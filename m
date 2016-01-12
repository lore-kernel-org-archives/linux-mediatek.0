From: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] soc: mediatek: PMIC wrap: DEW base addr may vary
Date: Tue, 12 Jan 2016 12:28:44 +0800
Message-ID: <1452572924.31465.13.camel@mtksdaap41>
References: <1452441884-25882-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452441884-25882-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2016-01-11 at 00:04 +0800, John Crispin wrote:
> The MT6323 and possible other PMICs have a different DEW base addr. Change
> the driver so that it handles the DEW registeres in the same manner as the
> rest of the registers.
> 
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c |  166 +++++++++++++++++++++++++---------
>  1 file changed, 122 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 105597a..f3fccea 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -61,32 +61,85 @@
>  #define PWRAP_MAN_CMD_OP_OUTQ          (0xa << 8)
> 
>  /* macro for slave device wrapper registers */
> -#define PWRAP_DEW_BASE                 0xbc00
> -#define PWRAP_DEW_EVENT_OUT_EN         (PWRAP_DEW_BASE + 0x0)
> -#define PWRAP_DEW_DIO_EN               (PWRAP_DEW_BASE + 0x2)
> -#define PWRAP_DEW_EVENT_SRC_EN         (PWRAP_DEW_BASE + 0x4)
> -#define PWRAP_DEW_EVENT_SRC            (PWRAP_DEW_BASE + 0x6)
> -#define PWRAP_DEW_EVENT_FLAG           (PWRAP_DEW_BASE + 0x8)
> -#define PWRAP_DEW_READ_TEST            (PWRAP_DEW_BASE + 0xa)
> -#define PWRAP_DEW_WRITE_TEST           (PWRAP_DEW_BASE + 0xc)
> -#define PWRAP_DEW_CRC_EN               (PWRAP_DEW_BASE + 0xe)
> -#define PWRAP_DEW_CRC_VAL              (PWRAP_DEW_BASE + 0x10)
> -#define PWRAP_DEW_MON_GRP_SEL          (PWRAP_DEW_BASE + 0x12)
> -#define PWRAP_DEW_MON_FLAG_SEL         (PWRAP_DEW_BASE + 0x14)
> -#define PWRAP_DEW_EVENT_TEST           (PWRAP_DEW_BASE + 0x16)
> -#define PWRAP_DEW_CIPHER_KEY_SEL       (PWRAP_DEW_BASE + 0x18)
> -#define PWRAP_DEW_CIPHER_IV_SEL                (PWRAP_DEW_BASE + 0x1a)
> -#define PWRAP_DEW_CIPHER_LOAD          (PWRAP_DEW_BASE + 0x1c)
> -#define PWRAP_DEW_CIPHER_START         (PWRAP_DEW_BASE + 0x1e)
> -#define PWRAP_DEW_CIPHER_RDY           (PWRAP_DEW_BASE + 0x20)
> -#define PWRAP_DEW_CIPHER_MODE          (PWRAP_DEW_BASE + 0x22)
> -#define PWRAP_DEW_CIPHER_SWRST         (PWRAP_DEW_BASE + 0x24)
> -#define PWRAP_MT8173_DEW_CIPHER_IV0    (PWRAP_DEW_BASE + 0x26)
> -#define PWRAP_MT8173_DEW_CIPHER_IV1    (PWRAP_DEW_BASE + 0x28)
> -#define PWRAP_MT8173_DEW_CIPHER_IV2    (PWRAP_DEW_BASE + 0x2a)
> -#define PWRAP_MT8173_DEW_CIPHER_IV3    (PWRAP_DEW_BASE + 0x2c)
> -#define PWRAP_MT8173_DEW_CIPHER_IV4    (PWRAP_DEW_BASE + 0x2e)
> -#define PWRAP_MT8173_DEW_CIPHER_IV5    (PWRAP_DEW_BASE + 0x30)
> +enum pwrap_dew_regs {
> +       PWRAP_DEW_EVENT_OUT_EN,
> +       PWRAP_DEW_DIO_EN,
> +       PWRAP_DEW_EVENT_SRC_EN,
> +       PWRAP_DEW_EVENT_SRC,
> +       PWRAP_DEW_EVENT_FLAG,
> +       PWRAP_DEW_READ_TEST,
> +       PWRAP_DEW_WRITE_TEST,
> +       PWRAP_DEW_CRC_EN,
> +       PWRAP_DEW_CRC_VAL,
> +       PWRAP_DEW_MON_GRP_SEL,
> +       PWRAP_DEW_MON_FLAG_SEL,
> +       PWRAP_DEW_EVENT_TEST,
> +       PWRAP_DEW_CIPHER_KEY_SEL,
> +       PWRAP_DEW_CIPHER_IV_SEL,
> +       PWRAP_DEW_CIPHER_LOAD,
> +       PWRAP_DEW_CIPHER_START,
> +       PWRAP_DEW_CIPHER_RDY,
> +       PWRAP_DEW_CIPHER_MODE,
> +       PWRAP_DEW_CIPHER_SWRST,
> +
> +       /* MT8173 only regs */
> +       PWRAP_DEW_CIPHER_IV0,
> +       PWRAP_DEW_CIPHER_IV1,
> +       PWRAP_DEW_CIPHER_IV2,
> +       PWRAP_DEW_CIPHER_IV3,
> +       PWRAP_DEW_CIPHER_IV4,
> +       PWRAP_DEW_CIPHER_IV5,
> +};
> +
> +static int mt8135_dew_regs[] = {
> +       [PWRAP_DEW_EVENT_OUT_EN]        = 0x0,
> +       [PWRAP_DEW_DIO_EN]              = 0x2,
> +       [PWRAP_DEW_EVENT_SRC_EN]        = 0x4,
> +       [PWRAP_DEW_EVENT_SRC]           = 0x6,
> +       [PWRAP_DEW_EVENT_FLAG]          = 0x8,
> +       [PWRAP_DEW_READ_TEST]           = 0xa,
> +       [PWRAP_DEW_WRITE_TEST]          = 0xc,
> +       [PWRAP_DEW_CRC_EN]              = 0xe,
> +       [PWRAP_DEW_CRC_VAL]             = 0x10,
> +       [PWRAP_DEW_MON_GRP_SEL]         = 0x12,
> +       [PWRAP_DEW_MON_FLAG_SEL]        = 0x14,
> +       [PWRAP_DEW_EVENT_TEST]          = 0x16,
> +       [PWRAP_DEW_CIPHER_KEY_SEL]      = 0x18,
> +       [PWRAP_DEW_CIPHER_IV_SEL]       = 0x1a,
> +       [PWRAP_DEW_CIPHER_LOAD]         = 0x1c,
> +       [PWRAP_DEW_CIPHER_START]        = 0x1e,
> +       [PWRAP_DEW_CIPHER_RDY]          = 0x20,
> +       [PWRAP_DEW_CIPHER_MODE]         = 0x22,
> +       [PWRAP_DEW_CIPHER_SWRST]        = 0x24,
> +};
> +
> +static int mt8173_dew_regs[] = {
> +       [PWRAP_DEW_EVENT_OUT_EN]        = 0x0,
> +       [PWRAP_DEW_DIO_EN]              = 0x2,
> +       [PWRAP_DEW_EVENT_SRC_EN]        = 0x4,
> +       [PWRAP_DEW_EVENT_SRC]           = 0x6,
> +       [PWRAP_DEW_EVENT_FLAG]          = 0x8,
> +       [PWRAP_DEW_READ_TEST]           = 0xa,
> +       [PWRAP_DEW_WRITE_TEST]          = 0xc,
> +       [PWRAP_DEW_CRC_EN]              = 0xe,
> +       [PWRAP_DEW_CRC_VAL]             = 0x10,
> +       [PWRAP_DEW_MON_GRP_SEL]         = 0x12,
> +       [PWRAP_DEW_MON_FLAG_SEL]        = 0x14,
> +       [PWRAP_DEW_EVENT_TEST]          = 0x16,
> +       [PWRAP_DEW_CIPHER_KEY_SEL]      = 0x18,
> +       [PWRAP_DEW_CIPHER_IV_SEL]       = 0x1a,
> +       [PWRAP_DEW_CIPHER_LOAD]         = 0x1c,
> +       [PWRAP_DEW_CIPHER_START]        = 0x1e,
> +       [PWRAP_DEW_CIPHER_RDY]          = 0x20,
> +       [PWRAP_DEW_CIPHER_MODE]         = 0x22,
> +       [PWRAP_DEW_CIPHER_SWRST]        = 0x24,
> +       [PWRAP_DEW_CIPHER_IV0]          = 0x26,
> +       [PWRAP_DEW_CIPHER_IV1]          = 0x28,
> +       [PWRAP_DEW_CIPHER_IV2]          = 0x2a,
> +       [PWRAP_DEW_CIPHER_IV3]          = 0x2c,
> +       [PWRAP_DEW_CIPHER_IV4]          = 0x2e,
> +       [PWRAP_DEW_CIPHER_IV5]          = 0x30,
> +};
> 
>  enum pwrap_regs {
>         PWRAP_MUX_SEL,
> @@ -347,18 +400,24 @@ enum pwrap_type {
> 
>  struct pmic_wrapper_type {
>         int *regs;
> +       int *dew_regs;
> +       u32 dew_base;
>         enum pwrap_type type;
>         u32 arb_en_all;
>  };
> 
>  static struct pmic_wrapper_type pwrap_mt8135 = {
>         .regs = mt8135_regs,
> +       .dew_regs = mt8135_dew_regs,
> +       .dew_base = 0xbc00,
>         .type = PWRAP_MT8135,
>         .arb_en_all = 0x1ff,
>  };
> 
>  static struct pmic_wrapper_type pwrap_mt8173 = {
>         .regs = mt8173_regs,
> +       .dew_regs = mt8173_dew_regs,
> +       .dew_base = 0xbc00,
>         .type = PWRAP_MT8173,
>         .arb_en_all = 0x3f,
>  };
> @@ -368,6 +427,8 @@ struct pmic_wrapper {
>         void __iomem *base;
>         struct regmap *regmap;
>         int *regs;
> +       int *dew_regs;
> +       u32 dew_base;
>         enum pwrap_type type;
>         u32 arb_en_all;
>         struct clk *clk_spi;
> @@ -475,6 +536,18 @@ static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
>         return 0;
>  }

Hi John,

Because the DEW was the address of PMIC not the address of AP. I think
that dew_regs/dew_base was much better to define out of pmic_wrapper,
maybe create another structure for it.

struct pwrap_slv_type {
	const u32 *dew_regs;
	enum pmic_type type;
};

and define for different PMIC, something likes

static const struct pwrap_slv_type pmic_mt6397 = {
	.dew_regs = mt6397_regs,
	.type = PMIC_MT6397,
};

static const struct pwrap_slv_type pmic_mt6323 = {
	.dew_regs = mt6323_regs,
	.type = PMIC_MT6323,
};

Thanks,
Henry

> 
> +static int pwrap_dew_write(struct pmic_wrapper *wrp, enum pwrap_dew_regs reg,
> +                          u32 wdata)
> +{
> +       return pwrap_write(wrp, wrp->dew_base + wrp->dew_regs[reg], wdata);
> +}
> +
> +static int pwrap_dew_read(struct pmic_wrapper *wrp, enum pwrap_dew_regs reg,
> +                         u32 *rdata)
> +{
> +       return pwrap_read(wrp, wrp->dew_base + wrp->dew_regs[reg], rdata);
> +}
> +
>  static int pwrap_regmap_read(void *context, u32 adr, u32 *rdata)
>  {
>         return pwrap_read(context, adr, rdata);
> @@ -535,7 +608,7 @@ static int pwrap_init_sidly(struct pmic_wrapper *wrp)
> 
>         for (i = 0; i < 4; i++) {
>                 pwrap_writel(wrp, i, PWRAP_SIDLY);
> -               pwrap_read(wrp, PWRAP_DEW_READ_TEST, &rdata);
> +               pwrap_dew_read(wrp, PWRAP_DEW_READ_TEST, &rdata);
>                 if (rdata == PWRAP_DEW_READ_TEST_VAL) {
>                         dev_dbg(wrp->dev, "[Read Test] pass, SIDLY=%x\n", i);
>                         pass |= 1 << i;
> @@ -581,7 +654,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
>         u32 rdata;
>         int ret;
> 
> -       ret = pwrap_read(wrp, PWRAP_DEW_CIPHER_RDY, &rdata);
> +       ret = pwrap_dew_read(wrp, PWRAP_DEW_CIPHER_RDY, &rdata);
>         if (ret)
>                 return 0;
> 
> @@ -606,12 +679,12 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>         }
> 
>         /* Config cipher mode @PMIC */
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_SWRST, 0x1);
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_SWRST, 0x0);
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_KEY_SEL, 0x1);
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_IV_SEL, 0x2);
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_LOAD, 0x1);
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_START, 0x1);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_SWRST, 0x1);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_SWRST, 0x0);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_KEY_SEL, 0x1);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_IV_SEL, 0x2);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_LOAD, 0x1);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_START, 0x1);
> 
>         /* wait for cipher data ready@AP */
>         ret = pwrap_wait_for_state(wrp, pwrap_is_cipher_ready);
> @@ -628,7 +701,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>         }
> 
>         /* wait for cipher mode idle */
> -       pwrap_write(wrp, PWRAP_DEW_CIPHER_MODE, 0x1);
> +       pwrap_dew_write(wrp, PWRAP_DEW_CIPHER_MODE, 0x1);
>         ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle_and_sync_idle);
>         if (ret) {
>                 dev_err(wrp->dev, "cipher mode idle fail, ret=%d\n", ret);
> @@ -638,9 +711,10 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>         pwrap_writel(wrp, 1, PWRAP_CIPHER_MODE);
> 
>         /* Write Test */
> -       if (pwrap_write(wrp, PWRAP_DEW_WRITE_TEST, PWRAP_DEW_WRITE_TEST_VAL) ||
> -           pwrap_read(wrp, PWRAP_DEW_WRITE_TEST, &rdata) ||
> -                       (rdata != PWRAP_DEW_WRITE_TEST_VAL)) {
> +       if (pwrap_dew_write(wrp, PWRAP_DEW_WRITE_TEST,
> +                           PWRAP_DEW_WRITE_TEST_VAL) ||
> +           pwrap_dew_read(wrp, PWRAP_DEW_WRITE_TEST, &rdata) ||
> +           (rdata != PWRAP_DEW_WRITE_TEST_VAL)) {
>                 dev_err(wrp->dev, "rdata=0x%04X\n", rdata);
>                 return -EFAULT;
>         }
> @@ -684,7 +758,7 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>                 return ret;
> 
>         /* Enable dual IO mode */
> -       pwrap_write(wrp, PWRAP_DEW_DIO_EN, 1);
> +       pwrap_dew_write(wrp, PWRAP_DEW_DIO_EN, 1);
> 
>         /* Check IDLE & INIT_DONE in advance */
>         ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle_and_sync_idle);
> @@ -696,7 +770,7 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>         pwrap_writel(wrp, 1, PWRAP_DIO_EN);
> 
>         /* Read Test */
> -       pwrap_read(wrp, PWRAP_DEW_READ_TEST, &rdata);
> +       pwrap_dew_read(wrp, PWRAP_DEW_READ_TEST, &rdata);
>         if (rdata != PWRAP_DEW_READ_TEST_VAL) {
>                 dev_err(wrp->dev, "Read test failed after switch to DIO mode: 0x%04x != 0x%04x\n",
>                                 PWRAP_DEW_READ_TEST_VAL, rdata);
> @@ -709,12 +783,13 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>                 return ret;
> 
>         /* Signature checking - using CRC */
> -       if (pwrap_write(wrp, PWRAP_DEW_CRC_EN, 0x1))
> +       if (pwrap_dew_write(wrp, PWRAP_DEW_CRC_EN, 0x1))
>                 return -EFAULT;
> 
>         pwrap_writel(wrp, 0x1, PWRAP_CRC_EN);
>         pwrap_writel(wrp, 0x0, PWRAP_SIG_MODE);
> -       pwrap_writel(wrp, PWRAP_DEW_CRC_VAL, PWRAP_SIG_ADR);
> +       pwrap_writel(wrp, wrp->dew_base + wrp->dew_regs[PWRAP_DEW_CRC_VAL],
> +                    PWRAP_SIG_ADR);
>         pwrap_writel(wrp, wrp->arb_en_all, PWRAP_HIPRIO_ARB_EN);
> 
>         if (pwrap_is_mt8135(wrp))
> @@ -739,8 +814,9 @@ static int pwrap_init(struct pmic_wrapper *wrp)
>                 writel(0x7ff, wrp->bridge_base + PWRAP_MT8135_BRIDGE_INT_EN);
> 
>                 /* enable PMIC event out and sources */
> -               if (pwrap_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
> -                               pwrap_write(wrp, PWRAP_DEW_EVENT_SRC_EN, 0xffff)) {
> +               if (pwrap_dew_write(wrp, PWRAP_DEW_EVENT_OUT_EN, 0x1) ||
> +                   pwrap_dew_write(wrp, PWRAP_DEW_EVENT_SRC_EN,
> +                                   0xffff)) {
>                         dev_err(wrp->dev, "enable dewrap fail\n");
>                         return -EFAULT;
>                 }
> @@ -821,6 +897,8 @@ static int pwrap_probe(struct platform_device *pdev)
>         type = of_id->data;
>         wrp->regs = type->regs;
>         wrp->type = type->type;
> +       wrp->dew_regs = type->dew_regs;
> +       wrp->dew_base = type->dew_base;
>         wrp->arb_en_all = type->arb_en_all;
>         wrp->dev = &pdev->dev;
> 
> --
> 1.7.10.4
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
