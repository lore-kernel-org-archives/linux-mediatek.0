Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB27C10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 09:19:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2058920848
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 09:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eTJ4CzxN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EuP72bIT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2058920848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qY5tFW+q7I4HbQ5nLyo5gdfPGwweq82dWpZAtS/myY=; b=eTJ4CzxNEmUnph
	EBE5UHMDM1Z0K4pyq6rUk6nugxBL3VuwkE7EjW+blX77dM7t5909XO8fI81EG5ZY1xFcYCTC3ALbx
	Miuca7jWDlhVjwSNe9lrufL0/wS592/wx+8e/efG/8Hekki5zwbYm7dtRSwwDTjlw0FWeDlEDxqOU
	KOztgfmp+mGZaNtFfIw90X7af9XfGPSu6Bz3H+78D3ZGCNW86NNjTjTSJegBfz7nOWbyeopZb4Fxz
	3nC3gjTK0b/WnXfSiGxXH36oEF2PkzgiLul+Q2WHI84aq00NKc+yPeuvtY5GfifZog89TAtcAT0rg
	uO5If0jHsPAQfrnCCwLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBxWd-0003Pg-33; Wed, 11 Mar 2020 09:19:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBxW6-0002vr-Jk; Wed, 11 Mar 2020 09:19:07 +0000
X-UUID: 5c488a576fef40099a0c54714c2769ff-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sNkHpXF8izKZUF7qsuSvErydtyfam/Pb0hpHXYo69zY=; 
 b=EuP72bITQxRxmtaF/8lyzYrb5mZFscploVJHj4w6IC+CjdIeEAB74jw2w8KmlXmCdsBmuAZAgHZICm295nXslnwMS6ir0PMPHpV8dreBTE2ZWgEurW6XvDBA1yIkNBRLAQHKq1MPFsjeGM5Tji8B6HhkmzwnKb3l4RYj332UCho=;
X-UUID: 5c488a576fef40099a0c54714c2769ff-20200311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 296043621; Wed, 11 Mar 2020 01:18:58 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 02:17:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 17:15:37 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 11 Mar 2020 17:17:13 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v10 2/5] dt-bindings: mfd: Add compatible for the MediaTek
 MT6358 PMIC
Date: Wed, 11 Mar 2020 17:17:00 +0800
Message-ID: <1583918223-22506-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_021906_657362_2CA7002B 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds compatible for the MediaTek MT6358 PMIC.

Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index a9b105a..0df4382 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -18,24 +18,30 @@ See the following for pwarp node definitions:
 This document describes the binding for MFD device and its sub module.
 
 Required properties:
-compatible: "mediatek,mt6397" or "mediatek,mt6323"
+compatible:
+	"mediatek,mt6323" for PMIC MT6323
+	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
 
 - rtc
 	Required properties: Should be one of follows
 		- compatible: "mediatek,mt6323-rtc"
+		- compatible: "mediatek,mt6358-rtc"
 		- compatible: "mediatek,mt6397-rtc"
 	For details, see ../rtc/rtc-mt6397.txt
 - regulators
 	Required properties:
-		- compatible: "mediatek,mt6397-regulator"
-	see ../regulator/mt6397-regulator.txt
 		- compatible: "mediatek,mt6323-regulator"
 	see ../regulator/mt6323-regulator.txt
+		- compatible: "mediatek,mt6358-regulator"
+	see ../regulator/mt6358-regulator.txt
+		- compatible: "mediatek,mt6397-regulator"
+	see ../regulator/mt6397-regulator.txt
 - codec
 	Required properties:
-		- compatible: "mediatek,mt6397-codec"
+		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
 - clk
 	Required properties:
 		- compatible: "mediatek,mt6397-clk"
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
