Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7C0C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCW+iqeqbg3S1A4LbDhmQlkQIgodyBkaAYltQxiZyMA=; b=gjUJv21+Afa9CXDSowf4xmKtsB
	L88fCvohQvJvSD/NbTXfOlvFILxSCBlBZFYKjTip1RPleFR+YT8Sa1ti6yXXNw91TKCBMIFBFcGre
	35uglb1oOHqI9X89A1J7ANcJ8IJ7NcUz2SuVSSTAt+7FeaivrtCgDiTTHeROOY0JedbRbu0EQ2VGq
	bso2i1PU+h6oH7koyenYm++e2FytJClBtC5CwybBQsXTg5s70L+CSxmjQwLh+/mSm7RQMVLmlzQNv
	GCaiJXBCwurLSFPLSBQCcL+u46yXDzjBmmYjfWMS0TZsNb3/7lHc91Lt2cz1PcXq2I1KHJ/7Dnd2o
	0oUMBo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r08G5-0004Wc-2u;
	Mon, 06 Nov 2023 22:39:49 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r08G3-0004Vx-01;
	Mon, 06 Nov 2023 22:39:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r08Fu-0004w8-1M;
	Mon, 06 Nov 2023 22:39:38 +0000
Date: Mon, 6 Nov 2023 22:39:31 +0000
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
Subject: [PATCH 2/2] wifi: mt76: mt7915: also MT7981 is 3T3R but nss2 on 5
 GHz band
Message-ID: <3e43ce8ae3dc80d02a4393e0d28de2fbf7e938db.1699310162.git.daniel@makrotopia.org>
References: <58c999ad9fd073183bec5532fe62782b7d4be0d5.1699310162.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58c999ad9fd073183bec5532fe62782b7d4be0d5.1699310162.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_143947_046611_F09D5C10 
X-CRM114-Status: GOOD (  12.59  )
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

Just like MT7916 also MT7981 can handle 3T3R DBDC frontend and should
hence be included in the corresponding conditional expression in the
driver. Add it.

Fixes: 6bad146d162e ("wifi: mt76: mt7915: add support for MT7981")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 8ebbf186fab23..e667de50ece23 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1045,8 +1045,9 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 
 	phy->mt76->antenna_mask = tx_ant;
 
-	/* handle a variant of mt7916 which has 3T3R but nss2 on 5 GHz band */
-	if (is_mt7916(&dev->mt76) && band && hweight8(tx_ant) == max_nss)
+	/* handle a variant of mt7916/mt7981 which has 3T3R but nss2 on 5 GHz band */
+	if ((is_mt7916(&dev->mt76) || is_mt7981(&dev->mt76)) &&
+	    band && hweight8(tx_ant) == max_nss)
 		phy->mt76->chainmask = (dev->chainmask >> chainshift) << chainshift;
 	else
 		phy->mt76->chainmask = tx_ant << (chainshift * band);
-- 
2.42.0


