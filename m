Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9781C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYD5YPRzSCe3/z4eq/zoMIRbI0bvnGLkgXoLLGpamHQ=; b=26C+0dy6LF8N3o/YcVgdSE8ENl
	4te6U9PGM/Ifg9TeaguBr0L1aJ/PLUI+HTRbv+LV2GXlmcgWSdFQOJVjhw0KsTpJayvpE83f+Unky
	sCSWfGkOcusu2YHrOr2/83leHNuNaasNGzasdAAt8pBicaFz1f++gCjuxo9C8u+KFXD+xV+bPor76
	mQu9DFmBKWvIf18LzbhA2nbIF0W3uGZuKsJ36QWD5mnhhfHQUpPZ/JOO6q7nf98qPN0uD9uARwwOh
	0JjLKMElxGhy2hMbjepotox9Xo1KNbHIvYT1AuW4ZOBBQvFOvi+Mc2fe0i6fe1eCCuuCSAiT19tme
	09s4Ws5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpSz-00DEuE-2c;
	Tue, 16 Jan 2024 19:51:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpSx-00DEsw-0G;
	Tue, 16 Jan 2024 19:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B89A6131C;
	Tue, 16 Jan 2024 19:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9398DC433C7;
	Tue, 16 Jan 2024 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434678;
	bh=QbtDIgq36wGYPjbNL99cbfZ0a3/J5QTkywmWt95A8NI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hHxiU8fZlJRbMqKsx9gvXIEg1eeN2TsNf7muaX31P0ZzbU3ulPAKx1C/ZFwZEheiv
	 OVXgJXyiWTYC/1Fs10V0B7gYz6lcHCr0KhQZKPgzndyH9RIS4aGVi+N48C3yGPpFM3
	 4kY+KQcIMjhpPwlkHoMbeqz1TbXW6tVltjrPbRpyJNC87ZxZZ+BohBmBqmV3KOXRNG
	 KhUz/ZvEGOWsO5an46f5/LYp0fFtLjuv6d5ZCD+clNoMAjLO5g7rLg99EkWIw5Uq4n
	 ZCoPpa9l29Y5nbcdzlHFLV0A24dFCrLR8OiQ+Cgkts2V8Qw5s3rsEpSSXGB0opOfJH
	 fOVL5Lcbz7w2g==
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
Subject: [PATCH AUTOSEL 6.6 047/104] wifi: mt76: connac: fix EHT phy mode check
Date: Tue, 16 Jan 2024 14:46:13 -0500
Message-ID: <20240116194908.253437-47-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116194908.253437-1-sashal@kernel.org>
References: <20240116194908.253437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.12
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_115119_164031_F5F70349 
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
index 8274a57e1f0f..dc4fbab1e1b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1347,7 +1347,7 @@ u8 mt76_connac_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	sband = phy->hw->wiphy->bands[band];
 	eht_cap = ieee80211_get_eht_iftype_cap(sband, vif->type);
 
-	if (!eht_cap || !eht_cap->has_eht)
+	if (!eht_cap || !eht_cap->has_eht || !vif->bss_conf.eht_support)
 		return mode;
 
 	switch (band) {
-- 
2.43.0


