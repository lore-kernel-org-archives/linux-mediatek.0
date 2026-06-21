Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD14CD98F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx5Q7/ku7gsTZmZ3GOU0+vMbh5Q6hh5pyKlmVU1DXCA=; b=yr5FHeyBnrHCxEeqf2vYYnoIXj
	LDG+jYhLTmuKVWjX6heH+s0qQ+ezFwri4SRK71pKknduSxRPfJb9J6vw5AI3RrjeqEoVLSzZlSzJZ
	ToueQLvwUa4IfYYQ6XVVvusOH/e6mVUzY0B1eWF9+tDo20rsd+BlzrVApvdUhbzp3anvmyHILnWZd
	uukCBhZ2PGm6oUbj+0bbimqceQfVIiSmRvquXDzkrVvIAnubEZE/t1/MwbfMBRvgi5cGl1hW7FOet
	w4aaFgM07mOd+epdVBcwLzxesrxHodRK9rg9LKxZDGwCMyYh+G3dclLa6oKZoKvRwUFRJrgGvr3z8
	U7tGj64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIBC-00000003xRk-44rU;
	Sun, 21 Jun 2026 13:25:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIB9-00000003xPw-3WnJ;
	Sun, 21 Jun 2026 13:25:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70C3E600AF;
	Sun, 21 Jun 2026 13:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ABC1F000E9;
	Sun, 21 Jun 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782048338;
	bh=cx5Q7/ku7gsTZmZ3GOU0+vMbh5Q6hh5pyKlmVU1DXCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iV27+AFpnrbRDKwmWYRHIACsbx313RQtEzN3+GYnhHFTRUnrjyLMlphtVPKBT1PqJ
	 Kv+nBHIYnOynAWJyAKnibDTmHz6TXUu6Sr8ZoeYOpaLsj1pzkf1GT0Aihfp696HT5h
	 CGuRb6H0osvNTZ7wHd9UPt3xw+kaqqhtBD7gHg/Ye0WmY2XgdDNqDT6auVXsnag/xp
	 pE2MTpW5d0vJqAXFqXKttdQ9vaRa1r+3nVV+O7wmOlUsH8HRaf+IzUZ1CyULXrMqV0
	 GYcyKdkmP+mlQSeAu/co14fkOoFX0JLu29xnebG4/2xXq0olKQ2+coeBEnQ5CeUx+F
	 RY12yvpjC8EUQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 21 Jun 2026 15:24:59 +0200
Subject: [PATCH 1/4] wifi: mt76: connac: fix possible NULL-pointer deref in
 mt76_connac_mcu_uni_bss_he_tlv()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-mt76_connac_get_he_phy_cap-fix-v1-1-ed4ccf7a0363@kernel.org>
References: <20260621-mt76_connac_get_he_phy_cap-fix-v1-0-ed4ccf7a0363@kernel.org>
In-Reply-To: <20260621-mt76_connac_get_he_phy_cap-fix-v1-0-ed4ccf7a0363@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Leon Yen <leon.yen@mediatek.com>, Hao Zhang <hao.zhang@mediatek.com>, 
 Nelson Yu <nelson.yu@mediatek.com>, Rong Yan <rong.yan@mediatek.com>, 
 Money Wang <Money.Wang@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Quan Zhou <quan.zhou@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>, MeiChia Chiu <meichia.chiu@mediatek.com>
X-Mailer: b4 0.14.3
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

mt76_connac_get_he_phy_cap routine can theoretically return NULL so
check cap pointer before dereferencing it.

Fixes: d0e274af2f2e4 ("mt76: mt76_connac: create mcu library")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 6596c9e198f4..58b0b15e4fd6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1458,6 +1458,8 @@ mt76_connac_mcu_uni_bss_he_tlv(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	struct bss_info_uni_he *he;
 
 	cap = mt76_connac_get_he_phy_cap(phy, vif);
+	if (!cap)
+		return;
 
 	he = (struct bss_info_uni_he *)tlv;
 	he->he_pe_duration = vif->bss_conf.htc_trig_based_pkt_ext;

-- 
2.54.0


