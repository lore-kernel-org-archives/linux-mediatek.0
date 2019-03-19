From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 04/14] soc: mediatek: Refactor polling timeout and documentation
Date: Tue, 19 Mar 2019 19:45:10 +0800
Message-ID: <CANMq1KCLQaFg3bOrHnXzbjU9KM5Ny2rRX9bP4xg17jOYirxxig@mail.gmail.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com> <20190319080140.24055-5-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319080140.24055-5-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 19, 2019 at 4:02 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Use USEC_PER_SEC to indicate the polling timeout directly.
> And add documentation of scp_domain_data.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 9f52f501178b..2855111b221a 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -21,7 +21,7 @@
>  #include <dt-bindings/power/mt8173-power.h>
>
>  #define MTK_POLL_DELAY_US   10
> -#define MTK_POLL_TIMEOUT    (jiffies_to_usecs(HZ))
> +#define MTK_POLL_TIMEOUT    USEC_PER_SEC
>
>  #define MTK_SCPD_ACTIVE_WAKEUP         BIT(0)
>  #define MTK_SCPD_FWAIT_SRAM            BIT(1)
> @@ -108,6 +108,18 @@ static const char * const clk_names[] = {
>
>  #define MAX_CLKS       3
>
> +/**
> + * struct scp_domain_data - scp domain data for power on/off flow
> + * @name: The domain name.
> + * @sta_mask: The mask for power on/off status bit.
> + * @ctl_offs: The offset for main power control register.
> + * @sram_pdn_bits: The mask for sram power control bits.
> + * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> + * @bus_prot_mask: The mask for single step bus protection.
> + * @clk_id: The basic clock needs to be enabled before enabling certain
> + *          power domains.

I assume these are the clock*s* that *this* scp_domain requires?

So maybe just: "The basic clocks required by this power domain." ?

> + * @caps: The flag for active wake-up action.
> + */
>  struct scp_domain_data {
>         const char *name;
>         u32 sta_mask;
> --
> 2.18.0
>
