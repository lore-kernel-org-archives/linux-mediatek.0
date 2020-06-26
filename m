Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8220C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9955420C09
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s3VXpFIV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQP3kyCk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9955420C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=52HeYeHT1PUb0KTbZ8uO2MDR67Gx7dZOt5OyPVezOvQ=; b=s3VXpFIVPYRVHS2PXx9xxjI6e
	kTrlufV7CbTnLSNo5I3QVvcAAU4Hg093GDZdXDkDX+DSgYSnCqhJEMS0g0SlAk6NQBc0qCW/In+HQ
	sVuPHgIJjryrTw9zbJvPvaOAI6Tta/pLro5e8mkZAJM+oFK6cI8M1m+6pQCE0OsSOe5iIpmlsTm2k
	+5BWVfA2cwrhlvE8jfv92yFQ9X07TWaoP1R+BLPheIvmqvQ9BRqmydSYq6mIoLwPW6+zA+QQsCA1Q
	owMVwVnqyUmOtuer3qT5GGmijRq+fq+ws/6+NHGP1pl/CB8xMLvwfrjxKdAUtsZ7kRWF5p4Ki20fs
	If/bsxQMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovr0-0001zg-Li; Fri, 26 Jun 2020 21:25:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovqx-0001xx-Vh
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:44 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15B2320B80;
 Fri, 26 Jun 2020 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206743;
 bh=pPcCbVgcEboVVAYAy++sxqhrZnM4Fe9FZuWUms+LUgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rQP3kyCkAB2lMx3iSm2r/fynLQIO/I2M8DkFhv2miI8rI+zBSOd3NpiupR4m5yFMU
 Om/NvacGc6P0YdDeW4zYXP9KiDObky2liv+lP9Qn4l8bYiVBu+nHOD7ylV29wAl15W
 n4q3z9UOYOkGt9KkhmPrTzklHRTnItqb26sHkkWQ=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 06/17] mt76: mt7615: wake device before configuring hw keys
Date: Fri, 26 Jun 2020 23:25:06 +0200
Message-Id: <0bc5bc1f94fa2bcaa0abc51a5bada9f921135471.1593204577.git.lorenzo@kernel.org>
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

Make sure the device is in full-power before uploading keys to the hw

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index b63dc12a0342..8ac63ea7cbb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -339,7 +339,7 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt7615_sta *msta = sta ? (struct mt7615_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
-	int idx = key->keyidx;
+	int idx = key->keyidx, err;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
@@ -369,6 +369,8 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		return -EOPNOTSUPP;
 	}
 
+	mt7615_mutex_acquire(dev, &dev->mt76.mutex);
+
 	if (cmd == SET_KEY) {
 		key->hw_key_idx = wcid->idx;
 		wcid->hw_key_idx = idx;
@@ -379,9 +381,13 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			    cmd == SET_KEY ? key : NULL);
 
 	if (mt76_is_usb(&dev->mt76))
-		return mt7615_queue_key_update(dev, cmd, msta, key);
+		err = mt7615_queue_key_update(dev, cmd, msta, key);
+	else
+		err = mt7615_mac_wtbl_set_key(dev, wcid, key, cmd);
 
-	return mt7615_mac_wtbl_set_key(dev, wcid, key, cmd);
+	mt7615_mutex_release(dev, &dev->mt76.mutex);
+
+	return err;
 }
 
 static int mt7615_config(struct ieee80211_hw *hw, u32 changed)
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
