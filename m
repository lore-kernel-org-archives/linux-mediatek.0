From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] soc: Fix for clean up pmic driver - trivial
Date: Mon, 05 Oct 2015 14:21:33 +0200
Message-ID: <19210837.P9sIqrRUPt@wuerfel>
References: <20151005114444.GA11494@jci-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20151005114444.GA11494@jci-VirtualBox>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: "trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Mutharaju,
 Prasanna (P.)" <mkarthi3-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Monday 05 October 2015 11:45:08 Mutharaju, Prasanna wrote:
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index f432291..628a919 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -35,8 +35,8 @@
>  #define PWRAP_GET_WACS_RDATA(x)                (((x) >> 0) & 0x0000ffff)
>  #define PWRAP_GET_WACS_FSM(x)          (((x) >> 16) & 0x00000007)
>  #define PWRAP_GET_WACS_REQ(x)          (((x) >> 19) & 0x00000001)
> -#define PWRAP_STATE_SYNC_IDLE0         (1 << 20)
> -#define PWRAP_STATE_INIT_DONE0         (1 << 21)
> +#define PWRAP_STATE_SYNC_IDLE0         BIT(20)
> +#define PWRAP_STATE_INIT_DONE0         BIT(21)
>  
>  /* macro for WACS FSM */
>  #define PWRAP_WACS_FSM_IDLE            0x00
> @@ -52,7 +52,7 @@
>  #define PWRAP_DEW_WRITE_TEST_VAL       0xa55a
>  
>  /* macro for manual command */
> -#define PWRAP_MAN_CMD_SPI_WRITE                (1 << 13)
> +#define PWRAP_MAN_CMD_SPI_WRITE                BIT(13)
>  #define PWRAP_MAN_CMD_OP_CSH           (0x0 << 8)
>  #define PWRAP_MAN_CMD_OP_CSL           (0x1 << 8)
>  #define PWRAP_MAN_CMD_OP_CK            (0x2 << 8)

I'd say the original version is clearer because of the context that
does not use (and should not) use BIT().

	Arnd
