Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC30C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJ4V+/0YOarbnkYB2sNWFrqwXsH804Q1LtdWnWiML74=; b=pOgDaUivIsqcGc
	oL3H9Dr/Ta4IU7qjl92wOnF+Q7VFo5LvFHi2kuBUfhYP0uBEd7Ozm2lbfzK7Elm7mTzKU50KNBYhC
	XUUggvkruonNQPMQMAOz2AOKq+1owPZ/7JdA0j6fJTcC+t5EFTvbJzHWjtvZzzeG24oXgCp/XQ5aC
	gU6Cxq2cuh5GFOpLpiliCM4+fxDM1Ds1ydeih/k8P7EuX7qNAecMuNW650P4pogr5Kmr/4Urzp9+K
	EfzEK4Mh7WctIMs+OfOXUW6f1zgYzYFLDulyMm3o019z1bvoeTB7kuy0RUcNayEi9Hn8CYRY4kVkm
	P7/VnjqZAKLtMT2A3CAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXWae-000Wr3-7w; Thu, 24 Mar 2022 23:10:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXWab-000Wqa-6O
 for linux-mediatek@lists.infradead.org; Thu, 24 Mar 2022 23:09:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBCFA6162D;
 Thu, 24 Mar 2022 23:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE958C340EC;
 Thu, 24 Mar 2022 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648163396;
 bh=koL0yw/ZGPvfN2cElH8U7dgkhIxPULfTtIaPQ3OmoqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=CTYeZLrYwcwEEFtZIY14kEBvBnhvexZTucDHpM/f8bl9nUVKPtDXa0K+BwRuwonhF
 SKwxZ1SLUM9YzpmvfPHDNKhbK+3X0BcFKq8aRa2gBfajNJL9YgAkfZrIDv7Oj5rh2t
 ZSFXmIRsRge/rSBYAnGPGKVMe78TjiYeDeuF4BrvX6tTQsr8lKKoBv+uEocwvxUVHO
 vnK5/I1wijXnannR3MCvlUvfCixLd6gluaaqKYDJZfanyhJMQ4rmIXfmrCkGcU8LsE
 Ss/WvbW8dfYgn0V3vH7W7gNGL6p/zNcpRVUeZMV2jgdUF1rkLhvyvjbPyM3I7J/GL/
 Ra2lpp9fJleIA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes - 20220325
Date: Fri, 25 Mar 2022 07:10:09 +0800
Message-Id: <1648163409-18338-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_160957_300965_81C4E625 
X-CRM114-Status: UNSURE (   8.32  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Fix dt-binding issue.

Regards,
Chun-Kuang.

The following changes since commit 71941773e143369a73c9c4a3b62fbb60736a1182:

  Add linux-next specific files for 20220310 (2022-03-10 20:04:36 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20220325

for you to fetch changes up to 64884e592d71fd567fef7bdcb0736a5dae71ecb2:

  dt-bindings: display: mediatek: Fix examples on new bindings (2022-03-12 17:32:33 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes - 20220325

1. Fix dt-binding issue.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type
      dt-bindings: display: mediatek, ovl: Fix 'iommu' required property typo
      dt-bindings: display: mediatek: Fix examples on new bindings

jason-jh.lin (1):
      Revert "dt-bindings: display: mediatek: add ethdr definition for mt8195"

 .../bindings/display/mediatek/mediatek,aal.yaml    |  23 +++-
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  23 +++-
 .../bindings/display/mediatek/mediatek,color.yaml  |  23 +++-
 .../bindings/display/mediatek/mediatek,dither.yaml |  23 +++-
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   3 +-
 .../bindings/display/mediatek/mediatek,dsc.yaml    |  23 +++-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  | 147 ---------------------
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  23 +++-
 .../bindings/display/mediatek/mediatek,merge.yaml  |  49 +++----
 .../bindings/display/mediatek/mediatek,mutex.yaml  |  27 ++--
 .../bindings/display/mediatek/mediatek,od.yaml     |  14 +-
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |  26 ++--
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  28 ++--
 .../display/mediatek/mediatek,postmask.yaml        |  23 +++-
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  28 ++--
 .../bindings/display/mediatek/mediatek,split.yaml  |  17 ++-
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |  19 ++-
 .../bindings/display/mediatek/mediatek,wdma.yaml   |  26 ++--
 18 files changed, 262 insertions(+), 283 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
