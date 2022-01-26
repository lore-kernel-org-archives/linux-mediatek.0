Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E25BC28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OtlzStZ929uU+5fUXy726GDui4cwK05v7PeQJ2ukQg=; b=XkLwyfdbyGI2ZQ
	NPLfNBIrvDeI/gFRcJfM90rbdeHL3sq1zlMAbQkMZChvEci2Nhwbz0DwwJVCd7bXND/Xsyntuap1+
	sL3K5QDr3hZqgovOZlks/hVLz84/5SmPAHattsRI5eCmzurzGXg2/8pTtw+I58wLooTzq4pwcQ0dg
	rjR2ETFLm1WU9XhF4iZoEmRSqMhmP8XNX0M2aVxgTOsZrEK/sbVJd2MlvCSsQan4WzYg2d0WrJzVB
	9ioTOJSd81gqCYFkjp/tY13foPV70Fb26J4GCNzFw6aaDJbBYFByCcVeZ3qJ2WVmgK1wqkqBvBUuh
	yoFz2hzb6RjplwIlPaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdbT-00AiGW-NS; Wed, 26 Jan 2022 08:24:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdbM-00AiD2-1G; Wed, 26 Jan 2022 08:24:29 +0000
X-UUID: 711388e5c6a948d2bd6a7382af130a0a-20220126
X-UUID: 711388e5c6a948d2bd6a7382af130a0a-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1489954026; Wed, 26 Jan 2022 01:24:20 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:23:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 16:23:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:23:50 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 28/31] clk: mediatek: mt8195: Hook up
 mtk_clk_simple_remove()
