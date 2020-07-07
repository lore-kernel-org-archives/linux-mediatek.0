Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D761C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 19:17:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D613320738
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 19:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1gLQerRH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XVo/B7sn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D613320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oG73aXpG/hSszlwnLH0eOtZWejoVExnI86IC2TdiTHE=; b=1gLQerRHmPvlyibLri5U4MvE3b
	q0eutllYFUY45ikLH1PEQ8HwTIRvZPvVXpakeXdWJR3CAcFjuooGgX0SuYXVjXEWBG6GGAEfv6ZPr
	kSoDyDKBqa7Jf2973mtMANgCwBEcRT1A/Wg6R8Nem3/0/2hlOg/v/lisHdYT3UOROyYPqoRd+jHgb
	UeI7+HjXmez0q8sgKvNDpZ7hlNFXc75z95akrbB0Q4IJS7bwng5uzSF8KO27jDJ0+KF/3E+7Qfo2K
	I/F2yLnWwGcaqVtDlWrCk4n76UxW+AuFENVD94UPdSYQkt8ETRf91UO2H+IeXh+aPXbZXDjFZfjLx
	R7l6YVrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jst5a-0003OF-BQ; Tue, 07 Jul 2020 19:17:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jst5W-0003Kh-Jo
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 19:17:08 +0000
X-UUID: 5c81ba14dfc7470ba58f88df18bcf6d5-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2sll/Y485e+JNsrlD/BIKIwTJsEpJPT8Kwje84O+F/g=; 
 b=XVo/B7sna3yn2Bnjv2ZnEAx+SuxoQHSNUJVBLUynozxX0xfyiIvpcQM6XP9lJGzwrAZ+6s+pgwbgTbj8q6X/0Uz99AfU3Ihpy5thGXdpPiDL8GskpteNrCpgr0aLcTk00E8sD26x/ZZo1oeDXiJcAmnz3BNcD0D1FUpTrewaOEw=;
X-UUID: 5c81ba14dfc7470ba58f88df18bcf6d5-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1104608505; Tue, 07 Jul 2020 11:17:11 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 12:16:52 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:16:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 03:16:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/3] mt76: mt7663u: fix memory leak in set key
Date: Wed, 8 Jul 2020 03:16:46 +0800
Message-ID: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_151706_847695_4A53924C 
X-CRM114-Status: GOOD (  11.12  )
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

v1 -> v2:
	- remove unneeded kfree

Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb.c
index 0ba28d37c414..f3c3ad3509c8 100644
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
 
@@ -178,19 +182,22 @@ __mt7663u_mac_set_key(struct mt7615_dev *dev,
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
