Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B4AC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiko7LAf6zTmWxsKa6oxRRRlHpLxkBspfos0DtiJD4I=; b=t7oQGjGxer76VCY5kek+eOz+iz
	6WHNxmHW9H3IghvLcaVHNC1W9GHnz8KpwvUaoN4+v7ktqzBegOG4otG5xlg/4Z6IMooYUej7MvWmx
	J4aLywP3yBzMKsNOVpsvKJqg6/W6c2qHrFiVQxaidt7xPAHGR3k+8uiJ3Eby273nsI2+u7SNlwTgv
	RYiMQOtGezLxZZXYrMghFLrJZbGqoFEcV7TziYPgSZ/yUvwZJ5bVarPahiJpNmZjLGVE/RWVwYZQY
	qe/x7XxhsUOi4aMRylwL4baWiwSd/TPzzbmWES90yJkpfQ+WsOoeDqLzVvtb6jppRM8LlAsG9AwDx
	SK1OR8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpN4-00DBje-1n;
	Tue, 16 Jan 2024 19:45:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpMw-00DBfh-34;
	Tue, 16 Jan 2024 19:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EE4E61367;
	Tue, 16 Jan 2024 19:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEF8C43394;
	Tue, 16 Jan 2024 19:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434276;
	bh=2wSd7Pw557To/U/qMdiCZPjLJb0oe6gIifgwpckOdBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IpdHV8BhVrFFt/+Wb55pBI5LD+FDj2oc2cDsAp1YT2gitXzRl8jeRdHPkA3UF/CaA
	 zGUwHD1rXBrkv5SCPkMO2zrUqztqTnJWNZc/+f6nQ5Nm3zbD7wQV8ytLIQ8HGCiN6C
	 6Q6vrNd0921uFL4r7/vbfmnDiOz4yG43GDlpZJzz+c3EHU8K0TV8Fq4VMoEl5dAcFg
	 +zor2JTxZfWp0Jc8AFqXztT4paJ2XRlybK4z5rcBM22kGaTErRy/969K9tFFlkNURj
	 YbGeXJ/UK3n/6ZKLOljoWbQ+aorwkyQ1Ueyt3UDcfHTq+NnVlGE73wJ8vC7UqiBtDb
	 /HLDXXjUq8JdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: MeiChia Chiu <meichia.chiu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 048/108] wifi: mt76: connac: fix EHT phy mode check
Date: Tue, 16 Jan 2024 14:39:14 -0500
Message-ID: <20240116194225.250921-48-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194225.250921-1-sashal@kernel.org>
References: <20240116194225.250921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_114507_031975_AD306AEC 
X-CRM114-Status: GOOD (  10.48  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

[ Upstream commit 2c2f50bf6407e1fd43a1a257916aeaa5ffdacd6c ]

Add a BSS eht_support check before returning EHT phy mode. Without this
patch, there might be an inconsistency where the softmac layer thinks
the BSS is in HE mode, while the FW thinks it is in EHT mode.

Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ae6bf3c968df..b475555097ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1359,7 +1359,7 @@ u8 mt76_connac_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	sband = phy->hw->wiphy->bands[band];
 	eht_cap = ieee80211_get_eht_iftype_cap(sband, vif->type);
 
-	if (!eht_cap || !eht_cap->has_eht)
+	if (!eht_cap || !eht_cap->has_eht || !vif->bss_conf.eht_support)
 		return mode;
 
 	switch (band) {
-- 
2.43.0


