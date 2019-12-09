Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39685C43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 06:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8C82071E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 06:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t/77/i0q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Kqs26/S2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8C82071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ePm/pjreXVW/BSLY9O0eQfhOXB9aLCtLRE8/YqtEZM=; b=t/77/i0qR7XxNj
	lOcq7fogOCvu9mabrmgXMyEa94Nw2K4Y2lWbJG4ysTHFdvjD1xGV30poPZA2AB/YTi629+sxDnwWF
	kIEJ1j8fOED4TKQZdYBt9lSs37joGgvdPdfnTSi8z+g1dPYEdG6nDa5JF2AY3CF2YZL/ez+3vuFnJ
	C8/0+bk8m+AVkfA5JFu33nZ4z3VbAwo1ggdzLRBRTcf6n1UeDIFriozylH+pJBBokFSHROmVviCme
	iCOIgxA9tNyDgcJTHUlgETMqv7juruRDG3wb1WHMC42Ae8BZJURdfukaH+K2dlST+R6XMR9li+PQ3
	OXcGzGi0nQdwwRaNq3tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieCQG-0006ox-FY; Mon, 09 Dec 2019 06:21:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieCPI-0005mO-6k; Mon, 09 Dec 2019 06:20:33 +0000
X-UUID: 0428bb2a521e421988184e1ce1bf4b57-20191208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6pnAEXppwPsfEuWmBO+hjzZloVYOsMlRf98OdzXB3O0=; 
 b=Kqs26/S2cj8qf9V2Xzk8KyyyM5qTty+sWsLJLYqpQDdZL7+lhMTyzQ6vBUDrweSE9a4I6tkwBctFTyuE7JXwo8SuwyTKd9mU+eS13H622x4oZJjBjMdO1EDsR8qYqhm1lQX+Xf6OW4hhkt35bVWOmMspqs/0wu4DIj4Qq52GqX0=;
X-UUID: 0428bb2a521e421988184e1ce1bf4b57-20191208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ming-fan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1663079450; Sun, 08 Dec 2019 22:20:21 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 22:20:35 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 14:20:12 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 9 Dec 2019 14:20:11 +0800
From: Ming-Fan Chen <ming-fan.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] memory: mtk-smi: Add bandwidth initial golden setting
 for MT6779
Date: Mon, 9 Dec 2019 14:19:31 +0800
Message-ID: <1575872371-671-4-git-send-email-ming-fan.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1575872371-671-1-git-send-email-ming-fan.chen@mediatek.com>
References: <1575872371-671-1-git-send-email-ming-fan.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_222032_267908_7BB83F2F 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: devicetree@vger.kernel.org, Joerg
 Roedel <jroedel@suse.de>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>, Ming-Fan
 Chen <ming-fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SMI bandwidth initial golden setting for MT6779 make sure
better performance of memory control for multimedia modules.

Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
---
 drivers/memory/mtk-smi.c |  143 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 439d7d8..6b18b71 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -41,21 +41,49 @@
 #define SMI_LARB_NONSEC_CON(id)	(0x380 + ((id) * 4))
 #define F_MMU_EN		BIT(0)
 
+#define SMI_LARB_CMD_THRT_CON	 0x24
+#define SMI_LARB_SW_FLAG	 0x40
+#define SMI_LARB_OSTDL_PORT	 0x200
+#define SMI_LARB_OSTDL_PORTx(id) (SMI_LARB_OSTDL_PORT + (((id) & 0x1f) << 2))
+
 /* SMI COMMON */
+#define SMI_L1LEN			0x100
+#define SMI_L1ARB0			0x104
+#define SMI_L1ARB(id)			(SMI_L1ARB0 + (((id) & 0x7) << 2))
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
+#define SMI_LARB_PORT_NR_MAX		32
+#define SMI_LARB_MISC_NR		2
+#define SMI_COMMON_MISC_NR		6
+
 enum mtk_smi_gen {
 	MTK_SMI_GEN1,
 	MTK_SMI_GEN2
 };
 
+struct mtk_smi_reg_pair {
+	u16	offset;
+	u32	value;
+};
+
 struct mtk_smi_common_plat {
 	enum mtk_smi_gen gen;
 	bool             has_gals;
 	u32              bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
+	bool                          has_bwc;
+	u8                            larb_nr;
+	const u16                     *l1arb;
+	const struct mtk_smi_reg_pair *misc;
 };
 
 struct mtk_smi_larb_gen {
@@ -63,6 +91,9 @@ struct mtk_smi_larb_gen {
 	void (*config_port)(struct device *);
 	unsigned int			larb_direct_to_common_mask;
 	bool				has_gals;
+	bool				has_bwc;
+	const u8			(*ostdl)[SMI_LARB_PORT_NR_MAX];
+	const struct mtk_smi_reg_pair	(*misc)[SMI_LARB_MISC_NR];
 };
 
 struct mtk_smi {
@@ -161,6 +192,8 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	u32 reg;
 	int i;
+	const u8 *ostdl;
+	const struct mtk_smi_reg_pair *misc;
 
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
 		return;
@@ -170,6 +203,20 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 		reg |= F_MMU_EN;
 		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
 	}
+
+	if (!larb->larb_gen->has_bwc)
+		return;
+
+	for (i = 0, ostdl = larb->larb_gen->ostdl[larb->larbid];
+		i < SMI_LARB_PORT_NR_MAX; i++)
+		writel_relaxed(ostdl[i],
+			       larb->base + SMI_LARB_OSTDL_PORTx(i));
+
+	for (i = 0, misc = larb->larb_gen->misc[larb->larbid];
+		i < SMI_LARB_MISC_NR; i++)
+		writel_relaxed(misc[i].value,
+			       larb->base + misc[i].offset);
+	wmb(); /* make sure settings are written */
 }
 
 static void mtk_smi_larb_config_port_mt8173(struct device *dev)
