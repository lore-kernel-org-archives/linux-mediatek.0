Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A01FC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF95420752
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UuKM5Usg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaBKPqjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF95420752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPCSeg/zcwXlYegUYU+ppRgAzTFllK59qcRZZETz8no=; b=UuKM5UsgH1hGqg
	O88EK5yrsHe0iMIWdPmQnrKN1Cw6mmd0n/RXZYSIUmo8wzPYSITtGhG1PnTorEMPh71tTVyXk0AyZ
	24vM5xnumkWzPhn+LsZNDgmGIdlUPjaAxm7l1xqljG7yo772arpo96/+lyU7BDgoeObOkG5oImk3G
	buaq0cPRqj8WiSp4fxuAugMQtEPtolJgnGm3NoO3JMiwlVgAdmbKlQsstFKK4Wd/NvUDUkjpWUAZp
	nSNP3AT9Uft99eD3vCK3a2+GEXpc8YdP5eksdOJFAGZ2WOq4E+eXLGy/z9q+1YicUV+PeF3IP9S+e
	V+BqWiQqhSalBPd68sxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIO-000719-IK; Tue, 17 Mar 2020 16:42:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIH-0006pi-8Z
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:20 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B78420735;
 Tue, 17 Mar 2020 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463336;
 bh=6qufdRdAO/GVF/xteQddJRK47BzgysXE3imF6JTA2ts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AaBKPqjN5R3XIgnYg9TzXggCdLN3G2cwLuAhPmUPhp7Qi3aP7utS3DxhU1NNX+htG
 /71KHnCpFCvj1pemnTqHd1yfMiYIsjstkyNNEk7c9MSLv5xVYJKrkxh9zrtgz72u2P
 3we7yiY+Qpl88/Sqva8KPl8XphFVwnJbTPsLXzBM=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 13/25] mt76: mt7615: introduce MCU_FW_PREFIX for fw mcu
 commands
Date: Tue, 17 Mar 2020 17:41:20 +0100
Message-Id: <659a7e5be19f1a209145f00b3a049965b3beb502.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094217_353394_72EC4BF5 
X-CRM114-Status: GOOD (  12.76  )
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

