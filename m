Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD54C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166F561159
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166F561159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8chMx/g0lRHhU13ompeMnr1GmDkMmLhldYmUQ/Mq28=; b=UXzu7bSQVszikl
	T8AoYbRd2w56RpVYoAQMS3B6OXXItszbV55GdrjuXCCZqaz6t4KrRunpI7+kpdx2Qdhw2iy1XZGfz
	0n/Hve/NiUFiunZKQw7Z9lHbJIUSLc2UA4nb6zcXIMsjSffMSRJAe6dymAChA6U9bhBCfgPc7jJDU
	Gu5aVvhdT4RTX8bN40qEIC4hrDPCGbMUavqeC9FU++t0E/UeaL1out3tXJoN7sPVYeHlbCB7cjiTR
	suHOCW8eTiMh2ob7hXNuzaoGg3P7JxV//IYJNT+pSAX/nAzUOeYgn7oGqE/uxxZ/Q/NYxSHsN3jHG
	w0BNTosCiOZJfMdaojgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGlT-003Ecq-4j; Tue, 15 Jun 2021 21:38:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltD5Y-001pKi-18; Tue, 15 Jun 2021 17:43:02 +0000
X-UUID: 73c5c3834f324eee878bacfdcb577f5c-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RvQnFfthiXFdxcCkNPH5J7k1fCLsP1fGuofWQRq4+rE=; 
 b=BloX5dNK+Onm46XuMDD7XS35CF5ZaaarXKOktabwlGQ3UBpNXr7iaqYwdXrS8H7UcKD06+blgb0NLE5EsjSAw2JJJeE9PZiPokLRNwgh7eW9KmEMeoERI8dETYnhjF9qMi1dnwz6bKxrpoY++VA77BI+cq756gTht2pL5tNzvdQ=;
X-UUID: 73c5c3834f324eee878bacfdcb577f5c-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1557092085; Tue, 15 Jun 2021 10:42:55 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:46 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, YT Lee
 <yt.lee@mediatek.corp-partner.google.com>
Subject: [PATCH 27/27] arm64: dts: mt8195: add cpufreq device nodes
Date: Wed, 16 Jun 2021 01:32:33 +0800
Message-ID: <20210615173233.26682-27-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_104300_193014_3CDB27FD 
X-CRM114-Status: UNSURE (   9.35  )
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

From: YT Lee <yt.lee@mediatek.corp-partner.google.com>

this 8195 cpufreq device nodes is based on below dt-bindings document
https://patchwork.kernel.org/project/linux-mediatek/patch/1615549235-27700-3-git-send-email-hector.yuan@mediatek.com/

and it also rely on below patches to work
[1]https://patchwork.kernel.org/project/linux-mediatek/patch/1615549235-27700-2-git-send-email-hector.yuan@mediatek.com/
[2]https://patchwork.kernel.org/project/linux-pm/patch/20201105125001.32473-1-lukasz.luba@arm.com/
[3]https://patchwork.kernel.org/project/linux-pm/patch/20201103090600.29053-3-lukasz.luba@arm.com/
[4]https://patchwork.kernel.org/project/linux-pm/patch/20201103090600.29053-4-lukasz.luba@arm.com/
[5]https://patchwork.kernel.org/project/linux-pm/patch/20201103090600.29053-5-lukasz.luba@arm.com/

Signed-off-by: YT Lee <yt.lee@mediatek.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 25a6ee7c6659..e5ebf8d663df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -54,6 +54,7 @@
 			compatible = "arm,cortex-a55", "arm,armv8";
 			reg = <0x000>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
@@ -66,6 +67,7 @@
 			compatible = "arm,cortex-a55", "arm,armv8";
 			reg = <0x100>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
@@ -78,6 +80,7 @@
 			compatible = "arm,cortex-a55", "arm,armv8";
 			reg = <0x200>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
@@ -90,6 +93,7 @@
 			compatible = "arm,cortex-a55", "arm,armv8";
 			reg = <0x300>;
 			enable-method = "psci";
+			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <578>;
 			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
@@ -102,6 +106,7 @@
 			compatible = "arm,cortex-a78", "arm,armv8";
 			reg = <0x400>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
@@ -114,6 +119,7 @@
 			compatible = "arm,cortex-a78", "arm,armv8";
 			reg = <0x500>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
@@ -126,6 +132,7 @@
 			compatible = "arm,cortex-a78", "arm,armv8";
 			reg = <0x600>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
@@ -138,6 +145,7 @@
 			compatible = "arm,cortex-a78", "arm,armv8";
 			reg = <0x700>;
 			enable-method = "psci";
+			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
@@ -257,6 +265,12 @@
 		method = "smc";
 	};
 
+	performance: performance-controller@11bc10 {
+		compatible = "mediatek,cpufreq-hw";
+		reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+		#performance-domain-cells = <1>;
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
