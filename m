Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2436FC54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+ZNnPZgEeH4BqZ299K5FJeRcuItNLgjA88VZcVEjq0=; b=zaSOzbfMl7sldP5dzSMbqfPGC9
	z7afd+3sRv4IvR5j2X7dmz54lJlOTXf3ehwu6KyXG7C1KjC8ewDAtRWLq5eg1ATcg/bkUz9hTWwdm
	d2xWJF8Ddx3hIrvtIaERnNlUuBjb9raamFVkvXSulzINQqJ8M30l/X8F1fAw0WZFijtVfyuB80eET
	CFzwu5oVyzFJLhvuiG3QQSz6xNAU6upIz1qzzvtQgngVzI20Z7SQJAMogN3XwWda8p8jA+cJK1roS
	9anl+TOVKp28XJLjutLRpisi3ZASpQnX0+Dkl5QfDlvQ06C+cgiF20DFakMDiZvgz8eKhAEcRAH86
	HB92KAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ecL-003rje-1n;
	Thu, 16 Nov 2023 15:49:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ecH-003rh6-1P;
	Thu, 16 Nov 2023 15:49:19 +0000
X-UUID: aff19bb6849711ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5+ZNnPZgEeH4BqZ299K5FJeRcuItNLgjA88VZcVEjq0=;
	b=fG8JHusVIHLn4pH2stthte42IkA25ppmwxFJ8atXW8AsknqKpU/P/gd8DX/ZBLD0zVEbATYADOtqQhowvZTBN9d4GUbEsRJlgKa6vPdPTHrPGgfKMgWAIv8cBxGJ0neh0fBFCQahPsoezK/oFrrmj/ZvnwPZZdrwAhftuNXPljU=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.33,REQID:73c4942c-7944-4432-82f7-d1e7b7c83524,IP:0,U
	RL:25,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
	TION:quarantine,TS:125
X-CID-META: VersionHash:364b77b,CLOUDID:e4552460-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aff19bb6849711ee9b7791016c24628a-20231116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1485362325; Thu, 16 Nov 2023 08:49:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 23:29:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 23:29:09 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Arnd Bergmann <arnd@arndb.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, My
 Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
	<liju-clr.chen@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>, Kevenny
 Hsieh <kevenny.hsieh@mediatek.com>
Subject: [PATCH v7 02/16] dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
Date: Thu, 16 Nov 2023 23:27:42 +0800
Message-ID: <20231116152756.4250-3-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231116152756.4250-1-yi-de.wu@mediatek.com>
References: <20231116152756.4250-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_074917_476902_160A74B9 
X-CRM114-Status: GOOD (  16.49  )
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

[Detail]
The debate of using dt or not remains intact, and gentle ping seems not
working on this issue. We'll keep this patch for further discussion and
move forward in order to rebase based on the latest rc release. For
previous discussion, please kindly refer to the following link.

https://lore.kernel.org/all/4b81b7fbd50c04958c27fbb6e620a15ae4fe0d54.camel@mediatek.com/

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
index b4f7ff186619..7e64e510bf95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8946,6 +8946,7 @@ GENIEZONE HYPERVISOR DRIVER
 M:	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
 M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
 M:	Yi-De Wu <yi-de.wu@mediatek.com>
+F:	Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
 F:	Documentation/virt/geniezone/
 
 GENWQE (IBM Generic Workqueue Card)
-- 
2.18.0


