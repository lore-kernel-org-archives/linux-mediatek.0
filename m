Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F25C433E9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 14:28:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64798206EB
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 14:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tSZYsDLW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64798206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j0uLKuofsrDSOHC4cP/5p7VCqRCuWJInVd8JgPwJ/WM=; b=tSZYsDLWOncUNwvFZ+Zk/LGTcx
	5JpARdhodieSPbu2HLrVfBtaNkL615K8JiXW1LM0nvfZG2L9iL1dvsUCimaqLxTDc8xIAQhhtEh6I
	/IwaVs7cnv1WjxzaD9n19mpLrrlv5jbJcodZj2MFi9+DF91D9GLXl9BP6CBxhpkOszZaZOlZNCsrA
	ORYTOfaNryG07XL/qNWpEAe2TZlfLn+ObsLN1rFPJqTbJXs5ziFefmMWKjIYsl98dYWks6aFYFqhV
	CSgAQLOxVvKY2yRgTl0d1NF74qLfCffDZ/37JYQBuWKov1rAXgloyJaN51x8SG0he5wuJ8Rkuh/bn
	G7M1iNrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDqE7-0000NL-70; Thu, 03 Sep 2020 14:28:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDqE3-0000Mp-6N; Thu, 03 Sep 2020 14:28:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 9F6EC29AB6D
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: [PATCH] arm64: dts: mt8173-elm: fix supported values for
 regulator-allowed-modes of da9211
Date: Thu,  3 Sep 2020 16:28:19 +0200
Message-Id: <20200903142819.24487-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_102831_319287_9D154E26 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: enric.balletbo@collabora.com, dafna3@gmail.com, kernel@collabora.com,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

According to the datasheet the allowed modes for the da9211
regulator are sync and auto mode. This should be changed in the
devicetree. This also fix an error message
'BUCKA: invalid regulator-allowed-modes element 0'
since value 0 is invalid.

Fixes: 689b937beddeb ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 1fe5dac24ba1..1a51879d5c6f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/regulator/dlg,da9211-regulator.h>
 #include <dt-bindings/gpio/gpio.h>
 #include "mt8173.dtsi"
 
@@ -293,7 +294,8 @@
 				regulator-max-microamp  = <4400000>;
 				regulator-ramp-delay = <10000>;
 				regulator-always-on;
-				regulator-allowed-modes = <0 1>;
+				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
+							   DA9211_BUCK_MODE_AUTO>;
 			};
 
 			da9211_vgpu_reg: BUCKB {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
