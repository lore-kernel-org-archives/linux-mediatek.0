Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A75EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 11:39:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12FD860F4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 11:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12FD860F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaulM/GpkKP11ueKTClHnV1lSlSqkOEHUd8ESX9eKoo=; b=ghb5udCMLFEx3h
	GHxjhDRtyBcVBVHydbx7qTTOh0UYPUQokyhcZbbNZ4xdTtOxcyZwjFRbnP3mHqCWhzJnMiNYdsOY9
	9BiCkK5AwPVApR+qkACO/k3Qml9eu3GYBuqLaqytQPRM9ARpxf9HnWVhdflqK1sPdW2bsQv6L0bNl
	JRw7ZyP22+TllNNS8zlJj0bbbRIiTl0zBOFwlbrCdRUdJwMZtu+9wTw995oWes9ebNCKaXV/daYH3
	EIQWnB++/IqtDfnz9AYnA7SiDwJrAu/yRylOPsA1GCsyBvcEualuW2aTUyn5ZiqiTEBTloUDaJLMM
	eNyhXocMUyCmEmu65gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ6mj-005QSu-L9; Tue, 14 Sep 2021 11:39:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ6mR-005QJL-4E; Tue, 14 Sep 2021 11:39:16 +0000
X-UUID: 0b4bb4821232434fbd372ef551ecaa40-20210914
X-UUID: 0b4bb4821232434fbd372ef551ecaa40-20210914
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2027879238; Tue, 14 Sep 2021 04:39:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 04:39:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 19:39:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 19:39:08 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v4 11/13] memory: mtk-smi: mt8195: Add initial setting for
 smi-common
Date: Tue, 14 Sep 2021 19:37:01 +0800
Message-ID: <20210914113703.31466-12-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914113703.31466-1-yong.wu@mediatek.com>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_043915_218375_D78FB555 
X-CRM114-Status: GOOD (  19.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To improve the performance, add initial setting for smi-common.
some register use some fix setting(suggested from DE).

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 42 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 35853ba980c9..689a45b39a65 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -18,11 +18,19 @@
 #include <dt-bindings/memory/mtk-memory-port.h>
 
 /* SMI COMMON */
+#define SMI_L1LEN			0x100
+
 #define SMI_BUS_SEL			0x220
 #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
 /* All are MMU0 defaultly. Only specialize mmu1 here. */
 #define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
 
+#define SMI_M4U_TH			0x234
+#define SMI_FIFO_TH1			0x238
+#define SMI_FIFO_TH2			0x23c
+#define SMI_DCM				0x300
+#define SMI_DUMMY			0x444
+
 /* SMI LARB */
 
 /* Below are about mmu enable registers, they are different in SoCs */
@@ -59,6 +67,13 @@
 	(_id << 8 | _id << 10 | _id << 12 | _id << 14);	\
 })
 
+#define SMI_COMMON_INIT_REGS_NR		6
+
+struct mtk_smi_reg_pair {
+	unsigned int		offset;
+	u32			value;
+};
+
 enum mtk_smi_type {
 	MTK_SMI_GEN1,
 	MTK_SMI_GEN2,		/* gen2 smi common */
@@ -85,6 +100,8 @@ struct mtk_smi_common_plat {
 	enum mtk_smi_type	type;
 	bool			has_gals;
 	u32			bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
+
+	const struct mtk_smi_reg_pair	*init;
 };
 
 struct mtk_smi_larb_gen {
@@ -419,6 +436,15 @@ static struct platform_driver mtk_smi_larb_driver = {
 	}
 };
 
+static const struct mtk_smi_reg_pair mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
+	{SMI_L1LEN, 0xb},
+	{SMI_M4U_TH, 0xe100e10},
+	{SMI_FIFO_TH1, 0x506090a},
+	{SMI_FIFO_TH2, 0x506090a},
+	{SMI_DCM, 0x4f1},
+	{SMI_DUMMY, 0x1},
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_gen1 = {
 	.type     = MTK_SMI_GEN1,
 };
@@ -453,12 +479,14 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vdo = {
 	.has_gals = true,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
 		    F_MMU1_LARB(7),
+	.init     = mtk_smi_common_mt8195_init,
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vpp = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
+	.init     = mtk_smi_common_mt8195_init,
 };
 
 static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
@@ -551,15 +579,21 @@ static int mtk_smi_common_remove(struct platform_device *pdev)
 static int __maybe_unused mtk_smi_common_resume(struct device *dev)
 {
 	struct mtk_smi *common = dev_get_drvdata(dev);
-	u32 bus_sel = common->plat->bus_sel;
-	int ret;
+	const struct mtk_smi_reg_pair *init = common->plat->init;
+	u32 bus_sel = common->plat->bus_sel; /* default is 0 */
+	int ret, i;
 
 	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
 	if (ret)
 		return ret;
 
-	if (common->plat->type == MTK_SMI_GEN2 && bus_sel)
-		writel(bus_sel, common->base + SMI_BUS_SEL);
+	if (common->plat->type != MTK_SMI_GEN2)
+		return 0;
+
+	for (i = 0; i < SMI_COMMON_INIT_REGS_NR && init && init[i].offset; i++)
+		writel_relaxed(init[i].value, common->base + init[i].offset);
+
+	writel(bus_sel, common->base + SMI_BUS_SEL);
 	return 0;
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
