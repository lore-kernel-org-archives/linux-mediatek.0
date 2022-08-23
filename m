Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371CC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMjMH8OTt1UaDedq0vDfn7+YJui9OSPJEFRLTT6DbSI=; b=Rw6ZwoDP/IRTip9yjLj9SL38Nz
	VfMnMy2DdV8ERD1m7YyuqHBM9ynxm1tiuWajwvbiGi7bgDioN3/BTtwsH9mA6pustPtsAD5FVI+YS
	wy6PV875Wj9S0ZkAFzG2zadsQbhCzUy7Xb+YJQMsjrwxJWQ+atU7wi9Cn55FeqGKv7H6rmT0qQiKB
	2FPZzBhP5fTnt3FgGrTzjh+REjGidFNfUdgTsT8bHYL7hIjSzkiiPyWFFwJqOptgFPBH6/C9VHhed
	0ZnGqc+SkGKFGqhwFfFv+hALCbfMYU+SchSu7tzl8Mo9/52zBOacn/2a25Dd68Alt+htHt8HuANX8
	JEWaw6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaKO-008fcC-Pg; Tue, 23 Aug 2022 20:16:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaKD-008fZE-5C; Tue, 23 Aug 2022 20:16:38 +0000
Received: from notapiano (unknown [194.36.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C0DF6601DBC;
	Tue, 23 Aug 2022 21:16:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661285791;
	bh=JzsxxNzouivL3LyaaYX6SnjsVTmMyaN7Zhs2/j5WlOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnMaI8bqbVUHlua3CqX6Vwg6KiYF1aJ13rYtZ523ug1LHTLuFd/zVLXFhqg578FRt
	 2vU/2IujnRXHlNWAJeTv4hIEObDZdoHsukdOKCXcHZ2A4+Baspwkf+nzWmwH9xu2oV
	 J7+NXvPg62ewlJX+ki1OpWDesCQU8QmFjnFTzHxDDj3b8cKXzX9fmfyDeck8braTFD
	 KNjpYIzjJRNXruVDPSu8nLiNkFnIHYPMffGRVRmeU8LbRSF/j2JGmxhewPxxNKsCs4
	 kn1Nm4ttPomESf87rOw4JImZDDG88sKTFAcC/QN3Q9k5DMOrNaZFegAzwq0KMpvHN9
	 mJxu5m0xKz/SA==
Date: Tue, 23 Aug 2022 16:16:22 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	yongqiang.niu@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Message-ID: <20220823201622.meedlqvmixf5ukdf@notapiano>
References: <1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com>
 <1661235517-23699-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1661235517-23699-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_131637_356566_BAD80B3B 
X-CRM114-Status: GOOD (  17.48  )
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

On Tue, Aug 23, 2022 at 02:18:37PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> Because MT8186 HW has been modified at that time, SW needs to cooperate.
> And the register (MMSYS) reserved for dpi will be used for output
> format control (dual_edge/single_edge).
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
[..]
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
[..]
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @rgb888_dual_enable: Control output format for mt8186.

Let's not mention mt8186 in the description to keep the property generic. Also,
this description should say what having 'rgb888_dual_enable = true' indicates
about the hardware (in this case mt8186) and it currently doesn't.

Let's take a step back. What does 'dual enable' mean in this context and how
does it relate to 'dual edge' and the dpi output format? By answering those
questions we can find a description (and maybe variable name) that makes more
sense.

>   */
[..]
> @@ -449,6 +454,9 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
>  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>  			     dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE ?
>  			     EDGE_SEL : 0, EDGE_SEL);
> +	if (dpi->conf->rgb888_dual_enable)
> +		mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, DPI_RGB888_DDR_CON,
> +					     DPI_FORMAT_MASK, NULL);

This if block should be further indented.

>  	} else {
>  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE, 0);
>  	}
[..]
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -235,4 +235,8 @@
>  #define MATRIX_SEL_RGB_TO_JPEG		0
>  #define MATRIX_SEL_RGB_TO_BT601		2
>  
> +#define DPI_FORMAT_MASK			0x1
> +#define DPI_RGB888_DDR_CON		BIT(0)
> +#define DPI_RGB565_SDR_CON		BIT(1)

I'm not sure if it would make more sense to have these definitions in the mmsys
header since they're configurations of a register in mmsys' iospace... I think
we can keep them here but at least add a comment above:

/* Values for DPI configuration in MMSYS address space */

Thanks,
Nícolas

