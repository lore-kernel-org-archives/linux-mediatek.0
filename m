Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55C9C369D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoYc7Xje/xaATQ7u2RW0fEfWNDr/7jETw6eJLr+5ZCY=; b=dk947JRV7m9zaV6T/bh3mkag9F
	fzJ4u7zj/A9BEjjcAOuKgXeIVP5CSOemWL6uiNC7ThMxhadib/27C2ucK8qPE7w/RFDjLgY+Zs5Vm
	CKBKMnaLL3YUO0QkMr0McA5u0gnIkxTuw/pmVCasFUxljSdwLu40TUiG12++xZ59d/lZRg6FkTg0B
	86oGBkxx8gr+BUBudRvkVWRUNEK+nEqp7qqIsdnw5qPJjTrMsdGfPWHoOXnjmqpG+Do6AiLhHU5AD
	+hfzgA04jdm/zdHXKcF32iv+dM6XNzgFtMCWSYK3h7C8DgRoY2M85OJbpIXE8Lw0AZlQsbzT77FQL
	6KghqL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stR0L-000000056aR-2gSd;
	Wed, 25 Sep 2024 12:20:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQsb-00000005410-2cV7;
	Wed, 25 Sep 2024 12:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC8BD5C5435;
	Wed, 25 Sep 2024 12:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445E8C4CEC7;
	Wed, 25 Sep 2024 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266344;
	bh=3D2z+0SsT8huZ7rlh5ty6QMMg2TVj6QXTKvgfOUzK20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJ0S6+2gdwxgCKrf5bqQrGX7JzEj9IXIG0IIZqMAwDKuZIa9cgCiAJFe0vWgMv4HD
	 xEz1j/DlRBl5kgvD2+xmx4Udwfalou0bkSsLnLAx1/+NiKrV/uaCaZwU72iBfby0pi
	 66y0iP2PGKPVwpwCmQBOoGj16WCeIkpNsuCUdrnNPl3Yz7EN6xoNEMw82gzGz+iR4B
	 JfQMi3OlHZtRcqJ6v0KXXcS7gZYm/jLN6XJsaG84skAr46GnZQhUeP8iq+bDiKG63O
	 6fQz+kDHbUIgCCCyTp406lY1/jCMVo3TicncP5QuWyIEEjDfzC1ndxe89M7NJWMHQH
	 uW/zi19h9AgHw==
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
Subject: [PATCH AUTOSEL 6.6 019/139] wifi: mt76: mt7915: disable tx worker during tx BA session enable/disable
Date: Wed, 25 Sep 2024 08:07:19 -0400
Message-ID: <20240925121137.1307574-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_051225_754131_B95312F5 
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
index 272e55ef8e2d2..5fba103bfd65d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -688,13 +688,17 @@ int mt7915_mcu_add_tx_ba(struct mt7915_dev *dev,
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


