Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMWSpgyVlXNCBHp7XsmrTS6V4SiqwzcWp6T6TK17bf0=; b=25NcweHp0tsUSU
	IbL5MqccRdEymh1jyGkfzZaRiTYPAVwTAfmQxg2k2mp6Sw9L2RIsAfbYlUIvszANDC6XEi1IEpNsU
	/bIdl6UMu21X+Y7wWP3CTxUDYxWZTlfU/WU2ejl0qLNG9aX+LT7setI+1B3dAk747HfQqWKhjiB4H
	JF1NNiuuiFxoEG2un0MC5vGIoSQGbSU1bg9bhUJ1PG7DP8qX0m4W7NRENdZjzxREUIawVAkLicodq
	xqB9WN5wH+UC9ZO62oXpUg0dIwhJ8pLDrQt4zC76LO11xCV6wV9U3NgqqAqiX37raOJeb5hcSBHPp
	TKNxqxUW9BnjT2Y75fZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJs29-0013nk-Lk; Tue, 15 Feb 2022 07:13:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJs1Z-0013Ok-HO; Tue, 15 Feb 2022 07:13:23 +0000
X-UUID: 1c64cc7c2af74ec6bf6e9eb10c065561-20220215
X-UUID: 1c64cc7c2af74ec6bf6e9eb10c065561-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2137231410; Tue, 15 Feb 2022 00:13:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:12:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 15:12:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:12:27 +0800
Message-ID: <78bbd358c4e58cbbac0bced1fb09f3290bcaae15.camel@mediatek.com>
Subject: Re: [PATCH v3 28/31] clk: mediatek: mt8195: Hook up
 mtk_clk_simple_remove()
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 15:12:27 +0800
In-Reply-To: <20220208124034.414635-29-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-29-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_231321_593909_4599A9E5 
X-CRM114-Status: GOOD (  18.78  )
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

