Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D234C33CB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 10:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E84AA24677
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 10:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eFeMmnbM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DV6ztj33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E84AA24677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PCNWj4J/rFvgi8GnWoJz4ai+r/C5GmJ9U7Uxo12JnX0=; b=eFeMmnbMxEoA09
	8kZNWFsYnleDEGnbflMqiYsdm83Nv4r4FS4dcOlZEaaTsWqrQqFkPPXhcB89/+dsPXhXLjmbHDRQH
	JcCG77ohbum5Ego3NnLuFCblAGE2rugVvVeb2Y6hSkxaz4w6M9Po467GATOvsJDTq8kSMHr5p5qtC
	V24M3LRqIOo4k6CXO1+Nqe/yDyin6VGxYAEm9cFYHF7vyB72AsGP8Flp0kGMn+gHqjvp0pdeMTxM2
	E6czrxJmhaDdJ4s7he/F/l1J9WMGWJnt9Pia2UXQrDDVKg4F6g62F3SDw6d/QBnbERSyGF3FyG0Bo
	HTKa6VTQODArCmmEto7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irJAj-00009I-E1; Tue, 14 Jan 2020 10:11:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irJAY-0008Ra-8S; Tue, 14 Jan 2020 10:11:34 +0000
X-UUID: ed66a9d1d0654024bb6907518e190722-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qoaZJusf4At6LIpWx4whGG9gLSgykifupaNe4/abaOs=; 
 b=DV6ztj33KRVRzI88b2CxDhD8rEy5gaUf3Yejw7kSIjzMovSxT8dlZBtUPW0RDrN67GnXLcN3M9U1fuU3zMJfdbpjjG6tQXfUzj8v7DLxGo6EMQV5GuhOvCphPAYdlLgoQKIbsNtV7IwRJY0ceEYzhjxkE/c6rML00UCdDPQJmcY=;
X-UUID: ed66a9d1d0654024bb6907518e190722-20200114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jamesjj.liao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1187010828; Tue, 14 Jan 2020 02:11:25 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 02:12:09 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 18:10:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 14 Jan 2020 18:12:00 +0800
From: James Liao <jamesjj.liao@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] arm64: dts: mt8183: Enable CPU idle-states
Date: Tue, 14 Jan 2020 18:11:13 +0800
Message-ID: <1578996673-8140-1-git-send-email-jamesjj.liao@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B578A9546F8FDF9209DBB42AA7F3474A4986FEA89B320FDFD34373CBA93BD7F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_021130_304848_5BAA4727 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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
 James Liao <jamesjj.liao@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable mcdi-cpu and mcdi-cluster on MT8183 CPUs.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
This patch bases on v5.5-rc6, adds idle-states for MT8183 CPUs.

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 10b3247..a022325 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -73,6 +73,7 @@
 			reg = <0x000>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu1: cpu@1 {
@@ -81,6 +82,7 @@
 			reg = <0x001>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu2: cpu@2 {
@@ -89,6 +91,7 @@
 			reg = <0x002>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu3: cpu@3 {
@@ -97,6 +100,7 @@
 			reg = <0x003>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu4: cpu@100 {
@@ -105,6 +109,7 @@
 			reg = <0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu5: cpu@101 {
@@ -113,6 +118,7 @@
 			reg = <0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu6: cpu@102 {
@@ -121,6 +127,7 @@
 			reg = <0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
 		};
 
 		cpu7: cpu@103 {
@@ -129,6 +136,29 @@
 			reg = <0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
+		};
+
+		idle-states {
+			entry-method = "arm,psci";
+
+			MCDI_CPU: mcdi-cpu {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <200>;
+				exit-latency-us = <200>;
+				min-residency-us = <800>;
+			};
+
+			MCDI_CLUSTER: mcdi-cluster {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <250>;
+				exit-latency-us = <400>;
+				min-residency-us = <1300>;
+			};
 		};
 	};
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
