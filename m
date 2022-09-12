Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4119EECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 04:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk4sPKhjO8yEQMKZWtt9j4+15fnzQ6c/AWVaOhL/yhA=; b=vx3LZudP5U08fJkCclUu6Flacf
	+rLdWflo1OZ1xPe/FGDn2zSE+0hZAeKGO5DBBaUDtoUf/JSKboK+5puEhupMSYEk9eqB1Y8GO+JAC
	nLXeXdrazMZUNYYTnG8ElPICzcTBBZbyuP6WHAZK32fQDjk0wryeF60l3WUHBofvRnLmIDnxVHwrH
	WaXOmTTddrPS0OXipck7cekQAXaiZh6k/XRE1WapbggCsJ3C6FcbuoWAhxnMCvOcKHf/736GP+uWr
	tRPbteb/wKwcV9oInbAuNrJcICVRpJMMrpi27AALGUvHaE7htciMweceEsBph4E+YqcFtDGDuldT6
	FZA4MCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXb6t-006rsU-BD; Mon, 12 Sep 2022 04:31:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXb6g-006rpq-FL; Mon, 12 Sep 2022 04:31:40 +0000
X-UUID: 3205466432124d019e52e4375132a3a0-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Yk4sPKhjO8yEQMKZWtt9j4+15fnzQ6c/AWVaOhL/yhA=;
	b=UIeVS8NcyQPubt6ZsAo6MUFtCVay5BWgPYotT8KewLuxq3yTApdX6pvv4WyD0eLJdg2hT8yUH8FQ1BkGU6vofaqFfrpDj7ypgKcRazgvocFqUmcw11SP8W32eOHUISzehXE9ektDi/mtnsqT4lxXVcgtULVPr1TeGHs8TUvWAfU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0e08e178-2a7e-4eaa-aa3a-a89438853b35,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:be9b4c5d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3205466432124d019e52e4375132a3a0-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1879279058; Sun, 11 Sep 2022 21:31:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 11:40:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 11:40:54 +0800
Message-ID: <b740f81d62ce73e08a2a43637b4f951298b1c28a.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 5/9] drm/mediatek: Add gamma support different
 lut_bits for other SoC
From: CK Hu <ck.hu@mediatek.com>
To: Jason-JH.Lin <jason-jh.lin@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Sep 2022 11:40:54 +0800
In-Reply-To: <20220912013006.27541-6-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_213138_535757_92B4C2E4 
X-CRM114-Status: GOOD (  24.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jason:

On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> Add lut_bits in gamma driver data for each SoC and adjust the usage
> of lut_bits in mtk_drm_gamma_set_common().
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++-----
> --
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index 0a1022032b71..be82d15a5204 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -25,11 +25,14 @@
>  
>  #define LUT_10BIT_MASK				0x03ff
>  #define LUT_SIZE_DEFAULT			512 /* for setting
> gamma lut from AAL */
> +#define LUT_BITS_DEFAULT			10
> +#define LUT_INPUT_BITS				16 /* input lut
> bit from application */

I think we should use drm_color_lut_extract() to let the input bits
transparent. So add one patch to use drm_color_lut_extract(), and then
apply this patch.

Regards,
CK

>  
>  struct mtk_disp_gamma_data {
>  	bool has_dither;
>  	bool lut_diff;
>  	u16 lut_size;
> +	u8 lut_bits;
>  };
>  
>  /*
> @@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev,
> void __iomem *regs, struct drm_crt
>  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>  	bool lut_diff = false;
>  	u16 lut_size = LUT_SIZE_DEFAULT;
> +	u8 lut_bits = LUT_BITS_DEFAULT;
> +	u8 shift_bits;
>  	unsigned int i, reg;
>  	struct drm_color_lut *lut;
>  	void __iomem *lut_base;
> -	u32 word;
> +	u32 word, mask;
>  	u32 diff[3] = {0};
>  
>  	if (gamma && gamma->data) {
>  		lut_diff = gamma->data->lut_diff;
>  		lut_size = gamma->data->lut_size;
> +		lut_bits = gamma->data->lut_bits;
>  	}
>  
> +	shift_bits = LUT_INPUT_BITS - lut_bits;
> +	mask = GENMASK(lut_bits - 1, 0);
> +
>  	if (state->gamma_lut) {
>  		reg = readl(regs + DISP_GAMMA_CFG);
>  		reg = reg | GAMMA_LUT_EN;
> @@ -92,17 +101,20 @@ void mtk_gamma_set_common(struct device *dev,
> void __iomem *regs, struct drm_crt
>  		for (i = 0; i < lut_size; i++) {
>  
>  			if (!lut_diff || (i % 2 == 0)) {
> -				word = (((lut[i].red >> 6) &
> LUT_10BIT_MASK) << 20) +
> -					(((lut[i].green >> 6) &
> LUT_10BIT_MASK) << 10) +
> -					((lut[i].blue >> 6) &
> LUT_10BIT_MASK);
> +				word = (((lut[i].red >> shift_bits) &
> mask) << 20) +
> +					(((lut[i].green >> shift_bits)
> & mask) << 10) +
> +					((lut[i].blue >> shift_bits) &
> mask);
>  			} else {
> -				diff[0] = (lut[i].red >> 6) - (lut[i -
> 1].red >> 6);
> -				diff[1] = (lut[i].green >> 6) - (lut[i
> - 1].green >> 6);
> -				diff[2] = (lut[i].blue >> 6) - (lut[i -
> 1].blue >> 6);
> -
> -				word = ((diff[0] & LUT_10BIT_MASK) <<
> 20) +
> -					((diff[1] & LUT_10BIT_MASK) <<
> 10) +
> -					(diff[2] & LUT_10BIT_MASK);
> +				diff[0] = (lut[i].red >> shift_bits) -
> +					  (lut[i - 1].red >>
> shift_bits);
> +				diff[1] = (lut[i].green >> shift_bits)
> -
> +					  (lut[i - 1].green >>
> shift_bits);
> +				diff[2] = (lut[i].blue >> shift_bits) -
> +					  (lut[i - 1].blue >>
> shift_bits);
> +
> +				word = ((diff[0] & mask) << 20) +
> +					((diff[1] & mask) << 10) +
> +					(diff[2] & mask);
>  			}
>  			writel(word, (lut_base + i * 4));
>  		}
> @@ -209,11 +221,13 @@ static int mtk_disp_gamma_remove(struct
> platform_device *pdev)
>  static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
>  	.has_dither = true,
>  	.lut_size = 512,
> +	.lut_bits = 10,
>  };
>  
>  static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
>  	.lut_diff = true,
>  	.lut_size = 512,
> +	.lut_bits = 10,
>  };
>  
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] =
> {


