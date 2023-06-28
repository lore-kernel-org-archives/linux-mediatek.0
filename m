Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8A9EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/GB2Ybn4AH+QkUsnhFIXbSYB/1BRktYCsmkQyeUsUU=; b=QNLyMWe0az2NO2aQTJmeaplBAW
	Xlpq4TWIvGf3w6y5sws8YDGlsrJXKgH5vrN4DUXB6IxICSoVbHr5PvVfCWpmi6BwQBSjNLXtkDQyI
	0VNv4V95FywbhDH/ww4VBpbIi5hVmtMgkJAITFPlBc1jpWSbfVLqLWZ75n6xq6117fTxfrVP7QFVo
	0yxPTOKwHuFgzBiIm6pmL7xDSqQ8S+kTRwNDEEsvaJXwQuj7Vs4dZapaLQ9FJN/ssVFcYfemMCIgo
	vEQ+4qEQFu1AUBcJSmeWbw6R3ytQe+8xW9JXF8ubxwI2yUUj/rpE0GSUWDLdgKalgKLzWvw9WOd5G
	bQpXEuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPIb-00F21I-2x;
	Wed, 28 Jun 2023 07:09:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPIY-00F1zJ-1q
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:09:07 +0000
X-UUID: a8c4c194158211ee83ed1395ce914268-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x/GB2Ybn4AH+QkUsnhFIXbSYB/1BRktYCsmkQyeUsUU=;
	b=TwRFdA1jZKrE30xbst1/kb61RlnE73qqn7I8TzuORbh6FJuZ53QIbJHjMAIyb7IOqfU0wsy86JeG5beMbwY3LAXGyXoqWMW9GwtxlCIGW9uVwn5jhLYk6pzgmhzgn/prBbeZq8nkI+E4qcSu8mxAtsK/6LMyJw9qh2Lb3uUSmks=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:b70fe29a-cd1f-4c84-8b0f-c3e732ca9d9e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.27,REQID:b70fe29a-cd1f-4c84-8b0f-c3e732ca9d9e,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:01c9525,CLOUDID:17774f0d-26a8-467f-b838-f99719a9c083,B
	ulkID:230628150903HBTA91HK,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: a8c4c194158211ee83ed1395ce914268-20230628
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1965236565; Wed, 28 Jun 2023 00:09:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:08:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:08:58 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 08/11] wifi: mt76: mt76_connac3: move lmac queue enumeration in mt76_connac3_mac.h
Date: Wed, 28 Jun 2023 15:07:21 +0800
Message-ID: <02453eb49f241a464cded2781c13053d0a86d64a.1687920269.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1687920269.git.deren.wu@mediatek.com>
References: <cover.1687920269.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_000906_612853_7F28FED6 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

This is a preliminary patch to introduce mt7925 chip support

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac3_mac.h  | 14 ++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index 6663a0b46541..68ca0844cbbf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -4,6 +4,20 @@
 #ifndef __MT76_CONNAC3_MAC_H
 #define __MT76_CONNAC3_MAC_H
 
+enum {
+	MT_CTX0,
+	MT_HIF0 = 0x0,
+
+	MT_LMAC_AC00 = 0x0,
+	MT_LMAC_AC01,
+	MT_LMAC_AC02,
+	MT_LMAC_AC03,
+	MT_LMAC_ALTX0 = 0x10,
+	MT_LMAC_BMC0,
+	MT_LMAC_BCN0,
+	MT_LMAC_PSMP0,
+};
+
 #define MT_CT_PARSE_LEN			72
 #define MT_CT_DMA_BUF_NUM		2
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 726c222e8e1e..7354e5cf8e67 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -254,20 +254,6 @@ enum {
 	__MT_WFDMA_MAX,
 };
 
-enum {
-	MT_CTX0,
-	MT_HIF0 = 0x0,
-
-	MT_LMAC_AC00 = 0x0,
-	MT_LMAC_AC01,
-	MT_LMAC_AC02,
-	MT_LMAC_AC03,
-	MT_LMAC_ALTX0 = 0x10,
-	MT_LMAC_BMC0,
-	MT_LMAC_BCN0,
-	MT_LMAC_PSMP0,
-};
-
 enum {
 	MT_RX_SEL0,
 	MT_RX_SEL1,
-- 
2.18.0


