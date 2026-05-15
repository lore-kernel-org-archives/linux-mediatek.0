Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEB4CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/jjmpLvObTvHV9hKFKnoUw9o9V/WxOQQ1aWJYolflY=; b=C/wktNDLrU6BNn2qvv29/UD55U
	ZTAw5UvNGYTJK9yjjFgMARXfLpp53Rz0uI1cL4JHGhVs41mJt8z2WGMY7ZDYS+jeD7kk0JtsHYzND
	M/7DuZ7uMjKR6ZasezPzYhADqZQkgSpJoYSujtFMkgNAAXdcL7XOLwYxk+UNnyyYn/jQsfYKKi0eD
	X4lQpWCT7hP1CujuoPxLZPjG4u6qZDBhyinvS8dG5gcXp4CJ1STu8W0JsmVTpgr+RxQowmac30KXB
	+QBQREW364Tsn/3ICPk9vpN6bWM8U2TE1aWHxp/y9uTnNEhnVmE8SlzfAVbSpxFOFL5nfb3NQDlOg
	cBsgNhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxRf-000000096fr-1GoK;
	Fri, 15 May 2026 18:39:35 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxRc-000000096fB-25An
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 18:39:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1778870367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U/jjmpLvObTvHV9hKFKnoUw9o9V/WxOQQ1aWJYolflY=;
	b=dnaC/HaXTrd1HN65qJlPNvodOGgPnHpnIbq9bzDw81zwAz1zH+NGN5gmwyBSeZRcMsy9Zj
	MhPGbLHqPDKi7mCObKhZo1Vm911TPoreaxJYuMB3fOm4IwGsHrnj5bHB/e7UUSMEM29aqy
	GnA1iUzT+nwlunVnEOq0CpDvbL7OHRsd8l7M31Evn1s5tTU9QWGS8hR5638rfxMc9DZx8y
	WNFZycEzjsfFT6EkifMG5efww8+Fg/hKjLbQ59zW9VVgNPBlRQVew3weDdvnvEdIz/8ufs
	irgwAn4CR88QCoV4FZOE0poXnrEsMH0ul99FGlhXB7dwrGZo1gExJu2iAsewug==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Nick Morrow <morrownr@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7921: assert sniffer on chanctx change
Date: Fri, 15 May 2026 11:39:21 -0700
Message-ID: <20260515183921.23484-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_113932_885517_507C2B6B 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
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

mt7921_change_chanctx() configures the channel for monitor vifs but
does not re-assert sniffer mode. mt7925_change_chanctx() does. Match
mt7925 by adding the missing mt7921_mcu_set_sniffer(true) call,
completing the architectural pattern from commit 914189af23b8 ("wifi:
mt76: mt7921: fix channel switch fail in monitor mode").

The user-visible regression this asymmetry produced on v6.17 and v6.18
was addressed by commit cdb2941a516c ("Revert "wifi: mt76: mt792x:
improve monitor interface handling"") in v6.19 and backported to the
6.17.y and 6.18.y stable trees. This patch is defense in depth in
case the NO_VIRTUAL_MONITOR change is reintroduced in a future series.

Tested-by: Nick Morrow <morrownr@gmail.com>
Tested-on: RasPi4B, RasPiOS 64 bit, Alfa AWUS036AXML mt7921u
Tested-on: RasPi4B, RasPiOS 64 bit, Netgear A9000 mt7925u
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3d74fabe7408..fec9ab577dd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1405,10 +1405,12 @@ mt7921_change_chanctx(struct ieee80211_hw *hw,
 	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
 
 	mt792x_mutex_acquire(phy->dev);
-	if (vif->type == NL80211_IFTYPE_MONITOR)
+	if (vif->type == NL80211_IFTYPE_MONITOR) {
+		mt7921_mcu_set_sniffer(mvif->phy->dev, vif, true);
 		mt7921_mcu_config_sniffer(mvif, ctx);
-	else
+	} else {
 		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
+	}
 	mt792x_mutex_release(phy->dev);
 }
 
-- 
2.54.0


