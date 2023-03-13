//
// Optimal monetary policy with a zero lower bound on nominal interest rates

// This code examines a two-country model in which both countries face the non-negativity constraints
// on nominal interest rates.

var          pi_h pi_f x_h x_f r_h r_f  nrs_h nrs_f 
            r_not_h 
            r_not_lag1_h r_not_lag2_h r_not_lag3_h r_not_lag4_h r_not_lag5_h r_not_lag6_h 
            r_not_lag7_h r_not_lag8_h r_not_lag9_h r_not_lag10_h r_not_lag11_h r_not_lag12_h 
            r_not_f
            r_not_lag1_f r_not_lag2_f r_not_lag3_f r_not_lag4_f r_not_lag5_f r_not_lag6_f 
            r_not_lag7_f r_not_lag8_f r_not_lag9_f r_not_lag10_f r_not_lag11_f r_not_lag12_f   ;

varexo       eps_rh eps_rf  eps_GL  eps_mp_h eps_mp_f u_h u_f ;

parameters   betta alpha_h alpha_f sigma omega_h omega_f gamma GL_size
             eta  rho_rh rho_rf psi_r_h psi_pi_h psi_x_h psi_r_f psi_pi_f psi_x_f istar;

para = func_set_para;

% //setting parameters
alpha_h = para(1); // 0.9;  %//0.75;   // Calvo pricing parameter
alpha_f = para(2); //0.9;  %//0.75;   // Calvo pricing parameter
betta   = para(3); //0.985;  %  // discount factor
sigma   = para(4); //2.0;   %  // relative risk aversion coefficient
omega_h = para(5); //0.0125;  % price index
omega_f = para(6); //0.0125;  %  price index
gamma   = para(7); //0.5;     % ratio of foreign country size
eta     = para(8); //1.5;     % Frish elasticity of labour supply

rho_rh =para(10); // 0.8;
rho_rf = para(11); //0.8;

psi_r_h = para(12); //0.0;  // Taylor Rule
psi_pi_h= para(13); //1.25;
psi_x_h = para(14); //0.5;
psi_r_f = para(15); //0.0;
psi_pi_f= para(16); //1.25;
psi_x_f = para(17); //0.5;

istar  = -1*( 1/betta-1 );
GL_size = 1.0;

model(linear);

//NKPC
#  gam_f_h = (alpha_h*betta)/(alpha_h+omega_h*(1-betta));
#  gam_f_f = (alpha_f*betta)/(alpha_f+omega_f*(1-betta));
#  gam_b_h = (omega_h)/(alpha_h+omega_h*(1-betta));
#  gam_b_f = (omega_f)/(alpha_f+omega_f*(1-betta));
#  kappa1_h = (1-alpha_h)*(1-alpha_h*betta)*omega_h/(alpha_h+omega_h*(1-alpha_h*(1-betta)))
              *(sigma+eta-gamma*(sigma-1));
#  kappa2_h = (1-alpha_h)*(1-alpha_h*betta)*omega_h/(alpha_h+omega_h*(1-alpha_h*(1-betta)))
              *gamma*(sigma-1);
#  kappa1_f = (1-alpha_f)*(1-alpha_f*betta)*omega_f/(alpha_f+omega_f*(1-alpha_f*(1-betta)))
              *(sigma+eta-(1-gamma)*(sigma-1));
#  kappa2_f = (1-alpha_f)*(1-alpha_f*betta)*omega_f/(alpha_f+omega_f*(1-alpha_f*(1-betta)))
              *(1-gamma)*(sigma-1);

// Dynamic IS relationship
# sigma0_h = sigma-    gamma *(sigma-1);
# sigma0_f = sigma- (1-gamma)*(sigma-1);
# vartht_h =     gamma*(sigma-1)/(sigma-    gamma*(sigma-1));
# vartht_f = (1-gamma)*(sigma-1)/(sigma- (1-gamma)*(sigma-1));

// eq (1) NKPC
pi_h = gam_f_h*pi_h(+1) + gam_b_h*pi_h(-1) + kappa1_h*x_h + kappa2_h*x_f+u_h;

// eq (2) NKPC
pi_f = gam_f_f*pi_f(+1) + gam_b_f*pi_f(-1) + kappa1_f*x_f + kappa2_f*x_h+u_f;

// eq(3) Dynamic IS relationship
x_h = x_h(+1) +vartht_h*(x_f(+1) - x_f ) -sigma0_h^(-1)*(r_h -pi_h(+1) - nrs_h);

// eq(4) Dynamic IS relationship
x_f = x_f(+1) +vartht_f*(x_h(+1) - x_h ) -sigma0_f^(-1)*(r_f -pi_f(+1) - nrs_f);

// Taylor Rule home
r_h = r_not_h;
r_not_h = psi_r_h*r_h(-1) + (1-psi_r_h)*(psi_pi_h*pi_h + psi_x_h*x_h) + eps_mp_h; 

 r_not_lag1_h = r_h(-1);
 r_not_lag2_h = r_h(-2);
 r_not_lag3_h = r_h(-3);
 r_not_lag4_h = r_h(-4);
 r_not_lag5_h = r_h(-5);
 r_not_lag6_h = r_h(-6);
 r_not_lag7_h = r_h(-7);
 r_not_lag8_h = r_h(-8);
 r_not_lag9_h = r_h(-9);
 r_not_lag10_h = r_h(-10);
 r_not_lag11_h = r_h(-11);
 r_not_lag12_h = r_h(-12);

// Taylor Rule foreign
r_f = r_not_f;
r_not_f = psi_r_f*r_f(-1) + (1-psi_r_f)*(psi_pi_f*pi_f + psi_x_f*x_f) + eps_mp_f; 

 r_not_lag1_f = r_f(-1);
 r_not_lag2_f = r_f(-2);
 r_not_lag3_f = r_f(-3);
 r_not_lag4_f = r_f(-4);
 r_not_lag5_f = r_f(-5);
 r_not_lag6_f = r_f(-6);
 r_not_lag7_f = r_f(-7);
 r_not_lag8_f = r_f(-8);
 r_not_lag9_f = r_f(-9);
 r_not_lag10_f = r_f(-10);
 r_not_lag11_f = r_f(-11);
 r_not_lag12_f = r_f(-12);


// natural rate 
nrs_h = rho_rh*nrs_h(-1) + eps_rh + eps_GL;
nrs_f = rho_rf*nrs_f(-1) + eps_rf + eps_GL/GL_size ;
end;

initval;
pi_h = 0;
pi_f = 0;
x_h = 0;
x_f = 0;
r_h = 0;
r_f = 0;
nrs_h = 0;
nrs_f = 0;
end;

steady;

check;

//setting shock

SIGMA_MP =1;

shocks;
var eps_mp_h=SIGMA_MP;
end;

stoch_simul(order=1,nocorr,nomoments,irf=0,noprint);

//stoch_simul(irf=10);