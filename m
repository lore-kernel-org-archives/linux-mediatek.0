Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D630C0018C
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 02:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D654023B08
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 02:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D654023B08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AtWUfRa8O7Q9hMkLjonp438spR09KvhkTSAMZCeM7j4=; b=SHqye/pEcs0WUFi3GSlLCqfINQ
	MWV87khdVMOlFBOSL314p4QaiRORj/UQ28wBdUTv3ynbQpLDde67Mh+zFjVAD45V4fLLr30lXFXHv
	nMqUzU6PzjhVNSdY5sEZkRL/TQ8i4y5WL0hARlsImhl/yO04avHIfVNOCX8/1oT8MDUVtIPP+v7uf
	UsbLuwBxVN1hyQFeHhFEQ1OuT41G6ggAjeA33s1AAJBEX3EiQJbEo4FY1uj8gYzDp00lV5Cy1DTsL
	5YZ/M/U2CaMIh4YcZiqsBRFXtSLH2va4Kju/PFe1ESG9cUQJkx/QPiOkTVACYC4yjds+EPdPKZU04
	EXcE/u0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqob6-0006pX-R4; Sun, 20 Dec 2020 02:37:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqoax-0006la-22; Sun, 20 Dec 2020 02:37:16 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/5] Share mtk mutex driver for both DRM and MDP
Date: Sun, 20 Dec 2020 10:36:50 +0800
Message-Id: <20201220023655.30795-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_213715_186421_AEBB465A 
X-CRM114-Status: UNSURE (   9.33  )
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

This series based on linux-next next-20201218 [2]

[1] https://patchwork.kernel.org/patch/11140751/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=next-20201218

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
 .../mediatek/mtk-mutex.c}                     | 317 +++++++++---------
 include/linux/soc/mediatek/mtk-mutex.h        |  26 ++
 8 files changed, 201 insertions(+), 208 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
 rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (54%)
 create mode 100644 include/linux/soc/mediatek/mtk-mutex.h

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
