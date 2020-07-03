Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2922C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E06207DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0yVTwBoX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax1NaOkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71E06207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eWFpMgbzo5vaejJzpWe53E+PhvmNKLq5msIlDikXlxU=; b=0yVTwBoXOeVrUoJy3UD36cvUd
	D/bweaMe0K3CG4HSmmztPgINssq8iAioM70go/NcpJIBUC73xIDnpUPFy1/IGzjVrnzxpeTIATX2R
	ZzWqJlHNNeDZOZGS4gN9qwnZw/ByRa7Txl81jqdV2TCbck1+w8dH5AsHDhFFtHuxcPX7T60Mv6gpY
	MAAz3U3/Mx5uKBswvzyPmyhpT1YcKWZ/EljH3gcNEhQL5UB9L/YzDJ0FYgSUu0R8zJnFxvpWYmG5I
	W7cvQVbMbp9ujZa8rgx9PjR2+Z4VjGGQhI2WgvHY7IWwKbtq80B/51Pa0b5MOn0DTPXAfYbmpyWrI
	UqjNa3zIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsD-00062p-3T; Fri, 03 Jul 2020 08:16:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGs2-0005tq-DQ
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:31 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79821207FF;
 Fri,  3 Jul 2020 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764189;
 bh=UBes1j4vjYhY4PDH2ZniNzUObt9xb2hHJ5Z92aAHH1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ax1NaOkU6d7dw9/ixGrB5hlKqHuYasmWKRlXC6+3ERmtT+B+R6qf4olvnNMxvgLOE
 g3/pKrZ1EpHnjaQelmQczPi0613Ns8h1ZNmw/DlgM/YYoVihOrs/3CTznzWQojUeFl
 xKHeNEELtRV1LYuAq5GgIHDMrRL5v39HE9zCBe5w=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 05/22] mt76: mt7615: wake device before accessing regmap in
 debugfs
Date: Fri,  3 Jul 2020 10:15:44 +0200
Message-Id: <13592f72b6da4ded4ebf96477cc5fb6a9d318cd8.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041630_542441_5CF35257 
X-CRM114-Status: GOOD (  12.89  )
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
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Make sure the device is in full-power before reading regs in debugfs

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 8bb7c64db738..8894a0ab407b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -6,11 +6,16 @@ static int
 mt7615_radar_pattern_set(void *data, u64 val)
 {
 	struct mt7615_dev *dev = data;
+	int err;
 
 	if (!mt7615_wait_for_mcu_init(dev))
 		return 0;
 
-	return mt7615_mcu_rdd_send_pattern(dev);
+	mt7615_mutex_acquire(dev);
+	err = mt7615_mcu_rdd_send_pattern(dev);
+	mt7615_mutex_release(dev);
+
+	return err;
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_radar_pattern, NULL,
@@ -84,7 +89,10 @@ mt7615_fw_debug_set(void *data, u64 val)
 		return 0;
 
 	dev->fw_debug = val;
+
+	mt7615_mutex_acquire(dev);
 	mt7615_mcu_fw_log_2_host(dev, dev->fw_debug ? 2 : 0);
+	mt7615_mutex_release(dev);
 
 	return 0;
 }
@@ -111,6 +119,8 @@ mt7615_reset_test_set(void *data, u64 val)
 	if (!mt7615_wait_for_mcu_init(dev))
 		return 0;
 
+	mt7615_mutex_acquire(dev);
+
 	skb = alloc_skb(1, GFP_KERNEL);
 	if (!skb)
 		return -ENOMEM;
@@ -118,6 +128,8 @@ mt7615_reset_test_set(void *data, u64 val)
 	skb_put(skb, 1);
 	mt76_tx_queue_skb_raw(dev, 0, skb, 0);
 
+	mt7615_mutex_release(dev);
+
 	return 0;
 }
 
@@ -167,9 +179,13 @@ mt7615_ampdu_stat_read(struct seq_file *file, void *data)
 {
 	struct mt7615_dev *dev = file->private;
 
+	mt7615_mutex_acquire(dev);
+
 	mt7615_ampdu_stat_read_phy(&dev->phy, file);
 	mt7615_ampdu_stat_read_phy(mt7615_ext_phy(dev), file);
 
+	mt7615_mutex_release(dev);
+
 	return 0;
 }
 
@@ -221,7 +237,10 @@ static int mt7615_read_temperature(struct seq_file *s, void *data)
 		return 0;
 
 	/* cpu */
+	mt7615_mutex_acquire(dev);
 	temp = mt7615_mcu_get_temperature(dev, 0);
+	mt7615_mutex_release(dev);
+
 	seq_printf(s, "Temperature: %d\n", temp);
 
 	return 0;
@@ -233,6 +252,8 @@ mt7615_queues_acq(struct seq_file *s, void *data)
 	struct mt7615_dev *dev = dev_get_drvdata(s->private);
 	int i;
 
+	mt7615_mutex_acquire(dev);
+
 	for (i = 0; i < 16; i++) {
 		int j, wmm_idx = i % MT7615_MAX_WMM_SETS;
 		int acs = i / MT7615_MAX_WMM_SETS;
@@ -253,6 +274,8 @@ mt7615_queues_acq(struct seq_file *s, void *data)
 		seq_printf(s, "AC%d%d: queued=%d\n", wmm_idx, acs, qlen);
 	}
 
+	mt7615_mutex_release(dev);
+
 	return 0;
 }
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