On Tue, 2022-02-08 at 20:40 +0800, Chen-Yu Tsai wrote:
> Various small clock controllers only have clock gates, and utilize
> mtk_clk_simple_probe() as their driver probe function.
> 
> Now that we have a matching remove function, hook it up for the
> relevant
> drivers. This was done with the following command:
> 
> sed -i -e '/mtk_clk_simple_probe/a \
>         .remove = mtk_clk_simple_remove,' drivers/clk/mediatek/clk-
> mt8195-*.c
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
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
> diff --git a/drivers/clk/mediatek/clk-mt8195-cam.c
> b/drivers/clk/mediatek/clk-mt8195-cam.c
> index 3d261fc3848e..e4d00fe6e757 100644
> --- a/drivers/clk/mediatek/clk-mt8195-cam.c
> +++ b/drivers/clk/mediatek/clk-mt8195-cam.c
> @@ -134,6 +134,7 @@ static const struct of_device_id
> of_match_clk_mt8195_cam[] = {
>  
>  static struct platform_driver clk_mt8195_cam_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-cam",
>  		.of_match_table = of_match_clk_mt8195_cam,
> diff --git a/drivers/clk/mediatek/clk-mt8195-ccu.c
> b/drivers/clk/mediatek/clk-mt8195-ccu.c
> index f846f1d73605..4e326b6301ba 100644
> --- a/drivers/clk/mediatek/clk-mt8195-ccu.c
> +++ b/drivers/clk/mediatek/clk-mt8195-ccu.c
> @@ -42,6 +42,7 @@ static const struct of_device_id
> of_match_clk_mt8195_ccu[] = {
>  
>  static struct platform_driver clk_mt8195_ccu_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-ccu",
>  		.of_match_table = of_match_clk_mt8195_ccu,
> diff --git a/drivers/clk/mediatek/clk-mt8195-img.c
> b/drivers/clk/mediatek/clk-mt8195-img.c
> index 22b52a8f15fe..12f5c436d075 100644
> --- a/drivers/clk/mediatek/clk-mt8195-img.c
> +++ b/drivers/clk/mediatek/clk-mt8195-img.c
> @@ -88,6 +88,7 @@ static const struct of_device_id
> of_match_clk_mt8195_img[] = {
>  
>  static struct platform_driver clk_mt8195_img_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-img",
>  		.of_match_table = of_match_clk_mt8195_img,
> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> index 4ab312eb26a5..fbc809d05072 100644
> --- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> @@ -58,6 +58,7 @@ static const struct of_device_id
> of_match_clk_mt8195_imp_iic_wrap[] = {
>  
>  static struct platform_driver clk_mt8195_imp_iic_wrap_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-imp_iic_wrap",
>  		.of_match_table = of_match_clk_mt8195_imp_iic_wrap,
> diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> index 5f9b69967459..8ebe3b9415c4 100644
> --- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
> @@ -198,6 +198,7 @@ static const struct of_device_id
> of_match_clk_mt8195_infra_ao[] = {
>  
>  static struct platform_driver clk_mt8195_infra_ao_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-infra_ao",
>  		.of_match_table = of_match_clk_mt8195_infra_ao,
> diff --git a/drivers/clk/mediatek/clk-mt8195-ipe.c
> b/drivers/clk/mediatek/clk-mt8195-ipe.c
> index fc1d42b6ac84..b0d745cf7752 100644
> --- a/drivers/clk/mediatek/clk-mt8195-ipe.c
> +++ b/drivers/clk/mediatek/clk-mt8195-ipe.c
> @@ -43,6 +43,7 @@ static const struct of_device_id
> of_match_clk_mt8195_ipe[] = {
>  
>  static struct platform_driver clk_mt8195_ipe_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-ipe",
>  		.of_match_table = of_match_clk_mt8195_ipe,
> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c
> b/drivers/clk/mediatek/clk-mt8195-mfg.c
> index aca6d9c0837c..9411c556a5a9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-mfg.c
> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
> @@ -39,6 +39,7 @@ static const struct of_device_id
> of_match_clk_mt8195_mfg[] = {
>  
>  static struct platform_driver clk_mt8195_mfg_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-mfg",
>  		.of_match_table = of_match_clk_mt8195_mfg,
> diff --git a/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> index 907a92b22de8..2f6b3bb657db 100644
> --- a/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
> @@ -54,6 +54,7 @@ static const struct of_device_id
> of_match_clk_mt8195_peri_ao[] = {
>  
>  static struct platform_driver clk_mt8195_peri_ao_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-peri_ao",
>  		.of_match_table = of_match_clk_mt8195_peri_ao,
> diff --git a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> index 26b4846c5894..e16c383f631b 100644
> --- a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> +++ b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
> @@ -39,6 +39,7 @@ static const struct of_device_id
> of_match_clk_mt8195_scp_adsp[] = {
>  
>  static struct platform_driver clk_mt8195_scp_adsp_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-scp_adsp",
>  		.of_match_table = of_match_clk_mt8195_scp_adsp,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c
> b/drivers/clk/mediatek/clk-mt8195-vdec.c
> index a1df04f42a90..a1446b666385 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdec.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
> @@ -96,6 +96,7 @@ static const struct of_device_id
> of_match_clk_mt8195_vdec[] = {
>  
>  static struct platform_driver clk_mt8195_vdec_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vdec",
>  		.of_match_table = of_match_clk_mt8195_vdec,
> diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c
> b/drivers/clk/mediatek/clk-mt8195-venc.c
> index 7339851a0856..622f57804f96 100644
> --- a/drivers/clk/mediatek/clk-mt8195-venc.c
> +++ b/drivers/clk/mediatek/clk-mt8195-venc.c
> @@ -61,6 +61,7 @@ static const struct of_device_id
> of_match_clk_mt8195_venc[] = {
>  
>  static struct platform_driver clk_mt8195_venc_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-venc",
>  		.of_match_table = of_match_clk_mt8195_venc,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> index c3241466a8d0..bf2939c3a023 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -102,6 +102,7 @@ static const struct of_device_id
> of_match_clk_mt8195_vpp0[] = {
>  
>  static struct platform_driver clk_mt8195_vpp0_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vpp0",
>  		.of_match_table = of_match_clk_mt8195_vpp0,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> index ce0b9a40a179..ffd52c762890 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> @@ -100,6 +100,7 @@ static const struct of_device_id
> of_match_clk_mt8195_vpp1[] = {
>  
>  static struct platform_driver clk_mt8195_vpp1_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vpp1",
>  		.of_match_table = of_match_clk_mt8195_vpp1,
> diff --git a/drivers/clk/mediatek/clk-mt8195-wpe.c
> b/drivers/clk/mediatek/clk-mt8195-wpe.c
> index 274d60838d8e..b483fab10e18 100644
> --- a/drivers/clk/mediatek/clk-mt8195-wpe.c
> +++ b/drivers/clk/mediatek/clk-mt8195-wpe.c
> @@ -135,6 +135,7 @@ static const struct of_device_id
> of_match_clk_mt8195_wpe[] = {
>  
>  static struct platform_driver clk_mt8195_wpe_drv = {
>  	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8195-wpe",
>  		.of_match_table = of_match_clk_mt8195_wpe,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
