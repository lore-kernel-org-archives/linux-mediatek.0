Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB48C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mUGieBf81NHgDHLFFszeOE1W9DwmuOKqKWfCEXch2E=; b=kdudzQ7bqmajwpkYDRUurSNV57
	8u4WllmAwUhbjj1CNjIcO205KwqRSfaEUGC515hFPzcdFPtlCyg5ycGSyIQoaQJpyoW85JnbgNIWy
	kqJi85gdya7iyDyYeW/bTN8R0bbITl+XP67vVEJ7AndLUYuZ98FeMg432aJRcFQdRKtulyY2G7YDh
	pl0AHLe9IcnP8WT5z1cPfqnfEiXtA3ZOc4Vy159L5pPlN6NDBqwcZbR6vztz0RELAhRkLyVkQUlte
	CbYg8aopL9Z7CeRcPUkh6EPm3v0C+6HMikwnBMg8s7qU01mqqM7whX8WxAtOCDR6Jn50ugKdoZjAt
	bCNO2Fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBM2-00000000LPS-3tUp;
	Fri, 29 Mar 2024 12:29:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBLN-00000000KxC-3WBd;
	Fri, 29 Mar 2024 12:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC364CE2F84;
	Fri, 29 Mar 2024 12:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7C2C43609;
	Fri, 29 Mar 2024 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715302;
	bh=jynmpQ+qq4mMAdefWa+kWyANDOVCxQSgDNakmtIj/GI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X5snKhEEcT/WGxEkE01izFAsMrheMdWO9htbyEXeUf9yJm0G1TEC/HnHebTTmGvCv
	 R0+8O4mwhHxT1PYjEnVz9TicMkJWsLI9NLFXV+XGs5EWxGOtkG4VYuQyRLkWfv6E0f
	 08xqZFIFpGG/ooFECK3Dn2+dc3cU4LLoq4R7werOGc4C48puyZjhJ+Ur5dsAK+dUeQ
	 jJiyMLSJI9LSfWmcfLHjy1phdCzGRHj57rtyAhX9iHe7S7l+WbrbbD3EI0iwmhgsdY
	 s6CGoAEdL+D/fcAQKZLqY5qORekiMaLwoGZaQ8dsIR+5vO9SgWritvRScV5uLKQUyS
	 5TYXgc1lvkXSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Chiu <chui-hao.chiu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	yi-chia.hsieh@mediatek.com,
	Bo.Jiao@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 43/68] wifi: mt76: mt7996: disable AMSDU for non-data frames
Date: Fri, 29 Mar 2024 08:25:39 -0400
Message-ID: <20240329122652.3082296-43-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122652.3082296-1-sashal@kernel.org>
References: <20240329122652.3082296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_052826_351797_3C63AB2B 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

[ Upstream commit 5d5edc09197cd8c705b42a73cdf8ba03db53c033 ]

Disable AMSDU for non-data frames to prevent TX token leak issues.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 53258488d49f3..b5b8b163f94df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -732,6 +732,9 @@ mt7996_mac_write_txwi_8023(struct mt7996_dev *dev, __le32 *txwi,
 	      FIELD_PREP(MT_TXD2_SUB_TYPE, fc_stype);
 
 	txwi[2] |= cpu_to_le32(val);
+
+	if (wcid->amsdu)
+		txwi[3] |= cpu_to_le32(MT_TXD3_HW_AMSDU);
 }
 
 static void
@@ -862,8 +865,6 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 		val |= MT_TXD3_PROTECT_FRAME;
 	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
 		val |= MT_TXD3_NO_ACK;
-	if (wcid->amsdu)
-		val |= MT_TXD3_HW_AMSDU;
 
 	txwi[3] = cpu_to_le32(val);
 	txwi[4] = 0;
-- 
2.43.0


