Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7580AC47080
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 07:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B3E60FDC
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 07:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B3E60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iX/EpPhMdMm7WjI6X8PnyrOCqSgD6qBU15kBou3gqOA=; b=pfw+0vo3PzuM9m
	bcLlTo0dveqr4uqf+uO00pJaeKyJSZ8GG0lF0mmUYloFeSzpdJ/CMRq+0/NtFgby+iFwAo1EutuOH
	dHyZs3U5oLYV25RP9t5xJFZtYYwtRlawnSY2pOt/vUziRsfd3Fu67r9tqbThLtD0KxD7t2lrvaN2S
	vacFvar0yg7Ol9s5CB8xWqSmcIvhD1Po/sv2PB/KxdUJZsN5bKzJoGdOIiwO0FEhuhoH/q+EyzjfL
	LYODZwg/pby4CIa2L5AImfXUyPWRTntXiFRIlqNO0KfpRoQEU/KSM2lHvMn3uqdV0LbyV5u0gAQKq
	lgxHstuzWwFlCUPMUG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnyYv-00F4jo-S4; Tue, 01 Jun 2021 07:11:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnyYu-00F4i8-1A; Tue, 01 Jun 2021 07:11:41 +0000
X-UUID: 4c7610ad450d4cb9ae30540a3d16d41f-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cpAk/AdvD3AP+KvisOzDSM2Xix1Pz33ijv2/knc+3Lo=; 
 b=MMwbYHb2X0CAqbZftcCaJlka0fIImJL64EVKabx3l3m9ES3P1SLvs1s0xiwwkrtRwYVS127UzKCNLR65QIKG1hFk4rSwPgBCa8529Smw4ehO4LcpCaIxDHX6p8u6Tp1Yfqu2+beR6vibdFZNCTnN8YzUcH0QHkHNfqiYEcwlbUQ=;
X-UUID: 4c7610ad450d4cb9ae30540a3d16d41f-20210601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1016122092; Tue, 01 Jun 2021 00:11:35 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 00:11:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 15:11:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Jun 2021 15:11:20 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Seiya Wang <seiya.wang@mediatek.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>
Subject: [RESEND 2/2] dt-bindings: cpufreq: update cpu type and clock name for
 MT8173 SoC
Date: Tue, 1 Jun 2021 15:10:42 +0800
Message-ID: <20210601071042.31349-2-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210601071042.31349-1-seiya.wang@mediatek.com>
References: <20210601071042.31349-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_001140_100982_3C5C5368 
X-CRM114-Status: GOOD (  11.02  )
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

Update the cpu type of cpu2 and cpu3 since MT8173 used Cortex-a72.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
index ea4994b35207..ef68711716fb 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
@@ -202,11 +202,11 @@ Example 2 (MT8173 SoC):
 
 	cpu2: cpu@100 {
 		device_type = "cpu";
-		compatible = "arm,cortex-a57";
+		compatible = "arm,cortex-a72";
 		reg = <0x100>;
 		enable-method = "psci";
 		cpu-idle-states = <&CPU_SLEEP_0>;
-		clocks = <&infracfg CLK_INFRA_CA57SEL>,
+		clocks = <&infracfg CLK_INFRA_CA72SEL>,
 			 <&apmixedsys CLK_APMIXED_MAINPLL>;
 		clock-names = "cpu", "intermediate";
 		operating-points-v2 = <&cpu_opp_table_b>;
@@ -214,11 +214,11 @@ Example 2 (MT8173 SoC):
 
 	cpu3: cpu@101 {
 		device_type = "cpu";
-		compatible = "arm,cortex-a57";
+		compatible = "arm,cortex-a72";
 		reg = <0x101>;
 		enable-method = "psci";
 		cpu-idle-states = <&CPU_SLEEP_0>;
-		clocks = <&infracfg CLK_INFRA_CA57SEL>,
+		clocks = <&infracfg CLK_INFRA_CA72SEL>,
 			 <&apmixedsys CLK_APMIXED_MAINPLL>;
 		clock-names = "cpu", "intermediate";
 		operating-points-v2 = <&cpu_opp_table_b>;
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
