Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F2FC5517A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 12:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C0A206F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 12:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2Uaw7I4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BpoJvi12"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C0A206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8/ZZNS6GGgvJZWmAxD0f9uouXy2/AZjetlKsQnX6Ixs=; b=I2Uaw7I4F/G0UQk1mUH765NHv
	nvdJdHFAlv/r4NDQOINhhS2CbbEmk9k41T32iCtOCxLsRKpYlmyrYSFM9JW59BlN4LhSBXd5HewHS
	hEMDOxQOrVW1oT4m/pqw+EyGE8eqOfom/6Cc0rT+kiZWj3+uT1UqZFTHn4kdmZzcerySEjMZVUlIc
	2U8GK77gO0YQGqw7LBW0t+avUzyK8qFrupfhUEKA9JVr0dOpTW03SAP/Sm1ngjzEJqAP2u0HJDfA2
	yxqok74WnnYtKDoZPkERAfjNNLbVRYEPv45maFeYGNvueky3rEYR1hDmT58w6bW8cgx2hb2yt1Pr9
	N/YXWQEWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcpcs-0005fS-EQ; Wed, 11 Nov 2020 12:53:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcpb5-0004YN-Mn; Wed, 11 Nov 2020 12:51:37 +0000
X-UUID: 5e45ee7819dc4d4aaadc42221505fb9d-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bOFnYqsj/NHkfioWaBDLYgSkY3imAE4pv20+qUtAlkU=; 
 b=BpoJvi12mqbX8OXZgyxXBj2yP1I2MrtOcFkz6JPzV0YmJs1+Bss68D44z4IB4TEmgdGodnAUMAoKSwVi7qPTMfPYQrREa19Lcl+bSLWSXdrJq1Ot/CshCXMnCxoYYD1JH+Wi+79vgufW8sEOHnuqYILO/aB7AMMb90epEtvkNJE=;
X-UUID: 5e45ee7819dc4d4aaadc42221505fb9d-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1385738167; Wed, 11 Nov 2020 04:51:20 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 04:41:42 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 20:41:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 20:41:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 20/24] iommu/mediatek: Support report iova 34bit
 translation fault in ISR
Date: Wed, 11 Nov 2020 20:38:34 +0800
Message-ID: <20201111123838.15682-21-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201111123838.15682-1-yong.wu@mediatek.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_075135_983152_75656144 
X-CRM114-Status: GOOD (  14.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, Greg Kroah-Hartman <gregkh@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the iova is over 32bit, the fault status register bit is a little
different. Add a flag for the special register bits.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 11af0780e4dd..fdf08e2d9ed5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -89,6 +89,9 @@
 #define F_REG_MMU1_FAULT_MASK			GENMASK(13, 7)
 
 #define REG_MMU0_FAULT_VA			0x13c
+#define F_MMU_INVAL_VA_31_12_MASK		GENMASK(31, 12)
+#define F_MMU_INVAL_VA_34_32_MASK		GENMASK(11, 9)
+#define F_MMU_INVAL_PA_34_32_MASK		GENMASK(8, 6)
 #define F_MMU_FAULT_VA_WRITE_BIT		BIT(1)
 #define F_MMU_FAULT_VA_LAYER_BIT		BIT(0)
 
@@ -113,6 +116,7 @@
 #define HAS_SUB_COMM			BIT(5)
 #define WR_THROT_EN			BIT(6)
 #define HAS_LEGACY_IVRP_PADDR		BIT(7)
+#define IOVA_34_EN			BIT(8)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -263,8 +267,9 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
 	struct mtk_iommu_domain *dom = data->m4u_dom;
-	u32 int_state, regval, fault_iova, fault_pa;
 	unsigned int fault_larb, fault_port, sub_comm = 0;
+	u32 int_state, regval, va34_32, pa34_32;
+	u64 fault_iova, fault_pa;
 	bool layer, write;
 
 	/* Read error info from registers */
@@ -280,6 +285,14 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN)) {
+		va34_32 = FIELD_GET(F_MMU_INVAL_VA_34_32_MASK, fault_iova);
+		pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
+		fault_iova = fault_iova & F_MMU_INVAL_VA_31_12_MASK;
+		fault_iova |=  (u64)va34_32 << 32;
+		fault_pa |= (u64)pa34_32 << 32;
+	}
+
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
 		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
@@ -293,7 +306,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			data->dev,
-			"fault type=0x%x iova=0x%x pa=0x%x larb=%d port=%d layer=%d %s\n",
+			"fault type=0x%x iova=0x%llx pa=0x%llx larb=%d port=%d layer=%d %s\n",
 			int_state, fault_iova, fault_pa, fault_larb, fault_port,
 			layer, write ? "write" : "read");
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
