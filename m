Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2082CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F3HImJCHmVaqvOnCxjgMFNvZD+TONuV9hSruXhWSQQ=; b=yj80jSIzxLlubTqRdbJCeqbwkm
	MzYSQ5u0TUlBxD024V/KJHm1um151bGDjpwPaxw4evZk2gbTAQVNoqRnhiqDCVYemZJb0kmYagGw2
	Pli0oLj5yQ6INKrmW0JYMeZ56BclInjq8OvFSn6gcp1znMSDzDMkUqj1Q5uuhqGb4EP/9g0HmBCUU
	FJ682I1yBMUU1VtnTi/2jW2aYsVmeU9q5fmYCKOrgdAfsdPlf0Tzt+2SpojGRjiqWxsHF2EqvNC2y
	nuHnoDv5cRllKR4lAC9eM3fTlQeox5Dt5k92FgKm6sPgvsCSr9jq+aQbzddEt+tbGdxMtCWeOC1ov
	tYy0r+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot40A-004h2m-9Q; Thu, 10 Nov 2022 09:37:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot402-004gvz-4X
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 09:37:31 +0000
X-UUID: afd81f6d1c46414ca1999ee6cf8a75c0-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3F3HImJCHmVaqvOnCxjgMFNvZD+TONuV9hSruXhWSQQ=;
	b=SRfhfE7DHrt8uX2QNiKLo2UOwMXexTmdfkxlRaeNs0ZXEfXYdV2j7nvXOq7tXtRb1iekUTu67x3/Og5sGk5KouG1mVU9LZSGbijVo/yL5Q52ODtsiBiA7WK0qfsDpvz7zRT/216UtqpUJMACFuFdQPI614J2V5iKpcwpWKOJLhQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:3d7b420f-03dd-46b8-9b46-d1518f4e2831,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:1c56e950-b7af-492d-8b40-b1032f90ce11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: afd81f6d1c46414ca1999ee6cf8a75c0-20221110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1642489741; Thu, 10 Nov 2022 02:37:28 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 17:36:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 17:36:51 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v2 5/9] wifi: mt76: connac: introduce unified event table
Date: Thu, 10 Nov 2022 17:35:21 +0800
Message-ID: <20221110093525.29649-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110093525.29649-1-shayne.chen@mediatek.com>
References: <20221110093525.29649-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_013730_229555_63647089 
X-CRM114-Status: UNSURE (   8.63  )
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

Add event IDs and related bit fields for unified event support.
This is a preliminary patch to add mt7996 chipset support.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f8f974f36554..91f2f1d7ca7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -993,6 +993,17 @@ enum {
 	MCU_EXT_EVENT_MURU_CTRL = 0x9f,
 };
 
+/* unified event table */
+enum {
+	MCU_UNI_EVENT_RESULT = 0x01,
+	MCU_UNI_EVENT_FW_LOG_2_HOST = 0x04,
+	MCU_UNI_EVENT_IE_COUNTDOWN = 0x09,
+	MCU_UNI_EVENT_RDD_REPORT = 0x11,
+};
+
+#define MCU_UNI_CMD_EVENT			BIT(1)
+#define MCU_UNI_CMD_UNSOLICITED_EVENT		BIT(2)
+
 enum {
 	MCU_Q_QUERY,
 	MCU_Q_SET,
-- 
2.25.1


