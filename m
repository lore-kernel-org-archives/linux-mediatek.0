Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454F4CD6E57
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNllWddQ47Bk95xUmeZPCtRTy3zxGw7XxwM3Le5rTSI=; b=m4ZDg/QSzTLi3MhLO+1dnxJHQC
	n65UzfrxiJKV3RpIYgGpkl1kOwG+c8KS69PiBLum33pNPGjSdJewMGhQGEXvLFsDgZ7ni/sysW6Mr
	2QKvbDvn+R4JnRK5/tNX485MFF+Eq1znYXCFw60hVGqQdMNaSWO66xptJrKZ0nJct3k1kWMGsOG/m
	o6ju5mBjjcAZ5aTHKCD4QuCihbSWSrK0wXQtLztSzOD37vlmo1TMCRZcGQGhENcggmIPIAhTLzjqL
	TIiN95/Ghgq0OL2TZ7KMhW4HIEUKWsaUzDWLQXZKPeUeJKVUBq4lGSyYGKIBSqCaKKcpiYLQ8kD9d
	EU74cl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbiH-00GEls-2P;
	Wed, 11 Oct 2023 16:05:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbiD-00GEkf-2i;
	Wed, 11 Oct 2023 16:05:31 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0AC3866072FC;
	Wed, 11 Oct 2023 17:05:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697040326;
	bh=JX/FNFTRvgUjRggNucUPj/avlj5AIJtfvklHcuIrhpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOvsvP2z4ELP9LV96w8lC8IG53tbUcpfdEjCzCWhy/UHUKlqPJKxAjKU7yzF4Yy7N
	 /YC08oleXh/SM7zMPX0cUpXEghvg0c950bgpJPz3XHcjo2sb972iSTv1/L3xRhurGj
	 cqtbstLlprV0C0Hw/4WhEkTTMeynQsyOW7QZqYgbgGrkwUapU9I7r5hQnaIyl2f/0A
	 ekkyHILY/UiLaVp9xK0pQl107nduU5BO6a+DG7nIu9xxO6KKiqcPzwa8ZDF7HKMnbZ
	 gzaWCPuhM0PrsfZodIBY96FK42HFPak2R1vZO01rFQo6VmvwZro0xCeYca14c6COUA
	 iyESeUwrHaw9w==
Date: Wed, 11 Oct 2023 12:05:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org, kernel@collabora.com, ehristev@collabora.com
Subject: Re: [PATCH v10 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma
 gamma_set functions
Message-ID: <8cf3d18a-fe99-49c5-8d0c-eb5deaef79d6@notapiano>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804072850.89365-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_090530_082109_B935D7F6 
X-CRM114-Status: GOOD (  25.46  )
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

On Fri, Aug 04, 2023 at 09:28:42AM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding a 12-bits gamma support for the DISP_GAMMA
> IP, remove the mtk_gamma_set_common() function and move the relevant
> bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
> DISP_AAL: since the latter has no more support for gamma manipulation
> (being moved to a different IP) in newer revisions, those functions
> are about to diverge and it makes no sense to keep a common one (with
> all the complications of passing common data and making exclusions
> for device driver data) for just a few bits.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 39 +++++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  1 -
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 ++++----------------
>  3 files changed, 44 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index bec035780db0..21b25470e9b7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -17,10 +17,18 @@
>  
>  #define DISP_AAL_EN				0x0000
>  #define AAL_EN						BIT(0)
> +#define DISP_AAL_CFG				0x0020
> +#define AAL_RELAY_MODE					BIT(0)
> +#define AAL_GAMMA_LUT_EN				BIT(1)
>  #define DISP_AAL_SIZE				0x0030
>  #define DISP_AAL_SIZE_HSIZE				GENMASK(28, 16)
>  #define DISP_AAL_SIZE_VSIZE				GENMASK(12, 0)
>  #define DISP_AAL_OUTPUT_SIZE			0x04d8
> +#define DISP_AAL_GAMMA_LUT			0x0700
> +#define DISP_AAL_GAMMA_LUT_R				GENMASK(29, 20)
> +#define DISP_AAL_GAMMA_LUT_G				GENMASK(19, 10)
> +#define DISP_AAL_GAMMA_LUT_B				GENMASK(9, 0)
> +#define DISP_AAL_LUT_BITS			10
>  #define DISP_AAL_LUT_SIZE			512
>  
>  struct mtk_disp_aal_data {
> @@ -85,9 +93,36 @@ unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
>  void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
>  {
>  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> +	struct drm_color_lut *lut;
> +	unsigned int i;
> +	u32 cfg_val;
> +
> +	/* If gamma is not supported in AAL, go out immediately */
> +	if (!(aal->data && aal->data->has_gamma))
> +		return;
> +
> +	/* Also, if there's no gamma lut there's nothing to do here. */
> +	if (!state->gamma_lut)
> +		return;
> +
> +	cfg_val = readl(aal->regs + DISP_AAL_CFG);
> +	lut = (struct drm_color_lut *)state->gamma_lut->data;
> +
> +	for (i = 0; i < DISP_AAL_LUT_SIZE; i++) {
> +		struct drm_color_lut hwlut = {
> +			.red = drm_color_lut_extract(lut[i].red, DISP_AAL_LUT_BITS),
> +			.green = drm_color_lut_extract(lut[i].green, DISP_AAL_LUT_BITS),
> +			.blue = drm_color_lut_extract(lut[i].blue, DISP_AAL_LUT_BITS)
> +		};
> +		u32 word;
> +
> +		word = FIELD_PREP(DISP_AAL_GAMMA_LUT_R, hwlut.red);
> +		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_G, hwlut.green);
> +		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_B, hwlut.blue);
> +		writel(word, (aal->regs + DISP_AAL_GAMMA_LUT) + (i * 4));
> +	}

Hi Angelo,

it looks like you're missing a

  	cfg_val |= FIELD_PREP(AAL_GAMMA_LUT_EN, 1);

to actually enable the AAL gamma table here, like was done in the common
function.

Thanks,
Nícolas

>  
> -	if (aal->data && aal->data->has_gamma)
> -		mtk_gamma_set_common(NULL, aal->regs, state);
> +	writel(cfg_val, aal->regs + DISP_AAL_CFG);
>  }
[..]

