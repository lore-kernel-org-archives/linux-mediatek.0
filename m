Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E392C47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T+Tw+85OHVTJHW2CYkedVbyj7HPlEHWa81TgjLPy91o=; b=wVxbPr67uPTmbN
	7nVS7qU82kUYLO5SDo9gSRC3W7SPz87iPSCzwdhpoTaEVKv7ytfAFpdb5rCYN5FTnoh/5YOXfzZVR
	y04hvTjd+qJU3Qod7Dqo32ZywJK1nt6RVW4VkOnpkUFO7av4lKn9vN/zCwQprUjS4ezdPoHtb6Oel
	e170yzjO4Zy/lDp5Ddtz057CS1AtO0kQQevKaT+rsIS8Kt2/W1bR97CzW5jAw/maxGUC88Dd4aQm6
	E2X8GZLjGCl5OQQ2ocy0oPkr5cwAQAzSFDU5QX+KRxVA21cBUH14yPJxIy30tHZLIHpe1KDtu7HXy
	rsbgeBjahFwUr2SzPojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rf-000000038CB-3TKR;
	Wed, 31 Jan 2024 11:34:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rb-0000000389K-2sTJ;
	Wed, 31 Jan 2024 11:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700880;
	bh=szOUEWIekbHFv2ysEIzLFfxkSV4iQ7hF2ZVTmP3Cfbg=;
	h=From:To:Cc:Subject:Date:From;
	b=XhT2sK5+x7A6MrmX55bmRBBSKIslbgDwWP/R1kW8wOSsaJTXkuqh8LmHuxDI7GM/u
	 lX7+F4OYh/12DCdtK3bIR7Dv+uZvzB4s4+BkzH/iIAJhDuh8eWbZUG6sH3kNypCpj+
	 ZqsHuxvDaSXs38XVyd4nmBeOPneYYOt/TCR992V6WHcMyH6J2fOEqWqMbWL3Wxto3p
	 86CiZUAN5b/B2kd4T9lo1y5W1GTEEiX6gdwgU25aSg6jmGUs2sWPBtK237YrZV9U2R
	 GuSacIFWXaRvXdH/f6P+hOkzviXzEZ9zFizoiHsJTvOB69CD6YMlCF6YqlGT8Ralc8
	 egc+3GS5Tf8Vw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0C8A13780C22;
	Wed, 31 Jan 2024 11:34:39 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 0/7] MediaTek DRM - DSI driver cleanups
Date: Wed, 31 Jan 2024 12:34:27 +0100
Message-ID: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_033443_873150_18724A17 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v3:
 - Rebased over next-20240131
 - Added bitfield.h inclusion in patch 3
 - Added three more cleanup commits to the mix to simplify
   the probe function and remove gotos.

Changes in v2:
 - Rebased over next-20231213

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).

AngeloGioacchino Del Regno (7):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
  drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
  drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
  drm/mediatek: dsi: Compress of_device_id entries and add sentinel

 drivers/gpu/drm/mediatek/mtk_dsi.c | 284 ++++++++++++-----------------
 1 file changed, 117 insertions(+), 167 deletions(-)

-- 
2.43.0


