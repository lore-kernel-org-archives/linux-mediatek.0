Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F91CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 03:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNZXWzfsmMcPlkao4TjDfeTwQ0UG/EWtbm7EKYgAM5c=; b=naYscswh95Oo8L
	IkMwVaN+9No6C33lM/LZ13aL3oN8gA0SJB3E2S4KVdOhEo7ccB1GgooyUtAbl1Y3B1hjB2hkPUHX5
	bdypyYE4f8B2nfImHjQQOeOI53uVMwvWo+iXT4EG+uevOK0Q9mGBWEOE7MUgcSVNoPcUHEsaHgb5S
	I/4ITsg1uq77pjoHo2f7yhxPb90X0t31YAb+lnpd09TTZLrsZe6kbteIM3Ug3rqnz50ZtEZJf96H1
	Lr2HxPJ7zdQsBOAs2mNuwlWbK5GxKMnQdlReFO08ZTFVXFygWvqLOXKBae5ufY0Y3uN+e4KzLFKTo
	fRlw9y++6DXdmzP98l+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMhvo-00CS83-FD; Wed, 23 Feb 2022 03:03:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMhvi-00CS3R-RS; Wed, 23 Feb 2022 03:03:05 +0000
X-UUID: 610c40649df542b98dc475aae6304def-20220222
X-UUID: 610c40649df542b98dc475aae6304def-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1440600378; Tue, 22 Feb 2022 20:02:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 19:02:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 11:02:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Feb 2022 11:02:19 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: mailbox: add definition for mt8186
Date: Wed, 23 Feb 2022 11:01:37 +0800
Message-ID: <20220223030138.13939-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
References: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_190302_900131_D07D84E9 
X-CRM114-Status: GOOD (  10.42  )
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

Add definition of compatible and dt-binding header for mt8186.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 98fe37e8b17b..c2aeba63bd47 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -10,7 +10,8 @@ mailbox.txt for generic information about mailbox device-tree bindings.
 
 Required properties:
 - compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
-  "mediatek,mt8192-gce", "mediatek,mt8195-gce" or "mediatek,mt6779-gce".
+  "mediatek,mt8186-gce", "mediatek,mt8192-gce", "mediatek,mt8195-gce" or
+  "mediatek,mt6779-gce".
 - reg: Address range of the GCE unit
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
@@ -40,8 +41,9 @@ Optional properties for a client mutex node:
   defined in 'dt-bindings/gce/<chip>-gce.h'.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8192-gce.h',
-'dt-bindings/gce/mt8195-gce.h' or 'dt-bindings/gce/mt6779-gce.h'.
+'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8186-gce.h'
+'dt-bindings/gce/mt8192-gce.h', 'dt-bindings/gce/mt8195-gce.h' or
+'dt-bindings/gce/mt6779-gce.h'.
 Such as sub-system ids, thread priority, event ids.
 
 Example:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