@@ -239,6 +286,55 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
 	.larb_direct_to_common_mask = BIT(8) | BIT(9),      /* bdpsys */
 };
 
+static const u8 mtk_smi_larb_mt6779_ostdl[][SMI_LARB_PORT_NR_MAX] = {
+	{0x28, 0x28, 0x01, 0x28, 0x01, 0x01, 0x0a, 0x0a, 0x28,},
+	{0x28, 0x01, 0x28, 0x28, 0x0a, 0x01, 0x01, 0x0d, 0x0d, 0x07,
+	 0x01, 0x07, 0x01, 0x28,},
+	{0x18, 0x01, 0x08, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02,
+	 0x01, 0x01},
+	{0x01, 0x03, 0x02, 0x01, 0x01, 0x01, 0x01, 0x04, 0x02, 0x01,
+	 0x04, 0x01, 0x01, 0x01, 0x01, 0x04, 0x0b, 0x13, 0x14,},
+	{},
+	{0x13, 0x0f, 0x0d, 0x07, 0x07, 0x04, 0x03, 0x01, 0x03, 0x01,
+	 0x05, 0x0c, 0x01, 0x01, 0x08, 0x06, 0x02, 0x01, 0x08, 0x08,
+	 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,},
+	{0x01, 0x01, 0x01,},
+	{0x01, 0x01, 0x01, 0x01,},
+	{0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,},
+	{0x1f, 0x1a, 0x02, 0x04, 0x1f, 0x02, 0x14, 0x01, 0x1f, 0x04,
+	 0x04, 0x01, 0x01, 0x01, 0x02, 0x02, 0x04, 0x02, 0x01, 0x02,
+	 0x04, 0x02, 0x02, 0x01,},
+	{0x1f, 0x1a, 0x02, 0x04, 0x1f, 0x02, 0x14, 0x01, 0x1f, 0x1a,
+	 0x02, 0x04, 0x1f, 0x02, 0x14, 0x01, 0x01, 0x02, 0x02, 0x04,
+	 0x02, 0x0a, 0x02, 0x02, 0x04, 0x02, 0x0a, 0x02, 0x04, 0x02, 0x04,},
+	{0x01, 0x01, 0x01, 0x01, 0x01,},
+};
+
+static const struct mtk_smi_reg_pair
+mtk_smi_larb_mt6779_misc[][SMI_LARB_MISC_NR] = {
+	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{},
+	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
+	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
+};
+
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
+	.config_port  = mtk_smi_larb_config_port_gen2_general,
+	.larb_direct_to_common_mask =
+		BIT(4) | BIT(6) | BIT(11) | BIT(12) | BIT(13),
+		/* DUMMY | IPU0 | IPU1 | CCU | MDLA */
+	.has_bwc = true,
+	.ostdl   = mtk_smi_larb_mt6779_ostdl,
+	.misc    = mtk_smi_larb_mt6779_misc,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 	.has_gals                   = true,
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
@@ -260,6 +356,10 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
 		.data = &mtk_smi_larb_mt2712
 	},
 	{
+		.compatible = "mediatek,mt6779-smi-larb",
+		.data = &mtk_smi_larb_mt6779
+	},
+	{
 		.compatible = "mediatek,mt8183-smi-larb",
 		.data = &mtk_smi_larb_mt8183
 	},
@@ -386,6 +486,31 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
 	.gen = MTK_SMI_GEN2,
 };
 
+static const u16 mtk_smi_common_mt6779_l1arb[] = {
+	0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000,
+};
+
+static const struct
+mtk_smi_reg_pair mtk_smi_common_mt6779_misc[SMI_COMMON_MISC_NR] = {
+	{SMI_L1LEN, 0xb},
+	{SMI_M4U_TH, 0xe100e10},
+	{SMI_FIFO_TH1, 0x506090a},
+	{SMI_FIFO_TH2, 0x506090a},
+	{SMI_DCM, 0x4f1},
+	{SMI_DUMMY, 0x1},
+};
+
+static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
+	.gen		= MTK_SMI_GEN2,
+	.has_gals	= true,
+	.bus_sel	= F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
+			  F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
+	.has_bwc	= true,
+	.larb_nr	= ARRAY_SIZE(mtk_smi_common_mt6779_l1arb),
+	.l1arb		= mtk_smi_common_mt6779_l1arb,
+	.misc		= mtk_smi_common_mt6779_misc,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
 	.gen      = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -407,6 +532,10 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
 		.data = &mtk_smi_common_gen2,
 	},
 	{
+		.compatible = "mediatek,mt6779-smi-common",
+		.data = &mtk_smi_common_mt6779,
+	},
+	{
 		.compatible = "mediatek,mt8183-smi-common",
 		.data = &mtk_smi_common_mt8183,
 	},
@@ -484,7 +613,7 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
 {
 	struct mtk_smi *common = dev_get_drvdata(dev);
 	u32 bus_sel = common->plat->bus_sel;
-	int ret;
+	int i, ret;
 
 	ret = mtk_smi_clk_enable(common);
 	if (ret) {
@@ -494,6 +623,18 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
 
 	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
 		writel(bus_sel, common->base + SMI_BUS_SEL);
+
+	if (!common->plat->has_bwc)
+		return 0;
+
+	for (i = 0; i < common->plat->larb_nr; i++)
+		writel_relaxed(common->plat->l1arb[i],
+			       common->base + SMI_L1ARB(i));
+
+	for (i = 0; i < SMI_COMMON_MISC_NR; i++)
+		writel_relaxed(common->plat->misc[i].value,
+			       common->base + common->plat->misc[i].value);
+	wmb(); /* make sure settings are written */
 	return 0;
 }
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
