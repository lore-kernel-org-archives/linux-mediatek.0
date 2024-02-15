Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A68C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IdPIWcogsh+3Fehwh0frKh4JtxTJLm6iq34Rg70x/5g=; b=MFeGtnqnijwMgo
	WeeBz5yD6muSedWbpUt3VxIgBOjRt909gCRhBoIrNNYcbsAore6sSFOQqWT318o4npJ5WviYaprnr
	ucgdo5v+xiVolgKedCxqRT+AAzI4lepkyJKAAg7BXyoPpahOBeKhVqaCPVDfaqPmWM8yy6TbuZ6zR
	Prgyl15URY3acPYdt5b/DAM2p64enuCsrX199EvHtpaKUUuxfeMnx2CzKoXydzRS0as7GmH3ogRGu
	PhlvHKKunIcZYXzBpXnG5CpdbrgR35QIS8lwp0ybSqzpPI/K3+Is/EnFnw9xEVUznxl1xSxmHBvjn
	A2/3/gM62+aRI+8f7toA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXUj-0000000FOr0-48qK;
	Thu, 15 Feb 2024 08:53:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXUg-0000000FOob-0Pl9;
	Thu, 15 Feb 2024 08:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707987199;
	bh=gSl7FFAcyFkyZu86fmPgJX2VEBYzcNb/7gsEn+fDq54=;
	h=From:To:Cc:Subject:Date:From;
	b=RyN4iV6kEyFZUZDDqUO4zfb0Xu1xdQ2OGWpN3LWM5Vhl1h/PF1pPWYFYYDxyyUMjr
	 qZyqHYtqOmcQ9y+ZJ+DR9RgpArK1ZI4oXnCIQHBn5eTwYDXamGZn1sT5mtGdnbHvqc
	 H2neXE64sulCGzppMw/hejt50qtRNSMAztVuG+640OyJgbF+sdvebK9IcLXRFZ2Mzx
	 mT9A+HlxzyQcqktgAPoObRiQU0Msj40xW7qvqmKjdL3SZApQGJ0e4DqDSC7WD/377l
	 iXGSqrGbHQdIcR6kqVjpzmXOcMdGBhqBpYkqsDJE1QLCPz0HT9n2S271+mSSuCHA7t
	 vzggWxfanXisw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E41AB37813FD;
	Thu, 15 Feb 2024 08:53:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v6 0/9] MediaTek DRM - DSI driver cleanups
Date: Thu, 15 Feb 2024 09:53:07 +0100
Message-ID: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_005322_303238_359367A3 
X-CRM114-Status: UNSURE (   9.39  )
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

Changes in v6:
 - Moved default case from patch [4/9] to patch [3/9]

Changes in v5:
 - Changed patch 1 to not fix the DSI_PS_SEL mask for newer SoCs

Changes in v4:
 - Added a fix for RGB666 formats setting and for wrong register
   definitions for packed vs loosely packed formats
 - Added a commit to make use of mipi_dsi_pixel_format_to_bpp() helper
   instead of open coding the same

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


AngeloGioacchino Del Regno (9):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
  drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
  drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
  drm/mediatek: dsi: Compress of_device_id entries and add sentinel
  drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper function

 drivers/gpu/drm/mediatek/mtk_dsi.c | 310 ++++++++++++-----------------
 1 file changed, 126 insertions(+), 184 deletions(-)

-- 
2.43.0


