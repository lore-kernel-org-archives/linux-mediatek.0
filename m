Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9524DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626A2206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gfW6vW9t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkQAxXmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626A2206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pemAIwxQ1ERbZ12g703NPh+ZF2AfXRsvSnLC19OREFA=; b=gfW6vW9tpIonUjcNB/6IZVd5F
	aVW8cBZPNpWdI1Ss1p1eMaf+A92Bl2FMw2A3X2B2jQh66VU/s+MGWU4X/PenaEwhO48UYyH9cL+j8
	q/xwLK0hdngIaphEcYl1p+TigrSxLTp5Usl6+h0u+lpAmDlpVMpuHd+DEM9fiRhnH++4UYvWEBJgq
	D7e7a7tdFiWpvb/x9wXOb5sxZqVhDFonQLG+FiXd75MXHD/6jFow5HIJrmpCrkWLa4f4tJzqX49IA
	WtG92Y1A6leVtN9njynQd4t0R7Fsm1GEEqR4Ddbj5dv/5sI4gADh+Ho6i0ufv3ws/LzOS4sWGajHp
	BKoMekUvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsE-00063j-BJ; Fri, 03 Jul 2020 08:16:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGs4-0005up-7u
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:33 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AC19206A1;
 Fri,  3 Jul 2020 08:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764191;
 bh=i/P2xdEkqGxE9To+bO0Ue/nBR35UyDkm4uABqmr0tOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BkQAxXmYHbhBlWQeiA9XJkJJJo8aLrQkjs2FJpg6KarY/Sdb4P6z1hww1nvHX9HJj
 7Fchk2n+Vc918QU46tzsIkRm1NX+x0e0soJ36imCI0WGWvNY6h9apUOuy1TkktiB53
 R87scwShr4VIvFmnvCocARLpUeTOMJ3WPyfUpA5c=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 06/22] mt76: mt7615: wake device before configuring hw keys
Date: Fri,  3 Jul 2020 10:15:45 +0200
Message-Id: <ebb32b3fc8eb1a36a65d3d56bb16c5ae377ea35a.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041632_430211_7EEEB588 
X-CRM114-Status: GOOD (  10.61  )
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

Make sure the device is in full-power before uploading keys to the hw

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 5f2c50a2449b..3c230479b36c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -336,7 +336,7 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt7615_sta *msta = sta ? (struct mt7615_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
-	int idx = key->keyidx;
+	int idx = key->keyidx, err;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
@@ -366,6 +366,8 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		return -EOPNOTSUPP;
 	}
 
+	mt7615_mutex_acquire(dev);
+
 	if (cmd == SET_KEY) {
 		key->hw_key_idx = wcid->idx;
 		wcid->hw_key_idx = idx;
@@ -376,9 +378,13 @@ static int mt7615_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			    cmd == SET_KEY ? key : NULL);
 
 	if (mt76_is_usb(&dev->mt76))
-		return mt7615_queue_key_update(dev, cmd, msta, key);
+		err = mt7615_queue_key_update(dev, cmd, msta, key);
+	else
+		err = mt7615_mac_wtbl_set_key(dev, wcid, key, cmd);
 
-	return mt7615_mac_wtbl_set_key(dev, wcid, key, cmd);
+	mt7615_mutex_release(dev);
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
