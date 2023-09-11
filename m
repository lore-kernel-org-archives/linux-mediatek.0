Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B21EE49A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 01:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpWxbdBjG4DzjaMymktKP3OHsgtAV4RScZ8r6Nj4Evs=; b=3Q7EcuKkDTW8hCyZ6hhDMKIlZd
	oRvCcO2wNSNG2NcSTkof2Q3f7BQWfDdWtu+IROPGnht+D9dIGNsD5Kd7aq0FwQ4ZFeAY9fPpm2o9S
	N33frPT6hgOgPWEM6jSpR6Ct649L8/6jkTKNBHcRSEQRTVpDzTCP8Da4QBL4LcyRoyxcve9J5D41Y
	0BOof07ka3WzCYGg80FkECtvhs0HmINTPJskNccqoHFy9Lv4t3VmpVlCFyXsLEvFVpHF3My2oVfvF
	W+3hTH47pyPDvwjbFvRD/q2l5SyAdPkvdGA2cZA6dUG6Ot2BctWEUVZGlj6ikw9zHt+/7nQwuJrDr
	hwNSW44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVZs-00H33y-23;
	Mon, 11 Sep 2023 01:19:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVZp-00H32x-1Q;
	Mon, 11 Sep 2023 01:18:58 +0000
X-UUID: 2bde8b20504111ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zpWxbdBjG4DzjaMymktKP3OHsgtAV4RScZ8r6Nj4Evs=;
	b=XSkns3G0FR2/AJPi0xSPWVvwZ7jiqlvHzhThJdBAtKEwi5+Opvj/+yHYwaSzJVIitLzeAipmpL6a4hfOm4SwL3PgdHwzyVpz3scA3Qbf4bMynMbl0zbNKE7C7OztMgU9wImAp5Hwrd8vI8MAY8sbheQgJ/QVZW4l1BMww8FhNCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:7f83f730-fcf4-4f88-acd7-5034197a717e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:c989c613-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2bde8b20504111ee9b7791016c24628a-20230910
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 550637418; Sun, 10 Sep 2023 18:18:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 09:18:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 09:18:15 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<anan.sun@mediatek.com>, <yf.wang@mediatek.com>, <mingyuan.ma@mediatek.com>,
	"T . J . Mercier" <tjmercier@google.com>
Subject: [PATCH 2/4] iommu/mediatek: Add irq handle for secure bank
Date: Mon, 11 Sep 2023 09:17:49 +0800
Message-ID: <20230911011751.29906-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911011751.29906-1-yong.wu@mediatek.com>
References: <20230911011751.29906-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.487300-8.000000
X-TMASE-MatchedRID: CrmPfhth5sAe1373YKeGbzo39wOA02LhI2kuSWhUaPVUvqB5o/Lqc2qs
	CKGiHb6RM4ggfKBPXnEfD8YWt0BqVja5NNzGfDJl7/U7JmMpiiHw2EELF/pHwzb9TB28UbkiXOZ
	tmYQXU7jT01A2vEikVgG2ORx9EyapjlL1EhinUT7hG1IOMb7PsDQAp53S718H4G/FgWE3B0wWQo
	lg+d2D28rdT5sfS91szxsUxA3eca555Kivg4hQPnV7tdtvoibauoYFb0nRiqNV3TNCtkugS6PFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4CiM3WUt6LtFD8Bd7h+QFyBmkeDsCfD1DAHgxpsT2kcuWyLG
	sWdglSs+TtFFN0PPlK+STEuTRCUKipUrFgDYq2feWo4xyyASh6RpmdJTNAHDHP4+GiOUtS56/Rg
	9M3zrxAGqr7/5oYKxS7Rtx98AtcQ=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.487300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B3785E9B5E1CB1F3591F845352B769369AAE57118E67637C0935C4CBFBF001752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_181857_483446_A8D8C30F 
X-CRM114-Status: GOOD (  20.57  )
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

The secure bank registers are protected and can only be accessed in
the secure world, thus it won't be initialised in linux. In kernel, we only
need register the irq handle to report which iommu HW the secure
translation fault happen in.

We will enter the ATF to read the detail fault information. If ATF fail or
ATF isn't the debug load, we won't get the fault information, just print
a simple "secure bank fault" log.

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c  | 61 +++++++++++++++++++++++++++-----------
 include/soc/mediatek/smi.h |  1 +
 2 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 4a2cffb28c61..e1faf2339b9a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -465,22 +465,38 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	struct mtk_iommu_data *data = bank->parent_data;
 	struct mtk_iommu_domain *dom = bank->m4u_dom;
 	unsigned int fault_larb = MTK_INVALID_LARBID, fault_port = 0, sub_comm = 0;
-	u32 int_state, regval, va34_32, pa34_32;
 	const struct mtk_iommu_plat_data *plat_data = data->plat_data;
