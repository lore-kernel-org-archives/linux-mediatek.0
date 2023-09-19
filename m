Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FA4CD54B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA+vZsBLcX0IJVpzfGwjWr3LP5GLc8Z86XvgG9kCAWU=; b=FpnkMCFVBd7PuWrkkWlhIIxhK0
	w7vCspBvxsdSSQeWCqJfTh62x8m+EIx2MAO5ISSmpEzvN6sp2aTeYohH57QNqR4JPw4tbANy2mbSI
	ZOq5GT82qrZBfxGrneX3KgAWcv+MSBkIugT4u6So7ERK98r+HQy7jVWpl/lYj3yfaauSnI0iaLw8L
	K2lWnPUIoz6Px2fW5omhvMIIEfRDQ3eCjZ8JphBC3C7TMuEI9q8T5NKhp24g6iZzTtLVzXHYwejH5
	PW6rGL9nPvyHNmPZk9X2kRkzKVxgsh3wlRhNuttg9ZyCEeZnq7+yFYDhBgLmfOP3IlLkz0pOqCmO2
	XdESTaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYfY-000FK1-0h;
	Tue, 19 Sep 2023 11:13:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYf1-000Es5-0V;
	Tue, 19 Sep 2023 11:13:00 +0000
X-UUID: 73fa957856dd11ee9b7791016c24628a-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KA+vZsBLcX0IJVpzfGwjWr3LP5GLc8Z86XvgG9kCAWU=;
	b=H8BFq5qQyA8M/QTQnONPQmwq2j34gElnshh2w3m20e+41jbPOq0QsRXDRWO33sLR2S+77op2vOapaZBUBrUrM/NEPGAkM/D/tuwGZc9CIctlOH0a0zA0mY7DLnmDR+A8eeFNTlb+yYLuWpTQN6NJecgfwc9JWNXqXwnYhG0fdbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:12b754c2-f73a-4b23-9209-ed3bc062e0ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:75581e14-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 73fa957856dd11ee9b7791016c24628a-20230919
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 970437359; Tue, 19 Sep 2023 04:12:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 19:12:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 19:12:39 +0800
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
	Jade Shih <jades.shih@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
	"My Chuang" <my.chuang@mediatek.com>, Kevenny Hsieh
	<kevenny.hsieh@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>, Liju
 Chen <liju-clr.chen@mediatek.com>
Subject: [PATCH v6 01/15] docs: geniezone: Introduce GenieZone hypervisor
Date: Tue, 19 Sep 2023 19:11:56 +0800
Message-ID: <20230919111210.19615-2-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230919111210.19615-1-yi-de.wu@mediatek.com>
References: <20230919111210.19615-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.646100-8.000000
X-TMASE-MatchedRID: +CLiPMT38ZAihjhlMTu+HHa57ruHAnHxFuNF4lJG6xs1LB46LFAAkkd0
	Rzx07LDVu1YWrIMJBFIUZ7mqlsLL7wAwGIAo3ShbyATMS/tDL5ipD1R7N5OROMA5YKm8dwM6jIZ
	02fRmyUctK7tHzSdmVLdnCNkrUAnN1ddezVny+QLiHyvyXeXh5qny79MYSKWc/uK0hv0lVwlA1n
	8Oi0n1etIHCO4ffu/YQIzSHwfpfZmJDUEPQnjmjye3N/QUhiGUj/xLIaDSshF+YesuCgkiXIp3F
	kEAWTZzOcsPl9K/JtfyN9+MhBBXP9D+INh9HpXLSEQN/D/3cG4ayaQg2/Z1zxy/A9iZcrIf+bls
	dPlPYzaEOdaLaz+/0fJtR6XZoHQXq9Fb0RfhjvR3p/MPn9NFkc/rSr8VfmGwJ870fpj93L70ZtJ
	JqrR/g4lKsVhc6mv/tTPQr586rYbGadyjEtbXaSZm6wdY+F8KBcGrxWcWEKSbKItl61J/yZ+inT
	K0bC9eKrauXd3MZDWyPbu28yjM4tTsELYXaJWEVpxjkr0K3AhaIjjFrKsZXl3j05jChdrw
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.646100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 34B7D3C12E25A28CB81B92321BCCA1AE0C6CE9F4A4DB192D98B0A45AF9D7635F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_041255_294371_38E1F70D 
X-CRM114-Status: GOOD (  17.86  )
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
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 Documentation/virt/geniezone/introduction.rst | 86 +++++++++++++++++++
 Documentation/virt/index.rst                  |  1 +
 MAINTAINERS                                   |  6 ++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/virt/geniezone/introduction.rst

