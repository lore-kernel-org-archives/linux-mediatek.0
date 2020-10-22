Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6AAC55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:29:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52A322249
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YeMwfccZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PD4UCzZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B52A322249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1QZWLfUKII9E5ZeyxWymaYVSnrVNPxkmDB/gqU5C5/8=; b=YeMwfccZ6o5g+btfPPiXancqP
	C0gmlcLMRVEGlLM+yg9FdweFIJgzed0oQd54PTEEntaQP7U2yWyR2jy8dPSGcdx1igxtf+1cNn8Zg
	CEee+PG7CaiTNwfDC00ci6KAyuSVzqp4WRTGDJSkIUwl4ZVoK93GYmh7pbzGmNOYDLBA12/LPKfXN
	5mYKwljWJfnuOJtnhOyk4bZ9Sd/7ShlY71rqFKFDGUOQGt4khfZAVAH2PZdQqEdDUQuNmsSUtmyep
	lnVXk6hEq0pryTNA4H1g9F80ro+MEgwiVs6E29O/cRcBFs0EuLX++d+5jjO0eaCRh2XH08c8IK5EX
	GfCNfBvJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVQLe-0002zp-9C; Thu, 22 Oct 2020 02:29:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVQLY-0002uV-Gb
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 02:28:57 +0000
X-UUID: e53179ce3a5b480fa159b26beb271a1f-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Xc9AEzvVsB14dXFTxBdxWUYms3Pt4khR3WyeScYHvVw=; 
 b=PD4UCzZJ5OWZk4g8GXP8zpsV851CS9u2WRHWH4/UFnWv0s2ANNR5NeDmKej7nljL6hjGE6tLpml3ZneYfQDF+iSrDnpx3xO5H/+nMF1bP+xpWX/95cGxmxIMpp6tfvS9A/N9AKU8eAy6mvGESVzceQvsSBE4gnc0y3Dc5yfRvvo=;
X-UUID: e53179ce3a5b480fa159b26beb271a1f-20201021
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 775376851; Wed, 21 Oct 2020 18:28:43 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 19:28:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 10:28:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 10:28:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v4 10/10] mt76: mt7915: add support to set tx frequency offset
 in testmode
Date: Thu, 22 Oct 2020 10:28:20 +0800
Message-ID: <20201022022820.3077-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201022022820.3077-1-shayne.chen@mediatek.com>
References: <20201022022820.3077-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB4A3D2A80CB3F71F154246CEE489732BE5F3B5B1E04D93793DBBDF147D4C7B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_222856_709007_32A34D90 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support to set tx frequency offset in testmode, which is usally used in
the pre-calibration stage.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 20 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.h  |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 0a7e9d2..ff5ed09 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -48,6 +48,7 @@ enum {
 
 enum {
 	MCU_ATE_SET_TRX = 0x1,
+	MCU_ATE_SET_FREQ_OFFSET = 0xa,
 };
 
 struct mt7915_mcu_rxd {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index b3649bc..9ee82e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -8,6 +8,7 @@
 
 enum {
 	TM_CHANGED_TXPOWER,
+	TM_CHANGED_FREQ_OFFSET,
 
 	/* must be last */
 	NUM_TM_CHANGED
@@ -15,6 +16,7 @@ enum {
 
 static const u8 tm_change_map[] = {
 	[TM_CHANGED_TXPOWER] = MT76_TM_ATTR_TX_POWER,
+	[TM_CHANGED_FREQ_OFFSET] = MT76_TM_ATTR_FREQ_OFFSET,
 };
 
 struct reg_band {
@@ -82,6 +84,19 @@ mt7915_tm_set_tx_power(struct mt7915_phy *phy)
 	return ret;
 }
 
+static int
+mt7915_tm_set_freq_offset(struct mt7915_dev *dev, bool en, u32 val)
+{
+	struct mt7915_tm_cmd req = {
+		.testmode_en = en,
+		.param_idx = MCU_ATE_SET_FREQ_OFFSET,
+		.param.freq.freq_offset = cpu_to_le32(val),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
 static int
 mt7915_tm_mode_ctrl(struct mt7915_dev *dev, bool enable)
 {
@@ -226,6 +241,11 @@ mt7915_tm_set_rx_frames(struct mt7915_dev *dev, bool en)
 static void
 mt7915_tm_update_params(struct mt7915_dev *dev, u32 changed)
 {
+	struct mt76_testmode_data *td = &dev->mt76.test;
+	bool en = dev->mt76.test.state != MT76_TM_STATE_OFF;
+
+	if (changed & BIT(TM_CHANGED_FREQ_OFFSET))
+		mt7915_tm_set_freq_offset(dev, en, en ? td->freq_offset : 0);
 	if (changed & BIT(TM_CHANGED_TXPOWER))
 		mt7915_tm_set_tx_power(&dev->phy);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 04f4a2c..964f2d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -11,6 +11,11 @@ struct mt7915_tm_trx {
 	u8 rsv;
 };
 
+struct mt7915_tm_freq_offset {
+	u8 band;
+	__le32 freq_offset;
+};
+
 struct mt7915_tm_cmd {
 	u8 testmode_en;
 	u8 param_idx;
@@ -18,6 +23,7 @@ struct mt7915_tm_cmd {
 	union {
 		__le32 data;
 		struct mt7915_tm_trx trx;
+		struct mt7915_tm_freq_offset freq;
 		u8 test[72];
 	} param;
 } __packed;
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
