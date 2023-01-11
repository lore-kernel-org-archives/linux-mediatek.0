Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C6DC5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 03:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1367LjRdABOqy7A1vYGcZQlo1pAjOhv0VoFEG4f6qM=; b=BQsoV/ZJWGVkPYYhZRRBDujUjU
	1GguaWk6b7qrIfuAu6IeJZlBheR/6fGLn3NjyuLyHRjjeZ94Y8L4ZQ3KqdYG2tC/X4sM7vtns7lM0
	+YzBA6IS4ndA2jMU7FPgWU/0WOQw+xaaVcAFLrRdqsdt+JOoH3xJbiw5fr9Zobu3nUoZqmtvPhPb7
	PxCdZETZAk0/GNhrW0By5zYhMXcBGSLORzSeDvOyoKheJHPE3DB8EGSUddRIIfonB+yk4gIVnTA6m
	/gND3poGHWvWaeI+h9M+IIfMk4VhOcz8LQMyyRIS8jtwjdtNMTg9AIam8rp6W6+yQLgHwAeifCRH0
	XrV7NFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFS7L-009S70-Vm; Wed, 11 Jan 2023 03:49:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFS7B-009S3s-Ju; Wed, 11 Jan 2023 03:49:26 +0000
X-UUID: ec852a12916211eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Q1367LjRdABOqy7A1vYGcZQlo1pAjOhv0VoFEG4f6qM=;
	b=l4b0lZgM4FrOxeGQtY/4FwyKJjZRG1Gg1vGv2V2dFXfZfn+qm1sZqnux5tnXB0IQf9m4sTzWb1RPYfI2gtHRkXJ2sv8s050/qpvQz8jfbC9t+qr/+MvSCE3X1+Mw+LLL8pOA8FeKJVIcn4AivUql6u1VxcxVxEirSIhokNouS0I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f0529030-61a0-4acd-9b4c-742f9b3a8e97,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:d6c7e78b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: ec852a12916211eda08d4d6090ec5a5c-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 482633789; Tue, 10 Jan 2023 20:49:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 11:28:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 11:28:41 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
	<ryder.lee@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>
CC: <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<jieyy.yang@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <david-yh.chiu@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add support for controlling power and reset
Date: Wed, 11 Jan 2023 11:28:30 +0800
Message-ID: <20230111032830.20447-3-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111032830.20447-1-jian.yang@mediatek.com>
References: <20230111032830.20447-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_194925_678635_8CC538A1 
X-CRM114-Status: UNSURE (   9.80  )
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
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 7e8c7a2a5f9b..46149cc63989 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -84,6 +84,29 @@ properties:
     items:
       enum: [ phy, mac ]
 
+  pcie1v8-supply:
+    description:
+      The regulator phandle that provides 1.8V power to downstream component.
+
+  pcie3v3-supply:
+    description:
+      The regulator phandle that provides 3.3V power to downstream component.
+
+  pcie12v-supply:
+    description:
+      The regulator phandle that provides 12V power to downstream component.
+
+  dsc-reset-gpios:
+    description:
+      The reset GPIO of a downstream component.
+    maxItems: 1
+
+  dsc-reset-msleep:
+    description:
+      The delay time between assertion and de-assertion of a downstream
+      component's reset GPIO.
+    maxItems: 1
+
   clocks:
     minItems: 4
     maxItems: 6
-- 
2.18.0


