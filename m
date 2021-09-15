Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46471C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1025361242
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1025361242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y2tnfFHo6C7K7tIO+8V8Bw95pCdx6TGh52coRZ0IQMc=; b=3MnqqvwIVc8RGA
	XcawxGrG/02xPDNodfY2VBUbQYytEVTDFkAVkMDvv/HuRFck+p6vf6T1cQ/ZaMq9y2AF161KXPMyX
	TaLRgO5Rzmc2NsCxaxTNMSmKXYsC/vqoXk8D8o/mxM+0Yz8L4V/9snYguHH7utfyjDCtEhlXIkWw3
	hHkgh7mTZ+RtXJzbkTIz9hmLdvoc71aWqGa3JlID+gOhRUzo4qvczHYB8ybP2l+qCsshQtkxEIX9o
	TH8hiKKnvy9LMsFXz9i9ubDHld1gKYG6gVjf9L6kUyJ28nzk6Pjcc+1sa8OtXoN8Z7Kdl3tmnJA1n
	7IYRtp2HJ6POkJ9i9mxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQLaA-007xGE-Hh; Wed, 15 Sep 2021 03:27:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQLa7-007xF6-PB; Wed, 15 Sep 2021 03:27:33 +0000
X-UUID: 43a7332943df470999bb88d6a3cc98e1-20210914
X-UUID: 43a7332943df470999bb88d6a3cc98e1-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 949797533; Tue, 14 Sep 2021 20:27:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 20:27:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 11:27:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Sep 2021 11:27:23 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>
Subject: [PATCH v2] arm64: dts: mt8183: support coresight-cpu-debug for mt8183
Date: Wed, 15 Sep 2021 11:27:19 +0800
Message-ID: <20210915032719.7194-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_202731_864010_6D5CF59A 
X-CRM114-Status: GOOD (  10.29  )
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

Add coresight-cpu-debug nodes to mt8183 for dumping
EDPRSR, EDPCSR, EDCIDSR, EDVIDSR
while kernel panic happens

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 409cf827970c..2d36575e7dbe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -367,6 +367,70 @@
 			reg = <0 0x0c530a80 0 0x50>;
 		};
 
+		cpu_debug0: cpu-debug@d410000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xd410000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+		};
+
+		cpu_debug1: cpu-debug@d510000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xd510000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+		};
+
+		cpu_debug2: cpu-debug@d610000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xd610000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+		};
+
+		cpu_debug3: cpu-debug@d710000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xd710000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+		};
+
+		cpu_debug4: cpu-debug@d810000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xd810000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu4>;
+		};
+
+		cpu_debug5: cpu-debug@d910000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xd910000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu5>;
+		};
+
+		cpu_debug6: cpu-debug@da10000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xda10000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu6>;
+		};
+
+		cpu_debug7: cpu-debug@db10000 {
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
+			reg = <0x0 0xdb10000 0x0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu7>;
+		};
+
 		topckgen: syscon@10000000 {
 			compatible = "mediatek,mt8183-topckgen", "syscon";
 			reg = <0 0x10000000 0 0x1000>;
-- 
2.14.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
