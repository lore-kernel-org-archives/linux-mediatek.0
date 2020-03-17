Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB5AC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486BB20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzcMXpB9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="it7h+xwJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486BB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyrniyfjWDPvFEPqgq77St3Fpr4h+wvM3pF/kN9V8zo=; b=hzcMXpB9VCNfH+
	RDsFJEpmf91kEe0d/EjlULC2WNIJmGcEvsi+ywycoWX0axHLWceqyYED9VIo8BiXp7iPfNT7UoRil
	m5UcY8WkTVKcY60FB765ZKIl4tgUf+orI74VaepSKcbdKQzY16KZw35bJhDh/UwSPyFuWlL8gYRBA
	h7TFnpz1WhOp3+TzkysU2/nxXOWxeQuBVFF4gCPhKkU9QEtypCkfhQ++C1mCpz6XfRKFo7L+4fyzR
	oTHXO5vzvWJLnyStug+XTLzFEo8VcUMRWvaw9vCKpQZnMlRqFP5hvWMZLvWgJ56wOsxD115uGNvyp
	IAthIgjqkrgpbbCepRDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFII-0006s8-92; Tue, 17 Mar 2020 16:42:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFIC-0006c9-6o
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:13 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4AD020735;
 Tue, 17 Mar 2020 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463331;
 bh=OIDV7xOwK4cL9i/DBOwXG2DvG5Kqko1qEZiH/mXmJz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=it7h+xwJiWIRN73eQ9nHzFwTFmcLLJvvmLtAjXYGI3rtKDsFednveCGiFDm9MfTJT
 dPem/S2iuPpCnalt4A1bpkwvPtzaS1RgwYSFNpdRP+kEpLEjc2qXU3Namh4tJA3VOz
 YGCgQiHBJ+5fUvRRQHwSwyL/8G+0v+pB1ReTqom0=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 10/25] mt76: mt7615: rely on skb API for
 mt7615_mcu_set_eeprom
Date: Tue, 17 Mar 2020 17:41:17 +0100
Message-Id: <3696d88f8ef0e2a58979d7bb8ba4ce5d9cadbfb1.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094212_343889_0BC85B4B 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

Rely on skb API and avoid kmalloc the buffer in mt7615_mcu_set_eeprom
routine

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 2ad8173f95ef..73ec31b20d21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1262,28 +1262,26 @@ int mt7615_mcu_set_eeprom(struct mt7615_dev *dev)
 	} __packed req_hdr = {
 		.buffer_mode = 1,
 	};
-	int ret, len, eep_len;
-	u8 *req, *eep = (u8 *)dev->mt76.eeprom.data;
+	u8 *eep = (u8 *)dev->mt76.eeprom.data;
+	struct sk_buff *skb;
+	int eep_len;
 
 	if (is_mt7622(&dev->mt76))
 		eep_len = MT7622_EE_MAX - MT_EE_NIC_CONF_0;
 	else
 		eep_len = MT7615_EE_MAX - MT_EE_NIC_CONF_0;
 
-	len = sizeof(req_hdr) + eep_len;
-	req = kzalloc(len, GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
-
 	req_hdr.len = cpu_to_le16(eep_len);
-	memcpy(req, &req_hdr, sizeof(req_hdr));
-	memcpy(req + sizeof(req_hdr), eep + MT_EE_NIC_CONF_0, eep_len);
 
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EFUSE_BUFFER_MODE,
-				  req, len, true);
-	kfree(req);
+	skb = mt7615_mcu_msg_alloc(NULL, sizeof(req_hdr) + eep_len);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put_data(skb, &req_hdr, sizeof(req_hdr));
+	skb_put_data(skb, eep + MT_EE_NIC_CONF_0, eep_len);
 
-	return ret;
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_EXT_CMD_EFUSE_BUFFER_MODE, true);
 }
 
 int mt7615_mcu_set_mac_enable(struct mt7615_dev *dev, int band, bool enable)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
