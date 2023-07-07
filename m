Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0183C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 05:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AezGOQP+D1v1bzBCXXR0/e4pZGQQF4EFtfBU/9TBFe4=; b=c/MPIFjsXWjjbw6qMHuLQPXq2k
	E1RJqZ0iO5sadIoPz4JcAfbbrN2sigjcIJGYLvPHaGPko+vyd7C050K4jVlvIf0ce5DNBbpCkO4KX
	qUMxoJY5iKCzxfenyjYZiTF7F4CB1Npof7m3KBueue0+tZTigKOt0L9WqyKNVcm6N5QVM9r/dzbfr
	8QR9jiojtfOPP5bxMGr7/PEMGttjauGr23v7FtWACaJd1twLxkSmBqbteGrn/5FZCU4JwHRqBYgU0
	wdHNdwBLFy2Od824IJHbOrz9E4tkXWUpy5IGyFbkoBgmN+vWqFzCrQr7NyyInOusKlprCviEEdrJK
	Xxhd8kyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHeJS-003f67-0n;
	Fri, 07 Jul 2023 05:47:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHeJO-003f4c-29;
	Fri, 07 Jul 2023 05:47:24 +0000
X-UUID: bc0fe2701c8911ee83ed1395ce914268-20230706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AezGOQP+D1v1bzBCXXR0/e4pZGQQF4EFtfBU/9TBFe4=;
	b=pHYA2kXBvPlBHxUo672BdUtFz2FK/1D9xsymN076WOf6yRlzhU0gk0NHHUSEVFXEkfTwkUF+pYiuyDOVGyFDLFGADIBZPNhZzGZKE6Xk9vLGlTIf4U88dGpphLZCWPpdPSTLMWfzrGQvIqsyIlE+KTFyTZQ94dlS1i27ZZb7H7I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:6fcb9025-1a71-4462-91dc-a342ee0874ec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:b7a0aa0d-26a8-467f-b838-f99719a9c083,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bc0fe2701c8911ee83ed1395ce914268-20230706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1090411555; Thu, 06 Jul 2023 22:47:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 7 Jul 2023 13:26:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 7 Jul 2023 13:26:14 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14 01/12] dt-bindings: remoteproc: mediatek: Improve the rpmsg subnode definition
Date: Fri, 7 Jul 2023 13:26:01 +0800
Message-ID: <20230707052612.27521-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230707052612.27521-1-tinghan.shen@mediatek.com>
References: <20230707052612.27521-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_224722_710869_4E928F94 
X-CRM114-Status: GOOD (  13.33  )
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

Improve the definition of the rpmsg subnode by
assigning a distinct node name and adding the
definition source of node properties.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 895415772d1d..271081df0e46 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -58,6 +58,18 @@ properties:
   memory-region:
     maxItems: 1
 
+  cros-ec-rpmsg:
+    $ref: /schemas/mfd/google,cros-ec.yaml
+    description:
+      This subnode represents the rpmsg device. The properties
+      of this node are defined by the individual bindings for
+      the rpmsg devices.
+
+    required:
+      - mediatek,rpmsg-name
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -89,21 +101,7 @@ allOf:
         reg-names:
           maxItems: 2
 
-additionalProperties:
-  type: object
-  description:
-    Subnodes of the SCP represent rpmsg devices. The names of the devices
-    are not important. The properties of these nodes are defined by the
-    individual bindings for the rpmsg devices.
-  properties:
-    mediatek,rpmsg-name:
-      $ref: /schemas/types.yaml#/definitions/string-array
-      description:
-        Contains the name for the rpmsg device. Used to match
-        the subnode to rpmsg device announced by SCP.
-
-  required:
-    - mediatek,rpmsg-name
+additionalProperties: false
 
 examples:
   - |
@@ -118,7 +116,8 @@ examples:
         clocks = <&infracfg CLK_INFRA_SCPSYS>;
         clock-names = "main";
 
-        cros_ec {
+        cros-ec-rpmsg {
+            compatible = "google,cros-ec-rpmsg";
             mediatek,rpmsg-name = "cros-ec-rpmsg";
         };
     };
-- 
2.18.0


