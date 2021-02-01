Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2FEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:00:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7692564E2B
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7692564E2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFqP7a2M3SnCTD6eOuycK/+2V7OgAqQFzDVoNO3sSBk=; b=hmwXugE422rRosC21Jsot86KG
	PIENmwFR7ywBxROcS6nRMpAPNMmQQBbZ3yKRIhabqXcSlysuBanfHoM6l0bZHowMYX52lT15Xy4bc
	X+dUqke8oFAjCiH1aj0BGnCMvf41LQJhRsEsoiSH7BtWqHsxKwBdRg6KOd5pjyKZHdSNWfqPypXor
	OUy7fI6WZyJGCh1ipvRyHW7Qg/Sxum+QJywg45wmC0AeGbnnDHf/RbpZC66yzDUCIQuNy8axog4xw
	A9wRwMziZaX5WTq1lcxbxGWodFCTqwJZUgDXVpewfUMKmIACoHvttxVmhuG40EfN6ATXgFgaQk4b/
	u4roaJ6Tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TCP-0001eY-2F; Mon, 01 Feb 2021 07:00:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TCJ-0001d2-J1; Mon, 01 Feb 2021 07:00:35 +0000
X-UUID: 45b07ec741e843f186793f8094d27b67-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UhlhXIXKE5s64298tbHlRuE71NSbu0o8CWqRTu2Bzhc=; 
 b=aBX66KsqfJZpwOh3ZCf5jnWAgNFXHzBvAe62DqdklEjuwf4el0xZpo7Edi2IIfrpnEDAO5narEf+QpXxah8ybWw7OIky3yPCgNwoXmFu6sUkkh1Lgn7/CSBbn6D1dTDw/BgRVMiX+6zjJMiS7oa3GYteL4HIE+K7tfn7EsKRq5g=;
X-UUID: 45b07ec741e843f186793f8094d27b67-20210131
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 389434389; Sun, 31 Jan 2021 23:00:28 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:24 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 02/16] dt-bindings: usb: mediatek: fix yamllint check
 warning
Date: Mon, 1 Feb 2021 15:00:02 +0800
Message-ID: <20210201070016.41721-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1337AA850911A56D2596727B7AEE040A8D22A95BD71EB5C3EA060D0DE231915F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_020032_412630_AA0E3675 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix warning: "too many spaces inside brackets"

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 2 +-
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml    | 6 +++---
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 38b1fe18aa79..a3817f3af59d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -139,7 +139,7 @@ patternProperties:
     description: The hard wired USB devices.
 
 dependencies:
-  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+  wakeup-source: ['mediatek,syscon-wakeup']
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index f5c04b9d2de9..66d78f534722 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -172,9 +172,9 @@ patternProperties:
       example if the host mode is enabled.
 
 dependencies:
-  connector: [ 'usb-role-switch' ]
-  port: [ 'usb-role-switch' ]
-  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+  connector: ['usb-role-switch']
+  port: ['usb-role-switch']
+  wakeup-source: ['mediatek,syscon-wakeup']
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index 790efe8b6274..a515c9f30b96 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -66,8 +66,8 @@ properties:
     type: object
 
 dependencies:
-  usb-role-switch: [ 'connector' ]
-  connector: [ 'usb-role-switch' ]
+  usb-role-switch: ['connector']
+  connector: ['usb-role-switch']
 
 required:
   - compatible
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
