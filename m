Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87225D33983
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j/HyP98j8NrJPQ1le2YvAkgFepBV2kR+iOheFZEPv+s=; b=dPrpVm0FgDWAtuQDQQNuhTcbIL
	VEmwZqhNe6XwHFqIwdBIppZXtty/4djrYuuC0LyzUFYGtJjQxTz9ztDBn4i/7aMhGVbGIT/HgXKqu
	ZwI4Uctm1TV4Gho601aiscMyAGCE0FKT4gsgDV7opRtHgfaXRypujsWFF3zZHu1dJ3kG9296hZU68
	k0k76FJwTQn0OxFj0HuZDcqVF5XteCYfRwifqNJW4iY59iErEZZzi8Ex7CPqg6sKgY6cOdJLsEopY
	uG0YFjlqj0g0EwSmlehNf2ZKaDd4GW95DEh2eVAIFXaDs9wMHPR7Bp+Zrrv/fKwvCSH8Pxe8QCtOq
	Jug6fY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QGn-0000000B11T-3Bbx;
	Mon, 28 Oct 2024 13:58:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QGk-0000000B0zD-4443
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 13:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58BD3A4196D;
	Mon, 28 Oct 2024 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE90C4CEE8;
	Mon, 28 Oct 2024 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730123933;
	bh=K/7KTDMPuENamkKkqsHNo5G/p+HSdxlk0n5hK36PN1E=;
	h=From:To:Subject:Date:From;
	b=ZyNlD4KZ+2/tN8m2oNbRkgZ62v9n/PBN1xJ4oeicGBphk8guST/GZKioUccJbN0Ol
	 GO7BC9tJ+BHiDmXMN2gr2nrat0AJBaXEB/IoGhOETkjfo+9kgiLsjuUTeOX3po6Ou6
	 XDKiX4CW2vw6t5F6gm5yQdmXZ8jkSd4YlzQT7eiBF6rTDw1lEZwTB0xJQ+7R7wuH3u
	 4ZHmHIrLl40v1xI4I69W0L15XId6+ds9jEtZJeJ3S8IUqbP95RqwCWepCGYTxoRlVu
	 gMtC556IKZZ5H4eqQSHdP1Bmh+1z0AFsDnSqOav0vrwOGozdBAvaf0zsRBEa1/2pye
	 rjrrMZCJUeeDQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Liankun Yang <liankun.yang@mediatek.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes 20241028
Date: Mon, 28 Oct 2024 13:58:46 +0000
Message-Id: <20241028135846.3570-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_065855_238234_19270478 
X-CRM114-Status: UNSURE (   8.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Fix degradation problem of alpha blending
2. Fix color format MACROs in OVL
3. Fix get efuse issue for MT8188 DPTX
4. Fix potential NULL dereference in mtk_crtc_destroy()
5. Correct dpi power-domains property
6. Add split subschema property constraints

Regards,
Chun-Kuang.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20241028

for you to fetch changes up to 3ad0edc46fb7668e75583ee6ebcce684f62ec4dc:

  dt-bindings: display: mediatek: split: add subschema property constraints (2024-10-23 14:47:39 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20241028

1. Fix degradation problem of alpha blending
2. Fix color format MACROs in OVL
3. Fix get efuse issue for MT8188 DPTX
4. Fix potential NULL dereference in mtk_crtc_destroy()
5. Correct dpi power-domains property
6. Add split subschema property constraints

----------------------------------------------------------------
Dan Carpenter (1):
      drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()

Hsin-Te Yuan (1):
      drm/mediatek: Fix color format MACROs in OVL

Jason-JH.Lin (5):
      drm/mediatek: ovl: Fix XRGB format breakage for blend_modes unsupported SoCs
      drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
      drm/mediatek: ovl: Remove the color format comment for ovl_fmt_convert()
      drm/mediatek: ovl: Add blend_modes to driver data
      drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs

Liankun Yang (1):
      drm/mediatek: Fix get efuse issue for MT8188 DPTX

Macpaul Lin (1):
      dt-bindings: display: mediatek: dpi: correct power-domains property

Moudy Ho (1):
      dt-bindings: display: mediatek: split: add subschema property constraints

 .../bindings/display/mediatek/mediatek,dpi.yaml    | 24 +++---
 .../bindings/display/mediatek/mediatek,split.yaml  | 19 +++++
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  4 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |  2 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            | 10 +++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 74 ++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  7 ++
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 85 +++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |  7 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |  1 +
 drivers/gpu/drm/mediatek/mtk_plane.c               | 15 ++--
 drivers/gpu/drm/mediatek/mtk_plane.h               |  4 +-
 13 files changed, 208 insertions(+), 46 deletions(-)

