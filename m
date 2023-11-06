Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BEDC4167D
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 06:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzm8Gk+Nw4s2zz+xmLAia02CqbGyamjFcvGWlnw9oCc=; b=j2ye/uOyuaKqFlrwNX0Yz1UpNo
	4QLvfvyYSuYUjBJyeoRK0PFH/qusvlyPule7VCrWF1myUNqzNLCReUqnTtsF5NzYI7LwXdWHpbpi/
	NggI6MhDNRsmAGadg/MMbYaj+DN2XrhOKIEwwmaTsPUxVaZeCZ/iEjyv9bReUT0Q94IMnzaaO7Lu6
	zDsIogi089ldqhQ2cMoIBJmhYiGpFbG6TShT1pZSNEYmO9/WhPoX/cyykYtfLuhQFVBTXoybaaIb5
	CJ3WteuIJk65VGBq9sELx8wqDycvJ2ul+1TUXn1ceqMHKiXcNaGWokOL2QMikD6a8lK3WMDx3T7EX
	hE5Hc8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzsr1-00Fvo9-0e;
	Mon, 06 Nov 2023 06:12:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzsqx-00FvmQ-21;
	Mon, 06 Nov 2023 06:12:52 +0000
X-UUID: 7fb139727c6b11ee86758d4a7c00f3a0-20231105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bzm8Gk+Nw4s2zz+xmLAia02CqbGyamjFcvGWlnw9oCc=;
	b=WGm+UYTtrKBioHIEo0hHTtYGAON45MF3YbTDnYZ/hIgZEA7DdAcqUg5BcI8nbz3tR3AN8/AVStxxO2s4YR3bYHB0g3feaJ0UHm59e0NS2I3F2uAoKxfCFRwPyeOVHFxaSa8Pn7X4Rfso65Dmq6gBYL6wLBSUGaHVW668iugUAsg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:70e582cf-2e18-480c-adcb-7d48b2e1de2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:09775072-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7fb139727c6b11ee86758d4a7c00f3a0-20231105
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 514845663; Sun, 05 Nov 2023 23:12:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 14:12:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 14:12:24 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Jianjun Wang
	<jianjun.wang@mediatek.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Chuanjia.Liu@mediatek.com>, <Jieyy.Yang@mediatek.com>,
	<Qizhong.Cheng@mediatek.com>, <Jianguo.Zhang@mediatek.com>, jian.yang
	<jian.yang@mediatek.com>
Subject: [PATCH v4 1/2] dt-bindings: PCI: mediatek-gen3: Add support for controlling power and reset
Date: Mon, 6 Nov 2023 14:12:19 +0800
Message-ID: <20231106061220.21485-2-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231106061220.21485-1-jian.yang@mediatek.com>
References: <20231106061220.21485-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.613400-8.000000
X-TMASE-MatchedRID: d+baqQ3qUqcLazoQyrpm0nTnOygHVQpOTJDl9FKHbrkCsxyhR8y7CVNu
	7s2NJTuOwYZvZa78l5Avu1ObNN4sTn1GcR5AeEs7FYJUGv4DL3yL/KYnYVWDlJsoi2XrUn/J8m+
	hzBStansfRoCwBzgRYsK21zBg2Klf9Ss5ONHRGPVzM0zS5xjyNu72wPSSWOaHUYcub2HijvByEA
	NRaOGFLw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.613400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 025ED5727A2C49F7DE1D4B0B2785185978250327684F8955987763DC707F7BD52000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_221251_672866_C624BE68 
X-CRM114-Status: UNSURE (   8.56  )
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
index 7e8c7a2a5f9b..a4f6b48d57fa 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -84,6 +84,26 @@ properties:
     items:
       enum: [ phy, mac ]
 
+  vpcie1v8-supply:
+    description:
+      The regulator phandle that provides 1.8V power from root port to a
+      downstream component.
+
+  vpcie3v3-supply:
+    description:
+      The regulator phandle that provides 3.3V power from root port to a
+      downstream component.
+
+  vpcie12v-supply:
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
+                vpcie3v3-supply = <&pcie3v3_regulator>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+            };
         };
     };
-- 
2.18.0


