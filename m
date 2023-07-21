Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F835EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 02:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GTgfHZrkSs0xnUZ/LSuab61h/gYO3SBlbVog4q7hk8=; b=zkUf79p9H8PXRVtK4u4RKxM5Ep
	Xen3F7MO3S0Ohvs2eysoir+piKS5Z7HZW3G/3IPFcBX98/8EXatq7094XZExOID0qp11IyGL6xNDm
	YnIGY+RgVIpkTTN7Cq+dJQf5fuN28CYR/ltknD1G4JM377x/z8NHXYZ5iSAY/3tvs+39H0ay++WZd
	46mXu4sd6IORZI7DRpHOGJGx7NHjzD3Upt/pVQqpf97ipeq0qQgLIc+7mBx1H6XXZXgWzw+YWdV25
	Ri7E4WZLWI1jXnhBWKEaWpVJgpOdqIlp8hQg+4KzwBBvICSgJOv/vEq+tG/8tw9El5NzO6asU0rUL
	jqFIRROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMg5j-00Ce0Z-0B;
	Fri, 21 Jul 2023 02:42:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMg5f-00CdzQ-29;
	Fri, 21 Jul 2023 02:42:01 +0000
X-UUID: 2634f1d6277011ee912e1518a6540028-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0GTgfHZrkSs0xnUZ/LSuab61h/gYO3SBlbVog4q7hk8=;
	b=Z62fCUfh1fOj6pjKtKMeL5+IbqVdsWICr0II1gO0DEiVXvTmA8XXcOkbxr9KU1bg2389S4wyeaHn+eMGkKb2MzZbM4MZQaaLiHY9JOXEQ5ZWIeixJuLB7DRIGSoBs4Y8luAXHBkByoBbpu179snKDlBOZzFdF3r2X+EQTjm9NqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:3e7717f3-2164-4e92-b7d5-ebb4742fce79,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:d611de87-44fb-401c-8de7-6a5572f1f5d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2634f1d6277011ee912e1518a6540028-20230720
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1620540676; Thu, 20 Jul 2023 19:41:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jul 2023 10:41:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jul 2023 10:41:49 +0800
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
Subject: [PATCH v15 01/13] dt-bindings: remoteproc: mediatek: Improve the rpmsg subnode definition
Date: Fri, 21 Jul 2023 10:41:20 +0800
Message-ID: <20230721024132.6548-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230721024132.6548-1-tinghan.shen@mediatek.com>
References: <20230721024132.6548-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_194159_714654_B750AEAA 
X-CRM114-Status: GOOD (  13.24  )
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

Improve the definition of the rpmsg subnode by assigning a distinct node name
and adding the definition source of node properties.

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


