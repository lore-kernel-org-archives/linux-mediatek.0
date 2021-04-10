Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547D2C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAE80611AE
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 05:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAE80611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qAbJjBkrtqnN59OrQNdWTAx4C0odmYYgRHDuQmwDJ8s=; b=nk6DeT7Y0IYcnsff+cEgiMqrQ
	LFZ6y0FFUBNr0D6Fa/HPcD8IkyIE3QVPFo+4BzGL3SiYaD8FDs9dBfBjpdA2awywhFzkmG1nNiNEs
	dXA1V4ln6im8GKnFy0RAqhnf8pyDQKzfHoy4QSeH2NC+rnOec+QjhCVXvq7COBW5YR8x3H6gi0XTS
	oEcYOLt96rdoSJ30N8cYXaLFsmAS+azzJ7zZAHIXpza1YX7/sEwfDDT0lXEpJY8/snqbR5cBzDSwO
	n7XIFoOhnS/BqTz1bbOFGyhf5hz/r+tJSScwqy0Ukrma87nxDpneUU3TAfrz86HMxD1U0MvehOxBw
	+UIoqwDxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV5uG-002By5-PC; Sat, 10 Apr 2021 05:11:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t6-002BnD-3c; Sat, 10 Apr 2021 05:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Jqu5mgmnwtoA/IJe+oC6Vlro2lgKuNDVMxjmkW3RzQw=; b=3xBs9/al2JdRDTtZSvXMHUQLl1
 sdMlyiIKuAtst0O5/WD3or8xAthBFsJlicfn6EgEYkwYqfvEhKqbmmMi9IHnr1tUJ1i0fpYA6lGmO
 Y2l0s6LUSSTeGSAaDQ/Zthnm0TyfaPY8hrgXY3Nvqfeo0Cr+LSBx60aDxzv8nEhCz6wA0d3iU3tJ0
 QHqRc3t/6l8DT52dNJgxpMk0GdkdwULENQBEqWUy8xrv2lyZHU6SjlWPUgx5tvXJHPyFgrCDbdgwX
 O4OW4pBK1Tkxkmn5nKvV67plASSjlwWF7ndYkzEtKqbOyzM9unbRYUvfjClU0H2HfdHMnuOetdBeH
 JTeCMzDA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV5t2-004wG6-Kj; Sat, 10 Apr 2021 05:10:25 +0000
X-UUID: aec4f3f5b6a446b0882928d5553b6309-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Jqu5mgmnwtoA/IJe+oC6Vlro2lgKuNDVMxjmkW3RzQw=; 
 b=fkbUdwUANkS5x5R/SdqMu/ZUgH6Uu4uEtBH5JBOSRI/GQBZ2EpIKxrruU/19y8LmvnS/KoiH5A/6WQchuCx5KpB5Kt54Xsjj34Km+3Re9XwSVg5e4kPRCYD77n68W2CUU11lKmt3hH4W6za/uDRhJgCxOzOqFgIc4Aetj+wm4RM=;
X-UUID: aec4f3f5b6a446b0882928d5553b6309-20210409
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 269019712; Fri, 09 Apr 2021 22:10:22 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 22:10:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 13:10:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 13:10:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek
 <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2 2/5] dt-bindings: usb: mtk-xhci: add wakeup interrupt
Date: Sat, 10 Apr 2021 13:10:03 +0800
Message-ID: <1618031406-15347-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1618031406-15347-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E17103FB531DAC6961A975A9761F7CACEEA0AA56C5433C513A7E3E175D64DE182000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_221024_705347_A34D5858 
X-CRM114-Status: GOOD (  11.50  )
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

Add an interrupt which is EINT usually to support runtime PM,
meanwhile add "interrupt-names" property, for backward
compatibility, it's optional and used when wakeup interrupt
exists

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add Reviewed-by Rob
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 45bf4ea00c9e..4fe8a301d03f 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -46,7 +46,18 @@ properties:
       - const: ippc  # optional, only needed for case 1.
 
   interrupts:
-    maxItems: 1
+    description:
+      use "interrupts-extended" when the interrupts are connected to the
+      separate interrupt controllers
+    minItems: 1
+    items:
+      - description: xHCI host controller interrupt
+      - description: optional, wakeup interrupt used to support runtime PM
+
+  interrupt-names:
+    items:
+      - const: host
+      - const: wakeup
 
   power-domains:
     description: A phandle to USB power domain node to control USB's MTCMOS
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
