Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4712C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zkde7XvD7sTr+5siCiMHCEt37fW2eS9UKRT7T3OjxcY=; b=mAIaGYRkFyD8051n0Jn25MVbeb
	UE2mcZxcRq7aYJDxh8CyGDRvZqVLSOianRuU3/Z/2gm4AIUfhusFEb7b78NPKZSBK7/pEPkYaEPV0
	bnEMOL1gDmgg/r1HzKY5DpI0FI/HS5jQ6ifUSPmekSHYTgzlApSWq3QMZApzaWKMoinmm5+KF5qur
	3B6Wra1Je6BqoUnU6ILPyCF5BJFZLKRh4WyaGhpCqWAKf5pULEi93f7zqXfs9YSk3aMClYsfBRpw9
	0snbkM5D8CcvXA10QHOuGn3U+BwqMvlfKnO0Th6Skn+t2s6IGU8DThuL6w/qYD8q2/4NK+aDPGdPy
	aOpERIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPP-00GzIv-Vp; Wed, 28 Sep 2022 15:55:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPF-00GzFa-4w; Wed, 28 Sep 2022 15:55:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7D9161F11;
	Wed, 28 Sep 2022 15:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A339FC43146;
	Wed, 28 Sep 2022 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664380527;
	bh=RIn6sZf4k88Tnw5v3eTqACWbQ/KJxG3w+Kp9KpVeALg=;
	h=From:To:Cc:Subject:Date:From;
	b=bCY3qTb4/+dYc65wXDwqxgoTq77tM2XbIZQRImu59q9I62cckO9dRTEjEj6UD4hmE
	 wZyAoOcjXJzhmftW6Lz6yXZn43NBhnX9mdwFYKcBDjx9gJBL2Zj+i9cklfFFOmAj9T
	 z7mfUe+nEsVuEg45jVQnzNTM3BHoUcw7z5yXsmiWDLNWq4KbikSPO07vuo/h+xXI9M
	 Js39IvW3fVprP5SbBVTfdpbevt6LzayhsBHd8rNhHaR4RpwnYqFXSdX78pVg7vlWfN
	 oznf0AHJWiDYVmtvIG+5o/OwjOCNM+ak86TAQS1IkUzXCM/pqu7+rIy7NFDJmqDy4u
	 xS6IeGGAafKog==
From: matthias.bgg@kernel.org
To: roger.lu@mediatek.com,
	jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/8] soc: mediatek: mtk-svs: refactor and cleanup the driver
Date: Wed, 28 Sep 2022 17:55:11 +0200
Message-Id: <20220928155519.31977-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085529_271996_DF5D251A 
X-CRM114-Status: GOOD (  12.60  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Mediatek SVS driver got accepted upstream but has coding style issues
which were overseen in the review process. This series is a first step
to clean up the driver. It basically cleans up the SoC specific probe.
As next step we will need to clean up the 'struct svs_bank'.

This series should be a mere cleanup with no functional change. I'm
happy to recieve tested-by tags to make sure it does not break anything.


Matthias Brugger (8):
  soc: mediatek: mtk-svs: clean up platform probing
  soc: mediatek: mtk-svs: improve readability of platform_probe
  soc: mediatek: mtk-svs: move svs_platform_probe into probe
  soc: mediatek: mtk-svs: delete superfluous platform data entries
  soc: mediatek: mtk-svs: Move SoC specific functions to new files
  soc: mtk-svs: mt8183: Move thermal parsing in new function
  soc: mtk-svs: mt8183: refactor o_slope calculation
  soc: mtk-svs: mt8192: fix bank data

 drivers/soc/mediatek/Makefile         |   3 +-
 drivers/soc/mediatek/mt8183-svs.h     | 113 ++++
 drivers/soc/mediatek/mt8192-svs.h     |  64 ++
 drivers/soc/mediatek/mtk-svs-mt8183.c | 235 +++++++
 drivers/soc/mediatek/mtk-svs-mt8192.c |  98 +++
 drivers/soc/mediatek/mtk-svs.c        | 882 ++------------------------
 drivers/soc/mediatek/mtk-svs.h        | 279 ++++++++
 7 files changed, 853 insertions(+), 821 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8183-svs.h
 create mode 100644 drivers/soc/mediatek/mt8192-svs.h
 create mode 100644 drivers/soc/mediatek/mtk-svs-mt8183.c
 create mode 100644 drivers/soc/mediatek/mtk-svs-mt8192.c
 create mode 100644 drivers/soc/mediatek/mtk-svs.h

-- 
2.37.3


