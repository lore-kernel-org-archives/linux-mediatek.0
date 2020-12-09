Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EC9C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:12:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A14423B98
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A14423B98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ayTIvUpdbLwHAyMmuryV3DVszFsBKti20WHNDCSCN3E=; b=kDLHhazrxjQDaFW5TkMJ4Phlv
	WoNj+0pSGjyan4kSK5rjz0jL0XVKDBW2KVJMjrn/lu+6j6RbJvq+yBDHADJld5wyvO2fk6H0bR89Q
	/YiJVG05Tn9nM53VhkpGX9+WUMHa08wW6m77DWjVqEX+uw1/BsJ/iyw1AmpL3pJ8m16vJiW6Q+Yml
	xsW6LvQPyaQuOHEqhM2v+x4dbjjbz/gpua2cQlVTcv1P1KIFcQoTaA7DadeOeI4wz9WEUZPvU84yt
	fshG4NKIIBpmutsTONGs0ptTeEjM1oprcOZyjQ8IqeqK/b2ffDyMWkE6bBvYgzK5Dn/YiMrrGlf4g
	iTSJzSgEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmua0-0006WG-65; Wed, 09 Dec 2020 08:12:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuZb-0006H9-15; Wed, 09 Dec 2020 08:11:45 +0000
X-UUID: fa3185fc19384fe6bd28139990590249-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4T0AfB2ii6NXiPmQeqh1F+hk+Ytp00t4rkd3OlZjFh4=; 
 b=MOIdVBkRCJ4MtLivNrI4rNKm9TiuLCTQlLOD832CoHPPoClMDF4Yz4T4psUJj/3jKl9SVMTEanSf6JLZPWSaTjKpO/CvUsYTD2S2PgpUo6iiOrsci++dvmZ9S75X2s0WMIdchukbz8minSCTS8vsQ49ol8rNllYu/gNYG++woGM=;
X-UUID: fa3185fc19384fe6bd28139990590249-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1592173458; Wed, 09 Dec 2020 00:11:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:02:53 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:02:51 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:02:51 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 09/27] iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
Date: Wed, 9 Dec 2020 16:00:44 +0800
Message-ID: <20201209080102.26626-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031143_292632_52600037 
X-CRM114-Status: GOOD (  15.85  )
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

MediaTek extend the bit5 in lvl1 and lvl2 descriptor as PA34.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 9 +++++++--
 drivers/iommu/mtk_iommu.c          | 2 +-
 include/linux/io-pgtable.h         | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index e880745ab1e8..4d0aa079470f 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -112,9 +112,10 @@
 #define ARM_V7S_TEX_MASK		0x7
 #define ARM_V7S_ATTR_TEX(val)		(((val) & ARM_V7S_TEX_MASK) << ARM_V7S_TEX_SHIFT)
 
-/* MediaTek extend the two bits for PA 32bit/33bit */
+/* MediaTek extend the bits below for PA 32bit/33bit/34bit */
 #define ARM_V7S_ATTR_MTK_PA_BIT32	BIT(9)
 #define ARM_V7S_ATTR_MTK_PA_BIT33	BIT(4)
+#define ARM_V7S_ATTR_MTK_PA_BIT34	BIT(5)
 
 /* *well, except for TEX on level 2 large pages, of course :( */
 #define ARM_V7S_CONT_PAGE_TEX_SHIFT	6
@@ -194,6 +195,8 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
 		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
 	if (paddr & BIT_ULL(33))
 		pte |= ARM_V7S_ATTR_MTK_PA_BIT33;
+	if (paddr & BIT_ULL(34))
+		pte |= ARM_V7S_ATTR_MTK_PA_BIT34;
 	return pte;
 }
 
@@ -218,6 +221,8 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 		paddr |= BIT_ULL(32);
 	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
 		paddr |= BIT_ULL(33);
+	if (pte & ARM_V7S_ATTR_MTK_PA_BIT34)
+		paddr |= BIT_ULL(34);
 	return paddr;
 }
 
@@ -754,7 +759,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	if (cfg->ias > ARM_V7S_ADDR_BITS)
 		return NULL;
 
-	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
+	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
 		return NULL;
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6451d83753e1..ec3c87d4b172 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -320,7 +320,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = 32,
-		.oas = 34,
+		.oas = 35,
 		.tlb = &mtk_iommu_flush_ops,
 		.iommu_dev = data->dev,
 	};
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 4cde111e425b..1ae0757f4f94 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -77,8 +77,8 @@ struct io_pgtable_cfg {
 	 *	TLB maintenance when mapping as well as when unmapping.
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_MTK_EXT: (ARM v7s format) MediaTek IOMMUs extend
-	 *	to support up to 34 bits PA where the bit32 and bit33 are
-	 *	encoded in the bit9 and bit4 of the PTE respectively.
+	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
+	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
 	 *
 	 * IO_PGTABLE_QUIRK_NON_STRICT: Skip issuing synchronous leaf TLBIs
 	 *	on unmap, for DMA domains using the flush queue mechanism for
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
