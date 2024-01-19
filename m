Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22994C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwZKZUjRjs3XCXeM2yTPtJdlhSE2Am3dRvCgFqrlgko=; b=Js+L+PuEahBFhMCEftK8yTQHbN
	UxiEv7vSgzHzpvKwv1cXam02aDAL8uzMp/9elyHBVIkd3LheTyuGRAvIYHXdBPAegwzKrU0cMy2uN
	17HIHeRsNateGjecTQDNvPAuegdiCS5CZTTN/MJC0zlKxuV1FJ27c+9x8zVpld4Va2V3AIDJUBTtx
	NF2sT9YAZh5PXCQPH+kw1K2Rsf7IhhIFk3HTo82N/gkF/XTpiW9oSAsf3q5Gy3x9icUd7S8ZE09/0
	Z58KrIY7HRZE6mJ9YP3JgddOcKIio9Dw27IjJjn1GdoJFURiQeMHWlHgy1EmTrCCuRdqPLVFCnWCH
	6rUbUq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlND-004zTK-0X;
	Fri, 19 Jan 2024 09:41:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlN8-004zSe-3D;
	Fri, 19 Jan 2024 09:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705657269;
	bh=0cDiESFvb7qa9miqI4BzCZ+472VCEQGuIk9jkGeCoRw=;
	h=From:To:Cc:Subject:Date:From;
	b=4TpAef1mYqd/vXLVqPxRe+vRI+fmsaz79QlIT5ypjuDI09RFBTsEZM6vwSCyZRpfC
	 JW7ULhVzEtdRVphkjqkhLQpFGtHSXq/e5nbCAbCv//33K4hFSZM9ApTPMwguJ6oVRp
	 A3d5MekwJLbfuZ5xzzPG6GreWj980WVOH86OHxtcMw5ADzYrzGROfjVGSFYledLfQv
	 u7BPKoGXRGUmAU94knmOFR6rd/7reWdgPl3jLGkzRcswBjwXNnXZfpKUqpY6OcpUMW
	 Ffq8KkJ6EISw7LxSVAkMnAggqT4Bw8sfgv9ugvw6GY0OHBbClbDKtGcgR4uezKmaVe
	 HRAeHRMDAhWiQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7088D37811F1;
	Fri, 19 Jan 2024 09:41:08 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	cy_huang@richtek.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop interrupt-names
Date: Fri, 19 Jan 2024 10:41:04 +0100
Message-ID: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_014111_186591_B5A6235E 
X-CRM114-Status: UNSURE (   7.14  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This IP has only one interrupt, hence interrupt-names is not necessary
to have.
Since there is no user yet, simply remove interrupt-names.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml        | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 053264e60583..339bc9c00ac0 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -22,10 +22,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  interrupt-names:
-    items:
-      - const: PD_IRQB
-
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml#
@@ -58,7 +54,6 @@ examples:
         tcpc {
           compatible = "mediatek,mt6360-tcpc";
           interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
-          interrupt-names = "PD_IRQB";
 
           connector {
             compatible = "usb-c-connector";
-- 
2.43.0


