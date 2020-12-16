Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC69C0018C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 11:53:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472032339E
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 11:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472032339E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2icqKZHWlhR475wfxE9uK0/eqEGmtN7L0z7Jj1sPHw=; b=DDvNmCDQZt4NTFiFRifaYcQT+e
	SPVTZiBeR8RD4fjfj8C5pKEGM4NQ9jdoz6rbTT3kB8ZRO+DEWhr5pK0CEfkGr/1emedygUDflN8Sm
	Q9hgaFkTWOrPWeqhixMMIGBN+TZfFJFjZ1CQmH/LzL0LMQ2F9VMMRMzX5HgchU1rJJ4yo1VE5311Q
	Lxbdw81548fa4mVK/YMPrRkfsKb/Pf576neTA+mUKHXIioitdY7IFI/a0SU3ocJ0RCYhwBWlITZdf
	9lSCXFT85ZMpa4NlsxCx+qywodkvgD47OE9H2FF3+Rub6XF4yyQZ+HxSZ883uWVRmtGWWjNaEpooR
	F0SQPVhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpVN2-0007NC-Jd; Wed, 16 Dec 2020 11:53:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpVN0-0007MC-BU; Wed, 16 Dec 2020 11:53:27 +0000
X-UUID: 753cd698edfd404abc39c96e025951f4-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uZ8IiL/fzdanWEFXnYLIQv+1Tb9+DTkbQHMVp3WgntA=; 
 b=eI+Iga8BaulgL3glbWJoMQC4DgO+EDId8yi73dLBjaVidgyQXCaMt2xY4g2Ib+qFfeyVEsM+vfusg5ilZdfVi2v0cusgnyDgn7E7ZWRin29fsxslRuGHgn55ENrSUpB6wW3tTnQVUBch4EGbKQPzXVPloFKe3ixUIJFxqcFNLUQ=;
X-UUID: 753cd698edfd404abc39c96e025951f4-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 877365994; Wed, 16 Dec 2020 03:53:23 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 03:51:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 19:51:26 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Dec 2020 19:51:25 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a new property for broken
 streams
Date: Wed, 16 Dec 2020 19:51:23 +0800
Message-ID: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 543A3BC3B3871456BBC367ADBF6CC8A1ECEF19BEE1819E94475040288A10DC482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_065326_562341_F1A4DA11 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The 0.96 xHCI controller on some platforms does not support
bulk stream even HCCPARAMS says supporting, due to MaxPSASize
is set a non-zero default value by mistake, so add a new
property "mediatek,broken_streams_quirk" to fix it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
this patch depends on:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=402773
  [v4,09/11] dt-bindings: usb: convert mediatek, mtk-xhci.txt to YAML schema
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index e5e03f902802..330f7294bf34 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -120,6 +120,11 @@ properties:
     description: The mask to disable u3ports, bit0 for u3port0,
       bit1 for u3port1, ... etc
 
+  mediatek,broken_streams_quirk:
+    description: set if the controller doesn't support bulk stream but
+      HCCPARAMS says support.
+    type: boolean
+
   "#address-cells":
     const: 1
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
