Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969ADC021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzbwDugigv/fkESmtWyvMDB2hQeczIUKE9iHdWJ8hk4=; b=RbVmL3wbip/PQfWP4hBolwImd4
	0su+dvev/MdJkdLH9L9ZdTqaySIskjXkUu05Pksq4NCQhlwrxwAfwipNtGfgYbPhKaPhN4HnU7vUK
	odH5SD8Aq85bjAhcTwzwGChxhc0BHw1MSKdUZj9W3pIMK+KNGRRpDK/YA532daNypizm0HvhQ1IaS
	zZZSPHgG6IIKSIJeyNqUPRk6rQ+VY8bMEiwzLBiBfqUmWGyAU8hgf5Nkho1wSmbvjJuFmYKM80Vlk
	LRhOA/ozIrnYEOxGstr9Jw0GiN9zvRdRPPYMI3Dks/try8VFd01j7DursIBIcHDOwsDlNA2/YTy+R
	oPKRlyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6b8-000000013In-2uI1;
	Thu, 20 Feb 2025 13:28:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Sm-000000011ID-3QwE;
	Thu, 20 Feb 2025 13:19:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A85C5C5DA4;
	Thu, 20 Feb 2025 13:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90488C4CED1;
	Thu, 20 Feb 2025 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740057575;
	bh=gGdf+VRUhiXXWh8gyuHClI8gYTA7M7cqi6oq8hubugI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t82jy/YFvAa+dlqo2L7ilXJDn1InyBLjHC4lthLaoLWmDvkO4zi5i7NxEWvd41UIE
	 /MwbqjipOdqylRR0E7aB74mfJGUloSDlG+J1jLvCi9MuxGmuRjtkKAxxE7vK0skfVd
	 jIH2+OuyaQ+EXq7ppkV6s7sN4q2mL14rpgasAcT5pVDaPIKCcYKeBuHVuIZTfyh6TU
	 qa05ANvGzyLPwYHUvZ4uStZCavoONYDmPB0naLLfVooUpoQ4mlUi7KNrqzEQF1yD42
	 h7jN9KNszmVAOWPUO3LMcXqnV3xR7nolxApVfnHFKFR5Z0vw986Lh1Iaxro9BjjnN7
	 Q4tO+5kPfFoZg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 20 Feb 2025 14:18:55 +0100
Subject: [PATCH 09/14] wifi: mt76: mt7996: Add mt7996_mac_sta_change_links
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mt7996-mlo-v1-9-34c4abb37158@kernel.org>
References: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
In-Reply-To: <20250220-mt7996-mlo-v1-0-34c4abb37158@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051936_920702_EC1BD54D 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

Intrdouce mt7996_mac_sta_change_links routine to set change_sta_links
required by mac80211. This is a preliminary patch to introduce MLO
support for MT7996 driver.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 06e87a8cae48902d3ffa641127f653ddb146cb3d..104f832c1676912fbd07886da57c262112efea15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -910,6 +910,26 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	return err;
 }
 
+static int
+mt7996_mac_sta_change_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, u16 old_links,
+			    u16 new_links)
+{
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	unsigned long add = new_links & ~old_links;
+	unsigned long rem = old_links & ~new_links;
+	int ret;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	mt7996_mac_sta_remove_links(dev, sta, rem);
+	ret = mt7996_mac_sta_add_links(dev, vif, sta, add);
+
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
+}
+
 int mt7996_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
@@ -1827,4 +1847,5 @@ const struct ieee80211_ops mt7996_ops = {
 	.net_setup_tc = mt76_wed_net_setup_tc,
 #endif
 	.change_vif_links = mt7996_change_vif_links,
+	.change_sta_links = mt7996_mac_sta_change_links,
 };

-- 
2.48.1


