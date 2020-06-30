Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A79C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 04:38:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED82206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 04:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6zfZfKk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ucTjWca5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ED82206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4aANE/U+tTl8MM9QbBMRpe4grAAZYLUYs3EstuN6qBA=; b=j6zfZfKkw9VXj+ZCYDDiC/tPKn
	jOxL1YeB1/5SOKgHhX8e3F2BIhvs6y7z/tM30zN5/wG90XLcy7RhaKvF6ZtckQqo+0JIKz0K9dzGN
	3GmBvqh3VYn6hJ4E2kdzwgRiJaHfWMXQRj7vjLPZGgqo6yva3oC9CZOQ+v3E8GyRbMVNy4O2msQse
	meCAlRHSBbz/5WC6qFZZzni0qx4Gmf1ZkGvi9e9N9hHKL18Kr1oKx+N4HDQfxmbe+SozIV0Tjsq5I
	CP8L6373zrFX1Ta0GGZEJxb1O13qwzeWtC6lmhow41TDOAOvkSWlyl0gRrhZwOuHVCXn1eH94pkVg
	PVHC4l9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq824-0003Ju-F3; Tue, 30 Jun 2020 04:38:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq81z-0003J9-EK
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 04:38:06 +0000
X-UUID: 5b8a636894d44020b7da8f839d099a99-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sLhvuF8ycBP/EBmo222dGA/PKnzAApSuMpmdqeHpmNc=; 
 b=ucTjWca50y+ryFB9qApPXn4mvNS6FJFvlH06eGSh+pPf3nWdHMN2C8fqLrYcL3tId3X13sMP/nv7mkATEukPivNBNnEamcyPLbYwijviMfKQR6XAXJDGbizIVqIc7YFZA4SSqZiIlgJhJAvyvMAJUPm4ynH2sQ0VEKXqHwE59Y8=;
X-UUID: 5b8a636894d44020b7da8f839d099a99-20200629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 811932239; Mon, 29 Jun 2020 20:37:54 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 21:37:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 12:37:52 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Jun 2020 12:37:54 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/3] mt76: mt7663u: fix memory leak in set key
Date: Tue, 30 Jun 2020 12:37:49 +0800
Message-ID: <5e8786d9cf0ccd09dd9c13c24c48ce441afbf0ff.1593491298.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
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
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fix memory leak in set key.

Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index 0ba28d37c414..96a081be108e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
@@ -165,12 +165,16 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
 
 	lockdep_assert_held(&dev->mt76.mutex);
 
-	if (!sta)
-		return -EINVAL;
+	if (!sta) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	cipher = mt7615_mac_get_cipher(key->cipher);
-	if (cipher == MT_CIPHER_NONE)
-		return -EOPNOTSUPP;
+	if (cipher == MT_CIPHER_NONE) {
+		err = -EOPNOTSUPP;
+		goto out;
+	}
 
 	wcid = &wd->sta->wcid;
 
@@ -178,19 +182,23 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
 	err = mt7615_mac_wtbl_update_key(dev, wcid, key->key, key->keylen,
 					 cipher, key->cmd);
 	if (err < 0)
-		return err;
+		goto out;
 
 	err = mt7615_mac_wtbl_update_pk(dev, wcid, cipher, key->keyidx,
 					key->cmd);
 	if (err < 0)
-		return err;
+		goto out;
 
 	if (key->cmd == SET_KEY)
 		wcid->cipher |= BIT(cipher);
 	else
 		wcid->cipher &= ~BIT(cipher);
 
-	return 0;
+out:
+	kfree(key->key);
+	kfree(wd);
+
+	return err;
 }
 
 void mt7663u_wtbl_work(struct work_struct *work)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
