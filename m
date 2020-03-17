Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08BBC10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A8020738
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OtAw3e0D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE8TyzMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A8020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ikzB9lY17aMnDkKrtnK+YMMMpiPFQ8Zn8IjcFJJOo4=; b=OtAw3e0DeOq5FT
	yyBCVkRhp2Q5slI8HHn08i63e1SjmHUdD4OdowzdubsEJBA0AtgMMoshPp8/9vPACfQ1yErw2XhGl
	Wvy3wn3SL6+CkY3JcMWS3UqRXcpSbdgbNKJ64Rvfci+VwhEjy55q1Fm/+MJ+Bf4diKXZM1wj9fe0M
	R2IiP3ksFMqwUomHvdHVE4WREWCVBqaAyLJG+V/MglKZdwkxV1ap1IcfkmPL+fI13aBboNpZWgCWz
	rd8tA4MTfkYGxNy6+S4v87UAc8B0m+Sho/D1nwCxNj+niiYAnAD4lHU8+rfFDz56fF8puMnS154EX
	DuzikRJKfOYk/f//UbgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFHz-0006PH-Rw; Tue, 17 Mar 2020 16:41:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFHw-0006Ng-Hu
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:41:57 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE28720663;
 Tue, 17 Mar 2020 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463316;
 bh=ejFbW8zWBXDfLb+oGugPKe4RtGry4u5oFr7jjSGL1pA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YE8TyzMKo4A0Y9oQiiZgBe9xCD1MJmhBqnAuy/qDT4pg6cK/MOgV8MXbhNSrA5xpb
 RTCghYjg6L4m4BXuTgtaJ61eei/8hu+Rr3GnAwSiqP/MhJ3HV+QF8FuFR087mTRL3w
 DF9vNcev30ifLz8wnMY+IeJeq2gMVzVqyd0jypFs=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 02/25] mt76: mt7615: introduce mt7615_mcu_wait_response
Date: Tue, 17 Mar 2020 17:41:09 +0100
Message-Id: <18e66e1e4e1a5f8760b1b1c6cc3d6744b8a04728.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094156_615309_51BFAA1E 
X-CRM114-Status: GOOD (  10.07  )
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

Introduce mt7615_mcu_wait_response in order to be reused parsing mt7663u
mcu messages

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 71b209fe439f..a4e971d7f6a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -144,12 +144,33 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 	return ret;
 }
 
+int mt7615_mcu_wait_response(struct mt7615_dev *dev, int cmd, int seq)
+{
+	unsigned long expires = jiffies + 20 * HZ;
+	struct sk_buff *skb;
+	int ret = 0;
+
+	while (true) {
+		skb = mt76_mcu_get_response(&dev->mt76, expires);
+		if (!skb) {
+			dev_err(dev->mt76.dev, "Message %d (seq %d) timeout\n",
+				cmd, seq);
+			return -ETIMEDOUT;
+		}
+
+		ret = mt7615_mcu_parse_response(dev, cmd, skb, seq);
+		if (ret != -EAGAIN)
+			break;
+	}
+
+	return ret;
+}
+
 static int
 mt7615_mcu_msg_send(struct mt76_dev *mdev, int cmd, const void *data,
 		    int len, bool wait_resp)
 {
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
-	unsigned long expires = jiffies + 20 * HZ;
 	struct sk_buff *skb;
 	int ret, seq;
 
@@ -163,19 +184,8 @@ mt7615_mcu_msg_send(struct mt76_dev *mdev, int cmd, const void *data,
 	if (ret)
 		goto out;
 
-	while (wait_resp) {
-		skb = mt76_mcu_get_response(mdev, expires);
-		if (!skb) {
-			dev_err(mdev->dev, "Message %d (seq %d) timeout\n",
-				cmd, seq);
-			ret = -ETIMEDOUT;
-			break;
-		}
-
-		ret = mt7615_mcu_parse_response(dev, cmd, skb, seq);
-		if (ret != -EAGAIN)
-			break;
-	}
+	if (wait_resp)
+		ret = mt7615_mcu_wait_response(dev, cmd, seq);
 
 out:
 	mutex_unlock(&mdev->mcu.mutex);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
