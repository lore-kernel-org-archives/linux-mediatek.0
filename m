Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BC7C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 08:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAUmtovh2BSgF+M7TxMbWY5EpQy5nM1PKExUhM4zzcI=; b=LPCvAgVudxK2XjoiuXpOgIHv/7
	CHKH0GlILFcqppKRhCdnH1QtCu7mv9y5tyfoGtaD8xTVcjtPL8US6D5l2ha16T9ma1dIuAWZr0fSf
	R3eJmb1XEyQePQ8XWvdtswaelKrrheN0ebXuoGSQkYkYrNkyIRkW7wDjk+p0uh/Dkc3dbJMzKqqNG
	OjkbdOZHWLMWc+zMpGYvEaU3oUqDFoDAVm3gmBsAynVFfm5V+/m+kPlo9wZWPidn5MhSWno3aNqJ9
	Qmv6LAlKloa8gX6HaERSqEnGdCaFft0VIGC26tMgy9o2faKu7q/r19OTq/XKelxD4aMbklKfLg9Cz
	AXMMM1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNlQ-00BH0j-0s;
	Fri, 12 May 2023 08:04:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNlB-00BGrF-2u;
	Fri, 12 May 2023 08:04:20 +0000
X-UUID: 937a21c8f09b11ed83ed1395ce914268-20230512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nAUmtovh2BSgF+M7TxMbWY5EpQy5nM1PKExUhM4zzcI=;
	b=WGyb10Qxzps3F8ljlrsj47rkATsuMPV56TNIH0KxTACPv7+58i5GOjoLw37/OcfiOPrVE/Wo4zdd5hOclFX26x10ePeYzPHtwouSw14UDdUJYj7eUFHD7UB8p6u/cffDAb7nW3O78OhRCLirFUmiPYGdSyrCyXp3BJthHKoffXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:f434bebe-30d9-444d-a93e-26bb27ff68d9,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:178d4d4,CLOUDID:09bda1c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 937a21c8f09b11ed83ed1395ce914268-20230512
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 408116070; Fri, 12 May 2023 01:04:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.194) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 May 2023 16:04:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 16:04:07 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Trilok
 Soni <quic_tsoni@quicinc.com>, David Bradil <dbrazdil@google.com>, Jade Shih
	<jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan Tseng
	<ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao
	<shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
	<liju-clr.chen@mediatek.com>
Subject: [PATCH v3 1/7] docs: geniezone: Introduce GenieZone hypervisor
Date: Fri, 12 May 2023 16:03:59 +0800
Message-ID: <20230512080405.12043-2-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230512080405.12043-1-yi-de.wu@mediatek.com>
References: <20230512080405.12043-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_010417_944872_D9F3B862 
X-CRM114-Status: GOOD (  14.42  )
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
 MAINTAINERS                                   |  6 ++++
 2 files changed, 40 insertions(+)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a91f14cad2e..523246ff3d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8705,6 +8705,12 @@ F:	include/vdso/
 F:	kernel/time/vsyscall.c
 F:	lib/vdso/
 
+GENIEZONE HYPERVISOR DRIVER
+M:	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
+M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
+M:	Yi-De Wu <yi-de.wu@mediatek.com>
+F:	Documentation/virt/geniezone/
+
 GENWQE (IBM Generic Workqueue Card)
 M:	Frank Haverkamp <haver@linux.ibm.com>
 S:	Supported
-- 
2.18.0


