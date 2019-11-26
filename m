Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55103C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 11:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCEE2073F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 11:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gU75RcXK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jit1QBCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CCEE2073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5WjGbDZrrSBfwSIkEgPiuiekTDenrFZsNqeWAFXBV0=; b=gU75RcXKCZ/XIV
	iqicekKLfnvxHujnaOdaqlZWqzovCXm0MSsMN+hwf0lLe3PbHb/pTM+KPvjBPDeyA2+8/lGLo3KYi
	mV+y7j6ExJaB11xUSYCgFXG46UoEPNk5EUMHAEnwR0qVJrhJ8t31kYAbCfCuVBWzX9EvspvR8wO2s
	m3PZV18BVELnx84tC1h8Nh72GlEhyhZ+RKyJbU1u3plvAibHo5x84z0AIPJ+//X/kS2o9b7EEm6+3
	kZaF2pQe0xWN80zRTfJ2/HqVvhFLR4oSP/E0e/0zgW2gZkx+tHbo1VktSUCja++lZCZ+fH83sEjGA
	08FuDCpP4I06uP2+ohGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZZNw-0001q9-JG; Tue, 26 Nov 2019 11:52:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZZNO-0000Bp-BA; Tue, 26 Nov 2019 11:51:30 +0000
X-UUID: 7a9a676c30804ff58447a2a45e582c79-20191126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TAC2t4iFfrEbkB3/t23Ja5izb+mns8zyK7JUaEluMxE=; 
 b=Jit1QBCnEcbg8ly+4kEwQZcUNdRHbW9/mAKOD0kBXIe/3ter8Bkygw37axfs8mWDPB+mKhSC0hU2ZVLB2NnXQYNvA+OPBUtCHMwgBMROY9mGX/53uWOEOlZDqgcf4aouRMKI1mFYedRgzhJTjF+CMT7oyTJ0B0XFzSDbKXb9kSM=;
X-UUID: 7a9a676c30804ff58447a2a45e582c79-20191126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1845158833; Tue, 26 Nov 2019 03:51:20 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 03:51:53 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 19:51:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 19:51:15 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>
Subject: [v5, PATCH 2/5] dt-bindings: devfreq: add compatible for mt8183 cci
 devfreq
Date: Tue, 26 Nov 2019 19:50:43 +0800
Message-ID: <1574769046-28449-3-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_035126_567603_9917F2CF 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

This adds dt-binding documentation of cci devfreq
for Mediatek MT8183 SoC platform.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 .../bindings/devfreq/mt8183-cci-devfreq.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt

diff --git a/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt b/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
new file mode 100644
index 000000000000..a65a70bb9f09
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mt8183-cci-devfreq.txt
@@ -0,0 +1,20 @@
+* Mediatek Cache Coherent Interconnect(CCI) frequency device
+
+Required properties:
+- compatible: should contain "mediatek,mt8183-cci" for frequency scaling of CCI
+- clocks: for frequency scaling of CCI
+- clock-names: for frequency scaling of CCI driver to reference
+- regulator: for voltage scaling of CCI
+- operating-points-v2: for frequency scaling of CCI opp table
+
+Example:
+	cci: cci {
+		compatible = "mediatek,mt8183-cci";
+		clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
+		clock-names = "cci_clock";
+		operating-points-v2 = <&cci_opp>;
+	};
+
+	&cci {
+		proc-supply = <&mt6358_vproc12_reg>;
+	};
\ No newline at end of file
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
