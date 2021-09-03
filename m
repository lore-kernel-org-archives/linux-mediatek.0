Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8691FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 06:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE4A6102A
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 06:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BE4A6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRrtNYy6492IiXWq7K1Awg8vhhf+op9VaCLpYY+G1tQ=; b=zjw7zWlhI4gYYN
	81sNXwVteKpzME6jUa+en9pgHb93YVPyYi+gBm3fxsgNOJK6byGSf5PmJUuwH6eb2Y3FDfA/jC1m9
	Lst7YRzUayenfJVcZWqZg0+0g7Y9jLEQ2uBb5v5JfYsp2P4aGUs8aDYPoLfFQdCEO57oFICTEa+gL
	WQsAUOEGBCVoO6GRA+GG5Grl1sdDPMpnYwxslXIgYMa8jpjmPBo5RvKnR87xmgOmt35lIR52diVZj
	vGFVWdocVUxpz8lju2A9o3b+AkiQ8ApgIi7XNHoGcGFQIxFobqMqQmhODcLmox6Sld9RVVBS8F07P
	kNREpprUnWpcYsk9Bi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM2cO-00B58g-05; Fri, 03 Sep 2021 06:24:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM2cL-00B57s-Pm; Fri, 03 Sep 2021 06:24:03 +0000
X-UUID: be1784218f67455a84dc3558e2a2149e-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tW0cWLsfcmfW8u99i/h8cbcoPQZbxcJEQbPRrddnpQo=; 
 b=BB5cAztt+7z3X81jg8rJmnN4MxeZVZbgbB6simKwnyo5x2nQJ44MhMsa6PLIIIWKNjtA8yD3AhVv+suym5GKhRZutW5muh9csD31P50y+xXF4VmTdvFS74yLQQYopCOvdGw5/Z7fHm1is92CGdRqmefnZbMWTmTUw1T0ydeE22E=;
X-UUID: be1784218f67455a84dc3558e2a2149e-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 278918613; Thu, 02 Sep 2021 23:24:00 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 23:17:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 14:17:04 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 14:17:03 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fengquan.chen@mediatek.com>, <tinghan.shen@mediatek.com>,
 <randy.wu@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <christine.zhu@mediatek.com>, <joe.yang@mediatek.com>,
 <zhishuang.zhang@mediatek.com>
Subject: [v2,
 2/2] dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst support
Date: Fri, 3 Sep 2021 14:16:23 +0800
Message-ID: <20210903061623.10715-3-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_232401_890284_FC18EE78 
X-CRM114-Status: GOOD (  10.67  )
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

This patch add a description and example of disable_wdt_extrst
element for watchdog on MTK Socs

Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60de829..c202d6fa5801 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -17,6 +17,7 @@ Required properties:
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
+- mediatek,disable-extrst: disable send output reset signal
 - timeout-sec: contains the watchdog timeout in seconds.
 - #reset-cells: Should be 1.
 
@@ -25,6 +26,7 @@ Example:
 watchdog: watchdog@10007000 {
 	compatible = "mediatek,mt8183-wdt",
 		     "mediatek,mt6589-wdt";
+	mediatek,disable-extrst;
 	reg = <0 0x10007000 0 0x100>;
 	timeout-sec = <10>;
 	#reset-cells = <1>;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
