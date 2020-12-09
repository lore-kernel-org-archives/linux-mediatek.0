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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1664EC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:49:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4622235F7
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4622235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+RglErnlsXG0H2QghacMlCSrQvFGxhIKAZx71Fx6agc=; b=qtKQoM8NpSZhxdZhfoIkX1z5+M
	/8ISQOqcoj0FQ+IsR8bLUrTCL03nU3z92xnHpAjNVB+koiB3y2+LUZAl3LF7W8uKL+c21dQZ8bNGF
	v8QU2n0RsMmkw6LiiOBiK6EAJ/7hFEE/bAKPhGW07k8bUphAZyg4FILFerV+nNpYIk/RJOUVnYGqV
	raheVfxN+Hg11vZIbWc7Nz9wAxRO3NmFPcdQpzhDfhKWzUiqNQpv3IC4MEOvogRxFSpxwdBeaD7m/
	Qz4K7MW8mT6brnQibF1/ZXYIPntLP4Seqe0r1mvc4f+nQuTiRaAwpMpJ0CNDFThCK6xKDj9mbjgIX
	tiCa0z3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmvAI-0006sa-Hk; Wed, 09 Dec 2020 08:49:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvAG-0006rK-1z; Wed, 09 Dec 2020 08:49:37 +0000
X-UUID: 08db65b79dc4448a873338a61c2d52d3-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aIXn1EGDM2VpEgVpUfEbf2EfImlbTvEu+rG9fdSNZqI=; 
 b=U28NEJnmL1U2Opp2nk8RTlbHJQf3dw54iHMVsnzFQaSsNqqUo4VAZrHrhi6Y86VptvhtpXykLWdB6fDVgbNZGisDTmfouvY6sC16pc6SlO+6WrVjRS15MuIxFm9LI2SVA+mSN9t6wRZg1baEazSqvbEh8R25wBx5Re01ClRp//U=;
X-UUID: 08db65b79dc4448a873338a61c2d52d3-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 127778515; Wed, 09 Dec 2020 00:49:32 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:39:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:39:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Dec 2020 16:39:28 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <drinkcat@chromium.org>, <matthias.bgg@gmail.com>, <sboyd@kernel.org>
Subject: [PATCH v2] clk: mediatek: Remove MT8192 unused clock
Date: Wed, 9 Dec 2020 16:39:21 +0800
Message-ID: <20201209083921.879-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_034936_404052_9F8AF7B6 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: weiyi.lu@mediatek.com, srv_heupstream@mediatek.com, erin.lo@mediatek.com,
 Tinghan Shen <tinghan.shen@mediatek.com>, ryan-jh.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, nathan.chung@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Tinghan Shen" <tinghan.shen@mediatek.com>

Remove MT8192 sspm clock

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
v2: resend patch to linux-mediatek because blocked by wrong mail setting.  

This patch depends on series "Mediatek MT8192 clock support"[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=379955 

---
 drivers/clk/mediatek/clk-mt8192.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 673dc60182f5..6983707e4ac9 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -403,15 +403,6 @@ static const char * const atb_parents[] = {
 	"mainpll_d5_d2"
 };
 
-static const char * const sspm_parents[] = {
-	"clk26m",
-	"mainpll_d5_d2",
-	"univpll_d5_d2",
-	"mainpll_d4_d2",
-	"univpll_d4_d2",
-	"mainpll_d6"
-};
-
 static const char * const dpi_parents[] = {
 	"clk26m",
 	"tvdpll_d2",
@@ -792,8 +783,6 @@ static const struct mtk_mux top_mtk_muxes[] = {
 		pwrap_ulposc_parents, 0x090, 0x094, 0x098, 8, 3, 15, 0x008, 2),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_ATB_SEL, "atb_sel",
 		atb_parents, 0x090, 0x094, 0x098, 16, 2, 23, 0x008, 3),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSPM_SEL, "sspm_sel",
-		sspm_parents, 0x090, 0x094, 0x098, 24, 3, 31, 0x008, 4),
 	/* CLK_CFG_9 */
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI_SEL, "dpi_sel",
 		dpi_parents, 0x0a0, 0x0a4, 0x0a8, 0, 3, 7, 0x008, 5),
@@ -1047,9 +1036,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA2(CLK_INFRA_UNIPRO_TICK, "infra_unipro_tick", "clk26m", 12),
 	GATE_INFRA2(CLK_INFRA_UFS_MP_SAP_B, "infra_ufs_mp_sap_b", "clk26m", 13),
 	GATE_INFRA2(CLK_INFRA_MD32_B, "infra_md32_b", "axi_sel", 14),
-	GATE_INFRA2(CLK_INFRA_SSPM, "infra_sspm", "sspm_sel", 15),
 	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist", "axi_sel", 16),
-	GATE_INFRA2(CLK_INFRA_SSPM_BUS_H, "infra_sspm_bus_h", "axi_sel", 17),
 	GATE_INFRA2(CLK_INFRA_I2C5, "infra_i2c5", "i2c_sel", 18),
 	GATE_INFRA2(CLK_INFRA_I2C5_ARBITER, "infra_i2c5_arbiter", "i2c_sel", 19),
 	GATE_INFRA2(CLK_INFRA_I2C5_IMM, "infra_i2c5_imm", "i2c_sel", 20),
@@ -1068,8 +1055,6 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA3(CLK_INFRA_MSDC0_SELF, "infra_msdc0_self", "msdc50_0_sel", 0),
 	GATE_INFRA3(CLK_INFRA_MSDC1_SELF, "infra_msdc1_self", "msdc50_0_sel", 1),
 	GATE_INFRA3(CLK_INFRA_MSDC2_SELF, "infra_msdc2_self", "msdc50_0_sel", 2),
-	GATE_INFRA3(CLK_INFRA_SSPM_26M_SELF, "infra_sspm_26m_self", "clk26m", 3),
-	GATE_INFRA3(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "clk32k", 4),
 	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi", "axi_sel", 5),
 	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6", "i2c_sel", 6),
 	GATE_INFRA3(CLK_INFRA_AP_MSDC0, "infra_ap_msdc0", "msdc50_0_sel", 7),
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
