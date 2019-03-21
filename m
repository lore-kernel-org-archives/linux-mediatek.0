From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 09/14] soc: mediatek: Add basic_clk_name to
 scp_power_data
Date: Thu, 21 Mar 2019 14:02:18 +0800
Message-ID: <CANMq1KDf6aCK4+VX070f1pB6knPT5M0kxbW_RJ0K7PtAvKWkLQ@mail.gmail.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com>
 <20190319080140.24055-10-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319080140.24055-10-weiyi.lu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>, Fan Chen <fan.chen@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 19, 2019 at 4:02 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Try to stop extending the clk_id or clk_names if there are
> more and more new BASIC clocks. To get its own clocks by the
> basic_clk_name of each power domain.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 6bf846cb1893..c6360de4e41e 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -118,6 +118,8 @@ static const char * const clk_names[] = {
>   * @bus_prot_mask: The mask for single step bus protection.
>   * @clk_id: The basic clock needs to be enabled before enabling certain
>   *          power domains.
> + * @basic_clk_name: provide the same purpose with field "clk_id"
> + *                  by declaring basic clock prefix name rather than clk_id.
>   * @caps: The flag for active wake-up action.
>   */
>  struct scp_domain_data {
> @@ -128,6 +130,7 @@ struct scp_domain_data {
>         u32 sram_pdn_ack_bits;
>         u32 bus_prot_mask;
>         enum clk_id clk_id[MAX_CLKS];
> +       const char *basic_clk_name[MAX_CLKS];

Either call them basic_clk_id/basic_clk_name, or clk_id/clk_name.

>         u8 caps;
>  };
>
> @@ -499,16 +502,24 @@ static struct scp *init_scp(struct platform_device *pdev,
>
>                 scpd->data = data;
>
> -               for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> -                       struct clk *c = clk[data->clk_id[j]];
> +               if (data->clk_id[0]) {

Since it's either clk_id or basic_clk_name, I wonder if it'd be good
to add a WARN_ON here, e.g.

WARN_ON(data->basic_clk_name[0]);

> +                       for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> +                               struct clk *c = clk[data->clk_id[j]];
>
> -                       if (IS_ERR(c)) {
> -                               dev_err(&pdev->dev, "%s: clk unavailable\n",
> -                                       data->name);
> -                               return ERR_CAST(c);
> -                       }
> +                               if (IS_ERR(c)) {
> +                                       dev_err(&pdev->dev,
> +                                               "%s: clk unavailable\n",
> +                                               data->name);
> +                                       return ERR_CAST(c);
> +                               }
>
> -                       scpd->clk[j] = c;
> +                               scpd->clk[j] = c;
> +                       }
> +               } else if (data->basic_clk_name[0]) {
> +                       for (j = 0; j < MAX_CLKS &&
> +                                       data->basic_clk_name[j]; j++)
> +                               scpd->clk[j] = devm_clk_get(&pdev->dev,
> +                                               data->basic_clk_name[j]);
>                 }
>
>                 genpd->name = data->name;
> --
> 2.18.0
>
