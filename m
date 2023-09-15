Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F6EE6453
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCk12bvapxHFQuUiLBI+egzgE6Cs5SbBsfqJWJmkXuY=; b=tXRJ0c57Fh9Ewa4Kn+JxzbwZ5o
	pUTXP12saGZwY2J9ERhwZA5K2kgzvkypuT3blQq05AU4cjv5Q6XualoVgcT2yTsxSq2fzTEFUtlPD
	Gi5jZh7E3zYdXKFF8P+NqRgrP1zuwAPyA3pmKFY8wXO+dH5dwKZzQfj1f3QlMyQu1xoKiJeMrIZ0V
	1HRTvnEoYSj+dYYpAUlrOtxKRx0a2tTSU97MUNeaz7mgV/Opmk/7ryXSrGw2vsSs74rbhzqsqEFbt
	dpeXpriz4lztunoXtyYPusm4t2nAR7B/5fsii91SbX4dpa/3PpljklWGqdb/GhDwHVpMz3IkFmtCT
	3INZCv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5nl-00ANBL-2G;
	Fri, 15 Sep 2023 10:11:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5ni-00AN9g-0l;
	Fri, 15 Sep 2023 10:11:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7D925B82B7B;
	Fri, 15 Sep 2023 10:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6E2C433C8;
	Fri, 15 Sep 2023 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694772707;
	bh=K0S1/7rjMJZap+e2ud7JWlak5LJu8FuoEdX+Kx2fq1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hwc3sq4NUs6XsWymG3LHd+7pjFr2rCrrVAW6fRTVYsXCUWZihNz2fagsUbBPPR6+r
	 xmnsnL+uXsGhZ5DhWv4A+bQKBmgwOjOnZtof3qNqZsVe/GPBWAuD2O5bZ67v9mnA3s
	 S10h0DVF6lLG4l0wWOfq43wu9Zi7Ybsdtgpcrahe71URAqCvr8QlYfGKyFs+LlH88M
	 z8q/MTuLNGhy66aNB7vp/Fd3l6XiV3zAqcTpeg0rH7TTcyoM9Hv39wHMQM5+Vegz98
	 2FJHbYcS7KjNcMglWhNKyeSMspE5PZyw3UNxQm770ZuL/j6c6kGha3nxRQ7Dp1PUTK
	 +zjI85AJuHWFA==
From: Michael Walle <mwalle@kernel.org>
To: angelogioacchino.delregno@collabora.com
Cc: airlied@gmail.com,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	jitao.shi@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	shaoming.chen@mediatek.com,
	yt.shen@mediatek.com,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling
Date: Fri, 15 Sep 2023 12:11:24 +0200
Message-Id: <20230915101124.283232-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_031150_440691_CC013997 
X-CRM114-Status: GOOD (  12.69  )
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

> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
> later calculation for horizontal sync-active (HSA), back (HBP) and
> front (HFP) porches got incorrect due to the logic being inverted.
> 
> This means that a number of settings were wrong because....:
>  - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>    set in order to disable the End of Transmission packet;
>  - Horizontal Sync and Back/Front porches: The delta used to
>    calculate all of HSA, HBP and HFP should account for the
>    additional EOT packet.
> 
> Before this change...
>  - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>  - For HSA/HBP/HFP delta... all three were wrong, as words were
>    added when EOT disabled, instead of when EOT packet enabled!
> 
> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
> MediaTek DSI driver to fix the aforementioned issues.
> 
> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Michael Walle <mwalle@kernel.org>

Thanks,
-michael

