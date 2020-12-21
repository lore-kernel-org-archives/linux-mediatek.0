Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB3FC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 03:37:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00F4230FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 03:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C00F4230FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l575Ua5Eubm5hihg26MySasNvnPQmOmJNa+RlTnhWII=; b=lLoJFdLlKEy1Fd27MAVxtQnV3H
	CtVEdFjKIs0TLTb2T5608xBTSHWYMRDVaJvh/F0MqNBCqTItomPfS2BRQrhlRcWIk/bcZ0ZIDABKL
	dndSBxC84lFsq3xtEkHtZhRAczufz5YOkGL/gRNGobsBUe6UuqejzeGmyL5yfkws+emI6KfGQo/n2
	xv+bh5ToHkBde+vdjOR6H833HOy12RZKNBcXfauhOfGWOUxlq+isS6fQOIVw65oOuBKs4nJuSZSW8
	QaLvRdeIY0PJ8M3PIRqUCLWGyWhjBe4HhjyQjTD8metq6O+/vuotUMA9w7PD7+nydfkCWWflFrC0B
	qKH8+C1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krC0c-00007k-IS; Mon, 21 Dec 2020 03:37:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krC0W-00006H-1Q; Mon, 21 Dec 2020 03:37:14 +0000
X-UUID: 758aebcb7e844c1f9995d8269c5ec6ad-20201220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Uo+XIg8o4WjWoayIoOc0q0rfThYTl2XUDATJocjPnw0=; 
 b=QEZCZjixjQ9Rs1F1NSGUHLaDYubQZCtXBHMt6KXYIFBI5s8n6ZWlU35JUIwmRQl+fpm2n9d6du4ph8ATrDLPe3rUEAVMdqPCuFR1qZ06hFpCFnR/djLO9qvj0EKb3uewVgg78SywYmwa7q2TgZzCzsxMXVg5YMoI+mip3OL+xAs=;
X-UUID: 758aebcb7e844c1f9995d8269c5ec6ad-20201220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 207358606; Sun, 20 Dec 2020 19:37:02 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Dec 2020 19:37:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 11:36:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Dec 2020 11:36:58 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: mediatek: Add Mediatek mt8192 cpufreq device nodes
Date: Mon, 21 Dec 2020 11:36:53 +0800
Message-ID: <1608521814-13017-1-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_223712_274680_40F7F5A6 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

This patch depends on [1] and [2].

[1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/019378.html
[2]https://patchwork.kernel.org/project/linux-mediatek/patch/1607586516-6547-3-git-send-email-hector.yuan@mediatek.com/

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 69d45c7b31f1..770f7d8833db 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -39,6 +39,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x000>;
 			enable-method = "psci";
+			performance-domain = <&performance 0>;
 			clock-frequency = <1701000000>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
@@ -49,6 +50,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x100>;
 			enable-method = "psci";
+			performance-domain = <&performance 0>;
 			clock-frequency = <1701000000>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
@@ -59,6 +61,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x200>;
 			enable-method = "psci";
+			performance-domain = <&performance 0>;
 			clock-frequency = <1701000000>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
@@ -69,6 +72,7 @@
 			compatible = "arm,cortex-a55";
 			reg = <0x300>;
 			enable-method = "psci";
+			performance-domain = <&performance 0>;
 			clock-frequency = <1701000000>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
@@ -79,6 +83,7 @@
 			compatible = "arm,cortex-a76";
 			reg = <0x400>;
 			enable-method = "psci";
+			performance-domain = <&performance 1>;
 			clock-frequency = <2171000000>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
@@ -89,6 +94,7 @@
 			compatible = "arm,cortex-a76";
 			reg = <0x500>;
 			enable-method = "psci";
+			performance-domain = <&performance 1>;
 			clock-frequency = <2171000000>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
@@ -99,6 +105,7 @@
 			compatible = "arm,cortex-a76";
 			reg = <0x600>;
 			enable-method = "psci";
+			performance-domain = <&performance 1>;
 			clock-frequency = <2171000000>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
@@ -109,6 +116,7 @@
 			compatible = "arm,cortex-a76";
 			reg = <0x700>;
 			enable-method = "psci";
+			performance-domain = <&performance 1>;
 			clock-frequency = <2171000000>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
@@ -194,6 +202,12 @@
 		compatible = "simple-bus";
 		ranges;
 
+		performance: performance-controller@0011bc00 {
+			compatible = "mediatek,cpufreq-hw";
+			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+			#performance-domain-cells = <1>;
+		};
+
 		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <4>;
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
