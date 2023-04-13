Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08545C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/PuYp06JANxyecmjfdkLJaYOHvRKSYhlev5QUYet24=; b=EPMaFLr1HRqbBrIAQTJwzsfDWu
	Um8XVHey2gk4P597j2FyXZTBKa7Byc6Lvfe4NRV565JN7pQXxX1tIGxL3UnAlIQXmrrmOURTs0tXC
	oeiQCt6DPGMF1OAxvGLUgNO4HAXJMjiqiLxtE+Xvrw7+InjfFCq7l7iQ17OwLxISdMX+oIbmLpQty
	po3BPoOrwYJXos5F1t8Tu7/g9cbeGQJWATyd6tCzaJFNiu78gRhTm4ohrhXGkdNurdja3hhNrHzsL
	F3TCtZTBfe7BNEs8FZsjuusYcNWDIpwHtVSQh8aHop3foDWXFC7W3e4RLjLQyYOovkhB5KcEco1rv
	C2bUpkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmt5p-005Zte-0f;
	Thu, 13 Apr 2023 09:18:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmt5m-005Zrz-0A;
	Thu, 13 Apr 2023 09:18:11 +0000
X-UUID: 19583a4ad9dc11ed8687db9d93187ff1-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6/PuYp06JANxyecmjfdkLJaYOHvRKSYhlev5QUYet24=;
	b=i8oHJz+Tb42zhRG/Ecq97/bF4fDTQ3lZNe7weXKaGMIG6UtkqPBui+3E67lCWW13PQ1nZRPUHqj6OaOXDFNmZsjeQdITK1WD6bhF+NSsGzN0LLMmd4QvDxEL0FM2zwLwI2M+tfBzSmG+RBaAB0wOeL2b2KbvtuynZs5Pw6IAg+A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:524c126d-7e74-44c0-8b53-725d19874e94,IP:0,U
	RL:0,TC:0,Content:49,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:49
X-CID-META: VersionHash:120426c,CLOUDID:7a2935a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 19583a4ad9dc11ed8687db9d93187ff1-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 335271425; Thu, 13 Apr 2023 02:18:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v1 1/6] docs: geniezone: Introduce GenieZone hypervisor
Date: Thu, 13 Apr 2023 17:07:30 +0800
Message-ID: <20230413090735.4182-2-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230413090735.4182-1-yi-de.wu@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_021810_099852_BA25B324 
X-CRM114-Status: GOOD (  12.01  )
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

GenieZone is MediaTek proprietary hypervisor solution, and it is running
in EL2 stand alone as a type-I hypervisor. It is a pure EL2
implementation which implies it does not rely any specific host VM, and
this behavior improves GenieZone's security as it limits its interface.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 Documentation/virt/geniezone/introduction.rst | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/virt/geniezone/introduction.rst

diff --git a/Documentation/virt/geniezone/introduction.rst b/Documentation/virt/geniezone/introduction.rst
new file mode 100644
index 000000000000..1fffd6cbb4db
--- /dev/null
+++ b/Documentation/virt/geniezone/introduction.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+GenieZone Introduction
+======================
+
+
+Overview
+========
+GenieZone is MediaTek proprietary hypervisor solution, and it is running in EL2
+stand alone as a type-I hypervisor. It is a pure EL2 implementation which
+implies it does not rely any specific host VM, and this behavior improves
+GenieZone's security as it limits its interface.
+
+To enable guest VMs running, a driver (gzvm) is provided for VMM (virtual
+machine monitor) to operate. Currently, the gzvm driver supports only crosvm.
+
+
+Supported Architecture
+======================
+GenieZone now only supports MediaTek arm64 SoC.
+
+
+Platform Virtualization
+=======================
+We leverages arm64's timer virtualization and gic virtualization for timer and
+interrupts controller.
+
+
+Device Virtualizaton
+====================
+We adopts VMM's virtio devices emulations by passing io trap to VMM, and virtio
+is a well-known and widely used virtual device implementation.
+
-- 
2.18.0


