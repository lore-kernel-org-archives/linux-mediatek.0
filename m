Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A4AC63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:06:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C7D22256
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SlWW1cCr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ITcqDK6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C7D22256
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2tE/VlCiwEZhbB8K8Io42LOI18+aLsZwP742BiqUO7E=; b=SlWW1cCrAVPwjeJTLJAy0ZpFm
	pw+T+nRCcfmh0MzIn2MNA3L+BzxZMB0voDlqmvdfSpqpviw5akdIghCFsi2AZaaDQ9meDm/z+AQUq
	kUz+FLxzL4BTmMBmYReyTI4UlrajFXNNe/1yONSWHE4CxlJM3DR0c2Fg03eYPfEQC7hPUsx8jZkLa
	oXli5RcpR52s7WuyjS1jyFGrx/m/ip3B9cgR5bZyBtX85S9VM/svhzNdHKfLla1N7dyOg1faH3pHy
	y9vI3mDyOLN6kqACqTHCAhbKTfVjLAAAyGYLR8ykij4AD4oCYgDRCxao8oU2zdhVqpwd0TEbKa51H
	ORwHr0GYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwkp-0000TC-EI; Fri, 20 Nov 2020 03:06:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwkj-0000S3-I6; Fri, 20 Nov 2020 03:06:26 +0000
X-UUID: 3cab925aefee45f7a638037a04c34bea-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LrkZIvHcn+wrRlWb3LRzK4I6YXrU/NuxwXT4KuIyab0=; 
 b=ITcqDK6kwW8GApuwXwS+w6sLKRkxd84+GkNVNTYSriGqNYViaoyD2/jQD1dkf+WzQvhVabM4FukQPOfu0FGncbaUePUA/0ATDrKhIw0mPPg37qq2mxX8cVghhMfB1LHlILtk8jr+JLyhugCFVkqjFSXm6HT/Jr/zfYMvhAjBUis=;
X-UUID: 3cab925aefee45f7a638037a04c34bea-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1365437719; Thu, 19 Nov 2020 19:06:16 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 19:06:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 11:06:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 11:06:16 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt6359: remove unused property for
 mt6359
Date: Fri, 20 Nov 2020 11:06:13 +0800
Message-ID: <1605841573-1442-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DDC9A826DC1B14BDD756F49287CC87C9B10F08EA4E9D16A937B0F009B1940D902000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_220625_749711_83F24931 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 08651373808e16b01d3b12207f52504c17b6774c.
("dt-bindings: mediatek: mt6359: Add new property for mt6359")

Remove unused property "LDO_VAUD18-supply" in mt6359codec.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 Documentation/devicetree/bindings/sound/mt6359.yaml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
index ef027c79032f..a54f466f769d 100644
--- a/Documentation/devicetree/bindings/sound/mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -17,11 +17,6 @@ description: |
   Must be a child node of PMIC wrapper.
 
 properties:
-  LDO_VAUD18-supply:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      Regulator of LDO VAUD18 at 1.8V.
-
   mediatek,dmic-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
@@ -54,15 +49,11 @@ properties:
     description: |
       Specifies the type of mic type connected to adc2
 
-required:
-  - LDO_VAUD18-supply
-
 additionalProperties: false
 
 examples:
   - |
     mt6359codec: mt6359codec {
-      LDO_VAUD18-supply = <&mt6359p_vaud18_reg>;
       mediatek,dmic-mode = <0>;
       mediatek,mic-type-0 = <2>;
     };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
