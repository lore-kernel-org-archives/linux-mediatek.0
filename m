Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B4CD116EA
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Nov 2025 02:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cp/JYRXzpQUfHKnygAW6FMFtqKdikeBl6XCAbZoIbrs=; b=KNdehWmYUbpBshzDJyOhXTrc7C
	Y2RcOADQlVbRG51POFbmWkmxBRD6GH2aZIziGpZ1JkRP5jt4FfvVA12nLO7eZMFWpfosrIRb46KJi
	0pi4OrKjF1+WaxuG90nF1Qx7Zg8kr/Er1lPZtpKlJsaaAzyz5GO46hkbqhcIe3fizsd0WTqll2dQT
	sfsRfsHp7iecM1vjgLwB/sBcbdrvT0NQax4HJnmX1Fe1czUiLjWseLDQ79KFEyHp73Wid+VlTz3f7
	lNcKISSboZz3rriq3JXg76mc4EMaSSYlEziWj6q6FEu7nd3vE9NWmtVH6v9yyGC24gBF5cZaOQ8eV
	K1ylv1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPArw-00000001Bwr-3hJ5;
	Sat, 29 Nov 2025 02:39:28 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPArt-00000001Bvq-3PT4
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Nov 2025 02:39:27 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id E328A60BA8
	for <linux-mediatek@lists.infradead.org>; Sat, 29 Nov 2025 03:39:14 +0100 (CET)
Received: (qmail 7459 invoked by uid 988); 29 Nov 2025 02:39:14 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 29 Nov 2025 03:39:13 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt76x02: wake queues after reconfig
Date: Sat, 29 Nov 2025 03:39:02 +0100
Message-ID: <20251129023904.288484-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=r+TbYhbumj1LE8b1/7eJFLcgqdgfk2pwXQgbmKsupuw=;
	b=ZyuQ4RBJKyUA52XzcpBJ26EPkdMekw9p6Bem8sCEckOnqLoU5lOpVspUv5jatMkVYaLf2nfCzd
	rfPgNtHA3ihFfsc+fRXrieV+Co2ZgOJ9ahaP369qXv5z2bA/UXKOsAh3lLu53WdidtKShM8WznPz
	WwFGhVyza0nuZdbOgQ9wXX7ZmI8AHOAXuLg1yaPniWOGXq5vTA+VI71XiEqssDmPjnc4YXbe58aj
	1pKocbb9eH1VX5cF8oQutygWasZFPB+v0jxD0qeZN5GFujDPWihlegGkIRQ5NJ9X3YXWS/L0crd5
	DYfvTDtFXgfAE+C/8g5PzHnN5Ra40Cz9lkGxnW/ishU/4QWYrugGCwt5CcvaXY9AmoNRqj2lQAYU
	jFcgtjcqcDN36CEGQKfDctVyCQgeZL9sLpejrUPLAAFJJCluj8NHGNwbI2ezTMOIJ4NKnjelwH0/
	f76XnovaeViSjESw00+6jlJ4pUjqsE65RI76wjMVewCf37o9XloKN3O+CHSYWtr3Qv59Sz2Di0kb
	9XxMdx7WDJ3fIy/nrR5LLzqoo+0eI61QDQYGXgZk01khhTPjqaP/PAINiWpo590fdOQrFRIs0eki
	OooHEtIqMY2wHvyfrSBBOG3RgOjWAh1agyv2Hw0Tfzi+paYgJfFQW92CI4qxVhu9YjeJJwwpsaE1
	U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_183926_279940_4EAA9A67 
X-CRM114-Status: UNSURE (   7.01  )
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

The shared reset procedure of MT7610 and MT7612 stop all queues before
starting the reset sequence.

They however never restart these like other supported mt76 chips
do in the reconfig_complete call. This leads to TX not continuing
after the reset.

Restart queues in the reconfig_complete callback to restore
functionality after the reset.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dd71c1c95cc9b..dc7c03d231238 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -534,6 +534,7 @@ void mt76x02_reconfig_complete(struct ieee80211_hw *hw,
 		return;
 
 	clear_bit(MT76_RESTART, &dev->mphy.state);
+	ieee80211_wake_queues(hw);
 }
 EXPORT_SYMBOL_GPL(mt76x02_reconfig_complete);
 
-- 
2.51.0