diff --git a/Documentation/virt/geniezone/introduction.rst b/Documentation/virt/geniezone/introduction.rst
new file mode 100644
index 000000000000..fb9fa41bcfb8
--- /dev/null
+++ b/Documentation/virt/geniezone/introduction.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+GenieZone Introduction
+======================
+
+Overview
+========
+GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various virtual
+machine types and provides security features such as TEE-like scenarios and
+secure boot. It can create guest VMs for security use cases and has
+virtualization capabilities for both platform and interrupt. Although the
+hypervisor can be booted independently, it requires the assistance of GenieZone
+hypervisor kernel driver(gzvm-ko) to leverage the ability of Linux kernel for
+vCPU scheduling, memory management, inter-VM communication and virtio backend
+support.
+
+Supported Architecture
+======================
+GenieZone now only supports MediaTek ARM64 SoC.
+
+Features
+========
+
+- vCPU Management
+
+VM manager aims to provide vCPUs on the basis of time sharing on physical CPUs.
+It requires Linux kernel in host VM for vCPU scheduling and VM power management.
+
+- Memory Management
+
+Direct use of physical memory from VMs is forbidden and designed to be dictated
+to the privilege models managed by GenieZone hypervisor for security reason.
+With the help of gzvm-ko, the hypervisor would be able to manipulate memory as
+objects.
+
+- Virtual Platform
+
+We manage to emulate a virtual mobile platform for guest OS running on guest
+VM. The platform supports various architecture-defined devices, such as
+virtual arch timer, GIC, MMIO, PSCI, and exception watching...etc.
+
+- Inter-VM Communication
+
+Communication among guest VMs was provided mainly on RPC. More communication
+mechanisms were to be provided in the future based on VirtIO-vsock.
+
+- Device Virtualization
+
+The solution is provided using the well-known VirtIO. The gzvm-ko would
+redirect MMIO traps back to VMM where the virtual devices are mostly emulated.
+Ioeventfd is implemented using eventfd for signaling host VM that some IO
+events in guest VMs need to be processed.
+
+- Interrupt virtualization
+
+All Interrupts during some guest VMs running would be handled by GenieZone
+hypervisor with the help of gzvm-ko, both virtual and physical ones. In case
+there's no guest VM running out there, physical interrupts would be handled by
+host VM directly for performance reason. Irqfd is also implemented using
+eventfd for accepting vIRQ requests in gzvm-ko.
+
+Platform architecture component
+===============================
+
+- vm
+
+The vm component is responsible for setting up the capability and memory
+management for the protected VMs. The capability is mainly about the lifecycle
+control and boot context initialization. And the memory management is highly
+integrated with ARM 2-stage translation tables to convert VA to IPA to PA under
+proper security measures required by protected VMs.
+
+- vcpu
+
+The vcpu component is the core of virtualizing aarch64 physical CPU runnable,
+and it controls the vCPU lifecycle including creating, running and destroying.
+With self-defined exit handler, the vm component would be able to act
+accordingly before terminated.
+
+- vgic
+
+The vgic component exposes control interfaces to Linux kernel via irqchip, and
+we intend to support all SPI, PPI, and SGI. When it comes to virtual
+interrupts, the GenieZone hypervisor would write to list registers and trigger
+vIRQ injection in guest VMs via GIC.
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 7fb55ae08598..cf12444db336 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -16,6 +16,7 @@ Virtualization Support
    coco/sev-guest
    coco/tdx-guest
    hyperv/index
+   geniezone/introduction
 
 .. only:: html and subproject
 
diff --git a/MAINTAINERS b/MAINTAINERS
index fa7487b7729b..a788e7da77c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8797,6 +8797,12 @@ F:	include/vdso/
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


