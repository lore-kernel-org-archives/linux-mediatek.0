Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF28C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:14:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD356192D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD356192D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TCFwsSjqVsFGKVIXUEUTYuUHYHpNS16CGZOwQG/ICTw=; b=cLBPtWI8BdPYLasUjfwU23zZH
	AlXI/m5BKZuDbuT1cjgbwTpmE2CZFjSONoWtPGtop0sixnHRdTykUAeFxDGnfLDntepPCpng3wxkQ
	0a0MxqJ1wCuUmvjxj4q1CEyD+jUHf9YZHmwnHUaYBUJQhANdu0EW+Ss218r22U3hAvtB15wZXs8jU
	CtA8cQaSF2TROo6EbnkMQdTwJ6t6aw7TD4aVMSh2OnIZs8z5OIjChMtKrNzD7zY9W26nlP3Hmobwk
	TLsvmLkdJMTw7Ljih7dgjFTX3K8YhnjFR7MNWmQHkZhxYwwA25iDifIot/iYQb3x+batL6x7tb6Je
	CHEaFF+Tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOB1H-00Akaa-9G; Mon, 22 Mar 2021 03:14:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOB15-00AkXa-2r; Mon, 22 Mar 2021 03:14:13 +0000
X-UUID: dccca15c4ba74eb585a4e63c7a1476b1-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZjrrsVAKzhAELZIOi8MnbKRTkIo1m87F+okUcuji600=; 
 b=r13v1JqTnyRZid/FfwC1M8zYALFl4u6sTTO9IuXyPl/W0gFafOHMImP+HIWRo/HpdcqSZmDoXPqO/y9AxbPaEdPdfe2o306L/DvD/iKfbYaPSX21HQIggqXtQaoBxGbDbxJYd3kRPqbqYXoXsSH0UVs5uxIt1pBxK6RR0vc+cMM=;
X-UUID: dccca15c4ba74eb585a4e63c7a1476b1-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 332330281; Sun, 21 Mar 2021 19:13:58 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 20:13:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 11:13:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 11:13:55 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 03/13] dt-bindings: usb: mtu3: support wakeup for mt8183 and
 mt8192
Date: Mon, 22 Mar 2021 11:13:42 +0800
Message-ID: <1616382832-28450-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_031409_165557_CFB610B8 
X-CRM114-Status: GOOD (  14.29  )
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

These two HW of wakeup don't follow MediaTek internal IPM rule,
and both use a specific way, like as early revision of mt8173.

Due to the index 2 already used by many DTS, it's better to keep
it unchanged for backward compatible, treat specific ones without
following IPM rule as revision 1.x, meanwhile reserve 3~10 for
later revision that following the IPM rule.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtu3.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index f5c04b9d2de9..918f9d6447c6 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt2712-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
+          - mediatek,mt8192-mtu3
       - const: mediatek,mtu3
 
   reg:
@@ -152,10 +153,13 @@ properties:
         - description:
             The second cell represents the register base address of the glue
             layer in syscon
-        - description:
+        - description: |
             The third cell represents the hardware version of the glue layer,
-            1 is used by mt8173 etc, 2 is used by mt2712 etc
-          enum: [1, 2]
+            1 - used by mt8173 etc, revision 1 without following IPM rule;
+            2 - used by mt2712 etc, revision 2 with following IPM rule;
+            11 - used by mt8183, specific 1.1;
+            12 - used by mt8192, specific 1.2;
+          enum: [1, 2, 11, 12]
 
   mediatek,u3p-dis-msk:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
