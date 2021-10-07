Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05572C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 21:30:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E295161130
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 21:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E295161130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HX4Tp56++9syOKmDzQ51C+0thlLr0aRMr8XtjFv3IU4=; b=JIWO4LFw1lF2qA
	GzKXOIXT2CH1SG2lXb4dMxfvfTUtg3EZJtEr7N92eTnbj46XdYziQ6yx/3xsulmQh9+9D/GrMBKYI
	z5T7+pJlYKCvTOMxg2Y0x3txkSA2zV1thtp0DZFIx9OhWgi496Dy5V6HD9OL7UTQrkYOVNMxL6qNc
	55T3abB4lb55PjxHJFdYFRTaH9pMrl+px0xh8NmAaWdmKslcfoMIvYlTvkKE8CtqImpVtX13RFnDP
	LQlMgrq35FpYhHjfujJdIOE4Yyd2c+9LTEZlh+S6x4smmCSIFtKNeAvwnF4fxLTNqJ3Jfq6kW2871
	mmDvEdVjeTNEqzrFW/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYay3-000nsJ-E7; Thu, 07 Oct 2021 21:30:19 +0000
Received: from mail1.systemli.org ([212.103.72.247])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYaxn-000nqc-QX; Thu, 07 Oct 2021 21:30:05 +0000
From: Nick Hainke <vincent@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1633642197;
 bh=MJwQ+q0KiuGyG+lblF9ElluwfUQc8/qwRfPq28lM2o8=;
 h=From:To:Cc:Subject:Date:From;
 b=aXjEQPOhEJAtZKrhCg2tupgKeTBMtvCx89IeBDqcVnMy6ZHWLTGO0bKGdJYlQN9Ri
 h7CSbS/JDUSlmtDzRgmzcxFG0IKJZY4NHP4ezxQ7EKUqrJBxNiM2OY/vlEC0XewocM
 X9OneCef1S2jmdPfB+CTkil+Hn0rLDiHRDc74tUtwetRmQigxkBEbCmsPw327FZ80Z
 w84arZxSUZ4wLDvvmf0NB9wppmMgr/fxpzlGwouDIdWwaBuAeHo/XYTIdbU2Rc7LDI
 s5eKOskI0pHDI4CcyGo7HNryZx4BkS9vNIak5JNH/C1FDiL+W003GoIKaJPYTpB3gS
 YuBoaC52Xkkgw==
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robert Foss <robert.foss@linaro.org>,
	Nick Hainke <vincent@systemli.org>
Subject: [RFC v1] mt76: mt7615: mt7622: fix adhoc and ibss mode
Date: Thu,  7 Oct 2021 23:23:23 +0200
Message-Id: <20211007212323.1223602-1-vincent@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_143004_182254_4B94849C 
X-CRM114-Status: GOOD (  10.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").

commit 7f4b7920318b ("mt76: mt7615: add ibss support") introduced IBSS
and commit f4ec7fdf7f83 ("mt76: mt7615: enable support for mesh")
meshpoint support.

Both used in the "get_omac_idx"-function:

	if (~mask & BIT(HW_BSSID_0))
		return HW_BSSID_0;

With commit d8d59f66d136 ("mt76: mt7615: support 16 interfaces") the
adhoc and meshpoint mode should "prefer hw bssid slot 1-3". However,
with that change the ibss or meshpoint mode will not send any beacon on
the mt7622 wifi anymore. Devices were still able to exchange data but
only if a bssid already existed. Two mt7622 devices will never be able
to communicate.

This commits reverts the preferation of slot 1-3 for adhoc and
meshpoint. Only NL80211_IFTYPE_STATION will still prefer slot 1-3.

Tested on Banana Pi R64.

Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index dada43d6d879..51260a669d16 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -135,8 +135,6 @@ static int get_omac_idx(enum nl80211_iftype type, u64 mask)
 	int i;
 
 	switch (type) {
-	case NL80211_IFTYPE_MESH_POINT:
-	case NL80211_IFTYPE_ADHOC:
 	case NL80211_IFTYPE_STATION:
 		/* prefer hw bssid slot 1-3 */
 		i = get_free_idx(mask, HW_BSSID_1, HW_BSSID_3);
@@ -160,6 +158,8 @@ static int get_omac_idx(enum nl80211_iftype type, u64 mask)
 			return HW_BSSID_0;
 
 		break;
+	case NL80211_IFTYPE_ADHOC:
+	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_MONITOR:
 	case NL80211_IFTYPE_AP:
 		/* ap uses hw bssid 0 and ext bssid */
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
