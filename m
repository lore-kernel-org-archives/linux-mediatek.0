Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAACFA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLEes6JhlpKSfYiTYgnjO3nzfxNcrWSPX/riGgw6u94=; b=aHvExan6tqNudr+sw+gZyemu+M
	xQ3SBGuwcchz8MRfTlySZ7ohK4ljS8q/UmT1CXiIRehyZvUqbGR5vWK10AARTbBLS5wBuqhS83s+Z
	6+0NBjgNIAeWMHOcKw1OVlgLnvS9x2r+a7DUJ7uWhMewGKP8+1fbYfG2kOiUwZlyJfPiamsd+vwJ1
	2eQITIm62K089bJzaLwud8PSH94D8SDooXjRzUzWoeRfwNlVoN+rLUeajK5WYMp9KhcglMG4Zt11n
	F6Hcd3gwK9iFQLaj8Lg9yZnFKIutRDq4mDI7LZRHAnd9pzXCzauHiqMWouw3+A6mzLetZApVA84rk
	2i4tVPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXqI-00D3ZE-A1; Mon, 31 Oct 2022 16:40:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXqG-00D3Xf-0d
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 16:40:53 +0000
X-UUID: 559190f62de8485f952d8eeab6451de1-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mLEes6JhlpKSfYiTYgnjO3nzfxNcrWSPX/riGgw6u94=;
	b=Hqb/JrHVJmZ5EDI8pKcaXFLWbv3n7bq+EHFGmrIiKEl/N38JvnVodufMOhtU9hhwwyDxWclSCRKih3MKLGRjVaF0CUrK3JM2sOHP/6C7BHw1c00D2xJMey5tNud0NqIm4Zanm9VGJLJY3JUVzounrnjP8yLDD7uqLLcu5muncQU=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:635f191b-1bc1-4d23-af8e-9c22ad5e56f9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.12,REQID:635f191b-1bc1-4d23-af8e-9c22ad5e56f9,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:62cd327,CLOUDID:c3a4fcea-84ac-4628-a416-bc50d5503da6,B
	ulkID:221101004015RV5CKTML,BulkQuantity:3,Recheck:0,SF:28|16|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 559190f62de8485f952d8eeab6451de1-20221031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 846122728; Mon, 31 Oct 2022 09:40:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 00:40:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 00:40:12 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 09/10] wifi: mt76: connac: introduce helper for mt7996 chipset
Date: Tue, 1 Nov 2022 00:39:59 +0800
Message-ID: <20221031164000.17063-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221031164000.17063-1-shayne.chen@mediatek.com>
References: <20221031164000.17063-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094052_089559_F8233F18 
X-CRM114-Status: UNSURE (   9.60  )
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

Introduce is_mt7996() helper for new chipset.
This is a preliminary patch to support mt7996 driver.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 0915eb579539..8ba883b03e50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -187,6 +187,11 @@ static inline bool is_mt7986(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7986;
 }
 
+static inline bool is_mt7996(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7990;
+}
+
 static inline bool is_mt7622(struct mt76_dev *dev)
 {
 	if (!IS_ENABLED(CONFIG_MT7622_WMAC))
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 9bba18d24c71..aa8e7f7e9b50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -65,7 +65,8 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 	int cmd;
 
 	if ((!is_connac_v1(dev) && addr == MCU_PATCH_ADDRESS) ||
-	    (is_mt7921(dev) && addr == 0x900000))
+	    (is_mt7921(dev) && addr == 0x900000) ||
+	    (is_mt7996(dev) && addr == 0x900000))
 		cmd = MCU_CMD(PATCH_START_REQ);
 	else
 		cmd = MCU_CMD(TARGET_ADDRESS_LEN_REQ);
-- 
2.25.1


