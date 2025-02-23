Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF21CC021B2
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Feb 2025 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZXsjCNy4V+kCyFuif8XWdLqtmoN0EswAxYS9Q53oLPQ=; b=efk4LzK9g5Je5O8T3aPdQrVau2
	f0p7G1h0MhbSgD6fgA6Y95EuXUDKNPGnmQs//gHSbyHtjGyXNSOw4+Os8la+QjovkO8ikXZNKA4zF
	I/GggDZgEjdKJxV3o/loPrnSJ2Jhm9QRQkIPyHc+ASJ1bsv8ce5kookAxqMWkd7BrwM+WBiI9F4+y
	5igQYDnKA73Pfg2wMHoPx8NdN0PqXUfngyaACmCGj70mjB8nKRdJ5Ws7CwcDykJD+z83Fy9kcUPkg
	d1Dgkmct2UGJlWM3rF7WDGkOFOGJhxnV8xIlIjGZDpLCa6O3sYypsYMGhXefEIptimb1JPVh5XfLb
	WtFb0RxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLL4-0000000Bxpi-2yZy;
	Sun, 23 Feb 2025 23:24:46 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLJa-0000000Bxk8-1vuf
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Feb 2025 23:23:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740352981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZXsjCNy4V+kCyFuif8XWdLqtmoN0EswAxYS9Q53oLPQ=;
	b=NhM4NRdr+vfHRpfKDz22u8xvKhUui2K8mcLNioPcSxfF7v5JjqpR0/ERdZSgFG2uDTT5hD
	tlFGWAu1i1X8Kg/Nn60k4bs2QHbmmaVu1fd1IOdGJhAEHRmRBUM/aMHkqvwEjuh0E0DDKm
	DNuClbuZB9unk0HeYhqZroEoNVzxhdo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless-next] wifi: mt76: mt7925: Remove unnecessary if-check
Date: Mon, 24 Feb 2025 00:21:24 +0100
Message-ID: <20250223232127.99357-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_152315_044358_0B0AE48B 
X-CRM114-Status: UNSURE (   6.49  )
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

The if and else branches implement the same logic. Remove the
unnecessary if-check and simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 15815ad84713..7e4935965d35 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1983,11 +1983,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 	}
 	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
-
-	if (link_sta)
-		info.newly = state != MT76_STA_INFO_STATE_ASSOC;
-	else
-		info.newly = state == MT76_STA_INFO_STATE_ASSOC ? false : true;
+	info.newly = state != MT76_STA_INFO_STATE_ASSOC;
 
 	if (ieee80211_vif_is_mld(vif))
 		err = mt7925_mcu_mlo_sta_cmd(&dev->mphy, &info);
-- 
2.48.1


