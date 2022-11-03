Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D0EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 02:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkXsbhZ1C8Ne8ug6E4tBFfkzINbKPN88lCCIn+4lczs=; b=EFTLtP7ZqWjVvSetM5KZyS1xUS
	IGMH5w4wb9lTJIOpbSmO72S+bz7KdleXuHSbFY0VfFqg4GbeEfa01byhK2Vph+7kkgeI0Gc4ynXPY
	BOCvVxCPkAqDrOsV0S7lG9uaXRmAGb3qyo1hz9bSN3+zLu7TcO79qnUHd5F2UL/DKrIibUTt/hNr2
	GFDqcgOnBokcdRqZlHGvVK2Umcf5Hjkg59bnMKw0CkPb5xSEF3AqMWUj7MBfpGsPIj7k0zXoIlm3l
	REBOZxvIFCYAyECB1W9QHqRlbwlgpCHsxeGB9Uvx26TnW7MOSTugMTYteW19ZxrPkzWj+jWsVcDBW
	dUvGhWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQQZ-00FhgQ-T7; Thu, 03 Nov 2022 02:57:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQQI-00Fhc1-KA; Thu, 03 Nov 2022 02:57:43 +0000
X-UUID: 04d0648cbcc44f7f9bc2e511a254d1fa-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NkXsbhZ1C8Ne8ug6E4tBFfkzINbKPN88lCCIn+4lczs=;
	b=NE//+U/QChOFkWDOxxJk5oZVrFhse6JqXusvzooqSiD+fmoYAFMZrUm/QYCs1bfE9S87R9QvVkhj8YS5KUHmHAOTA9VbFrWYcyW7Vh8mVwa7TyaSLPumNf+fDFvT1uMkHYOO/PYa6E+Ipy1HewM7SqcczaGvRMwccYfpp8p5a3w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:9572a051-eacb-4df0-84b5-8e5d24f873a1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:d7b96c90-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 04d0648cbcc44f7f9bc2e511a254d1fa-20221102
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2093291549; Wed, 02 Nov 2022 19:57:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 3 Nov 2022 10:57:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 10:57:04 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, TingHan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH v5 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Date: Thu, 3 Nov 2022 10:56:54 +0800
Message-ID: <20221103025656.8714-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221103025656.8714-1-tinghan.shen@mediatek.com>
References: <20221103025656.8714-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_195742_690257_A9852090 
X-CRM114-Status: GOOD (  11.09  )
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

From: Jianjun Wang <jianjun.wang@mediatek.com>

In order to support mt8195 pcie node, update the yaml to support new
properties of iommu and power-domain, and update the reset-names
property to allow only one 'mac' name.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index c00be39af64e..bc90f0ec7bd9 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -70,15 +70,21 @@ properties:
     minItems: 1
     maxItems: 8
 
+  iommu-map:
+    maxItems: 1
+
+  iommu-map-mask:
+    const: 0
+
   resets:
     minItems: 1
     maxItems: 2
 
   reset-names:
     minItems: 1
+    maxItems: 2
     items:
-      - const: phy
-      - const: mac
+      enum: [ phy, mac ]
 
   clocks:
     maxItems: 6
@@ -107,6 +113,9 @@ properties:
     items:
       - const: pcie-phy
 
+  power-domains:
+    maxItems: 1
+
   '#interrupt-cells':
     const: 1
 
-- 
2.18.0


