Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A7CC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 02:45:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E40B2072C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 02:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oglXFgiz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KLH4XnJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E40B2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FIgKZsEnMCco8y3h1RrX0E0KzGw/kSKQ6eXrGzvE4I0=; b=oglXFgizgne2MM1+wENyrQQjr
	4eUo/68Aajfonf4EafR7pYVIq4pNDYzgfZ+gUKFLnxJUhfWtrx4SEFO2le8H8nMKzbXrxr5kCu/IC
	KwiMlIXbKZXbN6l+JJ81Js4NJrlDSguZkfAQBbiVi/o0alIQP5V4Gs/0LIj0IKrVp4hUid+he1T8z
	ALJKTOPu2MMbCBP6ZcM8i17fJsMyuJO/Pq3E+KmZYFHTVOTlZsaKAMZzNYY0SDIYltP+eA7lpDpsd
	v0yqYaIDr/qQptBjSxIfLjxwdEwIhgDWseKR8mM/ru+Vy0sAjIcOGc3Sn872qFz0cRcogfkOsMnB+
	0KZqPdQmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRnpn-0003uB-3D; Mon, 12 Oct 2020 02:45:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRnph-0003re-Pi; Mon, 12 Oct 2020 02:45:06 +0000
X-UUID: d67924f6b3a44ab48e99971cfa6c9022-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AAnU5PlJeTlT3eOu0s04k2n54q0uEvfmgyB1oE18Bvs=; 
 b=KLH4XnJRQRzEtSN8+cMJR+xYU8919DLFjE0suc78eAI5zsyQvwzJe8mOwnShAfTpumI2PwTdbMcYfHXZQGwcaqsfJW4CSNGQaPylIXuS52FVjMbvFYBtNaOiNfeLoPsM2WHEIB1ECT3JGlArAhx4OW3PsXYTkDC0fjlnLtHZILQ=;
X-UUID: d67924f6b3a44ab48e99971cfa6c9022-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2027404755; Sun, 11 Oct 2020 18:45:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 19:43:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 10:43:48 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 10:43:49 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 2/4] mmc: dt-bindings: add support for MT8192 SoC
Date: Mon, 12 Oct 2020 10:43:43 +0800
Message-ID: <20201012024345.8361-3-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012024345.8361-1-wenbin.mei@mediatek.com>
References: <20201012024345.8361-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_224506_047224_1D80A58F 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8192 mmc host ip is compatible with MT8183.
Add support for this.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 21a2fce5b7ba..093db1c33653 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -29,26 +29,37 @@ properties:
       - items:
         - const: mediatek,mt7623-mmc
         - const: mediatek,mt2701-mmc
+      - items:
+        - const: mediatek,mt8192-mmc
+        - const: mediatek,mt8183-mmc
 
   clocks:
     description:
       Should contain phandle for the clock feeding the MMC controller.
     minItems: 2
-    maxItems: 4
+    maxItems: 8
     items:
       - description: source clock (required).
       - description: HCLK which used for host (required).
       - description: independent source clock gate (required for MT2712).
       - description: bus clock used for internal register access (required for MT2712 MSDC0/3).
+      - description: msdc subsys clock gate (required for MT8192).
+      - description: peripheral bus clock gate (required for MT8192).
+      - description: AXI bus clock gate (required for MT8192).
+      - description: AHB bus clock gate (required for MT8192).
 
   clock-names:
     minItems: 2
-    maxItems: 4
+    maxItems: 8
     items:
       - const: source
       - const: hclk
       - const: source_cg
       - const: bus_clk
+      - const: sys_cg
+      - const: pclk_cg
+      - const: axi_cg
+      - const: ahb_cg
 
   pinctrl-names:
     items:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