+	u32 int_state = ~0, regval = 0, va34_32, pa34_32;
+	u64 fault_iova = ~0ULL, fault_pa = ~0ULL;
 	void __iomem *base = bank->base;
-	u64 fault_iova, fault_pa;
+	struct arm_smccc_res res;
 	bool layer, write;
 
-	/* Read error info from registers */
-	int_state = readl_relaxed(base + REG_MMU_FAULT_ST1);
-	if (int_state & F_REG_MMU0_FAULT_MASK) {
-		regval = readl_relaxed(base + REG_MMU0_INT_ID);
-		fault_iova = readl_relaxed(base + REG_MMU0_FAULT_VA);
-		fault_pa = readl_relaxed(base + REG_MMU0_INVLD_PA);
+	if (bank->is_secure) {
+		/* Enter to secure world to Read fault status if it is secure bank. */
+		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
+			      IOMMU_ATF_CMD_GET_SECURE_IOMMU_STATUS,
+			      bank->sec_bank_base, 0, 0, 0, 0, 0, &res);
+		if (res.a0 == 0) {
+			fault_iova = res.a1;
+			fault_pa = res.a2;
+			regval = res.a3;
+		} else {
+			dev_err_ratelimited(bank->parent_dev, "secure bank fault\n");
+			goto tlb_flush_all;
+		}
 	} else {
-		regval = readl_relaxed(base + REG_MMU1_INT_ID);
-		fault_iova = readl_relaxed(base + REG_MMU1_FAULT_VA);
-		fault_pa = readl_relaxed(base + REG_MMU1_INVLD_PA);
+		/* Read error info from registers */
+		int_state = readl_relaxed(base + REG_MMU_FAULT_ST1);
+		if (int_state & F_REG_MMU0_FAULT_MASK) {
+			regval = readl_relaxed(base + REG_MMU0_INT_ID);
+			fault_iova = readl_relaxed(base + REG_MMU0_FAULT_VA);
+			fault_pa = readl_relaxed(base + REG_MMU0_INVLD_PA);
+		} else {
+			regval = readl_relaxed(base + REG_MMU1_INT_ID);
+			fault_iova = readl_relaxed(base + REG_MMU1_FAULT_VA);
+			fault_pa = readl_relaxed(base + REG_MMU1_INVLD_PA);
+		}
 	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
@@ -515,16 +531,19 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			bank->parent_dev,
-			"fault type=0x%x iova=0x%llx pa=0x%llx master=0x%x(larb=%d port=%d) layer=%d %s\n",
-			int_state, fault_iova, fault_pa, regval, fault_larb, fault_port,
+			"bank(%u) fault type=0x%x iova=0x%llx pa=0x%llx master=0x%x(larb=%d port=%d) layer=%d %s\n",
+			bank->id, int_state, fault_iova, fault_pa, regval, fault_larb, fault_port,
 			layer, write ? "write" : "read");
 	}
 
 	/* Interrupt clear */
-	regval = readl_relaxed(base + REG_MMU_INT_CONTROL0);
-	regval |= F_INT_CLR_BIT;
-	writel_relaxed(regval, base + REG_MMU_INT_CONTROL0);
+	if (!bank->is_secure) {
+		regval = readl_relaxed(base + REG_MMU_INT_CONTROL0);
+		regval |= F_INT_CLR_BIT;
+		writel_relaxed(regval, base + REG_MMU_INT_CONTROL0);
+	}
 
+tlb_flush_all:
 	mtk_iommu_tlb_flush_all(data);
 
 	return IRQ_HANDLED;
@@ -1333,6 +1352,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		bank->parent_dev = dev;
 		bank->parent_data = data;
 		spin_lock_init(&bank->tlb_lock);
+
+		/* Secure bank is initialised in secure world. Only need register irq here */
+		if (!bank->is_secure)
+			continue;
+		ret = devm_request_irq(bank->parent_dev, bank->irq, mtk_iommu_isr,
+				       0, dev_name(bank->parent_dev), (void *)bank);
+		if (ret)
+			return ret;
 	} while (++i < banks_num);
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)) {
@@ -1426,7 +1453,7 @@ static void mtk_iommu_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	for (i = 0; i < data->plat_data->banks_num; i++) {
 		bank = &data->bank[i];
-		if (!bank->m4u_dom)
+		if (!bank->m4u_dom && !data->bank[i].is_secure)
 			continue;
 		devm_free_irq(&pdev->dev, bank->irq, bank);
 	}
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 000eb1cf68b7..294550240aa6 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -14,6 +14,7 @@
 enum iommu_atf_cmd {
 	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to en/disable iommu */
 	IOMMU_ATF_CMD_CONFIG_INFRA_IOMMU,	/* For infra master to enable iommu */
+	IOMMU_ATF_CMD_GET_SECURE_IOMMU_STATUS,	/* Get secure iommu translation fault status */
 	IOMMU_ATF_CMD_MAX,
 };
 
-- 
2.25.1


