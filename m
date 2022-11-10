Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C40C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4vl3qa4fhi0Y36Lw6eCwpq89PyvRrOhTFx28HTECZU=; b=wmr6vFF1s5oaShr16o2129pI/p
	liwsw1r9Gr61JQ7z0uXZ1OGZ3sPvEWHlof4M1DDgYtnYPEdOMcScZRweJYN7y5EKLASL/1q7m6ueC
	1LPITmZQhH4VJeTUFUJDh6HEwkDRb4ShdBVnN5p7wWtGsZbWHdYRs5Au5JqU6nt8IUg4niHCLk3tC
	G8RGOuXNrs4A28JNCyZTKuIHpqhayIWIelZq7LIH8SfoiuDTh3yHSzy8J+GOETiUWzwNyuZMih1rA
	1y5E3QQslkj/0/3a2MnVB6T98UaJQVWHCHx4Fj0kOBSee2zJhQoS+zgz9nCJOBZIkrMKsDS3OTdSf
	HW7PhlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot405-004gzS-00; Thu, 10 Nov 2022 09:37:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot400-004gt6-3N
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 09:37:29 +0000
X-UUID: c8750f52d39249348db7da3212400fe6-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d4vl3qa4fhi0Y36Lw6eCwpq89PyvRrOhTFx28HTECZU=;
	b=sTUrljkmFyYXr3XyTSg16dtpgXjyo9JqW98iyXh3Zx4A9IRp4npGlzZ3M0PQrYaf0mGqeH5kiiodmDiV5Tb9CoalhGA7W29PbMLvD0+W+HvhuzYNM19aOJ8mNTO0kYvOx16ruWpKkBWVGb+IaEAgbHUpOfdplPU5yV7+qOiCz0Q=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.12,REQID:619fc5f1-6b49-43ec-9afe-ad05c2a2cbeb,IP:0,U
	RL:0,TC:0,Content:26,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
	TION:quarantine,TS:126
X-CID-INFO: VERSION:1.1.12,REQID:619fc5f1-6b49-43ec-9afe-ad05c2a2cbeb,IP:0,URL
	:0,TC:0,Content:26,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:126
X-CID-META: VersionHash:62cd327,CLOUDID:23022d5d-100c-4555-952b-a62c895efded,B
	ulkID:221110173711CLMVD8YH,BulkQuantity:1,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:4,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: c8750f52d39249348db7da3212400fe6-20221110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 394181931; Thu, 10 Nov 2022 02:37:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 10 Nov 2022 17:36:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 17:36:51 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 6/9] wifi: mt76: connac: add more bss info command tags
Date: Thu, 10 Nov 2022 17:35:22 +0800
Message-ID: <20221110093525.29649-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110093525.29649-1-shayne.chen@mediatek.com>
References: <20221110093525.29649-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_013728_160383_136C9ECC 
X-CRM114-Status: UNSURE (   9.13  )
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

Add bss info tags which will be used in new chipset.
This is a preliminary patch to add mt7996 chipset support.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 91f2f1d7ca7e..603bd6a8fa0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1258,14 +1258,23 @@ enum {
 
 enum {
 	UNI_BSS_INFO_BASIC = 0,
+	UNI_BSS_INFO_RA = 1,
 	UNI_BSS_INFO_RLM = 2,
 	UNI_BSS_INFO_BSS_COLOR = 4,
 	UNI_BSS_INFO_HE_BASIC = 5,
 	UNI_BSS_INFO_BCN_CONTENT = 7,
+	UNI_BSS_INFO_BCN_CSA = 8,
+	UNI_BSS_INFO_BCN_BCC = 9,
+	UNI_BSS_INFO_BCN_MBSSID = 10,
+	UNI_BSS_INFO_RATE = 11,
 	UNI_BSS_INFO_QBSS = 15,
+	UNI_BSS_INFO_SEC = 16,
+	UNI_BSS_INFO_TXCMD = 18,
 	UNI_BSS_INFO_UAPSD = 19,
 	UNI_BSS_INFO_PS = 21,
 	UNI_BSS_INFO_BCNFT = 22,
+	UNI_BSS_INFO_OFFLOAD = 25,
+	UNI_BSS_INFO_MLD = 26,
 };
 
 enum {
-- 
2.25.1


