Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376E8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0955320C09
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iz7VshqN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWN/3Twx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0955320C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQuc7Lio01PqzSVjyJyStN2TxjJAskZqvVGgds3I5Ag=; b=iz7VshqNb/FYc+P86oz6Zu44W
	eX45v4v4Q66wAFQUW14MD7tDM5y9i8zMBIqgO/cGk81iMxUzFqm2sT+ycr/YCK8Z9Lsg0l7Kj8GbX
	cz8bf9x/nXFlGUynH3hxkl/QJpQSXJc2AeMnKY6icuif/0H4oLqvqdmwEzA6kLSZupGnnmYfJ/1YG
	YkFSVTl8B1qJ4xraTWQUIQAgfUyDVO9iJSHY9TdAmeXRKwVrNLuseVVLm/O1095hFR0c1rT+YXg7i
	WEMYMLCmEH8ZUYZsPeKU0ar/mfCf9qwrVT7jdI9Mse0qwqmQrv4amAExvgjnjfxs19s1F9FjqMJKD
	SfbjBli/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovqy-0001yX-Ja; Fri, 26 Jun 2020 21:25:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovqw-0001x3-7z
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:42 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A94120B1F;
 Fri, 26 Jun 2020 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206741;
 bh=tuLy4ShzWJs5sATRkIvM4SMsEx6NlrCEvROfr7GG5zA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DWN/3TwxAZ6w6DqupEkMRvnpF8ozFPuAn7ukJ1OYdI0bsB2wGtGtFKHU0SfU4XVO9
 UyHaHN+lydu6jnatPKNbaaTr6FDXSGtDmR2o9wgNyP2qqm3V4J9tyuvzkG/2KmCfMH
 4pLlaKuHVM4l+8JMVJUs+D8ElcEidkb1IuXs75o0=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 05/17] mt76: mt7615: wake device before accessing regmap in
 debugfs
Date: Fri, 26 Jun 2020 23:25:05 +0200
Message-Id: <4ad493ebe2a26e709c50edf16d29a310f57d8fcf.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593204577.git.lorenzo@kernel.org>
References: <cover.1593204577.git.lorenzo@kernel.org>
MIME-Version: 1.0
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Make sure the device is in full-power before reading regs in debugfs

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 8bb7c64db738..b4c196005ebf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -167,9 +167,13 @@ mt7615_ampdu_stat_read(struct seq_file *file, void *data)
 {
 	struct mt7615_dev *dev = file->private;
 
+	mt7615_mutex_acquire(dev, &dev->mt76.mutex);
+
 	mt7615_ampdu_stat_read_phy(&dev->phy, file);
 	mt7615_ampdu_stat_read_phy(mt7615_ext_phy(dev), file);
 
+	mt7615_mutex_release(dev, &dev->mt76.mutex);
+
 	return 0;
 }
 
@@ -233,6 +237,8 @@ mt7615_queues_acq(struct seq_file *s, void *data)
 	struct mt7615_dev *dev = dev_get_drvdata(s->private);
 	int i;
 
+	mt7615_mutex_acquire(dev, &dev->mt76.mutex);
+
 	for (i = 0; i < 16; i++) {
 		int j, wmm_idx = i % MT7615_MAX_WMM_SETS;
 		int acs = i / MT7615_MAX_WMM_SETS;
@@ -253,6 +259,8 @@ mt7615_queues_acq(struct seq_file *s, void *data)
 		seq_printf(s, "AC%d%d: queued=%d\n", wmm_idx, acs, qlen);
 	}
 
+	mt7615_mutex_release(dev, &dev->mt76.mutex);
+
 	return 0;
 }
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
