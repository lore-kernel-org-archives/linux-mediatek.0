Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F72C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:36:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3CE61175
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3CE61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hXNphwNEU30sCI9UFrwCgRcO7xfIJX9ssNOUfFG9dq4=; b=f/PnWjuwaKvXa7lyViDwMYGdq
	e77aP9D/78znI6nY4GDH9Fa28nJS8LUQCbCQ9uMCI3Z5V73Way6eWmqPz8JmveG0s60I5SDJbG1v9
	lAXvXINpVeRM31t7yJPAebToDtb/pcmcJTKU/b87aMsW1LT/+KuPsI3EbVhBab9BJZVkKZzwS3d78
	iGEbOKI9EAFepsOtHPgWkRruFwuwZk03u2uKchHGCEkOheXXyQ/1lb0Vt6GLKunoLxRUqwR9nTRgm
	JQir2GfAf03GnBA8Sxhp7cwqF92WeER5xYisH9ifKS0f82LTSXLitwzSn/FUaqbSN3Xe9pkG4Qd7r
	WvRPf+hSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUR50-007VaS-23; Thu, 08 Apr 2021 09:36:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUR4U-007VOk-L2; Thu, 08 Apr 2021 09:35:37 +0000
X-UUID: 2e083db8d5df41e0af0cac7bc3490001-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KQicy9tzOMbaOrFDFe8vOZDm5S0hg/1Q5DsA9BUDVHc=; 
 b=Gdh+mS1vl8vJdDYRe+ww9qojyFiHLRyMOVxsl/4htzrgMLOrWWXuG6leqp5J+jLOz1wa2CZfUAZ8CV+rDw6Topv1r97Orjwi7NY7B19I9r4RH2oojK6uToMg1OTcsJbYE6PjjSjDEoTk/ve5a/Idx+QrdvaxhrtOmshKua56l+U=;
X-UUID: 2e083db8d5df41e0af0cac7bc3490001-20210408
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 592275722; Thu, 08 Apr 2021 02:35:23 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 02:35:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 17:35:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:35:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 3/6] dt-bindings: usb: mtk-xhci: add wakeup interrupt
Date: Thu, 8 Apr 2021 17:35:11 +0800
Message-ID: <1617874514-12282-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3096B407D65BE384D503761103EF3B00FBD4AE24FB6F11B1529F76C16CC3AC502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_103531_079647_932EF860 
X-CRM114-Status: GOOD (  10.88  )
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

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
