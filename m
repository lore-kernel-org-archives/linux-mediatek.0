Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E44C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:17:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B932333D
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44B932333D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ayDa6jag+brpUiJ07tiWIqT0ykTWB3/fWwm2GA2ucdU=; b=1l/5f15GU1eJNRVwMTwXooCKlt
	cyozZehORgZLvqgtsW1Q60fqi+cVrMNJtkzEW4aimAkNa94+3og3IF2KM9/bLD+uQC0ShU8Z3lZVt
	Lb0+egzdgg4d6PUMccCwkGhJoELUVa8tf2GdP/4fSDa5wW5RlFQafqrheRl8gOx/9LuLrP/RA/4FP
	gnIjMLqAX9Q6qClRoYrLkqR3WVFnfsVJ4pcybmKhGyIEkBHcDvEvaNbMAH1cOb2FAJrY2J9psBrXc
	yR1da9plW1dJ06S60hTZALS//l8ZekXLgU5TxoxxtY9SLkLHjYWKfHH8LsdNc65ISz8GeRjd/MRrj
	Z95h8kzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI3l-0003eW-67; Wed, 06 Jan 2021 23:17:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI3g-0003ck-4X; Wed, 06 Jan 2021 23:17:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC14023332;
 Wed,  6 Jan 2021 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975058;
 bh=vKhyMmIuw4dVwfOPSyfNwOpSYaEo7Zn9XZymkFCSHQU=;
 h=From:To:Cc:Subject:Date:From;
 b=h41X+2ABQGKohRVdjEt2dYr3etneeWKi9iNfXaPDBQFjBuflnIYSmANx9OQf+8t87
 RbI1Jr+VAtYTytEu92EVPbgRebX5SuoygMEHw8sZGDMpYWA6ICzTE7PK7vYEr9c6bP
 zj00b4vPMiJ2ovmsYqYgoE1Yl8b90qULYrS8P+7LyBb2ll1d+SKBprgDTL0NfYx5jO
 tPGb5MLJV7kxIVinQ4gCfB8RJAPcMmSTpVLsaqXWDj6K+28me7F+qVnlOqO+mEqhGo
 Xg86qtucp1LJ0lxKC+rgcI+j3a03+tWjU+4zh6/lTJrZRpPfBM+UyFx6RKftdgkZ6V
 FcfTAfLpHzxIg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/5] Share mtk mutex driver for both DRM and MDP
Date: Thu,  7 Jan 2021 07:17:24 +0800
Message-Id: <20210106231729.17173-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181740_248887_A407112D 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk mutex is a driver used by DRM and MDP [1], so this series move
mtk mutex driver from DRM folder to soc folder, so it could be used
by DRM and MDP.

Changes in v2:
1. Rebase onto mediatek-drm-next [2].
2. Export symbol for mtk-mutex API.

[1] https://patchwork.kernel.org/patch/11140751/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

CK Hu (5):
  drm/mediatek: Remove redundant file including
  drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
  drm/mediatek: Change disp/ddp term to mutex in mtk mutex driver
  drm/mediatek: Automatically search unclaimed mtk mutex in
    mtk_mutex_get()
  soc / drm: mediatek: Move mtk mutex driver to soc folder

 drivers/gpu/drm/mediatek/Makefile             |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  32 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |  28 --
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   3 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 -
 drivers/soc/mediatek/Makefile                 |   1 +
 .../mediatek/mtk-mutex.c}                     | 328 +++++++++---------
 include/linux/soc/mediatek/mtk-mutex.h        |  26 ++
 8 files changed, 212 insertions(+), 208 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
 rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (53%)
 create mode 100644 include/linux/soc/mediatek/mtk-mutex.h

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
