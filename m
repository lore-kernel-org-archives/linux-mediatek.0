Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB1E95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3szfno1UBqprufN7RQz06YJGyjjH2OZ/gzFz/4X1ss=; b=xaeuS8pFn7ET9XC+fITZS5osad
	ZRTxwHdhZP53SbxIejS2NKNuLfawE/vSJu42UuBkopzKZHuT1YeoFZ1cpIfRTIpC4Hd8aKWo1zBc6
	XKLP8S4T3JGckC0MFj0k5bcgp+TeWwX0mm0rX0XqlbsBhHcf8iICwbOfLLRAi6lNTb2rTuE1npMHG
	SIco1/kENy+eKRaGDz/mMUr4QHSfvzTl+fFe4BV4gl/uQAtypOry1Q3NPHbeg+LOb0k3qtu1OvUlC
	NGRE6lI0iW5T+3Ycq4ZzYaehJ2VgMyV+9o/24q9q9QXAdKzRqXyzvBrSgMbZceKmG7r6pYiTYammm
	V1AVkg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qply0-00A0lH-0C;
	Mon, 09 Oct 2023 08:50:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplxw-00A0jz-1D;
	Mon, 09 Oct 2023 08:50:17 +0000
X-UUID: dbcddf72668011ee86758d4a7c00f3a0-20231009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=P3szfno1UBqprufN7RQz06YJGyjjH2OZ/gzFz/4X1ss=;
	b=m+HDPCGUeEwKHZW6yEOUOFkHnAj6nU0s60PGZAwGSuMTTLGdA2+rqAGS9zYOObfbZRaLBIZl7SnoznC04fQx/xDyXtMcNGNhzANXoUz+E1MkiILGySEzTmnK4TX5gToFRe9HhLZcwkCgMAeH17I7404+016NU4WkNy4RBzX9xws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:121b1c29-943b-4897-b026-0cea5c7fc992,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:a427d514-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dbcddf72668011ee86758d4a7c00f3a0-20231009
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 595852472; Mon, 09 Oct 2023 01:50:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Oct 2023 16:50:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Oct 2023 16:50:08 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Chuanjia.Liu@mediatek.com>, <Jieyy.Yang@mediatek.com>,
	<Qizhong.Cheng@mediatek.com>, jian.yang <jian.yang@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for controlling power and reset
Date: Mon, 9 Oct 2023 16:49:56 +0800
Message-ID: <20231009084957.18536-2-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009084957.18536-1-jian.yang@mediatek.com>
References: <20231009084957.18536-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015016_420103_1140E273 
X-CRM114-Status: UNSURE (   9.08  )
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

From: "jian.yang" <jian.yang@mediatek.com>

Add new properties to support control power supplies and reset pin of
a downstream component.

Signed-off-by: jian.yang <jian.yang@mediatek.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 7e8c7a2a5f9b..eb4ad98549d1 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -84,6 +84,26 @@ properties:
     items:
       enum: [ phy, mac ]
 
+  pcie1v8-supply:
+    description:
+      The regulator phandle that provides 1.8V power from root port to a
+      downstream component.
+
+  pcie3v3-supply:
+    description:
+      The regulator phandle that provides 3.3V power from root port to a
+      downstream component.
+
+  pcie12v-supply:
+    description:
+      The regulator phandle that provides 12V power from root port to a
+      downstream component.
+
+  dsc-reset-gpios:
+    description:
+      The extra reset pin other than PERST# required by a downstream component.
+    maxItems: 1
+
   clocks:
     minItems: 4
     maxItems: 6
@@ -238,5 +258,15 @@ examples:
                       #interrupt-cells = <1>;
                       interrupt-controller;
             };
+
+            pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                pcie-3v3-supply = <&pcie3v3_regulator>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+            };
         };
     };
-- 
2.18.0


