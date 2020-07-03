Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E6AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242D0206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w+/HBr9R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBq11pbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242D0206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EeVN6KML9vVgnYjDG63LNlQEENEIVHoTTAN21FyxcDQ=; b=w+/HBr9Rni2JaYxxmIO24IFQQ
	2/y56iar4f0gRFLAdnLlQV4AKNgdxWq8HlzBphoeTTg3PGVPteRbeC9v6P6bfywsuJV3LYIhbEqRx
	bni+0GrBONM9ZGyMQo4vQ5vftwGRCZdRDqhq7IdSk5xPmG/DEyimm44Wjs0ShNuYR74PHGU5G6efN
	zsI923VyajJU7dV1Y09Co2mVsfAMfXZx21pLD8dTD3pAYiQynggdZfwU3+2OeM9waCTF6hnAiCUTF
	x/VSvCJBoM9QwQ9+6oV8GwpdkIvnJo7Hd/ubk75qRWOv+LL/U9WAofdacCHRZWIszcABH5kp6l6QX
	JP4rKq6Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsQ-0006GI-Vf; Fri, 03 Jul 2020 08:16:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsG-00065z-Rr
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:45 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1CF720826;
 Fri,  3 Jul 2020 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764204;
 bh=d1bIE0kDegwbTo99G0gWtdE6n0x1lRNv7QhH5gOvehM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oBq11pbV34mqXydikYbZK9yGN8nfWoXJyLotcFrhsnKLB3VoM85TfCaRCHR50ZQWg
 4beR82H9XA5MGh0RgCVJJ7c4sHuAmXC4w9j9KZn8WLWXvbomYDVx20IgqeUtJ2QHCF
 kRuDiaJV07D1scqt5dgAPFLolcj17Ln+OmSXR/qI=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 13/22] mt76: mt7615: run mt7615_mcu_set_roc holding mt76
 mutex
Date: Fri,  3 Jul 2020 10:15:52 +0200
Message-Id: <e3eeaddf7c676810b3cb13ba9c1b6c6c8386b085.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041645_028768_345C995C 
X-CRM114-Status: GOOD (  10.55  )
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

Make sure to run mt7615_mcu_set_roc() holding mt76 mutex in order to
wake the device from low power state and avoid races

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index c52b5c68ba97..47dca270150d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -871,9 +871,11 @@ void mt7615_roc_work(struct work_struct *work)
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
 
+	mt7615_mutex_acquire(phy->dev);
 	ieee80211_iterate_active_interfaces(phy->mt76->hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7615_roc_iter, phy);
+	mt7615_mutex_release(phy->dev);
 	ieee80211_remain_on_channel_expired(phy->mt76->hw);
 }
 
@@ -991,20 +993,24 @@ static int mt7615_remain_on_channel(struct ieee80211_hw *hw,
 	if (test_and_set_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return 0;
 
+	mt7615_mutex_acquire(phy->dev);
+
 	err = mt7615_mcu_set_roc(phy, vif, chan, duration);
 	if (err < 0) {
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
-		return err;
+		goto out;
 	}
 
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, HZ)) {
 		mt7615_mcu_set_roc(phy, vif, NULL, 0);
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
-
-		return -ETIMEDOUT;
+		err = -ETIMEDOUT;
 	}
 
-	return 0;
+out:
+	mt7615_mutex_release(phy->dev);
+
+	return err;
 }
 
 static int mt7615_cancel_remain_on_channel(struct ieee80211_hw *hw,
@@ -1018,7 +1024,9 @@ static int mt7615_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	del_timer_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
+	mt7615_mutex_acquire(phy->dev);
 	mt7615_mcu_set_roc(phy, vif, NULL, 0);
+	mt7615_mutex_release(phy->dev);
 
 	return 0;
 }
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
