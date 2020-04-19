Return-Path: <SRS0=IGbo=6D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC371C38A30
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Apr 2020 20:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD47D21473
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Apr 2020 20:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q4YaByvT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ykbTKQai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD47D21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GoxJLd2VGLVUolZQ+NQ/SmYIsjysqDhTXpM/lnCjo0U=; b=Q4YaByvTG1EFSX
	sz5qpWTTd7VMiBrziinue/ZXFfcLYkVAB4KEi7V+xwTF1fgMuSyzrkWOpm7cXjtTdRQzbnWVooQHB
	kfp+BnlCh/KeNWscRzLi9yZRsgkr7qmGxPSyw+mZEisHzyhpZ43bqKZxdj04EZ4N0Wdez2uPizj3O
	kfuu1FIuKUtD3EoJBbG3AbKVwTxER0vXIJgtxMQquyB7wlEQs+XSNUq7JUtYf/jFJ1GYKrmw0hUj0
	UUWMYo9yBVNcXea/UpBWRpA8o3Z5iZsA5wKPH06ZAFGFJe3yCur+t972gMNbMqeDnaYxkN4DDGbcg
	bQtRsXryNhq8Q5608Grg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQGII-0004hl-FO; Sun, 19 Apr 2020 20:11:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQGIG-0004gh-IE
 for linux-mediatek@lists.infradead.org; Sun, 19 Apr 2020 20:11:58 +0000
Received: from lore-desk-wlan.lan (unknown [151.48.159.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7051221473;
 Sun, 19 Apr 2020 20:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587327115;
 bh=Uteiu/GUnOSUdNuQXi8TfJhQxKafRhCM39FSRbayK6I=;
 h=From:To:Cc:Subject:Date:From;
 b=ykbTKQaiHabKmJTqMM6O6E3ocX+/mhysYXH8AgWyLOJkJ5NQMDkReqhy88A3U2XS8
 XLfld6g39UqxUpELrmL3y2zpuaUjAD0MWsmbRED7l+FyhJOOfOCYzTSaPPtNOqq2dv
 CZLgg5mFqOMO1aDm9mn7kRpGEGgAKjV695bsNrwU=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: add rx queues info to mt76 debugfs
Date: Sun, 19 Apr 2020 22:11:41 +0200
Message-Id: <26a46b5e2f0775a50b6bc7a8e654ee834aa47010.1587326968.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_131156_642074_CBD42505 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce rx-queues debugfs node in order to dump rx queues status.
This would be useful for mcu fw debugging

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/debugfs.c  | 21 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7603/debugfs.c   |  2 +-
 .../wireless/mediatek/mt76/mt7615/debugfs.c   |  4 ++--
 .../wireless/mediatek/mt76/mt76x02_debugfs.c  |  2 +-
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/wireless/mediatek/mt76/debugfs.c
index d2202acb8dc6..0278e1b44576 100644
--- a/drivers/net/wireless/mediatek/mt76/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
@@ -46,6 +46,25 @@ int mt76_queues_read(struct seq_file *s, void *data)
 }
 EXPORT_SYMBOL_GPL(mt76_queues_read);
 
+static int mt76_rx_queues_read(struct seq_file *s, void *data)
+{
+	struct mt76_dev *dev = dev_get_drvdata(s->private);
+	int i, queued;
+
+	for (i = 0; i < ARRAY_SIZE(dev->q_rx); i++) {
+		struct mt76_queue *q = &dev->q_rx[i];
+
+		if (!q->ndesc)
+			continue;
+
+		queued = mt76_is_usb(dev) ? q->ndesc - q->queued : q->queued;
+		seq_printf(s, "%d:	queued=%d head=%d tail=%d\n",
+			   i, queued, q->head, q->tail);
+	}
+
+	return 0;
+}
+
 void mt76_seq_puts_array(struct seq_file *file, const char *str,
 			 s8 *val, int len)
 {
@@ -92,6 +111,8 @@ struct dentry *mt76_register_debugfs(struct mt76_dev *dev)
 		debugfs_create_blob("otp", 0400, dir, &dev->otp);
 	debugfs_create_devm_seqfile(dev->dev, "rate_txpower", dir,
 				    mt76_read_rate_txpower);
+	debugfs_create_devm_seqfile(dev->dev, "rx-queues", dir,
+				    mt76_rx_queues_read);
 
 	return dir;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
index cc7c788abedd..8ce6880b2bb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
@@ -113,7 +113,7 @@ void mt7603_init_debugfs(struct mt7603_dev *dev)
 		return;
 
 	debugfs_create_file("ampdu_stat", 0400, dir, dev, &fops_ampdu_stat);
-	debugfs_create_devm_seqfile(dev->mt76.dev, "queues", dir,
+	debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues", dir,
 				    mt76_queues_read);
 	debugfs_create_file("edcca", 0600, dir, dev, &fops_edcca);
 	debugfs_create_u32("reset_test", 0600, dir, &dev->reset_test);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 150036488e3f..fd3ef483a87c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -293,10 +293,10 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 		return -ENOMEM;
 
 	if (is_mt7615(&dev->mt76))
-		debugfs_create_devm_seqfile(dev->mt76.dev, "queues", dir,
+		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues", dir,
 					    mt7615_queues_read);
 	else
-		debugfs_create_devm_seqfile(dev->mt76.dev, "queues", dir,
+		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues", dir,
 					    mt76_queues_read);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "acq", dir,
 				    mt7615_queues_acq);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c b/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c
index 68b40d63a46d..ff448a1ad4e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_debugfs.c
@@ -144,7 +144,7 @@ void mt76x02_init_debugfs(struct mt76x02_dev *dev)
 	if (!dir)
 		return;
 
-	debugfs_create_devm_seqfile(dev->mt76.dev, "queues", dir,
+	debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues", dir,
 				    mt76_queues_read);
 	debugfs_create_u8("temperature", 0400, dir, &dev->cal.temp);
 	debugfs_create_bool("tpc", 0600, dir, &dev->enable_tpc);
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
