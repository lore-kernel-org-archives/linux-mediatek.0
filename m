Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD81C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:35:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AEF2224B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AEF2224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sRyYw5G6GTb1SfRLZZUELcuRtfmUubTetZbjux6JP2Q=; b=OAD4ExtJ0vYiTrZSSRgMFUki7
	JdjgUSE5053ZuYlGtqLWXYMF9LYN0ThYS3ourNFKde5pUn/gLPRgeJgYKSgaX+p2X2vXVNKRh1BGy
	sRte2l6+/kLJ3ol5Bgls1NYDU5PGul7U4vncZa67BMDgFcLRmQCserGiFU6tcbvvSkgVCh1fhsS7P
	FJmhXZ5tHQ8NFD13Yei5QyCgKMCENUOkgLPj1OcymaHvAdDi7K2YWqcgCl8ngpi1sbDZ68sDmVKgv
	ZQvVEWJJUj/0J1BK4T21jeZeBXNKxEP8hhxLc7RrGyaeQ7GJJiRPqWJMuMdZbYfsMtZhgmENGblcK
	Qprqqe7HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvTw-0008NO-3t; Mon, 11 Jan 2021 11:35:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvPU-0005FM-7H; Mon, 11 Jan 2021 11:30:59 +0000
X-UUID: d34f610fce554c3c8c95b15ebfe97d3f-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=63KiUiolG+r0wCnstlkegfVu3ISGL25HljSz0xA7i3Q=; 
 b=BkMUgNiPRpHbvXxwjMQEn9aa01sHGtrEQL6l3YsnuzOrh321R9zNkwJSUHL32VWe70XDQhTTo3SgdRjewWpCzd4jhTszL5pPiqpUOUtHZ716PjElJq5S5phsQdE8TgsKcFfwdUAZYrPbxkSlF5Ef32NPNIJs62jm+K/aMI1yNug=;
X-UUID: d34f610fce554c3c8c95b15ebfe97d3f-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1920808020; Mon, 11 Jan 2021 03:30:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:24:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:23:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:23:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 30/33] iommu/mediatek: Support master use iova over 32bit
Date: Mon, 11 Jan 2021 19:19:11 +0800
Message-ID: <20210111111914.22211-31-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063056_490125_24783D6E 
X-CRM114-Status: GOOD (  18.35  )
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
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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
Acked-by: Krzysztof Kozlowski <krzk@kernel.org> #for memory part
---
 drivers/iommu/mtk_iommu.c  | 18 ++++++++++++------
 drivers/memory/mtk-smi.c   |  7 +++++++
 include/soc/mediatek/smi.h |  1 +
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 764dc0b93477..7403a7cb90ea 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -345,21 +345,27 @@ static int mtk_iommu_get_domain_id(struct device *dev,
 	return -EINVAL;
 }
 
-static void mtk_iommu_config(struct mtk_iommu_data *data,
-			     struct device *dev, bool enable)
+static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
+			     bool enable, unsigned int domid)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
 	unsigned int                 larbid, portid;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	const struct mtk_iommu_iova_region *region;
 	int i;
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
 		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
+
 		larb_mmu = &data->larb_imu[larbid];
 
-		dev_dbg(dev, "%s iommu port: %d\n",
-			enable ? "enable" : "disable", portid);
+		region = data->plat_data->iova_region + domid;
+		larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
+
+		dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
+			portid, domid, larb_mmu->bank[portid]);
 
 		if (enable)
 			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
@@ -477,7 +483,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		pm_runtime_put(m4udev);
 	}
 
-	mtk_iommu_config(data, dev, true);
+	mtk_iommu_config(data, dev, true, domid);
 	return 0;
 }
 
@@ -489,7 +495,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
 	if (!data)
 		return;
 
-	mtk_iommu_config(data, dev, false);
+	mtk_iommu_config(data, dev, false, 0);
 }
 
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 89f92fa2afa5..fae61c5fbd70 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -44,6 +44,10 @@
 /* mt2712 */
 #define SMI_LARB_NONSEC_CON(id)	(0x380 + ((id) * 4))
 #define F_MMU_EN		BIT(0)
+#define BANK_SEL(id)		({			\
+	u32 _id = (id) & 0x3;				\
+	(_id << 8 | _id << 10 | _id << 12 | _id << 14);	\
+})
 
 /* SMI COMMON */
 #define SMI_BUS_SEL			0x220
@@ -88,6 +92,7 @@ struct mtk_smi_larb { /* larb: local arbiter */
 	const struct mtk_smi_larb_gen	*larb_gen;
 	int				larbid;
 	u32				*mmu;
+	unsigned char			*bank;
 };
 
 static int mtk_smi_clk_enable(const struct mtk_smi *smi)
@@ -154,6 +159,7 @@ mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
 		if (dev == larb_mmu[i].dev) {
 			larb->larbid = i;
 			larb->mmu = &larb_mmu[i].mmu;
+			larb->bank = larb_mmu[i].bank;
 			return 0;
 		}
 	}
@@ -172,6 +178,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
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
