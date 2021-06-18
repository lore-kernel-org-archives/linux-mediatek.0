Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378FEC48BE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0296A613D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 09:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0296A613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8KxIP2Rr8/Ig01Bcb0IaJK5JlCD6l2wrpGlc4U2asA=; b=niE6h3CYSx2snc
	8Z2oSv1K2wd5RseESUMDg760sd2xYar5CoOr6jzv5JjlC5py07g6oUhMf64u4+EdXAiD+3CX3DRP4
	ZSm1ZY+q/02Ga/OOD+soF36WVXpKrHvXH2smYcY0UMFujtp3DNKjo2urRUI9FLBkTzKtFmE20PNOC
	23l1N9B2SpGy3gXVRs7BbML1qQIdhPd3odAjYgmf6QRotIX9OatG4dxBqsU0YTQo5m23WZHYi4iMF
	E+OisJqLE4waklNmZDoykbPpqXghg+I8Y0/qwD0ckNq3TyKrUvKV3AKscXukcqaps101O/TtlofKq
	hU6nsIwCnk1qhw4Aizbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luAp7-00DSmW-KA; Fri, 18 Jun 2021 09:30:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luAon-00DShj-Eq; Fri, 18 Jun 2021 09:29:46 +0000
X-UUID: 24878f7bf49e40319a4f2db4e6eaf817-20210618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZhIKHmi7ExHBxGLJfReAej7Icbg3xQIRpUfSThjjTRg=; 
 b=W2Tl8/GIYn0zBQvrdhrnKV8pI+/Lr+waP22gaKADMU1HvJKLV191OCqADjSXoU/0cbtKeCw0FVtH3CixPAf0RhNEy8ZQyNbdudGiastVi53Mb/uP3HNLiJ7TF4p+hX86BXce0qUBPcWnT/SZqMV3Y7zv7tuBPvzfTvamD0UJ1MU=;
X-UUID: 24878f7bf49e40319a4f2db4e6eaf817-20210618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1288673189; Fri, 18 Jun 2021 02:29:37 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:29:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 17:29:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 17:29:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/13] dt-bindings: usb: mtu3: remove support VBUS
 detection of extcon
Date: Fri, 18 Jun 2021 17:29:06 +0800
Message-ID: <1624008558-16949-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 683F4A938518A05BE0FAEA58AB85DE011FA94647943A74AC8979B9B37CEBA1692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_022943_075247_D2A1A815 
X-CRM114-Status: GOOD (  14.66  )
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

Due to no platforms use a multi-funtion pin to detect VBUS
status until now when support dual role mode, prefer not to
support it anymore;
Another reason is that the controller doesn't support idle status,
the dual role port works as device or as host, using an IDDIG pin
is good enough, this will help to save another multi-function pin;
And fix a typo of 'neede';
Last modify example using VBUS to turn on/off device, for device
only mode, the driver doesn't get extcon.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 .../bindings/usb/mediatek,mtu3.yaml           | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index dbc7876e0a0b..2cac7a87ce36 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -106,7 +106,7 @@ properties:
   extcon:
     deprecated: true
     description: |
-      Phandle to the extcon device detecting the IDDIG/VBUS state, neede
+      Phandle to the extcon device detecting the IDDIG state, needed
       when supports dual-role mode.
       It's considered valid for compatibility reasons, not allowed for
       new bindings, and use "usb-role-switch" property instead.
@@ -230,7 +230,7 @@ examples:
         };
     };
 
-  # Enable/disable device by an input gpio for VBUS pin
+  # Dual role switch by gpio-usb-b-connector
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/power/mt2712-power.h>
@@ -244,13 +244,27 @@ examples:
         power-domains = <&scpsys MT2712_POWER_DOMAIN_USB2>;
         clocks = <&topckgen CLK_TOP_USB30_SEL>;
         clock-names = "sys_ck";
-        dr_mode = "peripheral";
+        dr_mode = "otg";
         usb-role-switch;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        host0: usb@11270000 {
+            compatible = "mediatek,mt2712-xhci", "mediatek,mtk-xhci";
+            reg = <0x11270000 0x1000>;
+            reg-names = "mac";
+            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT2712_POWER_DOMAIN_USB>;
+            clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
+            clock-names = "sys_ck", "ref_ck";
+        };
 
         connector {
             compatible = "gpio-usb-b-connector", "usb-b-connector";
             type = "micro";
-            vbus-gpios = <&pio 13 GPIO_ACTIVE_HIGH>;
+            id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
+            vbus-supply = <&usb_p0_vbus>;
         };
     };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
