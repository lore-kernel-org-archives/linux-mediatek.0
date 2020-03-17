Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F0C18E5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FD620663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AVMTYnHR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxkJ/u9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1FD620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKC3df1I17OBAlR79zTHOPnrX0uQ8IZVk2ofMYawV/Q=; b=AVMTYnHRUTwB3C
	E0FIoD1Pnl/0QY2CwERbiTOZIVIbfUZhB93UaSTQgjF3KaQo6/od90E/4jrejsK4b+n0VnoiaLTv9
	iW2JeCJlqA182TYumCIQeHl+35Nd5uans18voF6mwsZmup9ao+N22nW+DHSO2ofmldnIOTroN2u+T
	zTcvqTmL46lliaSJ4/OnvJHh/afDykDSDDpmFTeW0Yk9D3KtTmtwkV4sGNZMZKkgtN7BO/vRoVkPC
	7XMDj2grMmeUj37Bf6G45OP1utAYVOVejFJ1Q1EJqHeliO6iCN6+IXZCyryIujzQbLMbrtVKhloBd
	AStUboTiLFEk8uLc7txA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFId-0007Lh-E7; Tue, 17 Mar 2020 16:42:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIU-00078o-FA
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:32 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 587EB20738;
 Tue, 17 Mar 2020 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463349;
 bh=Ss9nUZyrariGUUUX1T5lrRkiJ795cNeYI/aoq+DPpDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cxkJ/u9FnkoK3p6j/OrJ3/4QivAyM55hPaj7oJrWAOqhH8jfQVp5Qq+bVbMHDAnna
 SkHBJi9eeK315NRiW1KEgCooydHTlDhPhgEsPxxVSlA9lpDx5DaW6sHE0ZuZFW7rQ7
 XXaIRokJ2XHgz0hLvc4v6Huo0FVs1v6TK8C7QcX0=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 20/25] mt76: mt7615: introduce uni cmd command types
Date: Tue, 17 Mar 2020 17:41:27 +0100
Message-Id: <99d40d768390f9cddbf8b52135680fd3193c4abf.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094230_622412_90D4AF12 
X-CRM114-Status: GOOD (  14.05  )
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

Introduce mcu uni command type. Uni commands rely on a stripped verions
of mt7615_mcu_txd data strutture. Split mt7615_mcu_txd_common and
mt7615_mcu_txd. Uni commands will be use by mt7663e driver

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 27 ++++++---
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 60 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index e73cd3cb014a..372ffc6322c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -52,7 +52,8 @@ struct mt7615_fw_trailer {
 void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 			 int cmd, int *wait_seq)
 {
-	int mcu_cmd = cmd & MCU_CMD_MASK;
+	int txd_len, mcu_cmd = cmd & MCU_CMD_MASK;
+	struct mt7615_uni_txd *uni_txd;
 	struct mt7615_mcu_txd *mcu_txd;
 	u8 seq, q_idx, pkt_fmt;
 	__le32 *txd;
@@ -61,8 +62,11 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 	seq = ++dev->mt76.mcu.msg_seq & 0xf;
 	if (!seq)
 		seq = ++dev->mt76.mcu.msg_seq & 0xf;
+	if (wait_seq)
+		*wait_seq = seq;
 
-	mcu_txd = (struct mt7615_mcu_txd *)skb_push(skb, sizeof(*mcu_txd));
+	txd_len = cmd & MCU_UNI_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
+	txd = (__le32 *)skb_push(skb, txd_len);
 
 	if (cmd != MCU_CMD_FW_SCATTER) {
 		q_idx = MT_TX_MCU_PORT_RX_Q0;
@@ -71,7 +75,6 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 		q_idx = MT_TX_MCU_PORT_RX_FWDL;
 		pkt_fmt = MT_TX_TYPE_FW;
 	}
-	txd = mcu_txd->txd;
 
 	val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len) |
 	      FIELD_PREP(MT_TXD0_P_IDX, MT_TX_PORT_IDX_MCU) |
@@ -83,8 +86,22 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 	      FIELD_PREP(MT_TXD1_PKT_FMT, pkt_fmt);
 	txd[1] = cpu_to_le32(val);
 
