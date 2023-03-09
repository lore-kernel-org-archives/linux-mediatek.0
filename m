Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DDDC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5fdk5ddG0VI4+eLcH5P8m0R0KTm1sGVdyuOV57yiRLM=; b=SMlxJxKSbRzUaTxkPPwTSsf7wC
	Pih8vJhwVzoaSxnmtU71CE08FzxM79hPjNlJtgtTGnCGuvvORqN3Xs9UDI3UP3CgYceJUgiWks439
	Z7O/+ECANE7n+g2infpyH9cqSHNuRJxl7dMSAZNe8Vez2ysSOsL0AlGUW2Qa/M51LqyyIY3RYpv0f
	mO/wb3/pkFLSF/gbDhC0SNrnO67CVy7FcEjyA9htooD3tzZaO2FaZOxBreG5xhI2PXTTE0qMtnFQY
	ryTyuV+qDm7zUWtpiieOeXBq0H2EZ+b+SJZRUGBpgPssdzptM9HYBmbfe0nRocuMfP1JHML6auPY7
	9a+bR8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paOYU-00C8KW-Dd; Thu, 09 Mar 2023 22:16:10 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNS9-00BvLJ-FO
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:05:35 +0000
Received: by mail-qt1-x835.google.com with SMTP id cf14so3555715qtb.10
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678395931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fdk5ddG0VI4+eLcH5P8m0R0KTm1sGVdyuOV57yiRLM=;
        b=RBqNVCm8GUHGKKA3VwyZcbBavXznAkMiwwEZ2Eulet3wzdElxSkFVXad1g1rMIlR2Y
         FGf9HpescsayfQswXulDzaf1RxBm9Le4JfAx2ANqoHZm1kEOkzz+JyOPf5Ofj9dTHHHv
         XJlKkUHI/0gRhYUePhLV1dYdxm9bx/WuPJ8tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678395931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fdk5ddG0VI4+eLcH5P8m0R0KTm1sGVdyuOV57yiRLM=;
        b=TvOODaJIppOumJP9jQebdbwnFahxPfFFlFzmt1z8zCNvCQHi9AGRM69Qt/GLQzvk/j
         vx+sehF3yzjUbbbDJnecs5TZuJYRRakcujgU+xn9Xbim8UX2Oq/4+kfTr7po/Q4w8ZSU
         XA+7nQfv7CMTETHaPV0zymuMjUV+g/uRCPji+8r+8p32HB9x72YBRnh7Nv1PBPGpXqVo
         /Nb/S/fRgs7kxOx1OnyWkJtMsuIDtvSKKvaFW9f6V+mk/wgfuSJ46Jm2zE2aTDr8YG1w
         5Xzqq6gz0RR1ri+mzKFu+bUHce8mBtLyGiYP1qpx232EppTGgg+pOYfLAbXHQSE6ZJsZ
         yt8A==
X-Gm-Message-State: AO0yUKV5xWBCGSh96SAMbxTDzAbwxRVGE4zyp+l+Z21ioRG/lBtuR21Z
	ydnJOkF+mRN6005pEVtDlRDp66IM+gXkt0szCP9/Hg==
X-Google-Smtp-Source: AK7set+w4EWBSOO5zfRJ+E2Yd08TsXQt0IbgUpDwnMvWNZ+EuowMhItpb0iWBXDHVpAub6dbY1Q2cw==
X-Received: by 2002:a05:622a:44a:b0:3bf:da1b:8023 with SMTP id o10-20020a05622a044a00b003bfda1b8023mr3569483qtx.38.1678395930899;
        Thu, 09 Mar 2023 13:05:30 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:a575:2520:a8e1:989d])
        by smtp.gmail.com with ESMTPSA id 69-20020a370548000000b007426f115a4esm14302375qkf.129.2023.03.09.13.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:05:30 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org
Subject: [PATCH v8 0/3] drm/mediatek: Add support for 10-bit overlays
Date: Thu,  9 Mar 2023 16:04:13 -0500
Message-Id: <20230309210416.1167020-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_130533_589882_E962A817 
X-CRM114-Status: GOOD (  11.20  )
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

2. Add AR30 and BA30 support to overlay driver.

3. Enable AR30 and BA30 overlays on MT8195.


Version history:
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.
v7:
 * Gate setting OVL_CLRFMT_EXT register on compatibility.
 * Split patches for adding 10-bit support and enabling 10-bit support on
   MT8195.
v8:
 * Updated descriptions for patches 2 and 3 in the series.


Justin Green (3):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays
  drm/mediatek: Enable AR30 and BA30 overlays on MT8195

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 173 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog


