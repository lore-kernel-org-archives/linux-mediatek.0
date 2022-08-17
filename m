Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA2C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KeERtmWUI/I2Cots4qk1QJx9krfvd3PVzU8UOzIE10=; b=a1BHigfEQMeft6Uw2t2WJxwnhd
	eKwQKCacFLrrYIUn9E8dWztI/qfOk7Oddc7NdXaoVQzwqZgRfGyFNqHqLkFe5klhypms7cbpWYFwW
	FPNzkF7r58oQkuq1/vv5HSbwX3pe2FmK1mQlxr5e0XphLD37t0f/kVNEvAO4RX7S76zU3HKNtrRYb
	iAIrgL5QNwwc9sJeh7W0/9qTneGA7y4uUc7XI05BPvfE/8bPvq6Y48+XV1CMVCugg2Wavw7lxv39K
	mQXDeQfLDBfsYHoS3byphdESfJS1spyGIRNZkXsLC7xRhdzmBm5wc8J/c9a6+1MFB2GJCfp6DrKAc
	eYwFn9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOInm-002EjI-I7; Wed, 17 Aug 2022 13:09:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOInb-002EeY-3X; Wed, 17 Aug 2022 13:09:32 +0000
X-UUID: 9e91e384b19c47089483a16cd4cff12c-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7KeERtmWUI/I2Cots4qk1QJx9krfvd3PVzU8UOzIE10=;
	b=ACeI3wTWUAMGW/xPwsNvraoehafrXW+UM+hgF2dYcQGCA87z4sgX7vyBBlf6Z61NpNxAALNcq/OBer4JKjJfmtY3s91WrpjyZe9kfrqYhDUSDDprspTKR56h5YUNR2i49OeroWd/p47uKYutVV5j0eUYRnZa11PiVvHd28QO38E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:47aa8dec-644d-4caf-a661-437581cafd1c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:2509f29c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9e91e384b19c47089483a16cd4cff12c-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1834953496; Wed, 17 Aug 2022 06:09:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 17 Aug 2022 20:48:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 20:48:49 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v5 2/4] memory: mtk-smi: Add return value for configure port function
Date: Wed, 17 Aug 2022 20:46:06 +0800
Message-ID: <20220817124608.10062-3-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817124608.10062-1-chengci.xu@mediatek.com>
References: <20220817124608.10062-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_060931_217283_F0549DA2 
X-CRM114-Status: GOOD (  14.76  )
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

In MT8188, the register to enable/disable IOMMU can only be configured
in secure world by SMC call. We should add a return value for configure
port function for preparation because SMC call may return an error result.

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index d7cb7ead2ac7..7e97406ab4a3 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -127,7 +127,7 @@ struct mtk_smi_common_plat {
 
 struct mtk_smi_larb_gen {
 	int port_in_larb[MTK_LARB_NR_MAX + 1];
-	void (*config_port)(struct device *dev);
+	int				(*config_port)(struct device *dev);
 	unsigned int			larb_direct_to_common_mask;
 	unsigned int			flags_general;
 	const u8			(*ostd)[SMI_LARB_PORT_NR_MAX];
@@ -185,7 +185,7 @@ static const struct component_ops mtk_smi_larb_component_ops = {
 	.unbind = mtk_smi_larb_unbind,
 };
 
-static void mtk_smi_larb_config_port_gen1(struct device *dev)
+static int mtk_smi_larb_config_port_gen1(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
@@ -214,23 +214,26 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
 			common->smi_ao_base
 			+ REG_SMI_SECUR_CON_ADDR(m4u_port_id));
 	}
+	return 0;
 }
 
-static void mtk_smi_larb_config_port_mt8167(struct device *dev)
+static int mtk_smi_larb_config_port_mt8167(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 
 	writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
+	return 0;
 }
 
-static void mtk_smi_larb_config_port_mt8173(struct device *dev)
+static int mtk_smi_larb_config_port_mt8173(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 
 	writel(*larb->mmu, larb->base + MT8173_SMI_LARB_MMU_EN);
+	return 0;
 }
 
-static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
+static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	u32 reg, flags_general = larb->larb_gen->flags_general;
@@ -238,7 +241,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	int i;
 
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
-		return;
+		return 0;
 
 	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_THRT_UPDATE)) {
 		reg = readl_relaxed(larb->base + SMI_LARB_CMD_THRT_CON);
@@ -259,6 +262,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 		reg |= BANK_SEL(larb->bank[i]);
 		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
 	}
+	return 0;
 }
 
 static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
@@ -511,9 +515,7 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 		mtk_smi_larb_sleep_ctrl_disable(larb);
 
 	/* Configure the basic setting for this larb */
-	larb_gen->config_port(dev);
-
-	return 0;
+	return larb_gen->config_port(dev);
 }
 
 static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
-- 
2.25.1


