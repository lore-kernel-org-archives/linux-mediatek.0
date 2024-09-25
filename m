Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A46C369D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clqOUDDdtyIQQxtmL+CRhxEU3xSqRKeHXGGvZcFPwBk=; b=XaOXIbJBxDp18+MGUDzCbghspN
	Qh05jlcD+iJxuPsMGt+4pbHSIsIn+HledbB+aBfzdAzndhAHpZY9UudU2iqq7dnHVvo2vWHOk03tp
	johoGkjEFqrZrRPAhLZgufpIHlNbWhS1EGGEphslWPpMOu7gxso9BfU6YbsfU686zDc70p3UKPAWE
	sIrGr9Y5G+FyyqZRZ+jOZ3TUNQZ9Al47Ww6gxz+0PF+dSKVVZXiMqvrswkF1yt8fq4ZbtXYRnYoSY
	RYWvFRJXFtOeOnYu7xwTiJotRevANNkAqRlfEvb9tI6MKnPuFGUi83Ta6Kyyo3rSh7UspJmS1UfF3
	JgF3bbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQgK-00000004zd6-0hSr;
	Wed, 25 Sep 2024 11:59:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQfv-00000004zSt-23uf;
	Wed, 25 Sep 2024 11:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B71A95C4DAE;
	Wed, 25 Sep 2024 11:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBA4C4CEC3;
	Wed, 25 Sep 2024 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265558;
	bh=UTnyrC6+eQGfN6gBoDqD4hpWuNu1GAI4ICtRKrZvAu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HDZKpS+wby4zn/fV6ztuGh5wuzt95e/OOWuPqRxm2L56nAAp7oEaqGpA7Pd9JI7HQ
	 71xr8eES2f/MikjMqaM9cJqiO9QYVRIu8dlPi0bKA4z0nAfi3FL2/HWYxRY025LLxt
	 BXEvTrojmxtrbJhTO7gp2jQviFvTTZXT7fTFcHGl7pnFZmbtr45y86X9W+2jqBG48X
	 JGPVZ3lyn9cO/AtByHEuyGJcfOdmJa8Fg6F4WE2+GJe6WEORvK75jjdkfFzCRLc4xc
	 Dbbsuse2uiPY+upmSoW+EaEMABH3tiPsMBfVZnrv6ulD3cGBwSWXDCK+YFqLBKgWIx
	 lpBKYpnl/mvnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shayne.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	meichia.chiu@mediatek.com,
	johannes.berg@intel.com,
	quic_adisi@quicinc.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 021/197] wifi: mt76: mt7915: disable tx worker during tx BA session enable/disable
Date: Wed, 25 Sep 2024 07:50:40 -0400
Message-ID: <20240925115823.1303019-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_045919_707511_FA2F1FB1 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 256cbd26fbafb30ba3314339106e5c594e9bd5f9 ]

Avoids firmware race condition.

Link: https://patch.msgid.link/20240827093011.18621-7-nbd@nbd.name
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9599adf104b16..758249b20c222 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -690,13 +690,17 @@ int mt7915_mcu_add_tx_ba(struct mt7915_dev *dev,
 {
 	struct mt7915_sta *msta = (struct mt7915_sta *)params->sta->drv_priv;
 	struct mt7915_vif *mvif = msta->vif;
+	int ret;
 
+	mt76_worker_disable(&dev->mt76.tx_worker);
 	if (enable && !params->amsdu)
 		msta->wcid.amsdu = false;
+	ret = mt76_connac_mcu_sta_ba(&dev->mt76, &mvif->mt76, params,
+				     MCU_EXT_CMD(STA_REC_UPDATE),
+				     enable, true);
+	mt76_worker_enable(&dev->mt76.tx_worker);
 
-	return mt76_connac_mcu_sta_ba(&dev->mt76, &mvif->mt76, params,
-				      MCU_EXT_CMD(STA_REC_UPDATE),
-				      enable, true);
+	return ret;
 }
 
 int mt7915_mcu_add_rx_ba(struct mt7915_dev *dev,
-- 
2.43.0


