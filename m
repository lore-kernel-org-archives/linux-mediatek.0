Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CBCC77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJHA62fePV8KQrTjmeo7P6N3t6CmbXBI+Yee42ikhhA=; b=2eZtC1iXXdrlcbUeu+H1+BdEDO
	NsFyzhG+9C8/lLfdotkz6U/pGUuETIRpo2U8IH2UF4te7x9IQHlfc1n/PFii3tA2ZyrxYhtaSUjRt
	s3jWihHHXBnjh/mg+9vA9D2IeDazCOQvl783FIOD+3x+NItAF5RxEazIuWTHoQmoLhky0BvUN4TOI
	slMXkHZJ4w72xymbO0AjzgpQPpTbPPnx43XexceqiTapOuI5tdAJqYWN7h0YSlYQM5b24zuFowvQi
	uQgPaCSNNkDQaDj+QbTB5B6odgeaClawve6LANz9Dok9tL2Xja4CIw/OKT3tKV2+jCU1N0ju/rpxA
	1K47Te5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmswI-005WYM-18;
	Thu, 13 Apr 2023 09:08:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmswF-005WVc-07;
	Thu, 13 Apr 2023 09:08:20 +0000
X-UUID: b39dd256d9da11ed8687db9d93187ff1-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vJHA62fePV8KQrTjmeo7P6N3t6CmbXBI+Yee42ikhhA=;
	b=JTE0oSKbzx/HUynH0CeT7pZ1NvBqEiUx2DIp1Rqe5azePIbcoeCUQt0Ncuzmo03STT/h1wY1SrvBaYjdjaRxGHH196mFgxMvhLxSJqG6JwVn0Uhru8a0aKLeh03AZAxAb6rWKYr8CkmPgPZ8aRIcMXfraJXXD/RhoIMeyUe8JZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:df4149fc-f52f-4f88-921f-327306161a5e,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:120426c,CLOUDID:78cfef83-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b39dd256d9da11ed8687db9d93187ff1-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 207211492; Thu, 13 Apr 2023 02:08:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 17:08:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 17:08:03 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yingshiuan Pan
	<yingshiuan.pan@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jades Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>
Subject: [PATCH v1 2/6] dt-bindings: hypervisor: Add binding for MediaTek GenieZone hypervisor
Date: Thu, 13 Apr 2023 17:07:31 +0800
Message-ID: <20230413090735.4182-3-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230413090735.4182-1-yi-de.wu@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020819_084868_5557CA9A 
X-CRM114-Status: GOOD (  13.06  )
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
 .../bindings/hypervisor/mediatek,gzvm.yaml    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml

diff --git a/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml b/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
new file mode 100644
index 000000000000..35e1e5b18e47
--- /dev/null
+++ b/Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
@@ -0,0 +1,30 @@
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
+  GenieZone is MediaTek proprietary hypervisor. This device node informs its
+  driver, gzvm, to probe if platform supports running virtual machines.
+
+properties:
+  compatible:
+    const: mediatek,gzvm
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    hypervisor {
+        compatible = "mediatek,gzvm";
+        status = "okay";
+    };
-- 
2.18.0


