Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764D8C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJre8KN29d1NkUMRqOSqxQexLqxHmU+GHdpVJfUR2M4=; b=GAys6PskXPFxVtYsWu8kG8aAgT
	EjSsZ2WE1t+2my70B4Tcw5/Ay13nysVA8uIpz/e2OfzrfiMMhwfBUPado5FAD2TF1iZ8GZjZUat3N
	bM6ZnnTFsJezxEAcZAaxp/s44Z1BHODr/UnQNH5G6ywy4xxdVeQ2p6CJmA4ZpWzZhjXaUEQKUr0Bs
	CeXyL5mmocrv9/vIc3y7QiI9oZ0ukdxYtUUC/6jWebR4bRBkhmAZAnSSJpVV/Iqu8ezdQVZN/2Ug/
	2FKBthM94CfWf6H12+UijXNG9MCF+3/Y+6au2LxiE/nmJOdg4/SxwPEM3yDRPFh6deTW73T7AGbFC
	DZiDUSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYc8-000Ubl-MU; Thu, 20 Oct 2022 16:41:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYat-000TEl-VM; Thu, 20 Oct 2022 16:40:33 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DDA8660247C;
	Thu, 20 Oct 2022 17:40:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666284028;
	bh=cvM3djFXmy7wP9TkTQGsL5CnoFlBKYQJZrVbENrbUJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxVPgP72xkk5pXDKB0rWnF5v2W6J0ELdMBK2J5ULgnVIuKkL2msmdQeA51+5tWcmv
	 Y8ZLEkBLMdkWlLl7UgQk+O09ljGPdB2h7qcnrvuURew/O36BvfyMKDlzNnHrSLSYyE
	 Mi+Qp43rg1cXDRw9I8Dhi7da8bAK7nGxmlM4r7fM756rjS85u9kkzTRqAA7w+XxZnk
	 O9LR0hBz6LcXtw688DI8MrPsIT/oGudBYtRZ3/LGol0Jv4LnuR3Ez8sHprNzN2qd+U
	 uFKskEaJDFlIe1TqaDgUMsg9tO+5lr1PjG5BlwD0EJfjUzzYn6A0xxF3ppxX0FYWgd
	 Z2bKZRHhol5Ow==
Date: Thu, 20 Oct 2022 12:40:22 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
Message-ID: <20221020164022.vtnumo3fob2sh54w@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_094032_200100_60B45B66 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, Oct 19, 2022 at 10:52:15AM +0800, xinlei.lee@mediatek.com wrote:
[..]
> @@ -134,6 +137,7 @@ struct mtk_dpi_yc_limit {
>   * @yuv422_en_bit: Enable bit of yuv422.
>   * @csc_enable_bit: Enable bit of CSC.
>   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.

As Angelo suggested previously, this could be written slightly shorter as 

  * @edge_cfg_in_mmsys: Edge configuration for DPI output has to be set in MMSYS.

>   */
[..]
> @@ -448,8 +453,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
>  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>  			     dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE ?
>  			     EDGE_SEL : 0, EDGE_SEL);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_DDR_CON);
>  	} else {
>  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE, 0);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_SDR_CON);

I know this isn't one of the formats supported by MT8186, but since we're using
platform-agnostic formats now... This else branch in theory could also run for a
format like MEDIA_BUS_FMT_YUYV8_1X16. Would it make sense to set
MTK_DPI_RGB888_SDR_CON in that case?

Thanks,
Nícolas

>  	}
[..]

