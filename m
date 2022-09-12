Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E22AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgKGxLJME97EESTzSl/GJ1X/tv4nYM3L+ZPiXlR/70Y=; b=p5ELnDUG+sPxGCZItCSV8b9eF1
	XVhkKce/xWjnJJomDOU+lB4NrouoyltoM2inXULd5+zY/BDwtSD7R0wXPsy5OmdnpsCBs/e/AClO1
	7KRe2qdUGJiG+sVB3dNjoRDfTSSMBmraTjFJTbHE2/qkV51Tdn9C0F7e+ZBOLZztfwj/Ze0iyUl4d
	396qowdxwsSxvDuXll+t25VYTj4K87FWsfXFFSL49yzodJj+v5Tdpbpwczf2L/7+4KSHgPw1qQa/O
	tN0yNHTTXUa6EYEN1pVbfm7Y41xAbx1qyvg4qzuMPpEdWKp5IhVqAF6tHwo+s587+7HE+y3uWV7nX
	0Toj2kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXcNn-0079F3-Fo; Mon, 12 Sep 2022 05:53:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXcNa-0079AU-HU; Mon, 12 Sep 2022 05:53:12 +0000
X-UUID: 89edd9283e7d4ea9a336415de4894ce6-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=AgKGxLJME97EESTzSl/GJ1X/tv4nYM3L+ZPiXlR/70Y=;
	b=MGONeH9kkyiyjD7wiXAUWW1IREGnIztGiDwtzShYqh8tbYQhgUdlUm7EABkkvklec6QuVkfwsWDzhz0TyqWrGg6e9OmIrBWjmJIdyVIvNZCJRs5BA96Py9sxH8LvIAl7gPSZ+KeO2X8Yy8WHMtUrnIcPpu1N0vRJCdRyQdxc5ig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:60bfafa4-bc00-4cbe-a4fa-e5065bb60853,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:c1060ff6-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 89edd9283e7d4ea9a336415de4894ce6-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 258903683; Sun, 11 Sep 2022 22:53:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 13:12:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Sep 2022 13:12:26 +0800
Message-ID: <3c67e742bdb06e55ba170a0a6dc79e6f6833c0e7.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 6/9] drm/mediatek: Add gamma support different
 bank_size for other SoC
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
Date: Mon, 12 Sep 2022 13:12:26 +0800
In-Reply-To: <20220912013006.27541-7-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_225310_725586_00383513 
X-CRM114-Status: GOOD (  20.71  )
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
> Add multiple bank support for mt8195.
> If bank size is 0 which means no bank support.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 45 +++++++++++++------
> ----
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index be82d15a5204..45da2b6206c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -21,6 +21,7 @@
>  #define GAMMA_LUT_EN					BIT(1)
>  #define GAMMA_DITHERING					BIT(2)
>  #define DISP_GAMMA_SIZE				0x0030
> +#define DISP_GAMMA_BANK				0x0100
>  #define DISP_GAMMA_LUT				0x0700
>  
>  #define LUT_10BIT_MASK				0x03ff
> @@ -33,6 +34,7 @@ struct mtk_disp_gamma_data {
>  	bool lut_diff;
>  	u16 lut_size;
>  	u8 lut_bits;
> +	u16 bank_size;
>  };
>  
>  /*
> @@ -75,9 +77,10 @@ void mtk_gamma_set_common(struct device *dev, void
> __iomem *regs, struct drm_crt
>  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>  	bool lut_diff = false;
>  	u16 lut_size = LUT_SIZE_DEFAULT;
> +	u16 bank_size = lut_size;
>  	u8 lut_bits = LUT_BITS_DEFAULT;
>  	u8 shift_bits;
> -	unsigned int i, reg;
> +	unsigned int i, j, reg, bank_num;
>  	struct drm_color_lut *lut;
>  	void __iomem *lut_base;
>  	u32 word, mask;
> @@ -87,8 +90,10 @@ void mtk_gamma_set_common(struct device *dev, void
> __iomem *regs, struct drm_crt
>  		lut_diff = gamma->data->lut_diff;
>  		lut_size = gamma->data->lut_size;
>  		lut_bits = gamma->data->lut_bits;
> +		bank_size = gamma->data->bank_size;
>  	}
>  
> +	bank_num = lut_size / bank_size;
>  	shift_bits = LUT_INPUT_BITS - lut_bits;
>  	mask = GENMASK(lut_bits - 1, 0);
>  
> @@ -98,25 +103,27 @@ void mtk_gamma_set_common(struct device *dev,
> void __iomem *regs, struct drm_crt
>  		writel(reg, regs + DISP_GAMMA_CFG);
>  		lut_base = regs + DISP_GAMMA_LUT;
>  		lut = (struct drm_color_lut *)state->gamma_lut->data;
> -		for (i = 0; i < lut_size; i++) {
> -
> -			if (!lut_diff || (i % 2 == 0)) {
> -				word = (((lut[i].red >> shift_bits) &
> mask) << 20) +
> -					(((lut[i].green >> shift_bits)
> & mask) << 10) +
> -					((lut[i].blue >> shift_bits) &
> mask);
> -			} else {
> -				diff[0] = (lut[i].red >> shift_bits) -
> -					  (lut[i - 1].red >>
> shift_bits);
> -				diff[1] = (lut[i].green >> shift_bits)
> -
> -					  (lut[i - 1].green >>
> shift_bits);
> -				diff[2] = (lut[i].blue >> shift_bits) -
> -					  (lut[i - 1].blue >>
> shift_bits);
> -
> -				word = ((diff[0] & mask) << 20) +
> -					((diff[1] & mask) << 10) +
> -					(diff[2] & mask);
> +		for (j = 0; j < bank_num; j++) {
> +			writel(j, regs + DISP_GAMMA_BANK);

Does mt8173 and mt8183 has this register? If not, do not set this
register in mt8173 and mt8183.

Regards,
CK

> +			for (i = 0; i < bank_size; i++) {
> +				if (!lut_diff || (i % 2 == 0)) {
> +					word = (((lut[i].red >>
> shift_bits) & mask) << 20) +
> +						(((lut[i].green >>
> shift_bits) & mask) << 10) +
> +						((lut[i].blue >>
> shift_bits) & mask);
> +				} else {
> +					diff[0] = (lut[i].red >>
> shift_bits) -
> +						  (lut[i - 1].red >>
> shift_bits);
> +					diff[1] = (lut[i].green >>
> shift_bits) -
> +						  (lut[i - 1].green >>
> shift_bits);
> +					diff[2] = (lut[i].blue >>
> shift_bits) -
> +						  (lut[i - 1].blue >>
> shift_bits);
> +
> +					word = ((diff[0] & mask) << 20)
> +
> +						((diff[1] & mask) <<
> 10) +
> +						(diff[2] & mask);
> +				}
> +				writel(word, (lut_base + i * 4));
>  			}
> -			writel(word, (lut_base + i * 4));
>  		}
>  	}
>  }


