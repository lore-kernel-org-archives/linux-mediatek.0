Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 23:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2561E610CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 23:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2561E610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kh+WESYSD3sPIDyzi6sEPCjMMF3T7TCce8g09wDz1DM=; b=STzUTfHwKUvviG
	u5rDOhbd+yJyZ/3tP9JvC+jq6LSigtZca54MaiWQptyYtFOoiwUm1kFRnjtG9NMazPNOTZIEESV+1
	Lw4AOFKgEzQPsBBPYzJGqE1NY5wZr895f93xlKIlu7v7krX4B6eKkGOiOk9JLVjOt+38OSs9p6HCL
	L4F1jHTztiU0GbBHPl70vDsO5pu7ymjnDAnMjPmzTehK9pHI7UY1Z56KKIbxHHd1qkn6M8Q5DHb0y
	A3yF1jSayvNVbYVsG5W5JKV4zs/mhYbZN51xcz+EFo4+40up+IT9ZYCM+Qs7udY2QUuPyrnOc2JTl
	5OwQUudM4o/A/nbkVvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mao1M-0014pp-0r; Wed, 13 Oct 2021 23:50:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mao1J-0014oE-Bv
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 23:50:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 666AE610FE;
 Wed, 13 Oct 2021 23:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634169048;
 bh=2CZILZS8k2Wus3hkLlSNYvJgO+c8wjp2peYkC+hIfpA=;
 h=From:To:Cc:Subject:Date:From;
 b=bdt/QUmq3f6P/rs+t4WDUk0hLb8de7273Cdn3cQwjml8bHUpF+LCOevqCfwoJY51O
 ImY5DmolrXbL29CxsR15Q4je6XmRBB79or3owG/yl6YVte1WMONEYr/y+ZOb9vCMT5
 SalYXVr444IhTE71EWDIv54y9BMFpxcteTSEZ4xj6grXTQEvhWxLHufqQUOvdSy3gb
 hixguvicxR8dhIlwLeHtaj1g74gvmHZk/WdFBEYnRsdyrL7wl2YQ7h36ejK7jvMARQ
 KHCsA4CTQ3rccjIBYeQ+Gt6zH31ztXzSLHB1qwucyprGR6EN39BdezFi+s3+fiyo+K
 C6UDY3c2ngIXg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes for 5.15
Date: Thu, 14 Oct 2021 07:50:44 +0800
Message-Id: <20211013235044.5488-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_165049_445233_BE92BA13 
X-CRM114-Status: UNSURE (   4.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Revert series "CMDQ refinement of Mediatek DRM driver"

Regards,
Chun-Kuang.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.15

for you to fetch changes up to 4157a441ff068cc406513e7b8069efa19bba89d0:

  Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb" (2021-10-12 08:02:27 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.15

1. Revert series "CMDQ refinement of Mediatek DRM driver"

----------------------------------------------------------------
Chun-Kuang Hu (5):
      Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
      Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
      Revert "drm/mediatek: Detect CMDQ execution timeout"
      Revert "drm/mediatek: Remove struct cmdq_client"
      Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb"

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 157 +++++---------------------------
 1 file changed, 24 insertions(+), 133 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
