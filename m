Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0101C47DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDYzYtOK7emgz2NcibSVM9p08YbBt9JuEMgMtcO71Ow=; b=gHh/U5RESecivFhGKCuHk/MdcJ
	fdSYtiwOrIsW6bkNikteJWJw3C98FkVisZQjD7xSs+hBPYOgyu379tYwQICGnKVom2KykC91AETEQ
	HIeSGA0S9ZfXKwY5Ww54Np6zQj3xt5L2jdmaaVFs6xoACHVcm8htrPFJCBNtm2kKv3QOt4onGT8mh
	RORYpb/0qg8heN1Qy1zZyG3ydpOnjmOs7BtRcTGyad/5qmr46FsORpK5f1xGpwN4EDixWbzWELHBA
	zYVWXTs7RVfFcX7+bGbKN9noy4KO+1hfJ3gODxGBPExSr1aVqN5VjoZQk1TmdQHTMh8TALiphe5cy
	faLr5sSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN7x-0000000Bol5-17Pk;
	Mon, 29 Jan 2024 08:36:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN5S-0000000BnA5-40sA;
	Mon, 29 Jan 2024 08:33:53 +0000
X-UUID: 1df2c176be8111eea0bf134e88e6c2dc-20240129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eDYzYtOK7emgz2NcibSVM9p08YbBt9JuEMgMtcO71Ow=;
	b=ZbFfK2GQpsQL1M47cY9IfNsIgzH6qJLAH35Mn4wSBuJUlUdx82UXY3+XTN5Fk562sOwGj7MZDL5xk1hs67mZL1/IRiSYkX3GAUSG48YxanKyzuKqHxtFnRnLAxzu4FI7z2qBBX0fmru3j36mofwLmERZO6j/2nPBNtGcDVXS278=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:b965d4e2-84c0-4d0e-8ba2-99c70ff4d6d3,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6e16cf4,CLOUDID:751a5e83-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1df2c176be8111eea0bf134e88e6c2dc-20240129
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2037027598; Mon, 29 Jan 2024 01:33:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 16:33:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 16:33:06 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, David Bradil
	<dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, My Chuang
	<my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei
	<peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, "Willix
 Yeh" <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: [PATCH v9 03/21] dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
Date: Mon, 29 Jan 2024 16:32:44 +0800
Message-ID: <20240129083302.26044-4-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240129083302.26044-1-yi-de.wu@mediatek.com>
References: <20240129083302.26044-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.112700-8.000000
X-TMASE-MatchedRID: l5qCKP2S+CbHCChNBbZThW3NvezwBrVmUXlp1FHYSPVfSPKGP39CrlYW
	wxB9tw0TJhXAZMA4h8Vncviyus0oC5/JE/eOMuX3vGTc5oROod7rpC+cgGEjuhHfiujuTbedOOF
	xXXPqKHnyga3Otdj4UogmzRSnu+RYqjvsBy5CHDu4jAucHcCqnZYcYQ11P5U/m5zZfbOy37EOsb
	dDU8hPqApsQGG0bIwTwKX8fpO+yjIFvymnGwMQKcgc0seoKgtWDcK8n+cR7XKbKItl61J/yUGDD
	kbg1gJk32mPO5tnasfCttcwYNipX8NbTFVOzjU8PZm5TtYsIfIFYU+GevBfScRAj2y1n1gN6fzS
	33INfqs=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.112700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9596F9895DA162A51FF1CBE38AC9F0D14A5FE35BB92D28E6B1A517C3B08B63FC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_003351_203457_3798DC3E 
X-CRM114-Status: GOOD (  15.22  )
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

[Reason to use dt solution]
- The GenieZone hypervisor serves as a vendor model for facilitating
platform virtualization, with an implementation that is independent
from Linuxism.
- In contrast to the dt solution, our previous approach involved probing
via hypercall to determine the existence of our hypervisor. However, this
method raised concerns about potentially impacting all systems, including
those without the GenieZone hypervisor embedded[ref].

Link: https://lore.kernel.org/all/2fe0c7f9-55fc-ae63-3631-8526a0212ccd@linaro.org/

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 .../hypervisor/mediatek,geniezone-hyp.yaml    | 31 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml

diff --git a/Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml b/Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
new file mode 100644
index 000000000000..ab89a4c310cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hypervisor/mediatek,geniezone-hyp.yaml#
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
+  It acts like a wrapper for every hypercall to GenieZone hypervisor in
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
index 99ef21d90420..17a8e20d2baa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9017,6 +9017,7 @@ GENIEZONE HYPERVISOR DRIVER
 M:	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
 M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
 M:	Yi-De Wu <yi-de.wu@mediatek.com>
+F:	Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
 F:	Documentation/virt/geniezone/
 
 GENWQE (IBM Generic Workqueue Card)
-- 
2.18.0


