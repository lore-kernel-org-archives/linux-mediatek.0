Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AE6C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrXJNe8DKWIUDiDLPUm4yvxJERull8+jFur46W/BOzw=; b=41UdOsrwCaqkhz1YbTCnWkaiee
	TlVrCuADE6PI9cTJPhU4zeYpjxDZd7VeKxPykHt7vXt+lAk8EsRtP5h2jaECjp1ICfEza0e+A33Lg
	zaD6t7LRsNISNJiHpWZYgPCcT76QgwETvlViQUVyOpzv8LZIbq673DycX4ey3Er5UG3ISyRAroM+N
	pWI/KnBNwLI+Y/ueWc8zLUuN9PyFMt/Ka0zRYJ59OpbhpOZFmTdj0SZeLCZDcYVc9AhetAmby/RJn
	FncD+2kB6rs99WLAy+lcPX69/9TcThXBMhWqyPO2Z9BAiDf8OROFZQ0Lo9cYYFVqSPJW42gIQL5Pt
	bLshHJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEv1-00000003TIO-2KIq;
	Wed, 29 May 2024 08:44:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEtz-00000003Sbi-1uQN;
	Wed, 29 May 2024 08:43:28 +0000
X-UUID: 7ec96cdc1d9711ef82c84f6416ccf2f3-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CrXJNe8DKWIUDiDLPUm4yvxJERull8+jFur46W/BOzw=;
	b=ueWtJouZwmwNcCMGKdPyjCCiGW0xygfsZZ3NA1FkP2OoE7dQH0YR98eVy6rOP7PYbyV7XXL8fJ9PapBTV0+Gu94kIjNiqirP0QuDbZoApDqnN6mUrKTGNpIm6oOtsdSd6RisFRPTLM8m5a2WUKTz3AuuvXNQEPzzWtdiJ89qStg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:66dc5242-727a-4528-890a-31c1d6cdf756,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:393d96e,CLOUDID:2f0e7584-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7ec96cdc1d9711ef82c84f6416ccf2f3-20240529
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1051648913; Wed, 29 May 2024 01:43:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 16:42:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 16:42:39 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"Steven Rostedt" <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liju-clr Chen
	<Liju-clr.Chen@mediatek.com>, Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>,
	Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v11 02/21] docs: geniezone: Introduce GenieZone hypervisor
Date: Wed, 29 May 2024 16:42:20 +0800
Message-ID: <20240529084239.11478-3-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
References: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.623400-8.000000
X-TMASE-MatchedRID: WxZCKdO1VZMihjhlMTu+HHa57ruHAnHxFuNF4lJG6xs1LB46LFAAkkd0
	Rzx07LDVu1YWrIMJBFIUZ7mqlsLL7wAwGIAo3ShbyATMS/tDL5ipD1R7N5OROMA5YKm8dwM6jIZ
	02fRmyUctK7tHzSdmVLdnCNkrUAnN1ddezVny+QLiHyvyXeXh5qny79MYSKWc/uK0hv0lVwklHD
	ysIsZQz11tBKF7hhAzucwGRxuiOSoY1mlq1H5Z3ov2/i8VNqeOWOi4GPaBr7/FpA1uJFd1mtZho
	S9qxz0XFekDcD12A6u1XPxxyTBct3y3NtgjFBPrGLXhwJ3YV6NAq6/y5AEOOjvpyveVkrtEhCLR
	gWbx/Un1D9AzgdWivKIys8bfOtn9+hiRYeF7szVHoKp7fxLOV7ZvJfWpnfsSEoBacoHAF/+lBxI
	wyU8eVQMQDDSpB+BxYhdQng3DZoPhLW5g057g5cgc0seoKgtWFugFBW/IrRqNBRPxef1SsaPFjJ
	EFr+olwXCBO/GKkVr3FLeZXNZS4KBkcgGnJ4WmoCu/aVC+9/W9P0YUHwpGmws0e2GQKqq/ulR6k
	gOEjxZ+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.623400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B442CE66BAEB2A05E6ACA2DBBC050B7EB13B6F37AF002ABC02985EA33F6D9AC22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_014319_973562_6A64ED3B 
