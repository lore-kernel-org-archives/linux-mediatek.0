Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB218C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/j2sk0Gu0f7kgmwf66bENo3rsyXQHCPfjXxZSmJeG4=; b=sG1HpTxUXnlyguIP3352rW6hnj
	HL0jaYXuNhMB/3MgjQwf2ex14tGG4AeoP2yu15kCaM/HvrjRZcdGTydQ9YK9+GHhnkHbmEcRqBIKU
	thuByiS+HpGmd6Nd+yOIzbfkKYy8EAyoc4ZjaYzBt8o7yKDGM5cGTiAfi0RJJW8wQRkyxnCe5EQkA
	fbHgSVziZUNjGtl09/WPGv0oKq9yA/8wASsrI/Mh2AIX6eHnW4xrAL+PpYe/f2ukd30PIA7i6qBZL
	kY+1Lf65rinF2gRNmGeOl2D0reNm6RienzUtA1ZjfXkrkmQZL140JTnWSuMvrzCuM2AsjwagCgPim
	uHiInkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9l-0000000GsSN-2glt;
	Sun, 27 Sep 2026 21:11:33 +0000
Received: from mail-dy2-f12.google.com ([74.125.229.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9h-0000000GsQC-3oty
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:11:30 +0000
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so2966092eec.3
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543489; x=1791148289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/j2sk0Gu0f7kgmwf66bENo3rsyXQHCPfjXxZSmJeG4=;
        b=YRTLRQjH9lzmDQpIssENfKzGac/ilDLrXiHQjVuBTz9MCL+rvpOsHpS5OMevkDuJ43
         JHtzCaNDR8Q1nNaW7k7Z/Xt/jrhjXsAUC1IqVuZ78QUHbWY8CWXDfScx0rbskOTQfewy
         Jtvkad1w4IYkxR2x3FCp7urLLCiwM53waOw29rAqgo0XvhguX1CBEOH8uxkMkWaNjuuh
         VvAS7bK30lpbtiDvw3seORpPuGyNbsdo9LM1JVaugoYprviUUjsvwp13V43zCQmyhYql
         I8olGM4x+5DlbCmxQpXHn/UE2k3pvWKiG5c48OprHhJ+qme8qHiae7o4UkGacFF9wt+Q
         ryOg==
X-Forwarded-Encrypted: i=1; AKwUvBzpCyC0lN8Sj/7xaaZ5L6Qg2ViFxCnvvhp8WpIlnQht6iJdNaYTwGVUmbAkYaJIK46JcXQGOjPhuKnR5kIhyQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLzhRZ58itYrXH9Wnf1GLU73rzdl674NimnGkW/vg6B8xVtwtkC
	Chs7qFMFBNowCxb+tl6q/ulMQkrA0RCl/EGFwYE+z5Alu5ClYWBkJbPYdXbT6C/H
X-Gm-Gg: AYBFou1MEleBi1xG063DgrrtWT6yMBnU/U0cEGf3NWJjlkapK4+wuiaCtTx4LXCt/dI
	rHp49fVjJjoTI4HpIPr5lK3yE4qlvoPbXVkoGB3mt0TnheA7a3ks8xaGHuaGr3LqLaMrItZyUYx
	BStSFbZgQ7TANETjuBnd2VEJ0I0isB2mB1WPVUQJdLP61mSJlb3oWFHZfxtDwEnVGMrsbVkPiGu
	4mI+ZTB4UYgoRIwluL9oC6YQjhiN5XSBbqpxjmPweLWKa5b9+oVIQx2d5RodIeRl7h2d2nhIYzM
	qst8qNSimMocCf0huJK8egzRgGGPIQioOIC079YCLr3QtnCcmlq6E5cdpOt9oqUbS3XvDwbEoaK
	7KyvgB+0c4oLcONw3Gnur+u9xtuBP7u7pf1qOguHQ6qRmYw24+KUDlYegf8BLcG+2gcFKpFgcOb
	BbQMW3t5xw/tZi+9CK5Pojl55ospgWN7dGRmbUJ9IkRr6PBirQA8YYYVjJDqWE6PzLZuOlosQRu
	gkCI1tf8+fatU7Yg3CTN93O/ppVTLsGdrO9uAM48vrDk46Pw7h/Q32xFg7zDB2T7eflwI/aM/E8
	FZi2
X-Received: by 2002:a05:690c:e3e1:b0:854:b86b:d206 with SMTP id 00721157ae682-8a6461b8773mr59308197b3.12.1790543011011;
        Sun, 27 Sep 2026 14:03:31 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:29 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 04/23] wifi: mt76: mt7925: wire up NAN MAC randomization lifecycle
Date: Sun, 27 Sep 2026 16:02:46 -0500
Message-ID: <20260927210306.737669-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141129_945554_E55F66E5 
X-CRM114-Status: GOOD (  11.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Chengwei Yu <chengwei.yu@mediatek.com>

Start mac_rand_work in mt7925_add_interface() and stop it in
mt7925_remove_interface() so the work item added by prior patches
is usable and cannot outlive its vif.

INIT_DELAYED_WORK() is unconditional across all vif types, matching
how csa_work is already initialized unconditionally -- mvif->nan
exists on every mt792x_vif so there is nothing NAN-specific to guard.

mt7925_nan_stop_mac_randomization() is called before
mt792x_mutex_acquire(), not inside it: the work function takes the
same dev mutex, so cancel_delayed_work_sync() while holding it would
deadlock. This follows the same ordering mt792x_unassign_vif_chanctx()
uses for csa_work.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index c882952f5df1..3e1c223e8da6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -480,6 +480,12 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 
 	if (vif->type == NL80211_IFTYPE_NAN)
 		dev->nan_vif = vif;
+
+	if (vif->type == NL80211_IFTYPE_NAN ||
+	    vif->type == NL80211_IFTYPE_NAN_DATA)
+		INIT_DELAYED_WORK(&mvif->nan.mac_rand_work,
+				  mt7925_nan_mac_rand_work);
+
 out:
 	mt792x_mutex_release(dev);
 
@@ -493,6 +499,15 @@ mt7925_remove_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
 
+	/*
+	 * Stop before taking the dev mutex: mt7925_nan_mac_rand_work()
+	 * acquires it too, so cancel_delayed_work_sync() would deadlock
+	 * against a concurrently running instance if called while held.
+	 */
+	if (vif->type == NL80211_IFTYPE_NAN ||
+	    vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_stop_mac_randomization(vif);
+
 	mt792x_mutex_acquire(dev);
 
 	if (dev->nan_vif == vif)
-- 
2.43.0


