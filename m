Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34836CE7B1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO47xg2q7reNI5Lyzxj+nlpv8stcl2GfJcb4pFVksnk=; b=Kns+HF2VqIrQ8IukL7fQDn3S78
	1Ist4ajNqjo+GhrnYX9BzNv04KaXIrkhsZLyy9SsKkj1uKe4kE60lRnvtmu11/sBCBPXmoF3XAonW
	XDaDaidt49CSN5/oJexXfMpQqnU8xpXLdEwfNJywv5I+dYR9iz10OEvQscm8kpHNc+ocA3jsUF6av
	xesN3qavkfhXUKi9tKE5RzV+3y/fRkxR+JulcDEkfnPQq2cpl2T6ur/3lLfIFeWIVCeK4+/oxTKII
	pEFyNRpy90hXf6ZsOvkJlXEElnoBJaIAes0DMxFZVhSw2zzIndmtQFLWwLow0enQpNklr6XCYq1fu
	Pclnbugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloja-0030PD-17;
	Thu, 28 Sep 2023 10:59:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlojQ-0030Dn-1A;
	Thu, 28 Sep 2023 10:59:02 +0000
X-UUID: 0131d0525dee11ee86758d4a7c00f3a0-20230928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sO47xg2q7reNI5Lyzxj+nlpv8stcl2GfJcb4pFVksnk=;
	b=AnnvLvJfLAdnrcr9XPfanLW6iHtijgXAmecAxIheqDjK2427oyG072fPIxOmMtCanT8JN0E5aN6i0cuwIBzFOUBIGQHMhdhVwJq+pA6TNgfaDCgxA5Pqa4TpSiUlEiSICS48e1yyJZ1wPtVRHziKjfGN++1y0ar8DB8fBmZAit8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:cefd0213-e0a9-4d49-9a01-d1d56191629e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c16b61bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0131d0525dee11ee86758d4a7c00f3a0-20230928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2140826506; Thu, 28 Sep 2023 03:58:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Sep 2023 18:58:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Sep 2023 18:58:46 +0800
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
	<Qizhong.Cheng@mediatek.com>, <Jian.Yang@mediatek.com>, jian.yang
	<jian.yang@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add support for controlling power and reset
Date: Thu, 28 Sep 2023 18:58:20 +0800
Message-ID: <20230928105819.5161-2-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928105819.5161-1-jian.yang@mediatek.com>
References: <20230928105819.5161-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_035856_472922_ADBF49B0 
X-CRM114-Status: UNSURE (   9.29  )
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
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 7e8c7a2a5f9b..32031362db58 100644
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
@@ -238,5 +258,10 @@ examples:
                       #interrupt-cells = <1>;
                       interrupt-controller;
             };
+
+            pcie@0 {
+              device_type = "pci";
+              pcie-3v3-supply = <&pcie3v3_regulator>;
+            };
         };
     };
-- 
2.18.0


