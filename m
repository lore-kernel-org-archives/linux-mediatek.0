Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB386C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 01:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prYRPyTm4zGUUepD1sORlA/24bua8ojq7IlfZZI2pe8=; b=qZkO3XejpP66w0bEzB3Vkru9fm
	mOOSv3npT9oFbEui50ghErsrRffETwNFR+fgEph3m4LNipgHWJcT4IBIrpAYNfi5+anwA8Senm7+3
	bHJDUWLdLlsCyB/XhJN4UdLh2LwU5PklBOnPa62aUIQV3OJ09VZ11fBJQoj8a44f32qnpM30s3EnR
	6iLpGmd18dHhGPTxaSVRbyFYNIq/gW3avo/Vg3lthJi0s1p9Z2VH5u8sNp5mSLzGRpz4o2AAY6cQH
	qtVY4RYbO9w43xLU+ESWj5/tleW5sUT/EHuc1B1R/T8NiORkhLxSpHyHZLsAXra76qG6c12ZWf8u4
	82FziYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVZE-00H2xg-1n;
	Mon, 11 Sep 2023 01:18:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVZB-00H2wJ-0B;
	Mon, 11 Sep 2023 01:18:18 +0000
X-UUID: 11f8e17e504111ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=prYRPyTm4zGUUepD1sORlA/24bua8ojq7IlfZZI2pe8=;
	b=pt+z4Q7zK2al4TstKDIXKtBhZ1DVZ+e1X49Wb7eRv+r7Gw1/fn9kfsq24z8EQ8Mbd3Z+NIOLlH4nLtc4lOnts78GirfXH5w3ltavMMokB8qTkl+aZLlA7GQflkyxcYwjCDpQaAM+rbdsQPFQ6nT7nOD3diFVB/+C9pdaFwBMTx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a36292f8-e7b7-4e3c-a9aa-cff19b087973,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:4,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:4
X-CID-META: VersionHash:0ad78a4,CLOUDID:ae87c613-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 11f8e17e504111ee9b7791016c24628a-20230910
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1736659605; Sun, 10 Sep 2023 18:18:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 09:18:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 09:18:06 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<anan.sun@mediatek.com>, <yf.wang@mediatek.com>, <mingyuan.ma@mediatek.com>,
	"T . J . Mercier" <tjmercier@google.com>
Subject: [PATCH 1/4] iommu/mediatek: Initialise the secure bank
Date: Mon, 11 Sep 2023 09:17:48 +0800
Message-ID: <20230911011751.29906-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911011751.29906-1-yong.wu@mediatek.com>
References: <20230911011751.29906-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_181817_100319_9C10BFBA 
X-CRM114-Status: GOOD (  16.47  )
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

The lastest IOMMU always have 5 banks, and we always use the last bank
(id:4) for the secure memory address translation. This patch add a new
flag (SECURE_BANK_ENABLE) for this feature.

For the secure bank, its kernel va "base" is not helpful since the
secure bank registers has already been protected and can only be accessed
in the secure world. But we still record its register base, because we need
use it to determine which IOMMU HW the translation fault happen in the
secure world.

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 640275873a27..4a2cffb28c61 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -146,6 +146,7 @@
 #define TF_PORT_TO_ADDR_MT8173		BIT(18)
 #define INT_ID_PORT_WIDTH_6		BIT(19)
 #define CFG_IFA_MASTER_IN_ATF		BIT(20)
+#define SECURE_BANK_ENABLE		BIT(21)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -162,6 +163,8 @@
 #define MTK_IOMMU_GROUP_MAX	8
 #define MTK_IOMMU_BANK_MAX	5
 
+#define MTK_IOMMU_SEC_BANKID	4
+
 enum mtk_iommu_plat {
 	M4U_MT2712,
 	M4U_MT6779,
@@ -240,9 +243,13 @@ struct mtk_iommu_plat_data {
 };
 
 struct mtk_iommu_bank_data {
-	void __iomem			*base;
+	union {
+		void __iomem		*base;
+		phys_addr_t		sec_bank_base;
+	};
 	int				irq;
 	u8				id;
+	bool				is_secure;
 	struct device			*parent_dev;
 	struct mtk_iommu_data		*parent_data;
 	spinlock_t			tlb_lock; /* lock for tlb range flush */
@@ -1309,7 +1316,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			continue;
 		bank = &data->bank[i];
 		bank->id = i;
-		bank->base = base + i * MTK_IOMMU_BANK_SZ;
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, SECURE_BANK_ENABLE) &&
+		    bank->id == MTK_IOMMU_SEC_BANKID) {
+			/* Record the secure bank base to indicate which iommu TF in sec world */
+			bank->sec_bank_base = res->start + i * MTK_IOMMU_BANK_SZ;
+			bank->is_secure = true;
+		} else {
+			bank->base = base + i * MTK_IOMMU_BANK_SZ;
+			bank->is_secure = false;
+		}
 		bank->m4u_dom = NULL;
 
 		bank->irq = platform_get_irq(pdev, i);
-- 
2.25.1