+	if (cmd & MCU_UNI_PREFIX) {
+		uni_txd = (struct mt7615_uni_txd *)txd;
+		uni_txd->len = cpu_to_le16(skb->len - sizeof(uni_txd->txd));
+		uni_txd->option = MCU_CMD_UNI_EXT_ACK;
+		uni_txd->s2d_index = MCU_S2D_H2N;
+		uni_txd->pkt_type = MCU_PKT_ID;
+		uni_txd->cid = mcu_cmd;
+		uni_txd->seq = seq;
+
+		return;
+	}
+
+	mcu_txd = (struct mt7615_mcu_txd *)txd;
 	mcu_txd->len = cpu_to_le16(skb->len - sizeof(mcu_txd->txd));
 	mcu_txd->pq_id = cpu_to_le16(MCU_PQ_ID(MT_TX_PORT_IDX_MCU, q_idx));
+	mcu_txd->s2d_index = MCU_S2D_H2N;
 	mcu_txd->pkt_type = MCU_PKT_ID;
 	mcu_txd->seq = seq;
 
@@ -97,10 +114,6 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 		mcu_txd->ext_cid = cmd;
 		mcu_txd->ext_cid_ack = 1;
 	}
-	mcu_txd->s2d_index = MCU_S2D_H2N;
-
-	if (wait_seq)
-		*wait_seq = seq;
 }
 
 static int __mt7615_mcu_msg_send(struct mt7615_dev *dev, struct sk_buff *skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 8ae08a2bf10d..3aad460e0809 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -23,6 +23,57 @@ struct mt7615_mcu_txd {
 	u32 reserved[5];
 } __packed __aligned(4);
 
+/**
+ * struct mt7615_uni_txd - mcu command descriptor for firmware v3
+ * @txd: hardware descriptor
+ * @len: total length not including txd
+ * @cid: command identifier
+ * @pkt_type: must be 0xa0 (cmd packet by long format)
+ * @frag_n: fragment number
+ * @seq: sequence number
+ * @checksum: 0 mean there is no checksum
+ * @s2d_index: index for command source and destination
+ *  Definition              | value | note
+ *  CMD_S2D_IDX_H2N         | 0x00  | command from HOST to WM
+ *  CMD_S2D_IDX_C2N         | 0x01  | command from WA to WM
+ *  CMD_S2D_IDX_H2C         | 0x02  | command from HOST to WA
+ *  CMD_S2D_IDX_H2N_AND_H2C | 0x03  | command from HOST to WA and WM
+ *
+ * @option: command option
+ *  BIT[0]: UNI_CMD_OPT_BIT_ACK
+ *          set to 1 to request a fw reply
+ *          if UNI_CMD_OPT_BIT_0_ACK is set and UNI_CMD_OPT_BIT_2_SET_QUERY
+ *          is set, mcu firmware will send response event EID = 0x01
+ *          (UNI_EVENT_ID_CMD_RESULT) to the host.
+ *  BIT[1]: UNI_CMD_OPT_BIT_UNI_CMD
+ *          0: original command
+ *          1: unified command
+ *  BIT[2]: UNI_CMD_OPT_BIT_SET_QUERY
+ *          0: QUERY command
+ *          1: SET command
+ */
+struct mt7615_uni_txd {
+	__le32 txd[8];
+
+	/* DW1 */
+	__le16 len;
+	__le16 cid;
+
+	/* DW2 */
+	u8 reserved;
+	u8 pkt_type;
+	u8 frag_n;
+	u8 seq;
+
+	/* DW3 */
+	__le16 checksum;
+	u8 s2d_index;
+	u8 option;
+
+	/* DW4 */
+	u8 reserved2[4];
+} __packed __aligned(4);
+
 /* event table */
 enum {
 	MCU_EVENT_TARGET_ADDRESS_LEN = 0x01,
@@ -180,7 +231,8 @@ enum {
 };
 
 #define MCU_FW_PREFIX		BIT(31)
-#define MCU_CMD_MASK		~MCU_FW_PREFIX
+#define MCU_UNI_PREFIX		BIT(30)
+#define MCU_CMD_MASK		~(MCU_FW_PREFIX | MCU_UNI_PREFIX)
 
 enum {
 	MCU_CMD_TARGET_ADDRESS_LEN_REQ = MCU_FW_PREFIX | 0x01,
@@ -217,6 +269,12 @@ enum {
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 };
 
+#define MCU_CMD_ACK		BIT(0)
+#define MCU_CMD_UNI		BIT(1)
+#define MCU_CMD_QUERY		BIT(2)
+
+#define MCU_CMD_UNI_EXT_ACK	(MCU_CMD_ACK | MCU_CMD_UNI | MCU_CMD_QUERY)
+
 enum {
 	PATCH_SEM_RELEASE = 0x0,
 	PATCH_SEM_GET	  = 0x1
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
