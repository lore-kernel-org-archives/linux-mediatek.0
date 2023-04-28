Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F36C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adkXrrnEZGPRbZSglcGKLdD759QITaY+HgrVCM5K9Y8=; b=bTnI5aCyHsx5DXDYgp1ojawwtj
	G/BeW2gwqRG/3fEE3Bgl4mVdu3fnuA07B95nu87vdui4Evwm6XQJvfPsPse79jAZ72pFr62wLGW8M
	jIO4ycn2oF8ZKwMcdvNX0QzD+rlxw+IoMUhWx+w3zx8NuFlYEJ3ejGts2t3UY79se2Uc6+m808Nak
	DWUmGHdP5FKz7x/QybQSHaRMm/nFbEOh0tki5YPNGwuUa99m65PfWosGQkY7ds+mFVI2loEUyPoMG
	FkI0+PV0iBP1rKvNdy+6SD+wARcxBqBb8/5U16jkEpLxEmD5MFBBJleITLrgv9kp4/6WXNjVe0aaf
	b3+OMoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psLTY-008okR-1j;
	Fri, 28 Apr 2023 10:37:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psLTR-008odt-1L;
	Fri, 28 Apr 2023 10:37:12 +0000
X-UUID: 9b167058e5b011ed912e1518a6540028-20230428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=adkXrrnEZGPRbZSglcGKLdD759QITaY+HgrVCM5K9Y8=;
	b=HRhYoyYlFHM9xvD/rKT/KsTnGG9L1GrgxexeeCviVNkjD9rngkDausF4/Sz9+vEX4lUtSI64pAoDVszB5ajZz/5rlx6+R7JaIUoDsYiw69Y+kMFloc5m86B2FElGrbsISEg4z3wHfs7+ZwfquxEId7XYllAPvYToqo8W6sLrmRk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:5b16ed2b-d46d-4a28-8cbb-420dca0cd7f1,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:120426c,CLOUDID:f532386a-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 9b167058e5b011ed912e1518a6540028-20230428
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1502601098; Fri, 28 Apr 2023 03:36:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
	<linux-arch@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, David
 Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih
	<jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan Tseng
	<ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao
	<shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
	<liju-clr.chen@mediatek.com>
Subject: [PATCH v2 1/7] docs: geniezone: Introduce GenieZone hypervisor
Date: Fri, 28 Apr 2023 18:36:16 +0800
Message-ID: <20230428103622.18291-2-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230428103622.18291-1-yi-de.wu@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_033709_453496_7D182C06 
X-CRM114-Status: GOOD (  13.76  )
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
index 4b8971cba764..db8915114b86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8694,6 +8694,12 @@ F:	include/vdso/
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


