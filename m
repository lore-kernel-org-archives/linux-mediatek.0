Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6E6C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 01:28:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5A564FA9
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 01:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5A564FA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5XgoFIhpOU6nmQgQnrGuvLScCyuMTuRyVGT68R0X6II=; b=Wko18IIa9Mf7LO2S0XyZEAUjb
	l3jQ1Pkgafk9VBrVnJOLGLOORPzRww98+zJFMbeJk5G6ONUCwkhI+SrY4f/fTE8hajhOxyFt9pW6u
	X68ZVm8XNqyu+PvAPvsxis3Xh08pFO314pK5W/fTI1dZWmDcpQHy12An5MMMMQcchBBJUGeTWeZzI
	qij2eL0Zevs4S+NfkC9LC6DLl1GOIsOplMw62AyyxLc4ddR/mfjzeXPYjlTJMpeMPyVqvNidiW4sV
	os1OvJVYgRBm01ciRq9eE4b6Dw20mqXCxTwkPuHwiKj2wHe9Z33lfK8bOW9KBfRk6kX7gDI6RrNyo
	pktFfjppw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7pvI-0003yy-1I; Fri, 05 Feb 2021 01:28:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7pv6-0003vk-En; Fri, 05 Feb 2021 01:28:26 +0000
X-UUID: af2dc2cc9bb84eb8801b02da66555bdd-20210204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W55BH/3nMJtW97cIER2LS14OeEZU3uHarsnzUJa4kg4=; 
 b=rCO0PQxRhx5Fp7w75KhTZzX+Cu9YYKPUstVyBj4p45PariIuKjmfOY5n1rP2uIItPYmTmbQ/ueaQtmhmJpMZ7uE2rTHtqJWDX87v8/KxZ3m7RmDY+0Vjl70/K//jwWRCLkXZ1OEBNOE57fpU5Wobu/f0X372hx8Mw4AvDnu9TxE=;
X-UUID: af2dc2cc9bb84eb8801b02da66555bdd-20210204
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 841960069; Thu, 04 Feb 2021 17:28:17 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 17:28:16 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 09:28:14 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Feb 2021 09:28:15 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <drinkcat@chromium.org>, Argus Lin
 <argus.lin@mediatek.com>
Subject: [PATCH v5 5/5] arm64: dts: mt8192: add pwrap node
Date: Fri, 5 Feb 2021 09:28:11 +0800
Message-ID: <1612488491-6149-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1612488491-6149-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1612488491-6149-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_202825_291509_10DEE116 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add pwrap node to SOC MT8192.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v4:
- update correct pwrap node in the Mediatek MT8192 dtsi.
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index e12e024de122..537af653ac54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -247,6 +247,18 @@
 			clock-names = "clk13m";
 		};
 
+		pwrap: pwrap@10026000 {
+			compatible = "mediatek,mt6873-pwrap";
+			reg = <0 0x10026000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+				 <&infracfg CLK_INFRA_PMIC_TMR>;
+			clock-names = "spi", "wrap";
+			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt8192-uart",
 				     "mediatek,mt6577-uart";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
