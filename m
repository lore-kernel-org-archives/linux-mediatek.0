Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5DEC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6460161246
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6460161246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Ut8LygcxopzKOP73jBtXJMSeMCrz4nJUJwVgrAqDl8=; b=fTlQM/0OUMXMObJ5Uh7bgXaEt
	g8yy+lmteQGvRMoOrwRdaKk45MCU0F3qp5+uIizoh3vZW7RWRqBsTulNyvLYGwf5tCQjk4ygnqEj2
	9AxQCCO20++VrcRI9TNK8jFvyS0IMqfFgGaDSRoVrVPkwC8tZ28UDv9VOQxBdGuwZLk/WwxYkydEA
	UA+Eapn/I6RXxEKfLWIjsY2ZxIH/5FpM19fgBm+OmQOnT1Zib7+grB/dPssLKEqZzacIvWX98E7lm
	CObGuDPrt0p0vgfNM8fxe7uwpMDi5PPSRd+bUWUagMjWh7I3dw2+9lGvPJDR41RIl4vLP1k2oBpMb
	PS984ejxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUm5-00A4nU-J1; Mon, 19 Apr 2021 14:21:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUm1-00A4mH-4M
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=JNcocZk8hjtVCZ/Bdy5x/XpVlpSqaYmyUyMtw/ORRTM=; b=4MLSTm6H+vryaeR0rQep+f7+tY
 vVqEaOwFqklIDKIhKOTqFxra9N9uwT09gJ43AW5SV0XbkF3hc7SBJ4LF4TRXrBhS8U19CjvqA/xva
 fUGJzcd3CDH1Zw6YbNhuvhcYpB9Ih+i/AV30nuzN3EmYzpT6YMdjlJB3t5otxpqUly2PfsX8YXY1B
 0iPJzO/Yb0JQIENmT3q4ML8Cvke6vaHue9pKEz1Bf6ljWqtLIwPx1udu3kHs6NjAwaIFVf6SqMd+O
 yKi3kzEHJp8NqlYUyJxhR6EuBfxBoHxMyZW409R7WHANH3Qi3zvcI4CZVoOvhrQBmun2q2uiNsrGg
 bPj3YPyw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUlv-00BRic-Tw
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:09 +0000
X-UUID: b3a923fd4c204782b68eb946de487dcf-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JNcocZk8hjtVCZ/Bdy5x/XpVlpSqaYmyUyMtw/ORRTM=; 
 b=bRCzDXCMTmRVKG/6lHWenyqSwHbxwOCROjKnhqSstZiFmmu0AJadI09Penk7Ur1nNero5fdlipuTmIlhlQNjYIYDpH90Cm+7JH+vbzYdxNhdSMW4ZPVQh4NTmyAU81xT52/Jp3/nKxIXvovPA5afJBENIg11rxZykZ9jTEIYTW8=;
X-UUID: b3a923fd4c204782b68eb946de487dcf-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1731228692; Mon, 19 Apr 2021 07:21:03 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 22:21:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 22:21:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH v2 4/6] mt76: mt7921: introduce mt7921_wpdma_reinit_cond
 utility routine
Date: Mon, 19 Apr 2021 22:20:57 +0800
Message-ID: <1618842059-8192-5-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
References: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAD8A403A11F7897794284DAA6677DC5ECB4C422DCC3A0B248AEECEBD0CF588A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072108_019848_1A3403EB 
X-CRM114-Status: GOOD (  13.19  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Add mt7921_wpdma_reinit_cond to check dummy reg if driver needs to
reinitialized WPDMA after driver_own operation

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  2 ++
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  3 +++
 .../net/wireless/mediatek/mt76/mt7921/dma.c   | 25 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  6 +++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 9e61c107c640..6c889b90fd12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -64,11 +64,13 @@ struct mt76_connac_pm {
 	struct delayed_work ps_work;
 	unsigned long last_activity;
 	unsigned long idle_timeout;
+
 	struct {
 		unsigned long last_wake_event;
 		unsigned long awake_time;
 		unsigned long last_doze_event;
 		unsigned long doze_time;
+		unsigned int lp_wake;
 	} stats;
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index f3982578cc56..6ee423dd4027 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -269,6 +269,7 @@ mt7921_pm_stats(struct seq_file *s, void *data)
 {
 	struct mt7921_dev *dev = dev_get_drvdata(s->private);
 	struct mt76_connac_pm *pm = &dev->pm;
+
 	unsigned long awake_time = pm->stats.awake_time;
 	unsigned long doze_time = pm->stats.doze_time;
 
@@ -281,6 +282,8 @@ mt7921_pm_stats(struct seq_file *s, void *data)
 		   jiffies_to_msecs(awake_time),
 		   jiffies_to_msecs(doze_time));
 
+	seq_printf(s, "low power wakes: %9d\n", pm->stats.lp_wake);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index fb7f98d92377..71e664ee7652 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -353,6 +353,31 @@ int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force)
 	return 0;
 }
 
+int mt7921_wpdma_reinit_cond(struct mt7921_dev *dev)
+{
+	struct mt76_connac_pm *pm = &dev->pm;
+	int err;
+
+	/* check if the wpdma must be reinitialized */
+	if (mt7921_dma_need_reinit(dev)) {
+		/* disable interrutpts */
+		mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
+		mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
+
+		err = mt7921_wpdma_reset(dev, false);
+		if (err) {
+			dev_err(dev->mt76.dev, "wpdma reset failed\n");
+			return err;
+		}
+
+		/* enable interrutpts */
+		mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
+		pm->stats.lp_wake++;
+	}
+
+	return 0;
+}
+
 int mt7921_dma_init(struct mt7921_dev *dev)
 {
 	/* Increase buffer size to receive large VHT/HE MPDUs */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 67cb0a647066..efc3ba791342 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -254,6 +254,7 @@ int mt7921_eeprom_get_target_power(struct mt7921_dev *dev,
 void mt7921_eeprom_init_sku(struct mt7921_dev *dev);
 int mt7921_dma_init(struct mt7921_dev *dev);
 int mt7921_wpdma_reset(struct mt7921_dev *dev, bool force);
+int mt7921_wpdma_reinit_cond(struct mt7921_dev *dev);
 void mt7921_dma_cleanup(struct mt7921_dev *dev);
 int mt7921_run_firmware(struct mt7921_dev *dev);
 int mt7921_mcu_init(struct mt7921_dev *dev);
@@ -317,6 +318,11 @@ mt7921_l1_rmw(struct mt7921_dev *dev, u32 addr, u32 mask, u32 val)
 #define mt7921_l1_set(dev, addr, val)	mt7921_l1_rmw(dev, addr, 0, val)
 #define mt7921_l1_clear(dev, addr, val)	mt7921_l1_rmw(dev, addr, val, 0)
 
+static inline bool mt7921_dma_need_reinit(struct mt7921_dev *dev)
+{
+	return !mt76_get_field(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
+}
+
 void mt7921_mac_init(struct mt7921_dev *dev);
 bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask);
 void mt7921_mac_reset_counters(struct mt7921_phy *phy);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
