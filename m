Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413BFC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 03:13:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF67761A42
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 03:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF67761A42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=garisCQ5iKe3n3A1i0D8ktiOBU5yd36AaaV2LoGF9u4=; b=IcIL10ke3SRShnCjjLcImRFml
	SDGVVkD6o+CclCI1igCHxsq0nXZKgN5lnkNJj8ApPXwlKSBg4CrVqd88UNbWXjnqwVJMv++GSRm3l
	hHX8bl1M90HrUMMWQEyxyF+9/68faCi+/kZISq8Z/tnQFoFk5Zq9jOeyZVTFlN0HgaXhXRrSuUoVI
	4SOPFLv+KwQuLSqR/vIW5ZGTlbPKURQiBlx9/0r2KW0CXjcr5okqzvzvXRDlceY8mww1DD3sV87AX
	TTrn7SILGkvgMuBxv6QPlBmDvEMdfd1UwInZo57Vv6+kaQz3inw4dutIMqyULGc2gbdFErVHbIfsk
	rSZ+Zo/sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPcub-002fRG-MS; Fri, 26 Mar 2021 03:13:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPcuP-002fPi-03; Fri, 26 Mar 2021 03:13:15 +0000
X-UUID: 2c4443ef04ee49e9acc61f4b8b9b84dc-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CHCSQowiX1nrYaEgrPue176Tk7t0rhH3dzhmwvZF6b8=; 
 b=iHii/zAkNx06CLnW33JRap35QqPQw7YQR7ia8Zu1zSU6um3k4kZuF1jlCqWeuqbNIvpIR4EKXzkjeU8+XgixHiHEA+12YEl28FY2CIpOJlgTc8fsQR3MPb4t1epz9FbvAi+yFY/pr/b4WsfMqumb2tmXLT0V/kzDJdP6wfjk7A8=;
X-UUID: 2c4443ef04ee49e9acc61f4b8b9b84dc-20210325
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 400324802; Thu, 25 Mar 2021 19:13:06 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 20:13:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 11:13:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Mar 2021 11:13:02 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Seiya Wang <seiya.wang@mediatek.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: cpufreq: update cpu type and clock name for
 MT8173 SoC
Date: Fri, 26 Mar 2021 11:12:27 +0800
Message-ID: <20210326031227.2357-2-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210326031227.2357-1-seiya.wang@mediatek.com>
References: <20210326031227.2357-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_031313_473414_A6D60EA4 
X-CRM114-Status: GOOD (  10.68  )
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
