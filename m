Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2823DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 22:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnSDzk8wrqhQGpd94G/JRsvh5jl3zlwkyNlzJaFcsvc=; b=0o9il+UNafa+tX18qK4LObpMnR
	gN5s+Eijpfk15Apo5HQ+XXwEZ3vkoJ4cc4MHqXznn3/YdoqUCPIYKEIjGqYsCF6pidwZQn6vaC/3D
	Rjt887xnbv5efXfy/nV1IzdS4cB0ZVY0DDYhjWw5wwkeP6icTKeC1IPK6pSD/brwSNOwWNW+bKdCD
	TstrPqdSiANGV0Uj8jdgWfyQSVeTDGF8fcJmA4zKOmNnZtL1zoCK5To8qwt0Tv6N6b5Xy+mEvloPq
	Q9OwGD2wbHv+MnSc6ITdCexf57FPbQ1hIgirwav8/eobrDaQ6cQXXkCKmKJw7wC4fITeJai6iEEfA
	S/j/+YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r08Fh-0004Tu-1Z;
	Mon, 06 Nov 2023 22:39:25 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r08Fe-0004S9-1w;
	Mon, 06 Nov 2023 22:39:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r08FI-0004vV-2h;
	Mon, 06 Nov 2023 22:39:00 +0000
Date: Mon, 6 Nov 2023 22:38:53 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Rany Hany <rany_hany@riseup.net>, Simon Horman <horms@kernel.org>,
	Alexander Couzens <lynxis@fe80.eu>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] wifi: mt76: mt7915: fix EEPROM offset of TSSI flag on
 MT7981
Message-ID: <58c999ad9fd073183bec5532fe62782b7d4be0d5.1699310162.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_143922_639637_725F4ADE 
X-CRM114-Status: GOOD (  10.90  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

The offset of the TSSI flag on the EEPROM of MT7981 devices was wrong.
Set the correct offset instead.

Fixes: 6bad146d162e ("wifi: mt76: mt7915: add support for MT7981")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index f3e56817d36e9..adc26a222823b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -144,7 +144,8 @@ static inline bool
 mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 {
 	u8 *eep = dev->mt76.eeprom.data;
-	u8 val = eep[MT_EE_WIFI_CONF + 7];
+	u8 offs = is_mt7981(&dev->mt76) ? 8 : 7;
+	u8 val = eep[MT_EE_WIFI_CONF + offs];
 
 	if (band == NL80211_BAND_2GHZ)
 		return val & MT_EE_WIFI_CONF7_TSSI0_2G;
-- 
2.42.0


