Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8925CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vuKLnJFlRopon6j9CRjniTi2MW7qjOoLsuTSvE6e2Oo=; b=gc0ypAApsOghDlAakz4cKh+M32
	WccKLkPoPRAw/Tn0qUz/PDMalqAcRH/fFM5y9iL1xLFrCDi5+U0uwut6atTqduN2O+XLU72jHBk/C
	qypNJlJv6Kn9Z9Y0do/1Qh0J/5n0CoE6+fm78wAMCAI8s2ySjsOuAq2YjzCPRiZg2QH8Sf/4+AZFM
	PD5te2BoPI4luWF59hWDrDfRYf1u4u5VGwCV4yKb//2uEIBBN6tIBHefdHaFh6MUjqTFvaIupjS8Y
	HEeycIY8hZ/gFuxZa2ogFFKtNJ+5jfP3nqANnX0NM4ZoFa9qcO64Qkq6tDy6/wDy50zzA5tx7OZwi
	mUxugyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS4-000TA9-1D;
	Thu, 12 Oct 2023 09:57:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsRu-000T0c-1M;
	Thu, 12 Oct 2023 09:57:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C4C7D66071A3;
	Thu, 12 Oct 2023 10:57:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104662;
	bh=BTPIj+FcLOSi1/QWmOLAwYFyRfu60kjTBbhvBipvpWY=;
	h=From:To:Cc:Subject:Date:From;
	b=mmGiE/s9fCUlHsVyTP//yL5JOs7kVrf7afjDVmGF0T+FPp56xatp9Iy1JA+ZBfngz
	 S4eXSnYkCxFclriSybL+SYjYwfdymvRjxbpa06NOFonAnBGtksF+zskufY+phs36XT
	 LBLjND0uYscGS0BaHFFPBejGKkDnwI0c5aBdjozwK6B1IiyuL/f1Rkw8E/I5sbkTpx
	 d6LRyAVEtxXg0Z5OGyEF+vCHq1SMrM3KtGu/AiQRTICx4o40EkYi1FJxmmr4bezI+h
	 CxiU/ABmb6PKHvbwDywyVGd1P1IQ2HBXkCbhaNZIjbrBIdr6qU6MtIIZHGYqT2hmJ3
	 cNyx5nWpcx6xQ==
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
	kernel@collabora.com,
	ehristev@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH v11 00/16] MediaTek DDP GAMMA - 12-bit LUT support
Date: Thu, 12 Oct 2023 11:57:20 +0200
Message-ID: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025746_716790_C0361D96 
X-CRM114-Status: GOOD (  16.51  )
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

Changes in v11:
 - As per previous conversation with CK:
   - Definitions for default LUT bits were removed
   - Specifying number of bits per LUT component was merged into
     the commit adding support for 12-bit LUT
   - MT8195 support was moved to a new commit
   - Other spare changes
 - Added missing AAL_GAMMA_LUT_EN bit setting to mtk_aal_gamma_set()
 - Rebased over next-20231012

Changes in v10:
 - Moved snippet from patch [7/15] to patch [6/15] as that was
   intended to be there instead; fixes build issue for patch [6/15]
   as pointed out by the kernel text robot (oops, sorry!)

Changes in v9:
 - As per previous conversation with CK Hu, added a commit that
   de-commonizes the gamma setting function that was used in
   both DISP_AAL and DISP_GAMMA, now each of them have their
   own .gamma_set() callback (mtk_disp_gamma_set_common() has
   been removed).
 - Added a change to use bitfield macros in mtk_disp_aal.c
 - Added a change to compress of_device_id entries in mtk_disp_aal.c
 - Tested again on MT6795, MT8173, MT8186, MT8192, MT8195

Changes in v8:
 - Changed lut_size to be a mtk_disp_gamma_set_common() function
   parameter to pass lut size from AAL

Changes in v7:
 - Added check for NULL dev for AAL-gamma case
 - Added get_lut_size callback for AAL-gamma
 - Added comment to clarify SoC 10/12 bits support and old vs new
   register layout as suggested by Alexandre M.

Changes in v6:
 - Fixed smatch warning in patch 11/11, ref.:
   https://lore.kernel.org/all/202306101458.lRXHEE0Z-lkp@intel.com/

Changes in v5:
 - Removed incorrect comment on default LUT size and bits
 - Removed useless check for num_lut_banks
 - Added comment about CMDQ implementation on patch 5
 - Evaluated passing lut size/bits from AAL, idea discarded as
   the implementation would be rather tricky while bringing no
   benefits.

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

AngeloGioacchino Del Regno (15):
  drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
  drm/mediatek: gamma: Support SoC specific LUT size
  drm/mediatek: gamma: Improve and simplify HW LUT calculation
  drm/mediatek: gamma: Enable the Gamma LUT table only after programming
  drm/mediatek: gamma: Use bitfield macros
  drm/mediatek: aal: Use bitfield macros
  drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
  drm/mediatek: gamma: Support multi-bank gamma LUT
  drm/mediatek: gamma: Add support for 12-bit LUT
  drm/mediatek: gamma: Add support for MT8195
  drm/mediatek: gamma: Make sure relay mode is disabled
  drm/mediatek: gamma: Program gamma LUT type for descending or rising
  drm/mediatek: aal: Add kerneldoc for struct mtk_disp_aal
  drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
  drm/mediatek: aal: Compress of_device_id entries and add sentinel

Jason-JH.Lin (1):
  drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters

 drivers/gpu/drm/mediatek/mtk_disp_aal.c     |  86 ++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 203 ++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   9 +
 7 files changed, 260 insertions(+), 52 deletions(-)

-- 
2.42.0


