Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA2CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:52:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F52C64E83
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F52C64E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4gNB6E/MihBCmz+mN7n8WMeLRhk/3y+scyw7omYT5tg=; b=SwWZiDey6j2U1Oy994oIe0doQ
	QlSq8F85tDuuO4GAiZ1F6A7Qut8WT5jgdrOudEXxWOqVnisZ2/1zuZaGCMOMo4ruwhLj38VEfRusS
	61JfCjoglYKa4yXrGjyIyQoxoNaOuu/9e8WQmHUezj6klztQc4p6WUnEL6EJQnSElci5SZF+/KaV8
	ECm7r8EYppiMJ2cjZD87w6pHujztPUbZXJQqcWkYstW2e46Bk6RUQ2Mf6RrSgyCDKujAwyr5onIQA
	jecleYV2oHYg3CrVVpQ8+1SBHsLeyAlPcC6VijHCQVFLeneVp+1TqQuonIJJzdqzyncp8PJGWo7DZ
	JwN25OhgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLndT-00G00n-V6; Mon, 15 Mar 2021 13:51:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnd3-00FzcG-2U; Mon, 15 Mar 2021 13:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=X50nXop30cnwwcmGkikGFe2s6bFECIzzj+a35koVrhA=; b=jftd6lK6pyHe5MWNCos/8DwawM
 +LIRuyqrocMtnq0oCDypDNkyDJ9Nc27+qZkLF8nnkLQ92oZ3Wm4fVQnlkhxUr175AcQbMGZ/dqL/9
 mVnePlAMNW9tbtVCS2TivxGTigXIxC3eKEbsPC1PU/4xQU1zVIK01lwAuh0UGtWdnVReaa8Pk8Zaq
 S4wpKmJa80DQGos3jXpL3BpSzOXIeaPtEGPthn8kcqdAqA/SyaMpfsOEcbF+iSQWUH7hcshknB/UK
 +6uKuZ71ptrbS0otZxLqDIjKyesKS4TBDJYIDYQt4VVRWPhyNCvbKrWUXWHfJxChFk//ONsioXC5g
 UElaE7uA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnSo-000FSZ-SF; Mon, 15 Mar 2021 13:41:10 +0000
X-UUID: 665e19677c7e484ebe8c7d216572bf2f-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X50nXop30cnwwcmGkikGFe2s6bFECIzzj+a35koVrhA=; 
 b=mwLZT4h4jK+etoTxYnEDwHUKuAlVAcKPf57PP4Gt2zjPKGp40Wr3s6WYYC6m+5sZTEeP6VtNnlZV303qhX3Xy1/WFuNkyNX5y2CIG+mxkBKortdAUZwHtOBggh/9emEDCF5J6qwCPv4BYSt51nVr1K/hsARyGnKuK52mnr8YiIc=;
X-UUID: 665e19677c7e484ebe8c7d216572bf2f-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 749498418; Mon, 15 Mar 2021 05:40:48 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 06:30:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 21:30:44 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 21:30:44 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 6/7] arm64: dts: mt8192: add svs device information
Date: Mon, 15 Mar 2021 21:30:17 +0800
Message-ID: <20210315133018.4976-7-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210315133018.4976-1-roger.lu@mediatek.com>
References: <20210315133018.4976-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_134056_228125_216174BC 
X-CRM114-Status: UNSURE (   9.06  )
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

add compitable/reg/irq/clock/efuse/reset setting in svs node

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 2f0b4824a024..f3a339de8992 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -268,6 +268,14 @@
 			compatible = "mediatek,mt8192-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+
+			infracfg_rst: reset-controller {
+				compatible = "mediatek,infra-reset", "ti,syscon-reset";
+				#reset-cells = <1>;
+				ti,reset-bits = <
+					0x150 5 0x154 5 0 0     (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: svs */
+				>;
+			};
 		};
 
 		pericfg: syscon@10003000 {
@@ -362,6 +370,20 @@
 			status = "disabled";
 		};
 
+		svs: svs@1100b000 {
+			compatible = "mediatek,mt8192-svs";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>,
+				      <&lvts_e_data1>;
+			nvmem-cell-names = "svs-calibration-data",
+					   "t-calibration-data";
+			resets = <&infracfg_rst 0>;
+			reset-names = "svs_rst";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8192-spi",
 				     "mediatek,mt6765-spi";
@@ -473,6 +495,18 @@
 			status = "disable";
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+
+			lvts_e_data1: data1 {
+				reg = <0x1C0 0x58>;
+			};
+			svs_calibration: calib@580 {
+				reg = <0x580 0x68>;
+			};
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
