Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7527C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 15:06:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE9760EBB
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 15:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DE9760EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kPGZB7NAs46FA4Y7HQM3kv6v95KmCo8clDEJs/+W+YQ=; b=RTZuYZP+lT0h7V
	IM/swISIKs0bWDFEV8crUvEDxDz1W543HHtWs7m/1bjTzBrM3BcvgOm8ZRk/yHkPqCCAZzvklC0iy
	hahSXwl3VGHkJ6VyZL5PJl329jVo2RBqzCEiYWWqDhPihUhWzM5e08wWDnqvadxuKToetOaJmtq5w
	ynP+2Wj/QI2Ih74SfBY26zswriWFGCNHBdq82Sq+46d3owjhZSLLVZ78uTSxo2p4iqI7nykke7x6L
	EfDIj+cldiUsVUcYwz929WDH06DRDAlaC9moZslQvDlxfLjD5BjJhorg4JbS/pPDBsIn7OGpLsXOI
	98r9UCuGoIr30/Q8Q/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD6qy-0013mj-1U; Mon, 09 Aug 2021 15:06:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD6qv-0013li-4I
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 15:06:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 523ED60F11;
 Mon,  9 Aug 2021 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628521568;
 bh=kKiTuvHFidh89Tnf5j3aUlnVrP9Bk+cJepda4RZf2JI=;
 h=From:To:Cc:Subject:Date:From;
 b=MgJjEUF13nttx8J2Xigea3vHPNd2QgnbhooTznezLCoo0S0WEdzmbSZfKg6ZsWHGA
 Mv7QtW5HWpVneh1qmI/zj+xiSRtp8VXmIQU0vVYkCLvN4fjvr/PRWRc01t/hYjWzAB
 9N3yoKJq0aMhghTyvAlybhBvIv0bka+0gXQTfTts3HnyyLXP4GeEHrLv3rihWNIgrz
 GshO2FbX8JYitGFHHCA0p/pOG5T2uBbbBdvCzTfmwj/l8aqxaxXtySowC1lDhzSB4w
 mPPAQ64H8TLYNoH64arFPkjAZmjQoCAzVfLAh7byWaCIQDgpOPJ17A2FKQKG5zLJC8
 NUokdSDESNeDA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes for 5.14
Date: Mon,  9 Aug 2021 23:06:04 +0800
Message-Id: <20210809150604.32426-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_080609_226593_E6088398 
X-CRM114-Status: UNSURE (   5.59  )
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

1. Fix dpi bridge bug.
2. Fix cursor plane no update.

Regards,
Chun-Kuang.

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.14

for you to fetch changes up to 1a64a7aff8da352c9419de3d5c34343682916411:

  drm/mediatek: Fix cursor plane no update (2021-07-22 22:57:52 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.14

1. Fix dpi bridge bug.
2. Fix cursor plane no update.

----------------------------------------------------------------
Frank Wunderlich (1):
      drm/mediatek: dpi: Fix NULL dereference in mtk_dpi_bridge_atomic_check

Hsin-Yi Wang (1):
      drm/mediatek: mtk-dpi: Set out_fmt from config if not the last bridge

jason-jh.lin (1):
      drm/mediatek: Fix cursor plane no update

 drivers/gpu/drm/mediatek/mtk_dpi.c       |  6 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  3 --
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++++++--------------
 3 files changed, 39 insertions(+), 30 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
