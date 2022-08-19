Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79AC25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tS6CZCBjUbOc1UZ92WKOWil7JFSb8J7Du3g9c10m3yA=; b=G6uNGwMsPODIprxw5O981309tB
	6lw1SDvJKWar36V5p82+DUydMtY/KzQ/cS4CkTKMxm9DwQQRLl4SisMX5tR4J7xJc3GzYUXuVicYp
	aObIyOrg7lBts6lhlmO+a5xp+c29RFEjCqLaYn1jkV/gqkbS3Az8oOEYvV3MfehwkPzj22XQR9PwH
	RGQ1nGD7+TZfI5JaPd2tmzWXJ2jfzuumXDngcFxn+E3ancUqAiu/o4Y+eSLOI9Vi67T9iPNB3gm3x
	CdsSnPvsjAcQGhJSL7cn77MJySZKSWR7KI4uMvLhVHReeP/dViCVZqnwuknaHBcx2PY9TP96UB2AQ
	4yRuNMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy5p-004jn7-UB; Fri, 19 Aug 2022 09:15:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy5B-004j6F-WF; Fri, 19 Aug 2022 09:14:28 +0000
X-UUID: 5ee198a145564574bd1824cb7fd49201-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tS6CZCBjUbOc1UZ92WKOWil7JFSb8J7Du3g9c10m3yA=;
	b=OHIgAhQcj43bNiCvufA3X/m94mgZNyQqu64dP3z3vhl+JWDb/pAyzuPms+BPzNaKP17zoLC6eEojdtyNZIRcWo48h8awiFE9Oqw2QmtdVkUwtXYKbFwyhmaqX3v9r2TanJXk9n12Xzz2HvnPI288Yv6i5HkKDAJPWqAIsp7z6dM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c990414e-d655-4a43-8246-7740f7a48dd5,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:2e7db667-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5ee198a145564574bd1824cb7fd49201-20220819
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1431961805; Fri, 19 Aug 2022 02:14:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 17:13:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 17:13:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 4/7] phy: phy-mtk-tphy: disable hardware efuse when set INTR
Date: Fri, 19 Aug 2022 17:13:41 +0800
Message-ID: <20220819091344.2274-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_021426_106416_79DCB85A 
X-CRM114-Status: UNSURE (   9.58  )
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

INTR's value is able autoload from hardware efuse by default, when
software tries to update its value, should disable hardware efuse
firstly.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 986fde0f63a0..7f40b8b052bd 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -874,9 +874,14 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL,
 				    PA1_RG_TERM_SEL_VAL(instance->eye_term));
 
-	if (instance->intr)
+	if (instance->intr) {
+		if (u2_banks->misc)
+			mtk_phy_set_bits(u2_banks->misc + U3P_MISC_REG1,
+					 MR1_EFUSE_AUTO_LOAD_DIS);
+
 		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
 				    PA1_RG_INTR_CAL_VAL(instance->intr));
+	}
 
 	if (instance->discth)
 		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH,
-- 
2.25.1


