Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CECFB424
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 02:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lc8ruaBmuClVv6jKY+UwbLVrhQa4kd7YEydWFIokluY=; b=ALGsIqHPUFU1pASoRzQwXCXU9w
	9qgxmoH85xu4GHD88y8tgNduMSotJ8TXnCnKL6K6nnmmfsfR8UOREQMG6q4AsW/vorgACt0NwazX1
	+KJp6b3SNfpI3BqLwZgRGtmrr4iDw31BgMyyNpH39lpD984KXhNKSOzuk8e9vepblSBw3VTRuZqMu
	xzkpEoMhnOIOkO3wac8DOBHAh9xicbYsg2rv2LeD24+aWAnpH9ADHVQlTK1TD68u+ec3lRt4GOaSj
	hDU7oMxm8ylK+4hUJrHaEmYuYHAQNXxEQxG4B2thFmARHwGR0hcgFm86jo624zgMJ8dBfvAVR/jEL
	L8gme76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxdjk-000000016qk-3QYK;
	Mon, 07 Oct 2024 02:44:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxdji-000000016q9-1VSt;
	Mon, 07 Oct 2024 02:44:39 +0000
X-UUID: 1449f630845611efba0aef63c0775dbf-20241006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Lc8ruaBmuClVv6jKY+UwbLVrhQa4kd7YEydWFIokluY=;
	b=E5/7I1yUy4m7LuMUYr5rh6qxn61slqFr0JvOOt9V7EcsUYuBRR8bURTN0yO+4dTmI7FhbYCWRZILPtKSYueHuHtQsWBXLcuhIexEOm1I+8FA0K1kTSnGhyfmExE1SA53MnV9nXzk/3vRx+QpP7HZMmI5e/4Wln2+bJ5EIwHv4PU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:75f6ce3b-246d-4509-8546-08bec7190727,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:6570d840-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1449f630845611efba0aef63c0775dbf-20241006
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 820674476; Sun, 06 Oct 2024 19:44:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 10:44:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 10:44:26 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH] soc: mediatek: pwrap: add pwrap driver for MT8188 SoC
Date: Mon, 7 Oct 2024 10:43:50 +0800
Message-ID: <20241007024350.7878-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.330200-8.000000
X-TMASE-MatchedRID: Lx+z0QQ7WQzMHUInqqZ02m3NvezwBrVmbd6rGhWOAwTvksLyT2rH0flY
	oV6p/cSxEc8OveTE8ifBowxuB9F6wnVkgEm9JWcdFYJUGv4DL3x9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO3x/F0UMEoTu6PVes6PULD+Jqo2WRVUqOu4+0yNOBdx7s/YGhV+CHHtxz43l3L7/1DURw
	1qtj+SMJmLv3skqBS9bX3DR8zNrRF/EKhRRqJkqaMnTJRI0XInfXwUEm1ouDzLDYxFC1/7rn6Gd
	Nk4NWmA
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.330200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 706DD3ECF896AB75FC26799BD8F81C70939B8EC67BB206DDC93097D410ABA4682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_194438_429092_BB9C0C6D 
X-CRM114-Status: GOOD (  11.29  )
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

MT8188 are highly integrated SoC and use PMIC_MT6359 for
power management. This patch adds pwrap master driver to
access PMIC_MT6359.

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9fdc0ef79202..5d3c90e32067 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1087,6 +1087,23 @@ static const int mt8183_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =			0xC28,
 };
 
+static int mt8188_regs[] = {
+	[PWRAP_INIT_DONE2] =            0x0,
+	[PWRAP_STAUPD_CTRL] =           0x4C,
+	[PWRAP_TIMER_EN] =              0x3E4,
+	[PWRAP_INT_EN] =                0x420,
+	[PWRAP_INT_FLG] =               0x428,
+	[PWRAP_INT_CLR] =               0x42C,
+	[PWRAP_INT1_EN] =               0x450,
+	[PWRAP_INT1_FLG] =              0x458,
+	[PWRAP_INT1_CLR] =              0x45C,
+	[PWRAP_WACS2_CMD] =             0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =    0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =    0x894,
+	[PWRAP_WACS2_VLDCLR] =          0x8A4,
+	[PWRAP_WACS2_RDATA] =           0x8A8,
+};
+
 static const int mt8195_regs[] = {
 	[PWRAP_INIT_DONE2] =		0x0,
 	[PWRAP_STAUPD_CTRL] =		0x4C,
@@ -1324,6 +1341,7 @@ enum pwrap_type {
 	PWRAP_MT8173,
 	PWRAP_MT8183,
 	PWRAP_MT8186,
+	PWRAP_MT8188,
 	PWRAP_MT8195,
 	PWRAP_MT8365,
 	PWRAP_MT8516,
@@ -1845,6 +1863,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT6797:
 	case PWRAP_MT8173:
 	case PWRAP_MT8186:
+	case PWRAP_MT8188:
 	case PWRAP_MT8365:
 	case PWRAP_MT8516:
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_EN);
@@ -2393,6 +2412,19 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 	.init_soc_specific = pwrap_mt8183_init_soc_specific,
 };
 
+static struct pmic_wrapper_type pwrap_mt8188 = {
+	.regs = mt8188_regs,
+	.type = PWRAP_MT8188,
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_INT1_EN | PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
@@ -2456,6 +2488,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt8173-pwrap", .data = &pwrap_mt8173 },
 	{ .compatible = "mediatek,mt8183-pwrap", .data = &pwrap_mt8183 },
 	{ .compatible = "mediatek,mt8186-pwrap", .data = &pwrap_mt8186 },
+	{ .compatible = "mediatek,mt8188-pwrap", .data = &pwrap_mt8188 },
 	{ .compatible = "mediatek,mt8195-pwrap", .data = &pwrap_mt8195 },
 	{ .compatible = "mediatek,mt8365-pwrap", .data = &pwrap_mt8365 },
 	{ .compatible = "mediatek,mt8516-pwrap", .data = &pwrap_mt8516 },
-- 
2.45.2


