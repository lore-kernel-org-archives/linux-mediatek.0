Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E7C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrvPzdjmykf8LV0rQWRvkadsxeoVqDc5y4VYgRUobMA=; b=l0hQZ5IGiHhLxvllcpJ9q24MI2
	hiTX39bYTb8rOk31Y/UBm+EjljHrVgpV8p5oRw5DQm1GlOZugO0D/h4cKpjbgrPBRFou92EkDmVdG
	qBRxUA+BnGqh5pYZgo6AZ7I7/LXCHHZL264phRLdqBbEbu+QMR4/vWF0eL3UwXPBTZGKfcGef0g56
	ZP7kJV3HDqFEOrTu8q7jGqFwY3FXv97NYRlKJB5NGewrDZComh2mbQrD39qXJaRmb/WGH6bI7abzv
	GKzEqG9b4hFDQPVI9FgXXL8XnWP7FYqfr/CizdIH3/6W37/mlWDIH2ynexhoY3yd7gJgPVDoflGmC
	FlTd1o/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psLTd-008onb-0w;
	Fri, 28 Apr 2023 10:37:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psLTR-008ocu-1B;
	Fri, 28 Apr 2023 10:37:14 +0000
X-UUID: 9b7b287ce5b011ed912e1518a6540028-20230428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VrvPzdjmykf8LV0rQWRvkadsxeoVqDc5y4VYgRUobMA=;
	b=toQ/bRcn4XI3A+YzC3WoIt25El9oad8+7OxrBDqu6DIZUBnu0GRGBLEwldq28l4WSCUASX2a1ybC1s9FUXrucu8oY4Nv+FqOmeuB9WhMy6I1ZyOSFWmivyjoxIlAE+colf7/YJW6XcetcE6+tHxLTSmQ37OMzz8ITXz8M3e01QU=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.22,REQID:c44fd34e-1f09-421e-a52b-6cf9221c4aa1,IP:0,U
	RL:25,TC:0,Content:59,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS6885AD,A
	CTION:quarantine,TS:184
X-CID-INFO: VERSION:1.1.22,REQID:c44fd34e-1f09-421e-a52b-6cf9221c4aa1,IP:0,URL
	:25,TC:0,Content:59,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_US65DF41,ACT
	ION:quarantine,TS:184
X-CID-META: VersionHash:120426c,CLOUDID:ba8e3230-6935-4eab-a959-f84f8da15543,B
	ulkID:230428183627KXSYCWYN,BulkQuantity:2,Recheck:0,SF:19|48|38|29|28|16|8
	01,TC:nil,Content:3,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 9b7b287ce5b011ed912e1518a6540028-20230428
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 580212401; Fri, 28 Apr 2023 03:37:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Apr 2023 18:36:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 28 Apr 2023 18:36:25 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "David
 Bradil" <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Jade
 Shih <jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan
 Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn
 Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>
Subject: [PATCH v2 2/7] dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
Date: Fri, 28 Apr 2023 18:36:17 +0800
Message-ID: <20230428103622.18291-3-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230428103622.18291-1-yi-de.wu@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_033709_407950_E2AB98CB 
X-CRM114-Status: GOOD (  15.59  )
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

From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>

Add documentation for GenieZone(gzvm) node. This node informs gzvm
driver to start probing if geniezone hypervisor is available and
able to do virtual machine operations.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 .../hypervisor/mediatek,geniezone-hyp.yaml    | 31 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml

diff --git a/Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml b/Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
new file mode 100644
index 000000000000..9dc0831cf175
--- /dev/null
+++ b/Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hypervisor/mediatek,gzvm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek GenieZone hypervisor
+
+maintainers:
+  - Yingshiuan Pan <yingshiuan.pan@mediatek.com>
+
+description:
+  This interface is designed for integrating GenieZone hypervisor into Android
+  Virtualization Framework(AVF) along with Crosvm as a VMM.
+  It acts like a wrapper for every hypercalls to GenieZone hypervisor in
+  order to control guest VM lifecycles and virtual interrupt injections.
+
+properties:
+  compatible:
+    const: mediatek,geniezone-hyp
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hypervisor {
+        compatible = "mediatek,geniezone-hyp";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index db8915114b86..1e911d1d9741 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8698,6 +8698,7 @@ GENIEZONE HYPERVISOR DRIVER
 M:	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
 M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
 M:	Yi-De Wu <yi-de.wu@mediatek.com>
+F:	Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
 F:	Documentation/virt/geniezone/
 
 GENWQE (IBM Generic Workqueue Card)
-- 
2.18.0


