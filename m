Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B4CCC6B03
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 02:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sayYI5/V5aP0hkCu87O6eEP/Go2rs6LIxqSWTQGxk/0=; b=R9B5VtMdXaUGX0MuTKCvSL5IYK
	Q2GWrpXJtwdZxRRxN/23gb2ioruqsPVRM4wDswv3v2XPxTOIyCZ/oya/Sgj4KgvLibzMExTeSJ4qG
	fxObFDy2SmcLaEdqIkHOrcb/Di+uaEoUOcMYmK99g9C9VB+XhVHxkmud3G0VpLAKFkCKpoHBxRN70
	jzBSD9EtCXgH7X19EJpPw0INwmjwxG5qACpj+cuYRNCUP+HcwRsNmwVnVQglprPz2qFH/tjs8pyvQ
	PdM4rl+ZoIigMwVkDjCSVNcU6H3hHWq3m/pRTKQRrOMN3fSIXX0eTcxpAu+LiNm02U+fEoFZXIuW7
	m3BiCWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSPE-0000000BosE-2j90;
	Tue, 13 Oct 2026 02:38:20 +0000
Received: from out-47.mta1.migadu.com ([2001:41d0:203:375::2f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSPB-0000000Boqm-1OYc
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 02:38:19 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=z+3b0R+SkRHpJ162dmXuf+uQGk2RcaK6++Nem8g9eKM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791859093; v=1; x=1792463893;
 b=sEvIwfTvs6CpAPe6UWtbIQ5snuJATafkqU6WtlypCnhjAb0MxpUJbh2opeYYputE98+23n0T
 T7HTCCTSueMEM4cSqcS961Nr5o8EfQUs0cMNfesPzhFSK5xUWW0shEZRB0gpsBEsUfPB1I4UqFe
 0xNkDdWyJ98xmnBtt++BMezxjZXC4JR6q9LeYbmpPe+dE/3yWZh1McGALCPZpaHW+mh7AxH5sAi
 0uZwzD/ThxLPQ7QTqhRl6Hq7/tw+ldp7iLN7bYZC7aX/K+X2/F31TrRohAXAxadkPPnl7eBQ8tw
 WkcWHJ/ptF1vFJb8cUstqm/Wb1vHx9/JU+sGjgmJrP9hA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a363cb81b51ea92b;
	Tue, 13 Oct 2026 02:38:13 +0000
X-Mizu-Trace-ID: a363cb81b51ea92b
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: mt7925: fix MT7927 receive loss after a channel switch
Date: Mon, 12 Oct 2026 19:38:10 -0700
Message-ID: <20261013023810.256061-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_193817_719891_F64464A2 
X-CRM114-Status: GOOD (  13.27  )
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

When the access point announces a channel switch, an MT7927 stays
connected but stops receiving until it reconnects.

To set the band, the driver deletes the MT7927's firmware interface and
adds it back whenever a single-link interface is put on a channel. A
channel switch does this mid-connection, and the connection is not
restored.

Skip it on a channel switch unless the band changes. Monitor mode still
needs it to retune.

Fixes: 05fd14885303 ("wifi: mt76: mt7925: sync MT7927 BSS band assignment")
Link: https://lore.kernel.org/linux-wireless/20260306-mt7927-wifi-support-v1-17-c77e7445511d@jetm.me/
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---

Notes:
    Tested on a Framework 13 with its built-in MT7927 and an MT7925, both
    downloading while a WiFi 7 access point switched. Switches after which
    the MT7927 needed a reconnect:
    
                             7.2.10      + fix       7.3-rc7     + fix
      channel moved          10 of 10    0 of 10     10 of 10    0 of 10
      width changed          26 of 26    0 of 26     26 of 26    0 of 26
      puncturing removed     10 of 10    0 of 10     10 of 10    0 of 10
    
    With the fix both cards can pause for up to three seconds at a switch,
    as the MT7925 also does without it. Monitor mode, AP mode, joins and
    moves between 2.4 and 5 GHz work as before, and the card still recovers
    from a firmware reset and from suspend. Two other MediaTek cards on a
    second machine came through every switch, stock and patched.
    
    The series as first posted only resent the interface when the band
    changed:
    https://lore.kernel.org/linux-wireless/20260306-mt7927-wifi-support-v1-17-c77e7445511d@jetm.me/

 .../net/wireless/mediatek/mt76/mt7925/main.c  | 25 +++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b46408f4aed2..bdd44b52f886 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2401,10 +2401,11 @@ mt7927_reconfig_band(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 					   true);
 }
 
-static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
-				     struct ieee80211_vif *vif,
-				     struct ieee80211_bss_conf *link_conf,
-				     struct ieee80211_chanctx_conf *ctx)
+static int __mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_bss_conf *link_conf,
+				       struct ieee80211_chanctx_conf *ctx,
+				       bool switching)
 {
 	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
@@ -2429,7 +2430,9 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 		if (is_mt7927(&dev->mt76)) {
 			band_idx = mt7927_band_idx(ctx->def.chan->band);
 
-			mt7927_reconfig_band(dev, vif, link_conf, mconf, band_idx);
+			if (!switching || mconf->mt76.band_idx != band_idx)
+				mt7927_reconfig_band(dev, vif, link_conf, mconf,
+						     band_idx);
 		}
 	}
 
@@ -2441,6 +2444,14 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	return 0;
 }
 
+static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     struct ieee80211_bss_conf *link_conf,
+				     struct ieee80211_chanctx_conf *ctx)
+{
+	return __mt7925_assign_vif_chanctx(hw, vif, link_conf, ctx, false);
+}
+
 static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 					struct ieee80211_vif *vif,
 					struct ieee80211_bss_conf *link_conf,
@@ -2491,8 +2502,8 @@ static int mt7925_switch_vif_chanctx(struct ieee80211_hw *hw,
 				     int n_vifs,
 				     enum ieee80211_chanctx_switch_mode mode)
 {
-	return mt7925_assign_vif_chanctx(hw, vifs->vif, vifs->link_conf,
-					 vifs->new_ctx);
+	return __mt7925_assign_vif_chanctx(hw, vifs->vif, vifs->link_conf,
+					   vifs->new_ctx, true);
 }
 
 void mt7925_csa_work(struct work_struct *work)
-- 
2.56.0


