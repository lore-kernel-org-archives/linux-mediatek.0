Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E3AFA372C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 02:23:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6377221848
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 02:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fkxBTYs1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6377221848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Km3L6rv2bftEUsY1j5a6wlYT5i47wDlW6Ag28s8wllM=; b=fkxBTYs18SCtQt
	GEDD0jvxH9YXcze1Ypfy5kaqTqCcFmIiKUf4GGEqZN4bCC89X8vYBKrsNMHcUO9Wcq1d8hqv6OQQi
	Jk7VluZo8eDtdwsraVoa1CZUQ0kKFlOw5Xr65p14sKsCF4IIUt+rHVy8hDySCGhQ9RrEEBxwvwq+/
	7a26zGWsrY0dPP1XSqa6nUQeSXq/++ZKxRNd9y/+QqHDMCgynW/C2fPLwFaRSi5J9ev0ZyJVM1Jp8
	nttNSS1X3tyZBa7sODKpAhVTyVw/WTHCkKl8CnoGLLjhp2h+nUL02J2PpzIXJs5+QIFgKYhmX1UtS
	Tqyc5++K55bZjOyC3Kvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSXSf-0002Z4-Ne; Thu, 07 Nov 2019 02:23:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSXSd-0002Yk-Vm
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 02:23:49 +0000
X-UUID: 43c6090ebafb4fa28877acc4f8cfa7a6-20191106
X-UUID: 43c6090ebafb4fa28877acc4f8cfa7a6-20191106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1366293003; Wed, 06 Nov 2019 18:23:43 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 18:23:40 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 10:23:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 7 Nov 2019 10:23:38 +0800
Message-ID: <1573093419.13645.5.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm next for 5.5 - 2
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 7 Nov 2019 10:23:39 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B433D3BD14457E0CC75F95C67EF524B0B9BA6E2DB114DC8B87BA556B409960512000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_182348_028036_BCE9CDFD 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dave, Daniel:

This round add new color format support and reflect function.

Regards,
CK

The following changes since commit
631005b255aab5f846f7ca03606613f898d70207:

  drm/mediatek: add no_clk into ddp private data (2019-10-09 16:58:13
+0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-next-5.5-2

for you to fetch changes up to df444457711858d398896d678bd3cd7f43f1c1f5:

  drm/mediatek: Support 180 degree rotation (2019-11-06 16:00:45 +0800)

----------------------------------------------------------------
Mediatek DRM next for Linux 5.5 - 2

----------------------------------------------------------------
Sean Paul (8):
      drm/mediatek: Add RGB[A] variants to published plane formats
      drm/mediatek: Refactor plane init
      drm/mediatek: Add helper to get component for a plane
      drm/mediatek: Add plumbing for layer_check hook
      drm/mediatek: Plumb supported rotation values from components to
plane init
      drm/mediatek: Support reflect-y plane rotation
      drm/mediatek: Support reflect-x plane rotation
      drm/mediatek: Support 180 degree rotation

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  50 ++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 145
++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  22 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  24 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   4 +-
 6 files changed, 205 insertions(+), 42 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
