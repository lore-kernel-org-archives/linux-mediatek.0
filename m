Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BF2C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TmL3xgRRUgOaF3LyE9yGfqTAOOoL2HhgY6qB6vntjS4=; b=EdpEzEvFA5EZ1jUBU9gWihu3BN
	jm8+zI17b/Fce0RejzIu05OWPd73RTpkmxBRh//ml/c9h5RT2kDsmGEsMPSGsDxvquckiID/1Vycv
	+sxIxBJckQ9+8520LGlAGUrDYvrUF66f2FM5xHAL8JcWBypNRHrYg3pyBLagqEhEbypQFo8IsDnzQ
	vU15yf1mUpnIUyo01R3yBxrRyMh//Kv+qPEqFKcj7bpygMDXdbN1wERSGmmguo9hPuJBeGuXuZtN7
	q3sHXEk/Aj3piZ+rf3WMk/mBm+6VWnt3dOpcAD8Yxdg7l9xKk782jPO6g/S/oKUzEydENLJdWPZoj
	hV3o23Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbBz-00CcLa-1B;
	Thu, 18 May 2023 10:49:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbBv-00CcJO-2Q;
	Thu, 18 May 2023 10:49:05 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBD6F660595E;
	Thu, 18 May 2023 11:49:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684406941;
	bh=l53ixwF3cZ6VWZW/juU6AowEPi2DJswS0O7JfEca9HU=;
	h=From:To:Cc:Subject:Date:From;
	b=GnFP2cbrU1Oe+tm94mVisoG+YDKc43dZbhJ1RpUs6ZgOk8esmjN0PLrcWxMcN5Nvq
	 aoRXcnCYbS3vVavrx32CMQEmq0STHT3wlvzRF+qNKH04pnlOiNsuZtqOAbRkwEbJeG
	 brykv9gLsoTGpFpBDfbuEecE91zp53Ksy8JqjZG5xHO2DaualfUlQ9mImg3MYuQScV
	 s2HVZ2ji1PeWba/7gqUPlqalpLlT7yGZy1rsXB70G+SnFWTVSuXpmTCLK5AKA07+Hu
	 oPj+1B5B81YIzsHZTUyniF9hGqfOSs/JB7x0/TAfMcrRJI51xQPClZZT8v2zP4qaMk
	 Hvv8RcKhM0nxw==
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
Subject: [PATCH v4 00/11] MediaTek DDP GAMMA - 12-bit LUT support
Date: Thu, 18 May 2023 12:48:46 +0200
Message-Id: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_034903_950857_05247C51 
X-CRM114-Status: GOOD (  11.60  )
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

Changes in v4:
 - Fixed assignment typo appeared in v3

Changes in v3:
 - Fixed issues due to variables renaming during cleanup (oops)
 - This is actually the right series, since v2 was taken from the
   wrong kernel tree.... :-)

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
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 197 +++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   9 +
 7 files changed, 181 insertions(+), 36 deletions(-)

-- 
2.40.1


