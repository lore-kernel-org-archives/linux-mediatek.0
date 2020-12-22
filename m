Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2780C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 04:58:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6686A22518
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 04:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6686A22518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJV4jb78Fn/08KWWHyRiDkPAhlUmM5Ib1u4tYtosYWI=; b=npn1wq6RAHOEONnzBarbFQi3g7
	1x8UjDc68aju+OzZTZzR8Fv5IS/cZb/rXUgTzK5kk86oeYdGMFylPs9iGiFDV8f5y3jR/eQ/fPxE9
	fRRle4lU91x5tzuJ+DBEbZ/IiI4/yIa0d4ISLZzD4stQpCZ+HrE/8kw+PCvFsNsPL3eVLxdAh+mFB
	Xg3rnyEY1Mj1shfZGojErghnQH1vNXA/CZq/s9sLWOQ/hwKx9QCmRCn1JV6qCh6kO7GKrbNOvSfMN
	gfC1iLkGgmDT+CqAuVh3qu5NnCzaxfHrPYeN/8rV6Mx1rPPaBBRCZb7MBNXZBbfTfCUpwMDeGngT5
	b+7UnUdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krZkx-0000Hg-10; Tue, 22 Dec 2020 04:58:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krZks-0000Gg-2d; Tue, 22 Dec 2020 04:58:39 +0000
X-UUID: 1343cd29808a495dac72a1b466eb5160-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ix39aEP/7qBhFODfaYq98ECNI0FRFoI883iGyqKhxxY=; 
 b=soX5LFOiBcCV2HtNbeL6cbqYt/IY3UZYIs0V/DvgqAnDxY3iDGT4XrgE1FL67YiEtBuoVyxEFKKI22CpEsS3dF/vNJFfS3QfPmYiQq71VRKdywrlRlM8SkO6PvZ17bqIc5cG1MyTbj+dfcYXq8WytTVNVMZ+H8CEPSzsESopOvM=;
X-UUID: 1343cd29808a495dac72a1b466eb5160-20201221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jamesjj.liao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 951786802; Mon, 21 Dec 2020 20:58:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 20:58:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 12:58:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 12:58:21 +0800
From: James Liao <jamesjj.liao@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mt8192: Add cpu-idle-states
Date: Tue, 22 Dec 2020 12:58:20 +0800
Message-ID: <20201222045820.26355-1-jamesjj.liao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_235838_349810_580D6FC3 
X-CRM114-Status: UNSURE (   9.44  )
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

Add idle states for cpu-off and cluster-off.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

This patch bases on v5.10 and [1], adds idle-states for MT8192 CPUs.

[1] https://lore.kernel.org/linux-arm-kernel/20201030092207.26488-2-seiya.wang@mediatek.com/

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index e12e024de122..c7f2ec9ea4f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -39,6 +39,7 @@
 			reg = <0x000>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -49,6 +50,7 @@
 			reg = <0x100>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -59,6 +61,7 @@
 			reg = <0x200>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -69,6 +72,7 @@
 			reg = <0x300>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -79,6 +83,7 @@
 			reg = <0x400>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -89,6 +94,7 @@
 			reg = <0x500>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -99,6 +105,7 @@
 			reg = <0x600>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -109,6 +116,7 @@
 			reg = <0x700>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -158,6 +166,42 @@
 		l3_0: l3-cache {
 			compatible = "cache";
 		};
+
+		idle-states {
+			entry-method = "arm,psci";
+			cpuoff_l: cpuoff_l {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010001>;
+				local-timer-stop;
+				entry-latency-us = <55>;
+				exit-latency-us = <140>;
+				min-residency-us = <780>;
+			};
+			cpuoff_b: cpuoff_b {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010001>;
+				local-timer-stop;
+				entry-latency-us = <35>;
+				exit-latency-us = <145>;
+				min-residency-us = <720>;
+			};
+			clusteroff_l: clusteroff_l {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010002>;
+				local-timer-stop;
+				entry-latency-us = <60>;
+				exit-latency-us = <155>;
+				min-residency-us = <860>;
+			};
+			clusteroff_b: clusteroff_b {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010002>;
+				local-timer-stop;
+				entry-latency-us = <40>;
+				exit-latency-us = <155>;
+				min-residency-us = <780>;
+			};
+		};
 	};
 
 	pmu-a55 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
