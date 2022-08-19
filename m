Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7167C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzuHN2o0PHCxOlCMC5PyS2eGduyQugC541Kw8Hzkdso=; b=gZYWeRGtDTtz1hzNtyqK2RAYqu
	Q3BpXsJrcLQCSWpyVFSGmMqK2YxFyElUaYNk/fXDBG79ZD6cE7HaGhqhsc1RmYzc1jwxBj5BFIgRU
	6HoAw0ssCNT134LSp5GKnL+E/t1vmUzpxXAEuH1rF7QJ3WxxPlqb9c8pqTM+MPdv8X7hGJRSI4RZC
	qYZQy5SUPggn9CN0qNJiSq3h6v5FdQ7OssX3GC702hjlKp3CdQOQc9KFhB9jAYeaKY4AKnXAcPJdE
	MHe9keHP3OncHft0uH6Z6KQnQQUf0kwA4mdAq3sjgCLa2PDs71wh0D0IBzfTKOeWQV1VBoVomXpl7
	MgBWK2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy6y-004kis-QC; Fri, 19 Aug 2022 09:16:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOy5E-004jAf-2a; Fri, 19 Aug 2022 09:14:30 +0000
X-UUID: 2acc9ba253c94e25b7ed56514df83185-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lzuHN2o0PHCxOlCMC5PyS2eGduyQugC541Kw8Hzkdso=;
	b=K73hn0vIol3GnwNvFZnyAp8pNlOXg0dTG25T919vti/sA0dqT4J8vKdX9i5P40SbmBZuJpoE4Tne02FAzXPmXUwAiR/6Z7Gi4dtcGpGwZdinMKLrF5Qa1GgdEBwFQtFkWnFYkHRkiYDBLDr/KPoI5rjp07TRyQkTFl1t/BNgTH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0728dea7-5ff8-4c55-8bcd-1e3a3a3a7c9f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:e72b33c9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2acc9ba253c94e25b7ed56514df83185-20220819
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1230218345; Fri, 19 Aug 2022 02:14:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 17:13:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 17:13:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 6/7] phy: phy-mtk-tphy: set utmi 0 register in init() ops
Date: Fri, 19 Aug 2022 17:13:43 +0800
Message-ID: <20220819091344.2274-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_021428_204871_37BA9237 
X-CRM114-Status: UNSURE (   9.09  )
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

No need repeat to clear utmi 0 register in ->power_on() and
->power_off(), just do it in ->init()

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 79920c066e59..e0f227a0d3cc 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -522,8 +522,8 @@ static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	/* switch to USB function, and enable usb pll */
 	mtk_phy_clear_bits(com + U3P_U2PHYDTM0, P2C_FORCE_UART_EN | P2C_FORCE_SUSPENDM);
 
-	mtk_phy_update_bits(com + U3P_U2PHYDTM0, P2C_RG_XCVRSEL | P2C_RG_DATAIN,
-			    P2C_RG_XCVRSEL_VAL(1) | P2C_RG_DATAIN_VAL(0));
+	mtk_phy_clear_bits(com + U3P_U2PHYDTM0,
+			   P2C_RG_XCVRSEL | P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
 
 	mtk_phy_clear_bits(com + U3P_U2PHYDTM1, P2C_RG_UART_EN);
 
@@ -565,9 +565,6 @@ static void u2_phy_instance_power_on(struct mtk_tphy *tphy,
 	void __iomem *com = u2_banks->com;
 	u32 index = instance->index;
 
-	mtk_phy_clear_bits(com + U3P_U2PHYDTM0,
-			   P2C_RG_XCVRSEL | P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
-
 	/* OTG Enable */
 	mtk_phy_set_bits(com + U3P_USBPHYACR6, PA6_RG_U2_OTG_VBUSCMP_EN);
 
@@ -590,8 +587,6 @@ static void u2_phy_instance_power_off(struct mtk_tphy *tphy,
 	void __iomem *com = u2_banks->com;
 	u32 index = instance->index;
 
-	mtk_phy_clear_bits(com + U3P_U2PHYDTM0, P2C_RG_XCVRSEL | P2C_RG_DATAIN);
-
 	/* OTG Disable */
 	mtk_phy_clear_bits(com + U3P_USBPHYACR6, PA6_RG_U2_OTG_VBUSCMP_EN);
 
-- 
2.25.1


