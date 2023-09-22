Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504F2E7D0D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgqu+3SeI9OFO9OZPPwA7hmQJEpL8yMn7OK2IZ2ZnWI=; b=iwjIMHhX5JjS0oJK8UgDDP8xxG
	TUk3zV5wW4QFrd4EJuGktZpJeg4zVjXpKLUQCxuYNJySrFk/dCZ+NIxlaOVWuRhVWvqZ0emgAlpyZ
	rbF8dNvYSd+leUGxL28KSL9uiE3pgBvw8biXKTmsNng7YWUnwp0zBOWOaLgUj8RlDDEdSvwPBfZ5/
	0oyN1uCW9/wd9a0zEfiuhQWy6Qmqmdk8RQEPfqIvcI/0Nx9YmcTFtwQbr+nOpgQrCI9IoDRmyRReU
	hqUYStF2OY/dvrf8vwrNjl2WgmpzH64A2A7ELg/EXhKYeT785YOsN9vDn6TJjZMCiiH64m5rcmh/Y
	Gp2ZG9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaU1-008AOK-0K;
	Fri, 22 Sep 2023 07:21:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaTh-008A4D-0U;
	Fri, 22 Sep 2023 07:21:32 +0000
X-UUID: a0bde74e591811ee86758d4a7c00f3a0-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mgqu+3SeI9OFO9OZPPwA7hmQJEpL8yMn7OK2IZ2ZnWI=;
	b=TvNEHDypiPmqwXHu73192a8AyM0DtueqtQ9Z2lSWsVk2AOwd9yT+hyZQPo/i+lawq5xfYIB8UybvKBHe+LPWhPTBe0z6DJpzaoXh/2DMa5KTm/Se7M7bnKpJDlGP1n3fJXSKD6xlRMaatKzKEK78+C36c8fj7gexdNvh+F47eOw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:9ed10ff3-00cf-4cf1-bfb8-669bf0fb67fe,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:392a24bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a0bde74e591811ee86758d4a7c00f3a0-20230922
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 608090088; Fri, 22 Sep 2023 00:21:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:17 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 03/16] dt-bindings: media: mediatek: mdp3: include common properties
Date: Fri, 22 Sep 2023 15:21:03 +0800
Message-ID: <20230922072116.11009-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_002129_206430_987439EB 
X-CRM114-Status: GOOD (  14.16  )
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

To minimize duplication and standardize the document style,
include the common properties for MT8183 RDMA.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++-----------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 3e128733ef53..0539badc9821 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek Read Direct Memory Access
+title: MediaTek MT8183 Read Direct Memory Access
 
 maintainers:
   - Matthias Brugger <matthias.bgg@gmail.com>
@@ -18,62 +18,27 @@ description: |
   Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
   for details.
 
+allOf:
+  - $ref: mediatek,mdp3-rdma-common.yaml#
+
 properties:
   compatible:
     items:
       - const: mediatek,mt8183-mdp3-rdma
 
-  reg:
-    maxItems: 1
-
-  mediatek,gce-client-reg:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      items:
-        - description: phandle of GCE
-        - description: GCE subsys id
-        - description: register offset
-        - description: register size
-    description: The register of client driver can be configured by gce with
-      4 arguments defined in this property. Each GCE subsys id is mapping to
-      a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
-
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-  power-domains:
-    maxItems: 1
-
   clocks:
     items:
       - description: RDMA clock
       - description: RSZ clock
 
-  iommus:
-    maxItems: 1
-
   mboxes:
     items:
       - description: used for 1st data pipe from RDMA
       - description: used for 2nd data pipe from RDMA
 
-  '#dma-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
-  - mediatek,gce-client-reg
-  - mediatek,gce-events
-  - power-domains
-  - clocks
-  - iommus
   - mboxes
-  - '#dma-cells'
 
 additionalProperties: false
 
-- 
2.18.0


