Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2F7C46CD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kh4ADFx8DyKsyheb1kxCqsOD8YqzwyrfLZNAEnzeVrQ=; b=kOZEgCwezFtHEH63ZLNxa/tA9C
	DM6RzRcEg+4twfp83PvjZHMsxIENDM+m0WApMB+GKp13nLiNNgGMog3TNSDv+IRNwCbll/9A4Oj73
	kI8kkJji0Zrf1piKa+yqrsTTGWnH+7pm6QfERuSwG9s9xnqFmL1PF546Wf1ChfxrqSV0XUE89xR4A
	o3dgVWO/gfRyJbpLBy4+s9d3vkpwMq/uyFBYFkvEhJGTtKk3Z5yfwYcL5lmNYVWXP0dAx6eUdx97L
	4sfe0+u0FFNBI7I3l1LGiWDBtlrOwokcORFOsJ2qEh2iD/8gy31uWRjwbJPg+lvSkb/JWIJF0A0bn
	KMBh5vOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbIe-005MsY-2O;
	Fri, 22 Dec 2023 08:54:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbIa-005Mr4-1P
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Dec 2023 08:54:29 +0000
X-UUID: b410d1f4a0a711ee9b09ad09c76753c8-20231222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Kh4ADFx8DyKsyheb1kxCqsOD8YqzwyrfLZNAEnzeVrQ=;
	b=cTRK7JC/TP6OE7KU4eFbkC5NoeZMhDAlJfw0e+5K68kp8GQslLlrj2d56lkZ5R3BE1+/gARSJ8cvMvMZHZR0c/QAcOLIrJiJFB4Nf12l8S2oPYN1RPDJ+cSvf7ubI+972A4pmXrfGjL46A52BnAXPf74TYbTnYNfbFOXJ+mZYVA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:07a1523b-264f-4b76-90d0-0d47c5f2ca48,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:b24c8f7e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b410d1f4a0a711ee9b09ad09c76753c8-20231222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1111788868; Fri, 22 Dec 2023 01:54:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 16:53:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 16:53:46 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH v1 3/4] wifi: mt76: mt792x: update the country list of EU for ACPI SAR
Date: Fri, 22 Dec 2023 16:53:37 +0800
Message-ID: <20231222085338.4530-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231222085338.4530-1-mingyen.hsieh@mediatek.com>
References: <20231222085338.4530-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.860300-8.000000
X-TMASE-MatchedRID: VZuxIYcieyyaOlY3WxOn56+dYEguu4aVQl/FdRYkUZKcbyawsiRjd6PF
	jJEFr+olwXCBO/GKkVr3FLeZXNZS4IzHo47z5Aa+cwtUq/gdOcbwxZn5SZV9DgKZS1JL1tAkTk1
	GBFvYVW1Yrf8u8Zq9GO0beEAOU2XCcmRZviJrho/obQWp6Rpd/QcKyX9nDkfBeZUpm6wun3ba/0
	6NhYDa4wyzCDjlUx89p2y3mIB+it9WXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.860300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 937F82216C4683102AF37373C5463ED00BFE8F9F487D4C97ACC41EE3825D52712000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_005428_473564_88CC5653 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

This patch updates the EU country list to ensure the MTCL table
works correctly.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 8fee3d481df0..571ef03cd4cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -376,7 +376,7 @@ u8 mt792x_acpi_get_mtcl_conf(struct mt792x_phy *phy, char *alpha2)
 		"AT", "BE", "BG", "CY", "CZ", "HR", "DK", "EE",
 		"FI", "FR", "DE", "GR", "HU", "IS", "IE", "IT",
 		"LV", "LI", "LT", "LU", "MT", "NL", "NO", "PL",
-		"PT", "RO", "MT", "SK", "SI", "ES", "CH",
+		"PT", "RO", "SK", "SI", "ES", "SE", "CH",
 	};
 	struct mt792x_acpi_sar *sar = phy->acpisar;
 	struct mt792x_asar_cl *cl;
-- 
2.18.0


