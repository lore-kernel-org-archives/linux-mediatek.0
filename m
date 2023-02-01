Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FC3C636D7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=; b=Sh8GYrlTYUL4m+tkvYT/R3avMN
	j8+LY7Y2yydKJBZVezSz3JwmmFNMurL5s6wN1gqIE+30qAqMDBvCn/r6YXzFoN6PpfWL1MAdsfniQ
	dvzsiSZkxyFYG3IXhoTyYZCkB8RKvwT1dYbMKM+kSJijMQmjwvzqvdlZInWBhu6KfNuN7YVQ66Pkh
	xTQUQmqangXwMj11NW6c1xtXdJ+8TskJDdEpSJH3ve5A8TK3d93PxwgKiLGsIU5Gmk5F+VTR6ukNq
	Zqy0rB84jc4y9e5KVjGm05a5QgB5T/3YB331IO7mKROU+eeD7ahgnO9Pk6oFcWUDzKaxDmH8aStAy
	cnQ1Z5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGVB-00CwnE-Rs; Wed, 01 Feb 2023 17:02:29 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGV9-00Cwku-3L
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 17:02:28 +0000
Received: by mail-qt1-x831.google.com with SMTP id h24so9543097qtr.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
        b=NpNPwPTDHN3G1uFG9+p7tm8cd/KNENYKAmYFQUOyf08E0frMjYiYZfKX4mZsZ0cDpw
         NLoXu0SWVmI5DdPr7w1WcuL4PAaYe4gHMVL0Zhj10V0urRokv4hUCXL99ZuUBRLDKKeU
         J0KQpzYzERo6dDnlKT6Bp6HXhTrMrVx5ZO0CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
        b=CLxaEAQF/kcJZirXCAwCYPeqh+SlQw2eutn9oBcKO11Avkc/89KfC/kAugSg0xnZhi
         /8tMMp2UMNfy7pH9ZN+Df5JtKIKz3yAL2WT2ABNR+NUbLdRS5tDtcvGbw9z8jRbtBnJl
         eO/DXccnSScyxKhB7C1F2mBJiULPBbZONty9/VOz5LszSfWM7O+udf4s0TGUFHPaI+pG
         vRzfvAC6qUzHTwS9iDCfR6lh2vi1ID23SFTFb0oDINUYznZ5LMCHQ7LkQ6bY1WagNgRz
         kSzoe6NrrLWQq7a/hEC7gsI61X8wFdwpymw/8uefw2Bc4V9Le7QNfdEO1wzz19XpfM7L
         s2ng==
X-Gm-Message-State: AO0yUKUqpAwIZ4EpOlFR/HujakWcahNGNcC/uQI9Z+Vd0suZ7iy5IFGq
	d2T1JVXy8zm1PYIB5Rx+1GMOnZ71zLgZK5N0
X-Google-Smtp-Source: AK7set+lamIikr/kqNApkdCRwuHsSMZwS1FCEr1MBVspIUpKMXkXSsrzjcsl8UoPQDimWgcp/SqOxw==
X-Received: by 2002:ac8:59d4:0:b0:3b9:a4ae:9d17 with SMTP id f20-20020ac859d4000000b003b9a4ae9d17mr5576168qtf.3.1675270943345;
        Wed, 01 Feb 2023 09:02:23 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:9334:99d8:1f91:70a])
        by smtp.gmail.com with ESMTPSA id z15-20020ac8430f000000b003b646a99aa6sm5549543qtm.77.2023.02.01.09.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:02:22 -0800 (PST)
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
Subject: [PATCH 0/3 v7] drm/mediatek: Add support for 10-bit overlays
Date: Wed,  1 Feb 2023 12:02:07 -0500
Message-Id: <20230201170210.1253505-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_090227_176576_A98C3DFD 
X-CRM114-Status: GOOD (  11.18  )
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


