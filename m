Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA44BC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCsFrFxTu2Wx/3OnYl4yRwvfLp07q19BSTrZLYzDynI=; b=uayaqEcKBYhkj6xXKBS1egSK+Z
	o1Aq/sFceIohXAzj0u6KJcBmbqupm1q+R0D5PI8YJRq9H868WNbvoU8nMd0d5aNCX/v2Q4CKn4CqK
	Q1jxVTSt5zy0qyyQ+Vl3cl1pconqDhICXMdarA33HA3Yup1QtujGloGxv2Pm9NMJOxoWa1Ptee9uN
	ZUuy7pDCRMHTsmMyLkFYfp2zI0hEMtxy/DKw4kzq2D+x4+aqn+ZxkY81pDUbZY5RF21I2R8dhicML
	f0Im2HTOSmQmtb7BHZW8Yw7ctMQ2aqiTEfxu0LgN6DQXX/RtEO47IBwva7osLWi03TMCQ2tVjeush
	6WiISjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMww9-009EAs-5x; Tue, 31 Jan 2023 20:09:01 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMww7-009EAM-Ee
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 20:09:00 +0000
Received: by mail-qv1-xf31.google.com with SMTP id x18so11964698qvl.1
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCsFrFxTu2Wx/3OnYl4yRwvfLp07q19BSTrZLYzDynI=;
        b=Tlq6vZ3Z+bOChVvdcjQhHB9km22BDOkkZ/qWueLyVRqyLF/yYjO5mWrVeLXmvQb9Hf
         dKM4M8ZGRrZQ/dS3TmSu2sqPQR3T5tCBu6Kt24m6IvM6wKf20RvJstZ6r7/A3rXylWKt
         RtYPf4cKcW09My0AGcaGdQQFGg6xotxnFBJxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCsFrFxTu2Wx/3OnYl4yRwvfLp07q19BSTrZLYzDynI=;
        b=oLbTXpi5o74bzhK7r4ecxgTifxBTCb79KCEhO+fbqDJznsNNp8ao2b+HOF0gZbc7Ry
         Eq5hE+Lriqlol4ar+PoMfC1sg5Os0ggrBolq2/NImy9koucIvqvcOgRV55v/SKwO5STS
         W2hFAk6MZ3hxgfERBYBiHrpTTmfEF/6248k1dqjco0abDVMyt2KuiqAxRVL+wB6R/VsU
         /OlfJ4uehE3e/XCdEfEdU35aizPAmJ30+ZX9KMI+LOzCgzTMgyQ3UYsGOIAwsLNzlkdi
         cx1tu51QmhKJQH6DSyAGmBUC0b0d2QEUUM5kaztAELXNFaHL9+oyyTDO4C0G4PUjjf5P
         fJQg==
X-Gm-Message-State: AO0yUKVZAqyzHwH53krwwV4SWNsf2Bb72Af1wFYqdNRUC18RVy3mdEzg
	KL6B+oBQ2313VLWfjL5yyacG2qm0WilVZda8
X-Google-Smtp-Source: AK7set85WIQ9wkzkoIEEQYoy3mBKFMptDGQsWp5LC2F/fasO0rQjL8HOj7i6LoFemKwmeMixeByhbQ==
X-Received: by 2002:a0c:e909:0:b0:538:861f:cfd7 with SMTP id a9-20020a0ce909000000b00538861fcfd7mr255616qvo.42.1675195737469;
        Tue, 31 Jan 2023 12:08:57 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:502d:723:d741:14cd])
        by smtp.gmail.com with ESMTPSA id m186-20020a37bcc3000000b007068b49b8absm10658782qkf.62.2023.01.31.12.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 12:08:57 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	Justin Green <greenjustin@chromium.org>
Subject: [PATCH 0/2 v6] drm/mediatek: Add support for 10-bit overlays
Date: Tue, 31 Jan 2023 15:08:40 -0500
Message-Id: <20230131200842.341272-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120859_551332_FB6C53B3 
X-CRM114-Status: GOOD (  11.45  )
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

This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
lay the groundwork for supporting more 10-bit formats on more devices.

1. Refactor plane initialization logic to allow individual DDP components to
provide their supported pixel formats.

2. Add AR30 and BA30 support to the MT8195 overlay driver.


Version history:
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.

v5:
* Removed some dead defines.
* Refactored mtk_ovl_set_afbc().

v4:
* Move modifier validation to format_mod_supported function.
* Add modifiers to drm_universal_plane_init() call.
* Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
  DRM_FORMAT_LINEAR being equal to 0.
* Gate AFBC control bit writes on device compatibility.

v3:
* Replaced pitch bitshift math with union based approach.
* Refactored overlay register writes to shared code between non-AFBC and
  AFBC.
* Minor code cleanups.

v2:
* Marked mtk_ovl_set_afbc as static.
* Reflowed some lines to fit column limit.


Justin Green (2):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 89 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 168 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog


