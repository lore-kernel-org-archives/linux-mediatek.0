Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10026C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9CB6023F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD9CB6023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgmYk2VWYr+X+S3ku/iVMgJ2MSBphtPGv29H7IzqIp4=; b=zBIFWeltBZsvx1
	rJkF5uMVAiDG5gB4xP6hxHoKigi45k+ILHZ90MwZTqTE0XlUwTl1TCNfzydUeFsM95dX13bnDaH0y
	VuUNZUuO4AXMXLEuy/pfqBQLc65XpOFjbYIp5EYThWAr6Wq754ZKw1/aBzt26PCsw8VxW1/Jo/qPD
	l5dKcSu0ieNdXy7VVFFl4TD/K9IWAx6Uh8nZ0R6bk/497wJrwdMcuRluj6Uq6EEdKNUahlCHfEe2S
	ZQI7j5lf51dhWBVa+ju9m8B4Bol9ej3g3Xe76DSrpvGaOwnToC7kpjyfAyJMZS/v6KMGqwIS7uq2K
	oBHQuAi09ZZSDF/Cc5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFviI-001uW6-Hj; Tue, 17 Aug 2021 09:48:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvgm-001tvJ-AP; Tue, 17 Aug 2021 09:47:26 +0000
X-UUID: 35c33d2619354135816e648429288f2c-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FQmDxUfHdoiFswvf/EzDd7VG5vWt9Gme0NIWcdJi1sY=; 
 b=Om9EmEQyjgyjSaIIk8Qrl2O1rgeIDtXj3dt8TnwpSFpb3LSsahjrLllYcE9R8h3DTqoMG19tWxT/EXn/NGm6QfYHSmvGBYlqV1G0nnRQqMKHRyieRiPJckCREqQZ2j9HwtEux9oEJix1uXH2mz2DuIEKkC9Uxh8ggfjeTSbHUtU=;
X-UUID: 35c33d2619354135816e648429288f2c-20210817
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 51567653; Tue, 17 Aug 2021 02:47:16 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 02:47:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 17:47:13 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 17 Aug 2021 17:47:13 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <james.lo@mediatek.com>
Subject: [PATCH v11 5/5] arm64: dts: mt8192: add spmi node
Date: Tue, 17 Aug 2021 17:47:10 +0800
Message-ID: <1629193630-19994-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1629193630-19994-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1629193630-19994-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_024720_461732_05F75F2E 
X-CRM114-Status: GOOD (  10.47  )
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

Add spmi node to SOC MT8192.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v10:
- No change.
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9810f1d441da..1237e3624e44 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -316,6 +316,23 @@
 			clock-names = "clk13m";
 		};
 
+		spmi: spmi@10027000 {
+			compatible = "mediatek,mt6873-spmi";
+			reg = <0 0x10027000 0 0x000e00>,
+			      <0 0x10029000 0 0x000100>;
+			reg-names = "pmif", "spmimst";
+			clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+				 <&infracfg CLK_INFRA_PMIC_TMR>,
+				 <&topckgen CLK_TOP_SPMI_MST_SEL>;
+			clock-names = "pmif_sys_ck",
+				      "pmif_tmr_ck",
+				      "spmimst_clk_mux";
+			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
