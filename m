Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314C5C61DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 06:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KslAqbfwU+k2/vbq1uOcdO7x5mENJ6NXxXaQYLYI9Jg=; b=XoYV7xh71W8/ZxvOqOc1rKYLFX
	uCxjzfbV9SP0MUqld3h6KEqffn7ZE9V3meEUF8KimO5oFcrk8/vPkVWNW0wRRJKDvX4oqsV1+s7Is
	kmqOfEW6JGvb+i6qnMJRGXCvEbTFlW56BrZdNkceRqV9hL/wmiTauAy5ZbPRuhNC3iRY58uLKp/qf
	H9oBdRCuNtUS7Nfvzp9CE4ZY/fBSOGiWv9ywO4wu8pwIxUylz/q0j+svYJqbDjTsI5pj/DuLcL1rB
	EBt+bN0XJxQdS8QM9XBZ92CnJKLnj/4LPLX1O2HaAiLWZmDowB4njQm+lGEfUH1VOLNa0VPzk7frS
	w80K6qFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vsL-00000008ehN-0AUZ;
	Mon, 31 Aug 2026 06:52:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vsJ-00000008eg5-2aI7;
	Mon, 31 Aug 2026 06:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BAAC43CB5;
	Mon, 31 Aug 2026 06:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10165C2BCFD;
	Mon, 31 Aug 2026 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788159131;
	bh=30XfblXiQ8Zqhfg1HJUgZ1c2zN58moikfo/u9eBO1FI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M/Pl7RtPbHpXUUK5i7a9rNvCUfqayp8/XgWPPCrXIqF1KqVdLOAU9rhYU2dW1ohP0
	 Kw9eLdevtQ2Qze0s+Ejcezu8vD2RvBRe99ysuuxeXtjqBETaIfcP2TW/W7yBqzlAj+
	 /3YKc9grU2mzx2w7XpR8fuJzWPh6nuAtv98j+97WaUTSzyvt8bUyhDZHvVHr1slfzQ
	 6x9+IG7H8yK5RK2nqLX6fPwfr3a12ZWOoX1tFjyWR1ehD5LZBxybljoFs3aEltXR7v
	 EF9blPVNs1PHXqiCX2lbzq8NHTgUgjL5rVuSIeGcZKyppMn8cVq09quRncoQTPqS1G
	 udvMopzZqhFGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E526BC624C2;
	Mon, 31 Aug 2026 06:52:10 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Mon, 31 Aug 2026 14:52:07 +0800
Subject: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
In-Reply-To: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Congcong Yao <congcong.yao@mediatek.com>, 
 Zhengnan Chen <zhengnan.chen@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788159129; l=4600;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=7az4Dgk3CXFVdlAoxr6OTNIBaBixjBIVkNdiyT0OpGA=;
 b=7LVFR45UNQ9UzEL7SqZVZ0eq6zimK7axUTNrz6xTswY9mxWDD6vec7IEIXQuqUyUJKMBnXMWH
 wLzJoC+nF49ACS+Bkzrja75h1kmEDkK6BwbYGc6Si6MxD80YvXPmV2C
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
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
Reply-To: congcong.yao@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zhengnan Chen <zhengnan.chen@mediatek.com>

Add the MT8189 SMI common, sub-common and LARB platform data.

Enable the GALS clock for the MT8189 SMI sub-common.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
---
 drivers/memory/mtk-smi.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index aaeba8ab211e..8c4606cbd73d 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -401,6 +401,30 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[25] = {0x01},
 };
 
+static const u8 mtk_smi_larb_mt8189_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10,},
+	[1] = {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10,},
+	[2] = {0x7, 0x7, 0x4, 0x4, 0x1, 0x1, 0x2, 0x2, 0x7, 0x7,},
+	[4] = {0x2f, 0x1e, 0x9, 0x1, 0x1, 0x1, 0x1, 0x2, 0x2, 0x5, 0x1, 0x17,},
+	[7] = {0x20, 0x2, 0x1, 0x1, 0x1, 0x4, 0x2, 0x1, 0x1, 0x2, 0x3, 0x2,
+	       0xa, 0xf, 0x4, 0x6, 0x5, 0x1,},
+	[9] = {0x6, 0x3, 0xc, 0x6, 0x1, 0x4, 0x3, 0x1, 0x2, 0x4, 0x5, 0x2,
+	       0x4, 0x2, 0x3, 0xb, 0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1,},
+	[11] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1, 0x1, 0xb, 0x1, 0x4, 0x6, 0x5, 0x6, 0x1, 0x5, 0x2,
+		0x9, 0x5,},
+	[13] = {0x2, 0x8, 0x8, 0x8, 0x4, 0x4, 0x4, 0x4, 0x4, 0xe, 0x4, 0x1,
+		0x6, 0x6, 0x2,},
+	[14] = {0x1, 0x1, 0x1, 0x20, 0xe, 0x4, 0x8, 0x8, 0x6, 0x4,},
+	[16] = {0x1e, 0xc, 0x2, 0x8, 0xe, 0x2, 0x1e, 0x10, 0x4, 0x2, 0x2, 0x2,
+		0x2, 0x2, 0x4, 0x2, 0x4,},
+	[17] = {0x1e, 0xc, 0x2, 0x8, 0xe, 0x2, 0x1e, 0x10, 0x4, 0x2, 0x2, 0x2,
+		0x2, 0x2, 0x4, 0x2, 0x4,},
+	[19] = {0x2, 0x1, 0x3, 0x1,},
+	[20] = {0x7, 0x7, 0x3, 0x3, 0x1, 0x1,},
+};
+
 static const u8 mtk_smi_larb_mt8192_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x2, 0x2, 0x28, 0xa, 0xc, 0x28,},
 	[1] = {0x2, 0x2, 0x18, 0x18, 0x18, 0xa, 0xc, 0x28,},
@@ -533,6 +557,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
 	.ostd		            = mtk_smi_larb_mt8188_ostd,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8189 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
+	.ostd		            = mtk_smi_larb_mt8189_ostd,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.ostd			    = mtk_smi_larb_mt8192_ostd,
@@ -556,6 +587,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8186-smi-larb", .data = &mtk_smi_larb_mt8186},
 	{.compatible = "mediatek,mt8188-smi-larb", .data = &mtk_smi_larb_mt8188},
+	{.compatible = "mediatek,mt8189-smi-larb", .data = &mtk_smi_larb_mt8189},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
@@ -808,6 +840,17 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vpp = {
 	.init     = mtk_smi_common_mt8195_init,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8189 = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8189 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+	.has_gals = true,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -852,6 +895,8 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8186-smi-common", .data = &mtk_smi_common_mt8186},
 	{.compatible = "mediatek,mt8188-smi-common-vdo", .data = &mtk_smi_common_mt8188_vdo},
 	{.compatible = "mediatek,mt8188-smi-common-vpp", .data = &mtk_smi_common_mt8188_vpp},
+	{.compatible = "mediatek,mt8189-smi-common",     .data = &mtk_smi_common_mt8189},
+	{.compatible = "mediatek,mt8189-smi-sub-common", .data = &mtk_smi_sub_common_mt8189},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},

-- 
2.43.0



