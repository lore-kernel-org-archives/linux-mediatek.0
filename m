Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6FBC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSyx+y5QWw6Fql4uXPmf3DbJBuZiaBaqnWt3c3nanl8=; b=geuO4bxdxGq9MGJYvfshhispx1
	RRnMz/mA3E3WPfrcymHBdgh20Mydu9+M0ig6xtz6rMagHDofJ1tVrUZMfxFos1m9jIvn3nr6BMyTX
	TGuA9WOzGGEf0FgwKWdaMSNiDexX/qR6pELMorhFNXzlGp5pPTXGyRfjMaPZ5+dvIv2Tj+NZ+D22X
	OWmG7pHMuSbDOsHht5bgRvlhWrZY0AHgPvZw6BytAvAVnLt89YFn0fBJm7WrD2GjNGBXIi9pb794M
	2R9miNfX5WgoIkNNVkUlD96Quceq5k1bfz6xXYZnDgLBA9Eag3ZLuYSjeGiVt7xdVPLwboKcB4rW3
	70agbYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgjk-008mDZ-B0; Mon, 12 Sep 2022 10:32:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgby-008iUK-8m; Mon, 12 Sep 2022 10:24:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CD6E6601FD9;
	Mon, 12 Sep 2022 11:24:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662978256;
	bh=kiqQbnIn7/5ut/Bpv9ksnG72E+m6XZrvIdfMBPIWiDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nWiUu98eh2uGOzmLk0SWdME8yzF3fTBfsXzrEQ87DFJjiBY1vOH7HPzJvISUPMfS6
	 xVPxZpve8trRoYmAvy599zNpzxcBF4Dx3jYO9peJC9GXm04aIzVbSQv5NEsAt8+k/3
	 0WdoGIuxzbP1IHImxfostd9DszbMyinHF+R1aH8HdlYdPuFlV8MRzG+Am+kXyhaQyM
	 VgLJt2fTJdictRb6SGPt3VCFU4VnEfy3kbWjafXVKTpmpQUEmES0+OSkWb5ML4KBo1
	 poYaGyMvWyrXJvKRgctf0Bq+o3EdggZL1UV2EY2eUJZq0Fueb68b2p9eXzyAqqZAug
	 On2OPOb0PpQOg==
Message-ID: <97ac2b35-bb3b-360a-4078-f72146136a7f@collabora.com>
Date: Mon, 12 Sep 2022 12:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 4/9] drm/mediatek: Add gamma support different lut_size
 for other SoC
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_032418_594227_053A071A 
X-CRM114-Status: GOOD (  20.68  )
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

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> 1. Add mtk_drm_gamma_get_lut_size() and remove MTK_LUT_SIZE macro.
> 2. Add lut_size to gamma driver data for different SoC.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 22 +++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
>   5 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index a83e5fbc8724..6a05bb56e693 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -51,6 +51,7 @@ void mtk_gamma_clk_disable(struct device *dev);
>   void mtk_gamma_config(struct device *dev, unsigned int w,
>   		      unsigned int h, unsigned int vrefresh,
>   		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +unsigned int mtk_gamma_get_lut_size(struct device *dev);
>   void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
>   void mtk_gamma_start(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index f54a6a618348..e69d0b205b9a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -24,10 +24,12 @@
>   #define DISP_GAMMA_LUT				0x0700
>   
>   #define LUT_10BIT_MASK				0x03ff
> +#define LUT_SIZE_DEFAULT			512 /* for setting gamma lut from AAL */
>   
>   struct mtk_disp_gamma_data {
>   	bool has_dither;
>   	bool lut_diff;
> +	u16 lut_size;
>   };
>   
>   /*
> @@ -54,18 +56,32 @@ void mtk_gamma_clk_disable(struct device *dev)
>   	clk_disable_unprepare(gamma->clk);
>   }
>   
> +unsigned int mtk_gamma_get_size(struct device *dev)
> +{
> +	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> +	unsigned int lut_size = LUT_SIZE_DEFAULT;
> +
> +	if (gamma && gamma->data)
> +		lut_size = gamma->data->lut_size;
> +
> +	return lut_size;
> +}
> +
>   void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
>   {
>   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>   	bool lut_diff = false;
> +	u16 lut_size = LUT_SIZE_DEFAULT;

This makes us get a double assignment in case gamma->data is populated.

>   	unsigned int i, reg;
>   	struct drm_color_lut *lut;
>   	void __iomem *lut_base;
>   	u32 word;
>   	u32 diff[3] = {0};
>   
> -	if (gamma && gamma->data)
> +	if (gamma && gamma->data) {
>   		lut_diff = gamma->data->lut_diff;
> +		lut_size = gamma->data->lut_size;
> +	}

...you can avoid it like that:

} else {
	lut_size = LUT_SIZE_DEFAULT;
}


Regards,
Angelo



