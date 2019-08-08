From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5,2/2] clk: reset: Modify reset-controller driver
Date: Thu, 08 Aug 2019 08:18:23 -0700
Message-ID: <20190808151824.97D9E218B6@mail.kernel.org>
References: <20190726070135.14347-1-yong.liang@mediatek.com>
 <20190726070135.14347-2-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726070135.14347-2-yong.liang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: chunhui.dai@mediatek.com, drinkcat@chromium.org, eddie.huang@mediatek.com, erin.lo@mediatek.com, jamesjj.liao@mediatek.com, jasu@njomotys.info, mark.rutland@arm.com, matthias.bgg@gmail.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh+dt@kernel.org, weiyi.lu@mediatek.com
Cc: "yong.liang" <yong.liang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Yong Liang (2019-07-26 00:01:35)
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Set reset signal by a register and
> clear reset signal by another register for 8183.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---

Applied to clk-next with this squashed in

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 3f1428ed619b..94bbadc0d259 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1198,8 +1198,8 @@ static int clk_mt8183_infra_probe(struct platform_device *pdev)
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r) {
 		dev_err(&pdev->dev,
-			"%s(): could not register clock provider: %d\n"
-			,__func__, r);
+			"%s(): could not register clock provider: %d\n",
+			__func__, r);
 		return r;
 	}
 
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 17df8f8b57ea..cb939c071b0c 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -90,7 +90,7 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 	.reset = mtk_reset_set_clr,
 };
 
-void mtk_register_reset_controller_common(struct device_node *np,
+static void mtk_register_reset_controller_common(struct device_node *np,
 			unsigned int num_regs, int regofs,
 			const struct reset_control_ops *reset_ops)
 {
