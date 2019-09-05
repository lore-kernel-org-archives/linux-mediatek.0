From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 07/14] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
Date: Thu, 5 Sep 2019 18:25:09 +0800
Message-ID: <1567679109.18702.54.camel@mhfsdcap03>
References: <1567503456-24725-1-git-send-email-yong.wu@mediatek.com>
 <1567503456-24725-8-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1567503456-24725-8-git-send-email-yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xia.jiang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ming-fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Tiffany,

Sorry to disturb. I change vcodec here, Could you help have a look at
this?

On Tue, 2019-09-03 at 17:37 +0800, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 22 ----------
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  3 --
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  1 -
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 47 ----------------------
>  4 files changed, 73 deletions(-)
> 
[...]
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 3e2bfde..f484ac7 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -8,7 +8,6 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_vcodec_enc_pm.h"
>  #include "mtk_vcodec_util.h"
> @@ -17,49 +16,18 @@
>  
>  int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -	struct device_node *node;
>  	struct platform_device *pdev;
>  	struct mtk_vcodec_pm *pm;
>  	struct mtk_vcodec_clk *enc_clk;
>  	struct mtk_vcodec_clk_info *clk_info;
>  	int ret = 0, i = 0;
> -	struct device *dev;
>  
>  	pdev = mtkdev->plat_dev;
>  	pm = &mtkdev->pm;
>  	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
>  	pm->mtkdev = mtkdev;
>  	pm->dev = &pdev->dev;
> -	dev = &pdev->dev;
>  	enc_clk = &pm->venc_clk;
> -
> -	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
> -	if (!node) {
> -		mtk_v4l2_err("no mediatek,larb found");
> -		return -ENODEV;
> -	}
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (!pdev) {
> -		mtk_v4l2_err("no mediatek,larb device found");
> -		return -ENODEV;
> -	}
> -	pm->larbvenc = &pdev->dev;
> -
> -	node = of_parse_phandle(dev->of_node, "mediatek,larb", 1);
> -	if (!node) {
> -		mtk_v4l2_err("no mediatek,larb found");
> -		return -ENODEV;
> -	}
> -
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (!pdev) {
> -		mtk_v4l2_err("no mediatek,larb device found");
> -		return -ENODEV;
> -	}
> -
> -	pm->larbvenclt = &pdev->dev;

I guess this patch will affect the venc of mt8173. From its dtsi[1], It
looks merge two venc HW into one device. then it may be fail to enable
the clock of larb5 after this patch.

>From my point of view, the two venc HW has independent base address,
irq, clocks and smi-larb, they are two HW instance, It looks reasonable
to split it to two devices like this:

 vcodec_enc: vcodec@18002000 {
   compatible = "mediatek,mt8173-vcodec-enc";
   reg = <0 0x18002000 0 0x1000>;/* VENC_SYS */
   interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
   iommus = <&iommu M4U_PORT_VENC_RCPU>,
     ...
    <&iommu M4U_PORT_VENC_NBM_WDMA>;
   clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
            <&topckgen CLK_TOP_VENC_SEL>;
   clock-names = "venc_sel_src",
                "venc_sel";
 }
 
 vcodec_enc_lt: vcodec@19002000 {
    compatible = "mediatek,mt8173-vcodec-enc";
    reg = <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
          <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
          ...				 
          <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
    clocks = <&topckgen CLK_TOP_UNIVPLL1_D2>,
	    <&topckgen CLK_TOP_VENC_LT_SEL>;
    clock-names = "venc_lt_sel_src",
            "venc_lt_sel";
}

one is venc which connect with larb3, the other is venc_lt that connect
with larb5. then we could call pm_runtime_get with the two devices to
enable the clock of corresponding larb.

[1]
https://elixir.bootlin.com/linux/v5.3-rc1/source/arch/arm64/boot/dts/mediatek/mt8173.dtsi#L1361

>  	pdev = mtkdev->plat_dev;
>  	pm->dev = &pdev->dev;
>  
> @@ -115,21 +83,8 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>  		}
>  	}
>  
> -	ret = mtk_smi_larb_get(pm->larbvenc);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -		goto larbvencerr;
> -	}
> -	ret = mtk_smi_larb_get(pm->larbvenclt);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larb4 fail %d", ret);
> -		goto larbvenclterr;
> -	}
>  	return;
>  
> -larbvenclterr:
> -	mtk_smi_larb_put(pm->larbvenc);
> -larbvencerr:
>  clkerr:
>  	for (i -= 1; i >= 0; i--)
>  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> @@ -140,8 +95,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
>  	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
>  	int i = 0;
>  
> -	mtk_smi_larb_put(pm->larbvenc);
> -	mtk_smi_larb_put(pm->larbvenclt);
>  	for (i = enc_clk->clk_num - 1; i >= 0; i--)
>  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
>  }
