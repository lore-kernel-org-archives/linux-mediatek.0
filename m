Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE79C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GVzM5l2GS7m5hxXVnuN7dbH8/RAxpC9QEiR0fzxFXVQ=; b=dtqjhhTUmwqSGu3TFpckLMzbyM
	ppQAi/K9jVYWhqjiBrADXIiGxuNVeKq4yTggUGKaJYalg1TJF64wS5rs5e4TxYikAWYKU4Xx7yS/s
	sc8cybSPOP7zYT5J5Jv6lGQEXiuYZXjrDP41L6zragOgnCe88uPFT3KrBN61uurxAJ6RopgVU9a99
	AZ3BQYBdQj8raXDSSJ6OSNIGnwOiPmxU52fdV06ZtGhHjDeC6p0gyugaNg/QyU8LqBUWKck7z9MdW
	rU/eJ09my95OeRFXrzyMsWQ1RVnFpOANwvDFG9rHZXYipCwXfD4MrdPPf0Ro1J1yCsn6xXe7Mgipc
	IYsGE6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyD6d-009FRR-6M; Thu, 24 Nov 2022 14:21:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyD6X-009FN1-Kk
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 14:21:31 +0000
X-UUID: 7369f70d5d7448c6bfd26e8177f15583-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GVzM5l2GS7m5hxXVnuN7dbH8/RAxpC9QEiR0fzxFXVQ=;
	b=eRcA7G33+IRYPmewb775OK8Dg3yDbI62VvEzrTH73zg32BnOV/Siqjx9Or7w2ZJEiNQkePO3JfoL/g+zFYnWt+ictSsVFfMDpHRQQ29hL0lG+q7F1KAG7zUKYWEadfUS/cr9STlOwq6XcQuunPK5eTWz30J6koJGjZRk384xqTo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:2bee5980-4eb9-451c-862e-1ad489271832,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:a526bc2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7369f70d5d7448c6bfd26e8177f15583-20221124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1365618082; Thu, 24 Nov 2022 07:21:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 22:20:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 22:20:47 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: do not send firmware FW_FEATURE_NON_DL region
Date: Thu, 24 Nov 2022 22:20:38 +0800
Message-ID: <9cdf601d03c7e68e0dfe771b03e42badd4b65489.1669297971.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_062129_736634_4B500D4C 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Deren Wu <deren.wu@mediatek.com>

skip invalid section to avoid potential risks

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 96d91238ad8d..5a047e630860 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2906,6 +2906,9 @@ mt76_connac_mcu_send_ram_firmware(struct mt76_dev *dev,
 		len = le32_to_cpu(region->len);
 		addr = le32_to_cpu(region->addr);
 
+		if (region->feature_set & FW_FEATURE_NON_DL)
+			goto next;
+
 		if (region->feature_set & FW_FEATURE_OVERRIDE_ADDR)
 			override = addr;
 
@@ -2922,6 +2925,7 @@ mt76_connac_mcu_send_ram_firmware(struct mt76_dev *dev,
 			return err;
 		}
 
+next:
 		offset += len;
 	}
 
-- 
2.18.0


