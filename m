Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01F4C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 06:03:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5DD61935
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 06:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5DD61935
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vrPljneb2RUXsrP3x3oi54+8KyTyasS1IrcJQyLi+yo=; b=irt6LDHbdh8X7vBfhgvg9YkS+
	WEYMewOD8O9nJ00hqhvWKmsxEsb0bbvrvwvI44NRWxsxBjZzeKKGlazOlC9tWKWIk17+VGLNAomK8
	MkWG7tSkYx+kPtDDxB2LADnKiuJwClxA2FGrTAP+ySlK36ApU1VcaPuTBt9yIT9eo3C4tI0bRELCB
	qcesm7qdC7NoNglwBd5Hlp2GvG83QYEOL6CWn+MDeMaImhWRMFzYe4TPSaMOab6SvbugjBv8V0EVK
	6mZL+PYQxwolxjPbuo+Rt2NqiMMkH4DMkgH3giE6+gSgt6SovBxmx9gkUihg69BjBEGCDG8a1bc7D
	1y2u6Zltg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7TA-002oFM-69; Tue, 30 Mar 2021 06:03:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7T1-002oDD-9S
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 06:03:09 +0000
X-UUID: f617a6e30c1c4d0dade39167975137a8-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mPa9cL2V9oUMsKWC/FWck4IK+Opmcl0ho0sWnHKMQlM=; 
 b=V8NOZOprQnezc5a92/Zabhvo/VH3pPYXAUrcqRe/c1mgOxLiLbv98uAn011wO1fduOSQGri0+AlKN5DReTbYzFTCy603Kp9QdVz93TXKt1m6scbHvpWQL/HglxIjlWKENpxN2yywL8fxWIeaj0VQrvXLfB8Qysq0RcsLPwGqKtk=;
X-UUID: f617a6e30c1c4d0dade39167975137a8-20210329
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 824379424; Mon, 29 Mar 2021 22:02:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 23:02:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 14:02:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 14:02:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 2/4] dt-bindings: usb: mtk-xhci: remove redefinitions of
 usb3-lpm-capable
Date: Tue, 30 Mar 2021 14:02:35 +0800
Message-ID: <1617084157-18652-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C91CFBDCD624F0ABB3B58D9B33BA2E569C6B2B173BACD4C277B13AA25AD915392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_070307_877261_26B425D2 
X-CRM114-Status: UNSURE (   9.14  )
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

The property usb3-lpm-capable is defined in usb-xhci.yaml which is
already referenced in this file, so no need 'description' and 'type'
anymore.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: new patch
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 291749f49f35..69c3e7d0f9dd 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -100,9 +100,7 @@ properties:
   vbus-supply:
     description: Regulator of USB VBUS5v
 
-  usb3-lpm-capable:
-    description: supports USB3.0 LPM
-    type: boolean
+  usb3-lpm-capable: true
 
   usb2-lpm-disable: true
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
