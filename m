Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F0FC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 08:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C193920736
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 08:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eesBuMI2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X/Rep5K8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C193920736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z2FGcsmnP6cx5heN/8NQdZOftO9W9ViD+ZehePtuoQE=; b=eesBuMI2f+l9eB
	MmrnlszfwObPn093kM/zCRj0xgCNcJWcSlyRxpp8r+dbeYCFgVplUOSUfx3jHSNUazv7QYrFJWQX4
	jxOGer/pUgq1hhN/GpXKjwJCCipJ0cEPLEk43JomX8Uo3fgSa2rlYw+am5sZABEKraA/y9XnlMfh4
	c5grOcTtojg/TujDAUxJVYpEhJTYurpusSeApnkfL5LRehS20Cs7n91bmCQiIDisIeDbQspto2WgE
	CUKmQyTidpXf5mv73nIfOSYRQkrN/Wh2l4kJNt0ip8KKuYGrMqzv9+dPNSf845iaECsSaVdz+zH50
	4i8Gl36Rf3WQyUJ6u8Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRtcm-0007d5-FY; Fri, 24 Apr 2020 08:23:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRtcj-0007c5-Al; Fri, 24 Apr 2020 08:23:51 +0000
X-UUID: 382b9c1fcbe34f83bbc0f2225c0a40aa-20200424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5Le9qoejU+6jSbO30NZ6FQCsnzb28/ib8ihNNO5nR/Q=; 
 b=X/Rep5K8QMo98wwa7h4FZ9m9ROq5x7ZKPJXqFs76Mw4ybRk0NHNOaoSQxEBKdP3grJcrLBZwNrEL2I4qkBgFcRBwvpOVmQh1aaDQj5+zysrE52qZxF2KaXzlJHemL0vzGEWtWgvLaIWdzgM3IXpCsXi00WaDLcgwa54tk+sITJE=;
X-UUID: 382b9c1fcbe34f83bbc0f2225c0a40aa-20200424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 276979056; Fri, 24 Apr 2020 00:23:27 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 01:23:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Apr 2020 16:23:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Apr 2020 16:23:39 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH] [RESEND] arm64: dts: mt8173: fix cooling device range
Date: Fri, 24 Apr 2020 16:23:40 +0800
Message-ID: <20200424082340.4127-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_012349_376600_7C04AFE6 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Kao <michael.kao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When thermal reaches target temperature,it would be pinned to state 0
(max frequency and power).
Fix the throttling range to no limit.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Michael Kao <michael.kao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index ccb8e88a60c5..cae2cec46cdc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/mt8173-power.h>
 #include <dt-bindings/reset/mt8173-resets.h>
 #include <dt-bindings/gce/mt8173-gce.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "mt8173-pinfunc.h"
 
 / {
@@ -294,14 +295,18 @@
 			cooling-maps {
 				map@0 {
 					trip = <&target>;
-					cooling-device = <&cpu0 0 0>,
-							 <&cpu1 0 0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT
+							  THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT
+							  THERMAL_NO_LIMIT>;
 					contribution = <3072>;
 				};
 				map@1 {
 					trip = <&target>;
-					cooling-device = <&cpu2 0 0>,
-							 <&cpu3 0 0>;
+					cooling-device = <&cpu2 THERMAL_NO_LIMIT
+							  THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT
+							  THERMAL_NO_LIMIT>;
 					contribution = <1024>;
 				};
 			};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
