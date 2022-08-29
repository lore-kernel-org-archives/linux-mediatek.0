Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667A1ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP+DoSEHJ8aCKJInjM1WgQQRX8nSJsLCLFjtbhxzYdk=; b=2Nqj55+Ug9uJDiBNoQYtK7saZ5
	KBKAApKgmvPUhTtJg0HOpsCqEcLIX6R8eJrmOFj4AUL3jkUbLQfYlYhR/RMyshp31EsbQsP8OLGLM
	xOCjJKBIrhq9UHp9fLD4QPv54HBhX/6faYcPx5lnRsTPDo4dQ4F04JbIhMZhQzclNwO0CpQKDNWhj
	gQ82I9vumt/bBk1Ty75OADIxvOghQqOfAjrTpQ/rypGdDTUUQ5uQMhSZddj3P+fHocCMbTJkYwEvU
	lG+aHRkQY7t7e2sWcPfHS4YTXULpL6jlUZwNKrXh7EYTgz1WZbytZemusXUITHzchPUIeiu00L9op
	Vz/0im4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZti-00639K-Gt; Mon, 29 Aug 2022 08:13:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZtJ-0062q7-7H; Mon, 29 Aug 2022 08:13:06 +0000
X-UUID: ccf6cb4f11a44c54b3de035f3a908b4d-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oP+DoSEHJ8aCKJInjM1WgQQRX8nSJsLCLFjtbhxzYdk=;
	b=QyJ5t0glEvNTbv4INSFLEsNO71TjxGzvv2e2XJisRgemTPpByFDbeWlVOLUx5xK2rb/kd0NeXcLQVr5I+o209+92M9OCpkCtssfqs+BdCUIqKGIGu4lL4mlwfxYpxit96giAbBMB0MD2WROA3S29npbSTo91QsADVA/S6SEQ5nA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:24abbcf6-ce19-4169-bbed-2f16100959cf,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:a66be9cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ccf6cb4f11a44c54b3de035f3a908b4d-20220829
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1537210243; Mon, 29 Aug 2022 01:10:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 16:08:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 16:08:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 7/7] phy: phy-mtk-tphy: fix the phy type setting issue
Date: Mon, 29 Aug 2022 16:08:30 +0800
Message-ID: <20220829080830.5378-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_011305_471383_CC29EBED 
X-CRM114-Status: UNSURE (   9.44  )
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

The PHY type is not set if the index is non zero, prepare type
value according to the index, like as mask value.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index e0f227a0d3cc..cc10298bc70d 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -915,7 +915,7 @@ static int phy_type_syscon_get(struct mtk_phy_instance *instance,
 static int phy_type_set(struct mtk_phy_instance *instance)
 {
 	int type;
-	u32 mask;
+	u32 offset;
 
 	if (!instance->type_sw)
 		return 0;
@@ -938,8 +938,9 @@ static int phy_type_set(struct mtk_phy_instance *instance)
 		return 0;
 	}
 
-	mask = RG_PHY_SW_TYPE << (instance->type_sw_index * BITS_PER_BYTE);
-	regmap_update_bits(instance->type_sw, instance->type_sw_reg, mask, type);
+	offset = instance->type_sw_index * BITS_PER_BYTE;
+	regmap_update_bits(instance->type_sw, instance->type_sw_reg,
+			   RG_PHY_SW_TYPE << offset, type << offset);
 
 	return 0;
 }
-- 
2.18.0