X-CRM114-Status: GOOD (  19.78  )
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

From: Yi-De Wu <yi-de.wu@mediatek.com>

From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>

GenieZone is MediaTek proprietary hypervisor solution, and it is running
in EL2 stand alone as a type-I hypervisor. It is a pure EL2
implementation which implies it does not rely any specific host VM, and
this behavior improves GenieZone's security as it limits its interface.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 Documentation/virt/geniezone/introduction.rst | 87 +++++++++++++++++++
 Documentation/virt/index.rst                  |  1 +
 MAINTAINERS                                   |  6 ++
 3 files changed, 94 insertions(+)
 create mode 100644 Documentation/virt/geniezone/introduction.rst

diff --git a/Documentation/virt/geniezone/introduction.rst b/Documentation/virt/geniezone/introduction.rst
new file mode 100644
index 000000000000..f280476228b3
--- /dev/null
+++ b/Documentation/virt/geniezone/introduction.rst
@@ -0,0 +1,87 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+GenieZone Introduction
+======================
+
+Overview
+========
+GenieZone hypervisor (gzvm) is a type-1 hypervisor that supports various virtual
+machine types and provides security features such as TEE-like scenarios and
+secure boot. It can create guest VMs for security use cases and has
+virtualization capabilities for both platform and interrupt. Although the
+hypervisor can be booted independently, it requires the assistance of GenieZone
+hypervisor kernel driver(also named gzvm) to leverage the ability of Linux
+kernel for vCPU scheduling, memory management, inter-VM communication and virtio
+backend support.
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
+  VM manager aims to provide vCPUs on the basis of time sharing on physical
+  CPUs. It requires Linux kernel in host VM for vCPU scheduling and VM power
+  management.
+
+- Memory Management
+
+  Direct use of physical memory from VMs is forbidden and designed to be
+  dictated to the privilege models managed by GenieZone hypervisor for security
+  reason. With the help of gzvm module, the hypervisor would be able to manipulate
+  memory as objects.
+
+- Virtual Platform
+
+  We manage to emulate a virtual mobile platform for guest OS running on guest
+  VM. The platform supports various architecture-defined devices, such as
+  virtual arch timer, GIC, MMIO, PSCI, and exception watching...etc.
+
+- Inter-VM Communication
+
+  Communication among guest VMs was provided mainly on RPC. More communication
+  mechanisms were to be provided in the future based on VirtIO-vsock.
+
+- Device Virtualization
+
+  The solution is provided using the well-known VirtIO. The gzvm module would
+  redirect MMIO traps back to VMM where the virtual devices are mostly emulated.
+  Ioeventfd is implemented using eventfd for signaling host VM that some IO
+  events in guest VMs need to be processed.
+
+- Interrupt virtualization
+
+  All Interrupts during some guest VMs running would be handled by GenieZone
+  hypervisor with the help of gzvm module, both virtual and physical ones.
+  In case there's no guest VM running out there, physical interrupts would be
+  handled by host VM directly for performance reason. Irqfd is also implemented
+  using eventfd for accepting vIRQ requests in gzvm module.
+
+Platform architecture component
+===============================
+
+- vm
+
+  The vm component is responsible for setting up the capability and memory
+  management for the protected VMs. The capability is mainly about the lifecycle
+  control and boot context initialization. And the memory management is highly
+  integrated with ARM 2-stage translation tables to convert VA to IPA to PA
+  under proper security measures required by protected VMs.
+
+- vcpu
+
+  The vcpu component is the core of virtualizing aarch64 physical CPU runnable,
+  and it controls the vCPU lifecycle including creating, running and destroying.
+  With self-defined exit handler, the vm component would be able to act
+  accordingly before terminated.
+
+- vgic
+
+  The vgic component exposes control interfaces to Linux kernel via irqchip, and
+  we intend to support all SPI, PPI, and SGI. When it comes to virtual
+  interrupts, the GenieZone hypervisor would write to list registers and trigger
+  vIRQ injection in guest VMs via GIC.
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
index 523d84b2d613..59481b0764d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9270,6 +9270,12 @@ F:	include/vdso/
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


