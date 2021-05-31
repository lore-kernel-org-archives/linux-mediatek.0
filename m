Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C52C47092
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 01:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB8461090
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 01:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB8461090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvYRAIjgSPcd/GE6lgwTFO7NjV/OGc20ak4xXwqatwU=; b=hXCSCXML72GiTC
	Ugh5kgeWH9SrcJQkOrh3QYmDzMFbzvmPyJh2ielEcO3TfQy1qUYrVq192txBRTj7QPL/WQtAiwIkl
	K7hywxgesAvBy8eoyaSnug3pffYHPzK5uT+TSpLmoS50DQxkuDnM9BsHrK55KmG3K+1uSGSqlCrhe
	wiboYg7upeQnLXUk46l0yTy7WCzC7yh38YuIsOmGMhrfcoV8abrF+STzGI8kJSTTBib0Wv2bpZt8D
	1Y6STwo7bBQOpewfMFSM5wHiC/duu2OPmTXaKfN1OYFL92oW12TvbpyiQWxhElF2i3RvNrmohkPQg
	M/+GeHVEs0y8umTnXUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnX6F-00AROv-I5; Mon, 31 May 2021 01:52:15 +0000
Received: from mail-m17639.qiye.163.com ([59.111.176.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnX5r-00ARNF-6p; Mon, 31 May 2021 01:51:53 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 26F743801A0;
 Mon, 31 May 2021 09:51:44 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V9, RESEND,
 2/2] doc: mtk-wdt: support pre-timeout when the bark irq is available
Date: Mon, 31 May 2021 09:51:35 +0800
Message-Id: <1622425895-32111-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
References: <1622425895-32111-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGkoZGlYaQ08aGEoeGh4dSElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6Nyo5Kj8VERMdPAgXPygI
 CSEaCwFVSlVKTUlJT0lOQktPQ09JVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFJTElJNwY+
X-HM-Tid: 0a79c01ea570d994kuws26f743801a0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_185151_432666_D75A88FC 
X-CRM114-Status: UNSURE (   8.73  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add description of pre-timeout in mtk-wdt.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60..8e27777
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -1,5 +1,8 @@
 Mediatek SoCs Watchdog timer
 
+The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
+before the expiry.
+
 Required properties:
 
 - compatible should contain:
@@ -17,6 +20,7 @@ Required properties:
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
+- interrupts: Watchdog pre-timeout (bark) interrupt.
 - timeout-sec: contains the watchdog timeout in seconds.
 - #reset-cells: Should be 1.
 
@@ -26,6 +30,7 @@ watchdog: watchdog@10007000 {
 	compatible = "mediatek,mt8183-wdt",
 		     "mediatek,mt6589-wdt";
 	reg = <0 0x10007000 0 0x100>;
+	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
 	timeout-sec = <10>;
 	#reset-cells = <1>;
 };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
