Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C25CA1002
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svoWC9D6G6+eNOlVocEza5byvhWFgL6Kwc7fUb0lntI=; b=w4ASQjat2EWjwZK4FvIKxyIO1m
	XCJ5i6mqmaNjqUHeQJ9NnUuxAFQyh9XOXAOthSx0qTJkmzQS3rzaLeiGI8YE2zKuFVjHnqT1dseV5
	lUSvbkDTTj1voJrr4+jW4+XeJn7Qi2n++9kc4fe1udoRprWsdSfeKQ7OSAw7FqV1ucdJeQkxd4jiB
	qj0ztwsBqpESJ1oG+aqBpvlWBoQqq3N54u8mO/AfOq7sSZQttV0SLWWHE4pcv208wsog64YnzIQZP
	9g7uTvPiAxF3eQTuDPLgcz5b0BUFG+4guP5mZwFS868bCN6BFZLLKVXS1AyfRL5C5ESuGvMKBU9Cp
	aDpFnUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5SS-0000000AH4b-2HFT;
	Thu, 04 Sep 2025 08:36:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4qS-0000000A2oL-0YVk;
	Thu, 04 Sep 2025 07:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9CF143AF9;
	Thu,  4 Sep 2025 07:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC2FC4CEF0;
	Thu,  4 Sep 2025 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756972643;
	bh=pvJsvoWdlUTvC290n9suVtfKhZuifPF5wPtJPHfxArI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DmKytEVgFvKUkYzq1imcCKcI1zp/r25292wZFTV+c2vUUHNgeB4MooczeAOgIkbi9
	 WyWOFY53frLOZediouAeCMZgkYOu5hIKeE94meIQNumgMpgUbdnH65IuGZe9kBBuGA
	 2UJrY74cmuQtWLiApp8AMekdIn+lNgVkMeau2Ruh9kZcmx/ujJG7c3FCx/6H9Mejh0
	 dx0wGfkAWrZugjCGc57RBCPAvWOT1XPANmkZIzQOC6sAjTNKPxggWy8BoDiKwoJbLp
	 GbCv8eXtPyq63GDTSKzHKnBiPKU8kH7yuT+agZjDk7hgBz4WAGZ3XSiJjDO8IXOUHr
	 9nQNIHM8rormw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Sep 2025 09:56:42 +0200
Subject: [PATCH mt76 4/4] wifi: mt76: mt7996: Temporarily disable EPCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mt7996-mlo-more-fixes-v1-4-89d8fed67f20@kernel.org>
References: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
In-Reply-To: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005724_196969_33E26149 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

EPCS is not yet ready, so do not claim to support it.

Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index bce128bcb8be7dea64db42f4dd9984ba0b9f4ba1..21ac618d1c836aa997b12769cdbe386265b2b276 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1351,7 +1351,6 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 	eht_cap->has_eht = true;
 
 	eht_cap_elem->mac_cap_info[0] =
-		IEEE80211_EHT_MAC_CAP0_EPCS_PRIO_ACCESS |
 		IEEE80211_EHT_MAC_CAP0_OM_CONTROL |
 		u8_encode_bits(IEEE80211_EHT_MAC_CAP0_MAX_MPDU_LEN_11454,
 			       IEEE80211_EHT_MAC_CAP0_MAX_MPDU_LEN_MASK);

-- 
2.50.1


