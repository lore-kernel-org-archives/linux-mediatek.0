Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1069DC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:04:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9ED20725
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eiHffHCv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="orjF07Ob"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9ED20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yl7dYW7MOXYU+xQs5PB0Ub2H5jYBeVC7gq+arijffdI=; b=eiHffHCvcw4mxhSPs0dxBm2FQ
	5s80zCYSzJ41AUigw79LwSNSXSR1JxoIuqywwgSK/TPCTBzkYPLlXoA+f0IToMfNUeq+QRMkz2Sm8
	npnlqYDtj1tritQq2Gzo3I+G7rEscdQnb1/UYdnszy/QlVWVOOWbm+7M5I+Cdd0Cga6XlK6SqoaUw
	P1ZeY5e5yulqTsv7TZLIFi+0mhtM53wijh6GFjnZlrVg+jAULuGeKMuDKV/u05nKjTw+qUpHu9yq7
	QogtXDj695ZYerGCx7ClFt37OaHX57bBPPKXxd3gMuMh6yk6F16k17QpxShwx9Gk4uYoPA0445gdY
	loaJW3krw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9YK-0004u4-P3; Sat, 11 Jul 2020 07:04:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9VB-0002lA-Q5; Sat, 11 Jul 2020 07:00:51 +0000
X-UUID: f06266b8e7094879b7bc54759c58060b-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W54Ty6QRMwKDgv6G7is1nGP3+DDMbubqS7XzqnzrYfY=; 
 b=orjF07ObKRb5lBvFBHU3Gpj+pV2lKAbXe2Cz4vUXOKNqdQh4wEh92bs3sroWzguHCcDZsCwPJ5EBmKVDCWN4XmqxWl7tha+FLRZMQCy/H+zvQV3tEjIJYKFsUkLpnClfdy9Bqr7c8Jol5MHH/z7UcM8U5elt3ggUEFTfjHpcSVY=;
X-UUID: f06266b8e7094879b7bc54759c58060b-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 926062983; Fri, 10 Jul 2020 23:00:30 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 23:52:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:52:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:51:59 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 15/21] iommu/mediatek: Support master use iova over 32bit
Date: Sat, 11 Jul 2020 14:48:40 +0800
Message-ID: <20200711064846.16007-16-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200711064846.16007-1-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_030050_058531_F619ACA9 
X-CRM114-Status: GOOD (  16.70  )
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
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After extending v7s, our pagetable already support iova reach
16GB(34bit). the master got the iova via dma_alloc_attrs may reach
34bits, but its HW register still is 32bit. then how to set the
bit32/bit33 iova? this depend on a SMI larb setting(bank_sel).

we separate whole 16GB iova to four banks:
bank: 0: 0~4G; 1: 4~8G; 2: 8-12G; 3: 12-16G;
The bank number is (iova >> 32).

We will preassign which bank the larbs belong to. currently we don't
have a interface for master to adjust its bank number.

Each a bank is a iova_region which is a independent iommu-domain.
the iova range for each iommu-domain can't cross 4G.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c  | 12 +++++++++---
 drivers/memory/mtk-smi.c   |  5 +++++
 include/soc/mediatek/smi.h |  1 +
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index db1f06324ecc..3b2714bea45a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -315,17 +315,23 @@ static void mtk_iommu_config(struct mtk_iommu_data *data,
 			     struct device *dev, bool enable)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
-	unsigned int                 larbid, portid;
+	unsigned int                 larbid, portid, domid;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	const struct mtk_iommu_iova_region *region;
 	int i;
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
 		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
+		domid = MTK_M4U_TO_DOM(fwspec->ids[i]);
+
 		larb_mmu = &data->larb_imu[larbid];
+		region = data->plat_data->iova_region + domid;
+		larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-		dev_dbg(dev, "%s iommu port: %d\n",
-			enable ? "enable" : "disable", portid);
+		dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
+			portid, domid, larb_mmu->bank[portid]);
 
 		if (enable)
 			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index f6516921287f..f2f6100c74ef 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -41,6 +41,8 @@
 /* mt2712 */
 #define SMI_LARB_NONSEC_CON(id)	(0x380 + ((id) * 4))
 #define F_MMU_EN		BIT(0)
+#define BANK_SEL(a)		((((a) & 0x3) << 8) | (((a) & 0x3) << 10) |\
+				 (((a) & 0x3) << 12) | (((a) & 0x3) << 14))
 
 /* SMI COMMON */
 #define SMI_BUS_SEL			0x220
@@ -85,6 +87,7 @@ struct mtk_smi_larb { /* larb: local arbiter */
 	const struct mtk_smi_larb_gen	*larb_gen;
 	int				larbid;
 	u32				*mmu;
+	unsigned char			*bank;
 };
 
 static int mtk_smi_clk_enable(const struct mtk_smi *smi)
@@ -151,6 +154,7 @@ mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
 		if (dev == larb_mmu[i].dev) {
 			larb->larbid = i;
 			larb->mmu = &larb_mmu[i].mmu;
+			larb->bank = larb_mmu[i].bank;
 			return 0;
 		}
 	}
@@ -169,6 +173,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
 		reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
 		reg |= F_MMU_EN;
+		reg |= BANK_SEL(larb->bank[i]);
 		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
 	}
 }
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 9371bf572ab8..4cf445dbbdaa 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -16,6 +16,7 @@
 struct mtk_smi_larb_iommu {
 	struct device *dev;
 	unsigned int   mmu;
+	unsigned char  bank[32];
 };
 
 /*
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
