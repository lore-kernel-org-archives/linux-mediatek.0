Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2732EC433F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 12:59:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E856220768
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 12:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LK/idMvw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jM3kal+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E856220768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/z1OnDGXl0t91b7lxv6VAo5KOPuFIQdxBPs1Mconif4=; b=LK/idMvwgX5O8HY8/Ydtw03AH
	nH4Isk0slsgAzWbtGGYbvQ+YHPwmAZ8aUAZOwzO2VrGwjTZLWRJAYzQk0TxH8cYwovAy6vtAfbEzd
	aJ9drbP8u0s7xUbu3SFvGHWv8Vpg/HOcaqoe5OwXygKauCW9MunrFdOkTWZyP5uzLJObjFWo659gJ
	l4NBTSBBoRi1kR6W3pUIPRvUsxNhmaSoK+6xNHonIZTPc5tbKc34w5dtQpkCShpnyjuNsXTE8rLIy
	bwsRw3Hx8NQPQFmzUDleSUiXxCraIJn16L3F2ml29t56x22cc27D9rAAm+kqvKKFq7Pn27+FQdeIG
	B114hJpaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyaog-0000Cb-7w; Thu, 23 Jul 2020 12:59:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyaoc-0000AL-Q0; Thu, 23 Jul 2020 12:59:16 +0000
X-UUID: 8163a50deaef4d8dbb903da49f5f4aac-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2Is1ucYR1KtV1gnXVnRLEL8b3ceL3UIHja7wdO9zHDE=; 
 b=jM3kal+0FrfxK3BIh0gx9XnRp1bqUDB9B66bcQWK359Ap1CIEJ2RDVB0umamDbpE/JiuHeZPRIUUn66Aim3IjniLvU+vcWYk/HWZzQFDxcySfI6dmd8EmOq5LUPQe5EmVqZPUeXYfhjHazURhh6I9h1AJL/eC8mf3j9tyXHg0/Q=;
X-UUID: 8163a50deaef4d8dbb903da49f5f4aac-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2001370120; Thu, 23 Jul 2020 04:59:07 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 05:59:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 20:59:04 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 20:59:06 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/8] dt-bindings: mfd: Add compatible for the MediaTek MT6359
 PMIC
Date: Thu, 23 Jul 2020 20:58:47 +0800
Message-ID: <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_085915_027611_0976E891 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds compatible for the MediaTek MT6359 PMIC.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775..3d173b5 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6359" for PMIC MT6359
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -29,6 +30,7 @@ Optional subnodes:
 	Required properties: Should be one of follows
 		- compatible: "mediatek,mt6323-rtc"
 		- compatible: "mediatek,mt6358-rtc"
+		- compatible: "mediatek,mt6359-rtc"
 		- compatible: "mediatek,mt6397-rtc"
 	For details, see ../rtc/rtc-mt6397.txt
 - regulators
@@ -37,11 +39,15 @@ Optional subnodes:
 	see ../regulator/mt6323-regulator.txt
 		- compatible: "mediatek,mt6358-regulator"
 	see ../regulator/mt6358-regulator.txt
+		- compatible: "mediatek,mt6359-regulator"
+	see ../regulator/mt6359-regulator.txt
 		- compatible: "mediatek,mt6397-regulator"
 	see ../regulator/mt6397-regulator.txt
 - codec
 	Required properties:
-		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
+		- compatible: "mediatek,mt6397-codec"
+		- compatible: "mediatek,mt6358-sound"
+		- compatible: "mediatek,mt6359-sound"
 - clk
 	Required properties:
 		- compatible: "mediatek,mt6397-clk"
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