Date: Wed, 26 Jan 2022 16:23:50 +0800
Message-ID: <20220126082350.10393-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-29-wenst@chromium.org>
References: <20220122091731.283592-29-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_002424_145152_56D7208C 
X-CRM114-Status: GOOD (  18.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Various small clock controllers only have clock gates, and utilize
> mtk_clk_simple_probe() as their driver probe function.
> 
> Now that we have a matching remove function, hook it up for the relevant
> drivers. This was done with the following command:
> 
> sed -i -e '/mtk_clk_simple_probe/a \
>         .remove = mtk_clk_simple_remove,' drivers/clk/mediatek/clk-mt8195-*.c
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for doing this exmaple, we can apply 
mtk_clk_simple_probe/mtk_clk_simple_remove to other clk-mtxxxx in the future.

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mt8195-cam.c          | 1 +
>  drivers/clk/mediatek/clk-mt8195-ccu.c          | 1 +
>  drivers/clk/mediatek/clk-mt8195-img.c          | 1 +
>  drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 1 +
>  drivers/clk/mediatek/clk-mt8195-infra_ao.c     | 1 +
>  drivers/clk/mediatek/clk-mt8195-ipe.c          | 1 +
>  drivers/clk/mediatek/clk-mt8195-mfg.c          | 1 +
>  drivers/clk/mediatek/clk-mt8195-peri_ao.c      | 1 +
>  drivers/clk/mediatek/clk-mt8195-scp_adsp.c     | 1 +
>  drivers/clk/mediatek/clk-mt8195-vdec.c         | 1 +
>  drivers/clk/mediatek/clk-mt8195-venc.c         | 1 +
>  drivers/clk/mediatek/clk-mt8195-vpp0.c         | 1 +
>  drivers/clk/mediatek/clk-mt8195-vpp1.c         | 1 +
>  drivers/clk/mediatek/clk-mt8195-wpe.c          | 1 +
>  14 files changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-cam.c b/drivers/clk/mediatek/clk-mt8195-cam.c
> index 3d261fc3848e..e4d00fe6e757 100644
> --- a/drivers/clk/mediatek/clk-mt8195-cam.c
> +++ b/drivers/clk/mediatek/clk-mt8195-cam.c
> @@ -134,6 +134,7 @@ static const struct of_device_id of_match_clk_mt8195_cam[] = {
>  
>  static struct platform_driver clk_mt8195_cam_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-cam",
>  		.of_match_table = of_match_clk_mt8195_cam,
> diff --git a/drivers/clk/mediatek/clk-mt8195-ccu.c b/drivers/clk/mediatek/clk-mt8195-ccu.c
> index f846f1d73605..4e326b6301ba 100644
> --- a/drivers/clk/mediatek/clk-mt8195-ccu.c
> +++ b/drivers/clk/mediatek/clk-mt8195-ccu.c
> @@ -42,6 +42,7 @@ static const struct of_device_id of_match_clk_mt8195_ccu[] = {
>  
>  static struct platform_driver clk_mt8195_ccu_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-ccu",
>  		.of_match_table = of_match_clk_mt8195_ccu,
> diff --git a/drivers/clk/mediatek/clk-mt8195-img.c b/drivers/clk/mediatek/clk-mt8195-img.c
> index 22b52a8f15fe..12f5c436d075 100644
> --- a/drivers/clk/mediatek/clk-mt8195-img.c
> +++ b/drivers/clk/mediatek/clk-mt8195-img.c
> @@ -88,6 +88,7 @@ static const struct of_device_id of_match_clk_mt8195_img[] = {
>  
>  static struct platform_driver clk_mt8195_img_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-img",
>  		.of_match_table = of_match_clk_mt8195_img,
> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> index 4ab312eb26a5..fbc809d05072 100644
> --- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> @@ -58,6 +58,7 @@ static const struct of_device_id of_match_clk_mt8195_imp_iic_wrap[] = {
>  
>  static struct platform_driver clk_mt8195_imp_iic_wrap_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-imp_iic_wrap",
>  		.of_match_table = of_match_clk_mt8195_imp_iic_wrap,
> diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> index 5f9b69967459..8ebe3b9415c4 100644
> --- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> @@ -198,6 +198,7 @@ static const struct of_device_id of_match_clk_mt8195_infra_ao[] = {
>  
>  static struct platform_driver clk_mt8195_infra_ao_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-infra_ao",
>  		.of_match_table = of_match_clk_mt8195_infra_ao,
> diff --git a/drivers/clk/mediatek/clk-mt8195-ipe.c b/drivers/clk/mediatek/clk-mt8195-ipe.c
> index fc1d42b6ac84..b0d745cf7752 100644
> --- a/drivers/clk/mediatek/clk-mt8195-ipe.c
> +++ b/drivers/clk/mediatek/clk-mt8195-ipe.c
> @@ -43,6 +43,7 @@ static const struct of_device_id of_match_clk_mt8195_ipe[] = {
>  
>  static struct platform_driver clk_mt8195_ipe_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-ipe",
>  		.of_match_table = of_match_clk_mt8195_ipe,
> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
> index aca6d9c0837c..9411c556a5a9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-mfg.c
> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
> @@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8195_mfg[] = {
>  
>  static struct platform_driver clk_mt8195_mfg_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-mfg",
>  		.of_match_table = of_match_clk_mt8195_mfg,
> diff --git a/drivers/clk/mediatek/clk-mt8195-peri_ao.c b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> index 907a92b22de8..2f6b3bb657db 100644
> --- a/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> @@ -54,6 +54,7 @@ static const struct of_device_id of_match_clk_mt8195_peri_ao[] = {
>  
>  static struct platform_driver clk_mt8195_peri_ao_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-peri_ao",
>  		.of_match_table = of_match_clk_mt8195_peri_ao,
> diff --git a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> index 26b4846c5894..e16c383f631b 100644
> --- a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> +++ b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> @@ -39,6 +39,7 @@ static const struct of_device_id of_match_clk_mt8195_scp_adsp[] = {
>  
>  static struct platform_driver clk_mt8195_scp_adsp_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-scp_adsp",
>  		.of_match_table = of_match_clk_mt8195_scp_adsp,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c b/drivers/clk/mediatek/clk-mt8195-vdec.c
> index a1df04f42a90..a1446b666385 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdec.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
> @@ -96,6 +96,7 @@ static const struct of_device_id of_match_clk_mt8195_vdec[] = {
>  
>  static struct platform_driver clk_mt8195_vdec_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vdec",
>  		.of_match_table = of_match_clk_mt8195_vdec,
> diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
> index 7339851a0856..622f57804f96 100644
> --- a/drivers/clk/mediatek/clk-mt8195-venc.c
> +++ b/drivers/clk/mediatek/clk-mt8195-venc.c
> @@ -61,6 +61,7 @@ static const struct of_device_id of_match_clk_mt8195_venc[] = {
>  
>  static struct platform_driver clk_mt8195_venc_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-venc",
>  		.of_match_table = of_match_clk_mt8195_venc,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> index c3241466a8d0..bf2939c3a023 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -102,6 +102,7 @@ static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
>  
>  static struct platform_driver clk_mt8195_vpp0_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vpp0",
>  		.of_match_table = of_match_clk_mt8195_vpp0,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> index ce0b9a40a179..ffd52c762890 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> @@ -100,6 +100,7 @@ static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
>  
>  static struct platform_driver clk_mt8195_vpp1_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vpp1",
>  		.of_match_table = of_match_clk_mt8195_vpp1,
> diff --git a/drivers/clk/mediatek/clk-mt8195-wpe.c b/drivers/clk/mediatek/clk-mt8195-wpe.c
> index 274d60838d8e..b483fab10e18 100644
> --- a/drivers/clk/mediatek/clk-mt8195-wpe.c
> +++ b/drivers/clk/mediatek/clk-mt8195-wpe.c
> @@ -135,6 +135,7 @@ static const struct of_device_id of_match_clk_mt8195_wpe[] = {
>  
>  static struct platform_driver clk_mt8195_wpe_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-wpe",
>  		.of_match_table = of_match_clk_mt8195_wpe,
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
