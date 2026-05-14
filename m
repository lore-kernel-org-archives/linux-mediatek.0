Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C4BCD37AC
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 19:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W29iSTC1z0rkF6yGO5rvBMSzfBy2esdMaVKN7MrSPZk=; b=3GzyJpmKWPaYtRT1Ag72Tw1XRa
	T65mFckRLunR5VUDFpbPlxHLXT7yISGiMKE/c4njiIwXvLzakshkvIEXFJ9Ga63QAHzVYY2k+eJ8m
	HOYgrI5gE1y5IsxxbjJwl1MMIsd/+iuxCx7Mz80WbXorUy4u/4Uso0iZJbTMf8m4ciNY//9u6Sulu
	sDw3LnQsjD58wlRYJHf5xI0Bf87knqCxAT4QSyBYKq+KsN/unGGrpEt+bIrVq0ROrjvzeAm/UU1gc
	JFRg1vcApV0kypAQtU0un/nutHdPwK9r69YBF6pqlCScAG1xhdMRUgKqTK9djMMC3FXnq0HYdmyxi
	TjXPA1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbne-00000006Qh8-3X5K;
	Thu, 14 May 2026 19:32:50 +0000
Received: from cvsmtppost101.wmail.worksmobile.com ([125.209.209.40])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbnc-00000006Qfp-1UXy
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 19:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1778787166;
	bh=1acIE6332zSbWTuobynlJDelq6HeX8f/lMzTcfmrhZI=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Fdey8ZGOSfk104QZnJNMU4NpPN/Fryl3JSkyJe/0ULIMe2o6sGBcy59hp1av1j1DE
	 7ipFZFo00mOoRXvHjy+NsoHJSC2nEaRP4QQZpViNzU2xK7wPORgpkV0oVOogxH6mfF
	 SrZ1J/McYN+GZUMAr1fSIi+VlRuKjfSz2265A1+rgXkEROqzswLbVzsYclfg42vxSD
	 TvaqlGmemJdtJilvWXbCjmw5TmgnhlJz3EGp+K1+vDb90GvHA9G39v/jzyEn7xiDUI
	 FmGwkFKdYMQxGhEjlLXYtYIetv1Hv37LKkoCvuOV0YSlyIiZIDtieerWTlRoARiAsP
	 Z+BRbN3YyqyfA==
X-Originating-IP: 163.152.163.130
Received: from cvsendbo005.wmail ([10.112.11.110])
  by cvsmtppost101.wmail.worksmobile.com with ESMTP id ofpm-sdtQgWy70O3K0udpw
  for <linux-mediatek@lists.infradead.org>;
  Thu, 14 May 2026 19:32:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1778787166;
	bh=1acIE6332zSbWTuobynlJDelq6HeX8f/lMzTcfmrhZI=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Wq/VWUnqLFTs80y9ME8gB8wdrpn1uyxsi9oYXmwk2JBqiU+0Vvy5CoNUI8FPREA1o
	 i8QkTwOCPoWwsXoIgNnJkVprRrx+2l/msWVIr0rjqXNobmM/p9a81NaheR6CuYl3ET
	 wcZ6Jvni5g/szquJFjFwLE9pG6ws/AzkNU4FLHVs=
X-Session-ID: nGRzE80uSn2UmjmtNUGmRg
X-Originating-IP: 163.152.163.130
X-Works-Send-Opt: 3lYwjAIYjHmXFoEXKBmwaAErKqpYjHmm
X-Works-Smtp-Source: Adn9Fq2XFqJZ+Hm9Fobd+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp401.gwmail.worksmobile.com with ESMTP id nGRzE80uSn2UmjmtNUGmRg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 14 May 2026 19:32:45 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mt76: Use IS_ERR() check for mt76_register_debugfs_fops()
Date: Fri, 15 May 2026 04:32:43 +0900
Message-Id: <20260514193243.2518979-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_123248_666174_A5AFA7C7 
X-CRM114-Status: UNSURE (   9.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt76_register_debugfs_fops() returns the dentry from
debugfs_create_dir(), which yields an error pointer on failure and
never NULL. The NULL checks in the per-chip *_init_debugfs() helpers
are therefore unreachable, and on a real failure the ERR_PTR would
be returned to callers as a valid pointer.

Use IS_ERR() and propagate the actual error via PTR_ERR() in
mt7615/mt7915/mt7921/mt7925/mt7996.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 0f7b20152279c..5c3646a67e4b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -550,8 +550,8 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
-	if (!dir)
-		return -ENOMEM;
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
 
 	if (is_mt7615(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues", dir,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 26ed3745af43e..f62a17c8958ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -1296,8 +1296,8 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(phy->mt76, NULL);
-	if (!dir)
-		return -ENOMEM;
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
 	debugfs_create_file("muru_debug", 0600, dir, dev, &fops_muru_debug);
 	debugfs_create_file("muru_stats", 0400, dir, phy,
 			    &mt7915_muru_stats_fops);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 4333005b3ad95..4da339867b6a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -266,8 +266,8 @@ int mt7921_init_debugfs(struct mt792x_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
-	if (!dir)
-		return -ENOMEM;
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
 
 	if (mt76_is_mmio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues",
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index e2498659c884e..01aa4a1071fdd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -291,8 +291,8 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
-	if (!dir)
-		return -ENOMEM;
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
 
 	if (mt76_is_mmio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues",
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 34af800964d11..63cd490977106 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -875,8 +875,8 @@ int mt7996_init_debugfs(struct mt7996_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, NULL);
-	if (!dir)
-		return -ENOMEM;
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
 
 	debugfs_create_file("hw-queues", 0400, dir, dev,
 			    &mt7996_hw_queues_fops);
-- 
2.34.1