Currently fw commands rely on negative cmds since they need different
mcu msg metadata. Extend this approach introducing MCU_FW_PREFIX.
This is a preliminary patch to support new mt7663e firmware commands

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 25 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 15 ++++++-----
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 1c26e2c3e476..4ce3d248182c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -52,6 +52,7 @@ struct mt7615_fw_trailer {
 void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 			 int cmd, int *wait_seq)
 {
+	int mcu_cmd = cmd & MCU_CMD_MASK;
 	struct mt7615_mcu_txd *mcu_txd;
 	u8 seq, q_idx, pkt_fmt;
 	__le32 *txd;
@@ -63,7 +64,7 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 
 	mcu_txd = (struct mt7615_mcu_txd *)skb_push(skb, sizeof(*mcu_txd));
 
-	if (cmd != -MCU_CMD_FW_SCATTER) {
+	if (cmd != MCU_CMD_FW_SCATTER) {
 		q_idx = MT_TX_MCU_PORT_RX_Q0;
 		pkt_fmt = MT_TX_TYPE_CMD;
 	} else {
@@ -87,9 +88,9 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 	mcu_txd->pkt_type = MCU_PKT_ID;
 	mcu_txd->seq = seq;
 
-	if (cmd < 0) {
+	if (cmd & MCU_FW_PREFIX) {
 		mcu_txd->set_query = MCU_Q_NA;
-		mcu_txd->cid = -cmd;
+		mcu_txd->cid = mcu_cmd;
 	} else {
 		mcu_txd->cid = MCU_CMD_EXT_CID;
 		mcu_txd->set_query = MCU_Q_SET;
@@ -127,7 +128,7 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 		return -EAGAIN;
 
 	switch (cmd) {
-	case -MCU_CMD_PATCH_SEM_CONTROL:
+	case MCU_CMD_PATCH_SEM_CONTROL:
 		skb_pull(skb, sizeof(*rxd) - 4);
 		ret = *skb->data;
 		break;
@@ -152,8 +153,8 @@ int mt7615_mcu_wait_response(struct mt7615_dev *dev, int cmd, int seq)
 	while (true) {
 		skb = mt76_mcu_get_response(&dev->mt76, expires);
 		if (!skb) {
-			dev_err(dev->mt76.dev, "Message %d (seq %d) timeout\n",
-				cmd, seq);
+			dev_err(dev->mt76.dev, "Message %ld (seq %d) timeout\n",
+				cmd & MCU_CMD_MASK, seq);
 			return -ETIMEDOUT;
 		}
 
@@ -308,7 +309,7 @@ static int mt7615_mcu_init_download(struct mt7615_dev *dev, u32 addr,
 		.mode = cpu_to_le32(mode),
 	};
 
-	return __mt76_mcu_send_msg(&dev->mt76, -MCU_CMD_TARGET_ADDRESS_LEN_REQ,
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_CMD_TARGET_ADDRESS_LEN_REQ,
 				   &req, sizeof(req), true);
 }
 
@@ -1101,7 +1102,7 @@ static int mt7615_mcu_send_firmware(struct mt7615_dev *dev, const void *data,
 		cur_len = min_t(int, 4096 - sizeof(struct mt7615_mcu_txd),
 				len);
 
-		ret = __mt76_mcu_send_msg(&dev->mt76, -MCU_CMD_FW_SCATTER,
+		ret = __mt76_mcu_send_msg(&dev->mt76, MCU_CMD_FW_SCATTER,
 					  data, cur_len, false);
 		if (ret)
 			break;
@@ -1127,13 +1128,13 @@ static int mt7615_mcu_start_firmware(struct mt7615_dev *dev, u32 addr,
 		.addr = cpu_to_le32(addr),
 	};
 
-	return __mt76_mcu_send_msg(&dev->mt76, -MCU_CMD_FW_START_REQ,
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_CMD_FW_START_REQ,
 				   &req, sizeof(req), true);
 }
 
 static int mt7615_mcu_restart(struct mt76_dev *dev)
 {
-	return __mt76_mcu_send_msg(dev, -MCU_CMD_RESTART_DL_REQ, NULL,
+	return __mt76_mcu_send_msg(dev, MCU_CMD_RESTART_DL_REQ, NULL,
 				   0, true);
 }
 
@@ -1145,7 +1146,7 @@ static int mt7615_mcu_patch_sem_ctrl(struct mt7615_dev *dev, bool get)
 		.op = cpu_to_le32(get ? PATCH_SEM_GET : PATCH_SEM_RELEASE),
 	};
 
-	return __mt76_mcu_send_msg(&dev->mt76, -MCU_CMD_PATCH_SEM_CONTROL,
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_CMD_PATCH_SEM_CONTROL,
 				   &req, sizeof(req), true);
 }
 
@@ -1158,7 +1159,7 @@ static int mt7615_mcu_start_patch(struct mt7615_dev *dev)
 		.check_crc = 0,
 	};
 
-	return __mt76_mcu_send_msg(&dev->mt76, -MCU_CMD_PATCH_FINISH_REQ,
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_CMD_PATCH_FINISH_REQ,
 				   &req, sizeof(req), true);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index c84695facf08..8ae08a2bf10d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -179,16 +179,19 @@ enum {
 	MCU_S2D_H2CN
 };
 
+#define MCU_FW_PREFIX		BIT(31)
+#define MCU_CMD_MASK		~MCU_FW_PREFIX
+
 enum {
-	MCU_CMD_TARGET_ADDRESS_LEN_REQ = 0x01,
-	MCU_CMD_FW_START_REQ = 0x02,
+	MCU_CMD_TARGET_ADDRESS_LEN_REQ = MCU_FW_PREFIX | 0x01,
+	MCU_CMD_FW_START_REQ = MCU_FW_PREFIX | 0x02,
 	MCU_CMD_INIT_ACCESS_REG = 0x3,
 	MCU_CMD_PATCH_START_REQ = 0x05,
-	MCU_CMD_PATCH_FINISH_REQ = 0x07,
-	MCU_CMD_PATCH_SEM_CONTROL = 0x10,
+	MCU_CMD_PATCH_FINISH_REQ = MCU_FW_PREFIX | 0x07,
+	MCU_CMD_PATCH_SEM_CONTROL = MCU_FW_PREFIX | 0x10,
 	MCU_CMD_EXT_CID = 0xED,
-	MCU_CMD_FW_SCATTER = 0xEE,
-	MCU_CMD_RESTART_DL_REQ = 0xEF,
+	MCU_CMD_FW_SCATTER = MCU_FW_PREFIX | 0xEE,
+	MCU_CMD_RESTART_DL_REQ = MCU_FW_PREFIX | 0xEF,
 };
 
 enum {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
