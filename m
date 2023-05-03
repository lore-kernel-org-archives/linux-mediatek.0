Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F093BC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mEaZfZQdX/gY0oQRKr7xw/UnMFzqhTLznUSCIsO9SA8=; b=1lN8bI3lVYixB9T94zc0l8y37h
	jMuUWuQ/vbrsiOenTaxVjo0ikZFp3RkOP9Xbu43zS/zAbcd/z6ll8piIos5eIcdSseNQ2CvsL9Lfh
	anOvWBnu9R1ltIPGfgrMUnS5CPcJi5yJX5DSLPUQn/sEFdQR6KTojrNCxJuHRg3JP607GZtJFUVZw
	cR4ifOtvx/P1ZTL+cd0n6JHI+X0ONkDCOsnWAvc3v91ySkSj/U6pGqM4x0qAtrdpz6/fTCVm3zm/R
	onjS7EkgBjs1XO/n2Yh5zUDLFZmDDT4KCaetsT+sazuLigakeFKcOB3oVMMzw43Ko9u/azDpVbA/L
	wSrQu+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzG-004R3y-0j;
	Wed, 03 May 2023 11:49:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzC-004R1i-14;
	Wed, 03 May 2023 11:49:31 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 107506603137;
	Wed,  3 May 2023 12:49:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114568;
	bh=45kl1Qn8N6NdwEwbEwHPXZCjU6At4IMsqvvVu/56OOo=;
	h=From:To:Cc:Subject:Date:From;
	b=UVU1BSJYXh0rXAoemDv5pFELCQTZbkBW0fC3lSX4YejQ9lvFgzKSyUuuYycvUvCtH
	 cPyS86+Diluh7dv76WqH/U/czkQ0pETYXmphoQ0uMD15Opar6jW0MtP7vCHM1r6LWX
	 OOQyjDq44aERQhTVdOqd1ZwtbYDWwOYTc11I3tM4y29mQ/tg5Cxi7ukEAehippHUcF
	 AJPro4X/8MUTiuKu1CfpLBIfGA8UlEeHbZssZnoWfB1kD09zs8K0hRwY72Jsh7jBpk
	 HPrANme9/tGuOCSvOPBoQRHASW6TxR6rgqNPDG+AFhUKAgQ5DfuA9cm5KAoZ30a7j1
	 hqaFfZhOM5xJw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v2 00/11] MediaTek DDP GAMMA - 12-bit LUT support
Date: Wed,  3 May 2023 13:49:12 +0200
Message-Id: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044930_615767_E4D688E9 
X-CRM114-Status: GOOD (  10.79  )
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

Changes in v2:
 - Added explicit inclusion of linux/bitfield.h in patch [06/11]

This series adds support for GAMMA IP requiring and/or supporting
a 12-bits LUT using a slightly different register layout and programming
sequence for multiple LUT banks: this IP version is currently found
on a number of SoCs, not only including the Chromebook/IoT oriented
Kompanio 1200/1380 MT8195/MT8195T, but also Smartphone chips such as
the Dimensity 9200 (MT6985) and others.

This series was tested on MT8195, MT8192, MT8173, MT6795:
 * MT6795, MT8192, MT8173: No regression, works fine.
 * MT8195: Color correction is finally working!

AngeloGioacchino Del Regno (10):
  drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
  drm/mediatek: gamma: Support SoC specific LUT size
  drm/mediatek: gamma: Improve and simplify HW LUT calculation
  drm/mediatek: gamma: Enable the Gamma LUT table only after programming
  drm/mediatek: gamma: Use bitfield macros
  drm/mediatek: gamma: Support specifying number of bits per LUT
    component
  drm/mediatek: gamma: Support multi-bank gamma LUT
  drm/mediatek: gamma: Add support for 12-bit LUT and MT8195
  drm/mediatek: gamma: Make sure relay mode is disabled
  drm/mediatek: gamma: Program gamma LUT type for descending or rising

Jason-JH.Lin (1):
  drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters

 drivers/gpu/drm/mediatek/mtk_disp_aal.c     |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 195 ++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   9 +
 6 files changed, 178 insertions(+), 36 deletions(-)

-- 
2.40.1


