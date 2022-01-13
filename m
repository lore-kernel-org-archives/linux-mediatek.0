Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12909C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuWh0A4IhjAwaxdg7JeX91xMjzsKkHSux+zKP1bUgTQ=; b=g2GDxuvuWzUIEY
	USOThUXw2fQvdDntXJjAYum+C3UxKJOSeevyR/1TeH2WE0XjLE1yPVvdu8AxIJ2IBP1mg9KvxZpnI
	NKfpyPY1yIolQBSUX3CK3dOcSn7L6S9NRSktkdDX7K0VgWDZAYYt6nokLZXOMxmPpBRj7Hql11vfx
	ADJqB9mDZ+rEMeaQ1sbpJkTeIeenaFdMdm1VP5mQp74L9fk+GfsxBBOoLw2w3Fcw9A+TEt52GCZHj
	PJlJHFrqTx2zBStlf7vjwbTtLzEj2CMB+2xwDc8rkV4dcvww/bLXjT4nMz23yii6dODrcvPXexrBz
	BJauHppFxdasUtGv86Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7y6I-005bS2-FS; Thu, 13 Jan 2022 11:17:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7y6F-005bQH-Hs; Thu, 13 Jan 2022 11:17:00 +0000
X-UUID: 09b0a8985789464d814d1feb3bb52f89-20220113
X-UUID: 09b0a8985789464d814d1feb3bb52f89-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 698438049; Thu, 13 Jan 2022 04:16:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 03:11:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 19:11:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 19:11:46 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 6/7] memory: mtk-smi: Add sleep ctrl function
Date: Thu, 13 Jan 2022 19:10:56 +0800
Message-ID: <20220113111057.29918-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220113111057.29918-1-yong.wu@mediatek.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_031659_624096_9792A6DC 
X-CRM114-Status: GOOD (  16.83  )
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

Sleep control means that when the larb goes to sleep, we should wait a bit
until all the current commands are finished. Thus, when the larb runtime
suspends, we need to enable this function to wait until all the existed
commands are finished. When the larb resumes, just disable this function.
This function only improves the safety of bus. Add a new flag for this
function. Prepare for mt8186.

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/memory/mtk-smi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index e7b1a22b12ea..12d15fcc65e2 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -32,6 +33,10 @@
 #define SMI_DUMMY			0x444
 
 /* SMI LARB */
+#define SMI_LARB_SLP_CON                0xc
+#define SLP_PROT_EN                     BIT(0)
+#define SLP_PROT_RDY                    BIT(16)
+
 #define SMI_LARB_CMD_THRT_CON		0x24
 #define SMI_LARB_THRT_RD_NU_LMT_MSK	GENMASK(7, 4)
 #define SMI_LARB_THRT_RD_NU_LMT		(5 << 4)
@@ -81,6 +86,7 @@
 
 #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
 #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
+#define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
 #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
 
 struct mtk_smi_reg_pair {
@@ -371,6 +377,26 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{}
 };
 
+static int mtk_smi_larb_sleep_ctrl_enable(struct mtk_smi_larb *larb)
+{
+	int ret;
+	u32 tmp;
+
+	writel_relaxed(SLP_PROT_EN, larb->base + SMI_LARB_SLP_CON);
+	ret = readl_poll_timeout_atomic(larb->base + SMI_LARB_SLP_CON,
+					tmp, !!(tmp & SLP_PROT_RDY), 10, 1000);
+	if (ret) {
+		/* TODO: Reset this larb if it fails here. */
+		dev_err(larb->smi.dev, "sleep ctrl is not ready(0x%x).\n", tmp);
+	}
+	return ret;
+}
+
+static void mtk_smi_larb_sleep_ctrl_disable(struct mtk_smi_larb *larb)
+{
+	writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
+}
+
 static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
 {
 	struct platform_device *smi_com_pdev;
@@ -483,6 +509,9 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (MTK_SMI_CAPS(larb->larb_gen->flags_general, MTK_SMI_FLAG_SLEEP_CTL))
+		mtk_smi_larb_sleep_ctrl_disable(larb);
+
 	/* Configure the basic setting for this larb */
 	larb_gen->config_port(dev);
 
@@ -492,6 +521,13 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
+	int ret;
+
+	if (MTK_SMI_CAPS(larb->larb_gen->flags_general, MTK_SMI_FLAG_SLEEP_CTL)) {
+		ret = mtk_smi_larb_sleep_ctrl_enable(larb);
+		if (ret)
+			return ret;
+	}
 
 	clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
