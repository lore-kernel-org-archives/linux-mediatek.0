Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6545CC48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE3A610C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE3A610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RFHNegkbIM0SFB3+vhWCZSJhYKsDkY5DeNcqC/htKM=; b=ycpansqw3cFBfx
	WcvR7t57svOgYcAzs0UFYh3nAaMj8sbyUrMCVayTP2Yfv0ZHRImZd5eTLFgGPIL/TMfzRUAtDeVOW
	0c2gO79glyho8PQb/4OQCnnPl1YPvJJZ+ST1rljsv9jV3ZFqVjnzeZEhn/AWS76zHp7aKQwaKgHDI
	FK+3RWZEJOCaKBrt9xKrMmVAPUCt5HO2dfp27BUd5Ykz65SCGGzEY0dLkQ1n7U75YZc3LNLMsp3jV
	etr9RQ8iabY7pag7B+UvQE5eFaK/UEs9dPArVfgNctnVAYkWO7SQqa+1tm5rzO6rj5zA5Ypb2+Ngt
	LjBB1uO0LNEMJ/Gp4jng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGXS-0037l2-DJ; Tue, 15 Jun 2021 21:24:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvs-001lHo-06; Tue, 15 Jun 2021 17:33:01 +0000
X-UUID: e734c98b4e0447838be3c89a28938089-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7/VYM//v+eGbB94z3FNop7e7h5m1NYcYd22a1IP7OT8=; 
 b=Fi/9vumuAPQ4fnyzwA+Gv+TRaifPeSxus1WijWTI8GGeY3VsL9M9XsG7Q0N7pp8/zfpFDjLz5UB1NVbC811A9QEozErvhymeXSukrAuk/1tBSH5a3Jm62L2ZYHOwWVtvEPjZDM+O5j6InTpglY9MdLnokElCyDJKEJalOsl8ecg=;
X-UUID: e734c98b4e0447838be3c89a28938089-20210615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471078769; Tue, 15 Jun 2021 10:32:53 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH 19/27] arm64: dts: mt8195: add dp_intf node
Date: Wed, 16 Jun 2021 01:32:25 +0800
Message-ID: <20210615173233.26682-19-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103300_235789_3AFD4FB0 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

From: Jason-JH Lin <jason-jh.lin@mediatek.com>

add dp_intf cnode

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0399aa8cf994..560a0583ca0b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2003,6 +2003,29 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 		};
 
+		dp_intf0: dp_intf0@1c015000 {
+			status = "disabled";
+			compatible = "mediatek,mt8195-dpintf";
+			reg = <0 0x1c015000 0 0x1000>;
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
+				<&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				<&topckgen CLK_TOP_EDP_SEL>,
+				<&topckgen CLK_TOP_TVDPLL1_D2>,
+				<&topckgen CLK_TOP_TVDPLL1_D4>,
+				<&topckgen CLK_TOP_TVDPLL1_D8>,
+				<&topckgen CLK_TOP_TVDPLL1_D16>,
+				<&topckgen CLK_TOP_TVDPLL1>;
+			clock-names = "hf_fmm_ck",
+				      "hf_fdp_ck",
+				      "MUX_DP",
+				      "TVDPLL_D2",
+				      "TVDPLL_D4",
+				      "TVDPLL_D8",
+				      "TVDPLL_D16",
+				      "DPI_CK";
+		};
+
 		smi_common0: smi@1c01b000 {
 			compatible = "mediatek,mt8195-smi-common";
 			mediatek,common-id = <0>;
@@ -2113,6 +2136,14 @@
 			ddc-i2c-bus = <&hdmiddc0>;
 			status = "disabled";
 		};
+
+		edp_tx: edp_tx@1c500000 {
+			status = "disabled";
+			compatible = "mediatek,mt8195-dp_tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
 	};
 
 	hdmiddc0: ddc_i2c {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
