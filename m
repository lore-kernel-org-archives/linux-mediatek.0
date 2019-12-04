Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6BCC43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 09:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8EC20637
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 09:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ERXPPP4X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IaiGs6c/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8EC20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPPQEd7nIvfYsx7AZ1iEn6IoAk4hB4MzqQJ8uKZuuEk=; b=ERXPPP4XZn5NET
	Yw+lmy8hTgXVyBZK2FNs5f/lnLzV+n6gNu+rf2wwXb9jQyQdYGHEPt5qfCqST+IEYoxd9iHXZHJg6
	zPE4uumLo3opvXfcufFmL1whj6ZQKL1VkfeGWmS5/zAHWaNwLthmtFsBPKVgwFN7Mud/iMJZOY/iD
	ehy68RSegD407iJ2jJqbKHfG0zgU2vYwK+T0uLbrjifRQ3mQrC/pM+SmN2Q1tnzBb6xIs8x0y7Xvf
	niOnPlWHNOXhqqL4hUxtEo0PLKNNJTGYPHPfcSzvMSdt5PHUfyNCBhuw7aAzq0/kKrtg89Xcl1G/Q
	9qCf22+5b4EfR1/T5RqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icRDq-0007Ql-0F; Wed, 04 Dec 2019 09:45:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icRDJ-0005Ta-3O; Wed, 04 Dec 2019 09:44:54 +0000
X-UUID: 628808f5d44a4673bcfc408651cf0ae3-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9c+0u2uq+nknwNcqDuJh0AzVEuM8VtGPxvy/e0XpUMc=; 
 b=IaiGs6c/JAPiiAMmQpc9h6PCnaSSZT6kFGXY38PuHS96pA3HEdFU/DRd8uI6qDXTKJT68LpV2hBH3hW2xDlBTnYRdRgIJLlYYWCx0v9vQzX03HO2krjUEvVIu4lK7cWXFyfcJl/2ctwniu4Zc7GCCWqcjCYTz21FNTH1GPVCVrs=;
X-UUID: 628808f5d44a4673bcfc408651cf0ae3-20191204
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2070285718; Wed, 04 Dec 2019 01:44:45 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 01:45:29 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Dec 2019 17:43:48 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/6] drm/mediatek: fix cursor issue and apply CMDQ in MTK
 DRM
Date: Wed, 4 Dec 2019 17:44:35 +0800
Message-ID: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_014453_142462_8927B6BF 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: drinkcat@chromium.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The CMDQ (Command Queue) in MT8183 is used to help update all
relevant display controller registers with critical time limation.
This patch add cmdq interface in ddp_comp interface, let all
ddp_comp interface can support cpu/cmdq function at the same time.

These patches also can fixup cursor moving is not smooth
when heavy load in webgl.

This patch depends on ptach:
add drm support for MT8183
(https://patchwork.kernel.org/cover/11121519/)
support gce on mt8183 platform
(https://patchwork.kernel.org/cover/11255147)
drm/mediatek: Refactor plane init/check and support rotation
(https://pw-emeril.freedesktop.org/series/69015/)
drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane
(https://lore.kernel.org/patchwork/patch/1154517/)

Changes since v2:
 - move some changes to another patch
 - disable layer in atomic_disable()

Changes since v1:
 - remove redundant code
 - merge the duplicate code
 - use async instead of cursor

Changes since v0:
 - remove redundant code
 - remove patch
   "drm/mediatek: fix atomic_state reference counting"
   After remove this patch, the issue we met before is gone.
   So I do not add any extra code to do something.

Bibby Hsieh (6):
  drm/mediatek: use DRM core's atomic commit helper
  drm/mediatek: handle events when enabling/disabling crtc
  drm/mediatek: update cursors by using async atomic update
  drm/mediatek: remove unused external function
  drm/mediatek: support CMDQ interface in ddp component
  drm/mediatek: apply CMDQ control flow

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  67 ++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 ++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 169 ++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 136 ++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  47 +++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +---------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  50 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
 11 files changed, 394 insertions(+), 222 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
