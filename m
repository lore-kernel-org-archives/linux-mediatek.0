Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA5CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E4oKsKC+QVQyNZL8GnXou+uvzCZT3mx6g9q6UnxG+k=; b=rs047u46lfytEFkdP/gea8pvCQ
	6DvepU9U+Fvv3Y4qWrNmY87ziwTj95pMJ8dQKBcymahmFIENIW2JdDgQQel5rOkO/e7Ldzz17jxHb
	CP3zgYGKhkQBe9Y2llD1QQdPC6X/rSTLP4EH3FI/+4Dy5VKgKnEafxueuZZQP7NMN1e7sCMeKN3aV
	+I8VvoLavXFgsNtBXF/v7rngaAI4myx/BCylmrc5TlbAv/Tx7jVwx0pDCdSsFTo2NnhEfw5ouA9WG
	hTE82p9g+TbkDo4mZ1y8Si/v1q4/n0mZyPYXmp8rbL9WvBaGPV2i7b8rvKRjuL8K+uHonZukhuffz
	yeHi1JqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgYc-008h76-Ar; Mon, 12 Sep 2022 10:20:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgPS-008cJa-8z; Mon, 12 Sep 2022 10:11:27 +0000
X-UUID: b84545ce58ce40b9b941f05d2c6435f2-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8E4oKsKC+QVQyNZL8GnXou+uvzCZT3mx6g9q6UnxG+k=;
	b=qmEWwU/o1Zzm/WirGIhOaF7Log8So1aE1dgRYRrJC/ph1fUDUwHlpWErLQdbk8QI8wY/gHo1rORRVpW9it0ZSf7d+om1riim1hB8LjwU+xqwBLTS+SsOI0DwAFIX5dTygK+t01ZHgfwYP486DWOiW17Y3cq6MTqd9Dla8Hry5t4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ea34c12a-2502-4868-b69e-42cf2f7ba95e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:214818f6-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b84545ce58ce40b9b941f05d2c6435f2-20220912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 95128813; Mon, 12 Sep 2022 03:11:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 18:00:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 18:00:38 +0800
Message-ID: <916f87cd706fef3bad919fe1dbee810af5980d5c.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 7/9] drm/mediatek: Add gamma lut support for
 mt8195
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zheng-yan.chen
	<zheng-yan.chen@mediatek.com>
Date: Mon, 12 Sep 2022 18:00:38 +0800
In-Reply-To: <20220912013006.27541-8-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_031122_673280_C3A1031C 
X-CRM114-Status: GOOD (  25.91  )
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
> From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>
> 
> Since the previous gamma_set_common() function is designed for
> 9bit-to-10bit conversion, which is not feasible for the
> 10bit-to-12bit conversion in mt8195.
> 
> 1. Update the function to fit the need of mt8195.
> 2. Add gamma driver data for mt8195.
> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 57 ++++++++++++++++-----
> --
>  1 file changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index 45da2b6206c8..d706f76fd30e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -23,6 +23,7 @@
>  #define DISP_GAMMA_SIZE				0x0030
>  #define DISP_GAMMA_BANK				0x0100
>  #define DISP_GAMMA_LUT				0x0700
> +#define DISP_GAMMA_LUT1				0x0b00
>  
>  #define LUT_10BIT_MASK				0x03ff
>  #define LUT_SIZE_DEFAULT			512 /* for setting
> gamma lut from AAL */
> @@ -82,9 +83,8 @@ void mtk_gamma_set_common(struct device *dev, void
> __iomem *regs, struct drm_crt
>  	u8 shift_bits;
>  	unsigned int i, j, reg, bank_num;
>  	struct drm_color_lut *lut;
> -	void __iomem *lut_base;
> -	u32 word, mask;
> -	u32 diff[3] = {0};
> +	void __iomem *lut_base, *lut1_base;
> +	u32 word, word1, mask;
>  
>  	if (gamma && gamma->data) {
>  		lut_diff = gamma->data->lut_diff;
> @@ -102,27 +102,41 @@ void mtk_gamma_set_common(struct device *dev,
> void __iomem *regs, struct drm_crt
>  		reg = reg | GAMMA_LUT_EN;
>  		writel(reg, regs + DISP_GAMMA_CFG);
>  		lut_base = regs + DISP_GAMMA_LUT;
> +		lut1_base = regs + DISP_GAMMA_LUT1;
>  		lut = (struct drm_color_lut *)state->gamma_lut->data;
>  		for (j = 0; j < bank_num; j++) {
>  			writel(j, regs + DISP_GAMMA_BANK);
>  			for (i = 0; i < bank_size; i++) {
> -				if (!lut_diff || (i % 2 == 0)) {
> -					word = (((lut[i].red >>
> shift_bits) & mask) << 20) +
> -						(((lut[i].green >>
> shift_bits) & mask) << 10) +
> -						((lut[i].blue >>
> shift_bits) & mask);
> +				struct drm_color_lut input;
> +
> +				input.red = (lut[i].red >> shift_bits)
> & mask;
> +				input.green = (lut[i].green >>
> shift_bits) & mask;
> +				input.blue = (lut[i].blue >>
> shift_bits) & mask;
> +				if (!lut_diff || i % 2 == 0) {
> +					word = (lut_bits == 12) ?

Move lut_bits modification to the patch "drm/mediatek: Add gamma
support different lut_bits for other SoC".

> +					       (input.red +
> (input.green << 12)) :
> +					       ((input.red << 20) +
> (input.green << 10) +
> +						input.blue);
> +					word1 = input.blue;
>  				} else {
> -					diff[0] = (lut[i].red >>
> shift_bits) -
> -						  (lut[i - 1].red >>
> shift_bits);
> -					diff[1] = (lut[i].green >>
> shift_bits) -
> -						  (lut[i - 1].green >>
> shift_bits);
> -					diff[2] = (lut[i].blue >>
> shift_bits) -
> -						  (lut[i - 1].blue >>
> shift_bits);
> -
> -					word = ((diff[0] & mask) << 20)
> +
> -						((diff[1] & mask) <<
> 10) +
> -						(diff[2] & mask);
> +					struct drm_color_lut diff;
> +
> +					diff.red = input.red  -
> +						   ((lut[i - 1].red >>
> shift_bits) & mask);
> +					diff.green = input.green -
> +						     ((lut[i - 1].green
> >> shift_bits & mask));
> +					diff.blue = input.blue -
> +						    ((lut[i - 1].blue
> >> shift_bits) & mask);
> +
> +					word = (lut_bits == 12) ?

Ditto.

> +					       (input.red +
> (input.green << 12)) :
> +					       (diff.red << 20) +
> (diff.green << 10) + diff.blue;
> +					word1 = input.blue;
>  				}
> +
>  				writel(word, (lut_base + i * 4));
> +				if (lut_bits == 12)

Ditto.

Regards,
CK

> +					writel(word1, (lut1_base + i *
> 4));
>  			}
>  		}
>  	}
> @@ -237,11 +251,20 @@ static const struct mtk_disp_gamma_data
> mt8183_gamma_driver_data = {
>  	.lut_bits = 10,
>  };
>  
> +static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
> +	.lut_diff = true,
> +	.lut_size = 512,
> +	.lut_bits = 10,
> +	.bank_size = 256,
> +};
> +
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] =
> {
>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = &mt8173_gamma_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-gamma",
>  	  .data = &mt8183_gamma_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-gamma",
> +	  .data = &mt8195_gamma_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);


