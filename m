Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D38C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 12:47:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9062A6109E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 12:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9062A6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDb7c8HE0PbrkX/dtRn1OpgRuIEyx8D7QDqF5WkTd8c=; b=tumU56jwyOCd/U
	VsUxIbgDUcfjvdMMiOpYG4Ty7oRiWeC2Fsgyj/N/8Ey5Cd/Qz2qDN6YNm7NlyUoTt1x2Sg1jcw+5x
	iLPA/+VwkxWbikFYzxrZqsasY0Bfq++ReMnBnW7HMcFCQHS4EmGJw0JwiXmmlyYasr45btIBa2A5Z
	1RmGDMHevqneq7aBEdBNYw1xq8VuBEnxndXL4tvzlS7ykZ8bXM2WKEoNyi76Y1URU76Vo+SRwn6Vx
	ko48qhyTW1Yv0tyAiGFYN+uihyP1w+4xiHWxZrnxRFwZjtcu6cHaT/DmD7X0aLrXkDi+HANV1Cg8p
	j6vHOvXPBGsN96OpX3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7qb-005koh-Ot; Tue, 14 Sep 2021 12:47:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7o7-005kF4-7d; Tue, 14 Sep 2021 12:45:04 +0000
X-UUID: fd69a7ffbfe54dbca2b621e697892f10-20210914
X-UUID: fd69a7ffbfe54dbca2b621e697892f10-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 15583568; Tue, 14 Sep 2021 05:45:00 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 05:34:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 20:34:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:34:56 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fengquan.chen@mediatek.com>, <tinghan.shen@mediatek.com>,
 <randy.wu@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <christine.zhu@mediatek.com>, <joe.yang@mediatek.com>,
 <zhishuang.zhang@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: [v3,
 1/2] dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst support
Date: Tue, 14 Sep 2021 20:34:53 +0800
Message-ID: <20210914123454.32603-2-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
References: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_054503_377420_3F273BE5 
X-CRM114-Status: UNSURE (   9.62  )
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

This patch add a description and example of disable_wdt_extrst
element for watchdog on MTK Socs

Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index a4e31ce96e0e..0114871f887a 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -22,6 +22,7 @@ Required properties:
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
+- mediatek,disable-extrst: disable send output reset signal
 - interrupts: Watchdog pre-timeout (bark) interrupt.
 - timeout-sec: contains the watchdog timeout in seconds.
 - #reset-cells: Should be 1.
@@ -31,6 +32,7 @@ Example:
 watchdog: watchdog@10007000 {
 	compatible = "mediatek,mt8183-wdt",
 		     "mediatek,mt6589-wdt";
+	mediatek,disable-extrst;
 	reg = <0 0x10007000 0 0x100>;
 	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
 	timeout-sec = <10>;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
