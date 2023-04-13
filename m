Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2D4C77B76
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 02:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zeP/p5nU9vWIdWfG/flC84na/JXSM5C24gDd4vSXg8=; b=ny4GziuxVaE5Jl/tul6oL6FVgE
	Pv3DigY8E7YkRAXL74tQ+DBY1md3hcF5QeLhVDtegdXJ9bLq0NYQ2lxnYOmQYlwqkvQ7yZloID0OV
	RcxYwR6QaAJGKs1zlx+XVbuZ6LDmKz0mgHXpsr2gYX9diQFp7L38NfTYujVM4Ui8rGN6aIT0CAKEV
	7XRIJjaKC5/dbkJRLEdTGOFoB+M4LTJAmCSD+smS0WSp6bsvwKjZNxD9E2W31KOb7PXjASMqhIsKn
	ElNnWl4oHlfLcpQSAbEa7dj3ovFU2RJ8q+egIT22CDKtnIxE73eDyWv80s1ugEb060OkkdtNJWCO0
	7jAgKlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmmpA-004pPu-12;
	Thu, 13 Apr 2023 02:36:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmmp5-004pOI-2e;
	Thu, 13 Apr 2023 02:36:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CA3463A8E;
	Thu, 13 Apr 2023 02:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86DBC433D2;
	Thu, 13 Apr 2023 02:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353390;
	bh=hw4xNWiwp8slyxeG+kC8WnPTYTvoQBMrOBS9+9t7ozY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pis44oNAv5R0IgtecOZldo4RyDnyM9VOGMa3C9hBGCDHrxnvnWKvPNPhFgaDiA1QS
	 ClJi3mW3g/rkB3AQB3SXE0FDNEs4CMuix8l0LgiJ+1fT/VaKuHqpEnRl11IMa8kDSf
	 K4MPHbuKg9CtejNv6oXY/0TfbZmbRixwpyFHmjUS9x2Xu/9p1vaFFrwNHy7GxTMzUX
	 PQKM3UTfomXL9CyMgqcJUHT3vMyP3CT0cfwsq3dgAURK+UtI+tgV8WgXFTidWRybJC
	 Xll9cs56BQb3UHg8gdSU9NvXDMu12HqHztDau52jmdeiGwftk0oBggaChy+nXwVbwN
	 g4iagdRZZTMaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	ryder.lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	deren.wu@mediatek.com,
	sean.wang@mediatek.com,
	mingyen.hsieh@mediatek.com,
	yn.chen@mediatek.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.2 11/20] wifi: mt76: mt7921: Fix use-after-free in fw features query.
Date: Wed, 12 Apr 2023 22:35:49 -0400
Message-Id: <20230413023601.74410-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023601.74410-1-sashal@kernel.org>
References: <20230413023601.74410-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_193631_937715_22796BB1 
X-CRM114-Status: GOOD (  12.36  )
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

From: Ben Greear <greearb@candelatech.com>

[ Upstream commit 2ceb76f734e37833824b7fab6af17c999eb48d2b ]

Stop referencing 'features' memory after release_firmware is called.

Fixes this crash:

RIP: 0010:mt7921_check_offload_capability+0x17d
mt7921_pci_probe+0xca/0x4b0
...

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Acked-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://lore.kernel.org/r/51fd8f76494348aa9ecbf0abc471ebe47a983dfd.1679502607.git.lorenzo@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index d4b681d7e1d22..f2c6ec4d8e2ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -162,12 +162,12 @@ mt7921_mac_init_band(struct mt7921_dev *dev, u8 band)
 
 u8 mt7921_check_offload_capability(struct device *dev, const char *fw_wm)
 {
-	struct mt7921_fw_features *features = NULL;
 	const struct mt76_connac2_fw_trailer *hdr;
 	struct mt7921_realease_info *rel_info;
 	const struct firmware *fw;
 	int ret, i, offset = 0;
 	const u8 *data, *end;
+	u8 offload_caps = 0;
 
 	ret = request_firmware(&fw, fw_wm, dev);
 	if (ret)
@@ -199,7 +199,10 @@ u8 mt7921_check_offload_capability(struct device *dev, const char *fw_wm)
 		data += sizeof(*rel_info);
 
 		if (rel_info->tag == MT7921_FW_TAG_FEATURE) {
+			struct mt7921_fw_features *features;
+
 			features = (struct mt7921_fw_features *)data;
+			offload_caps = features->data;
 			break;
 		}
 
@@ -209,7 +212,7 @@ u8 mt7921_check_offload_capability(struct device *dev, const char *fw_wm)
 out:
 	release_firmware(fw);
 
-	return features ? features->data : 0;
+	return offload_caps;
 }
 EXPORT_SYMBOL_GPL(mt7921_check_offload_capability);
 
-- 
2.39.2


