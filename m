Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB5CC25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j1seHF8vgxZLVkZ4tCtmjWXjvilkWrm0RSr1xSSx1sY=; b=FELFh0GGObBRKJyjBbp0pEYzzl
	wBGWybiOB29gl5ktYQjLnxF6hsB0tSP57hY9fycDR9JcLglttjphK16ry9qIKj8a/5bt4x4qEGtRt
	fWLFzPeudroVovZaLx+nqGzy92tvjS+AsAQevJWdklA4hTR798sPMGc3y+sipdeP/HEHKxsXKUwbB
	ZkXpfPLEaqTUW2yfdmGPLfAdD5slaFCYMeD7nlrIUbERHA7gPhuJ29vbjIUajmwFJNtVwo9PIlQti
	kGU+NPEEQF3SAtnZEMEwell6LA8fJrVTCvdF5yk+XxK2BzNveOGfRfr+IBGu1G31NWFPIKnTSPvMW
	KeDhhNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEur-00000003TBN-20CC;
	Wed, 29 May 2024 08:44:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEtx-00000003SZc-231G;
	Wed, 29 May 2024 08:43:25 +0000
X-UUID: 7c4527d01d9711ef82c84f6416ccf2f3-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=j1seHF8vgxZLVkZ4tCtmjWXjvilkWrm0RSr1xSSx1sY=;
	b=luEFi5VJenGUvRTiTfGSyREqX2UXm29wbMELbNZtmVEpCMOUKC43hRNqICsxlpXweEub43S2gmP6JQ6SHLtAxrvSDMvmmoWNqf+6qOao106yHLe2O7CW6OKgxbVyAKPPSPbyVpXNKAt0g0y8W9imawDj7bD0cPxxJ7PBWJAnfPQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:ebc783bf-60a0-4de0-831a-2db551eceaad,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:393d96e,CLOUDID:e91df587-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 7c4527d01d9711ef82c84f6416ccf2f3-20240529
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 646330473; Wed, 29 May 2024 01:43:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 01:42:39 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 16:42:39 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v11 00/21] GenieZone hypervisor drivers
Date: Wed, 29 May 2024 16:42:18 +0800
Message-ID: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_014317_879068_EC9A284B 
X-CRM114-Status: GOOD (  21.26  )
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

From: Liju-Clr Chen <liju-clr.chen@mediatek.com>

This series is based on linux-next, tag: next-20240529.

GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various virtual
machine types and provides security features such as TEE-like scenarios and
secure boot. It can create guest VMs for security use cases and has
virtualization capabilities for both platform and interrupt. Although the
hypervisor can be booted independently, it requires the assistance of GenieZone
hypervisor kernel driver(gzvm-ko) to leverage the ability of Linux kernel for
vCPU scheduling, memory management, inter-VM communication and virtio backend
support.

Changes in v11:
- Resolve low memory issue by using only one api to get pages for guest VM.
- The GenieZone hypervisor acts as a vendor firmware to enable platform
  virtualization, offering an implementation that is independent of
  Linux-specific implementations. So, relocate dt-binding yaml file to
  the firmware path, as the dts node is used to confirm the presence of
  the geniezone hypervisor firmware.
- Fix coding style from viewer suggestion and checking tools.

Changes in v10:
https://lore.kernel.org/all/20240412065718.29105-1-yi-de.wu@mediatek.com/
- Optimize memory allocation: query hypervisor demand paging capability before
  VM memory population.
- Fix goto syntax according to ACK reviewer in `gzvm_vcpu.c`.
- Fix coding style from viewer suggestion and checking tools.

Changes in v9:
https://lore.kernel.org/all/20240129083302.26044-1-yi-de.wu@mediatek.com/
- Add gzvm_vm_allocate_guest_page function for demand paging support and
  protected VM memory performance optimization.
- Fix coding style from viewer suggestion and checking tools.

Changes in v8:
https://lore.kernel.org/all/20231228105147.13752-1-yi-de.wu@mediatek.com/
- Add reasons for using dt solution in dt-bindings.
- Add locks for memory pin/unpin and relinquish operations.
- Add VM memory stats in debugfs.
- Add tracing support for hypercall and vcpu exit reasons.
- Enable PTP for timing synchronization between host and guests.
- Optimize memory performance for protected VMs.
- Refactor wording and titles in documentation.

Changes in v7:
https://lore.kernel.org/all/20231116152756.4250-1-yi-de.wu@mediatek.com/
- Rebase these patches to the Linux 6.7-rc1 release.
- Refactor patches 1 to 15 to improve coding style while ensuring they do not
  violate the majority of the changes made in v6
- Provide individual VM memory statistics within debugfs in patch 16.
- Add tracing support for hyper call and vcpu exit_reason.

Changes in v6:
https://lore.kernel.org/all/20230919111210.19615-1-yi-de.wu@mediatek.com/
- Rebase based on kernel 6.6-rc1
- Keep dt solution and leave the reasons in the commit message
- Remove arch/arm64/include/uapi/asm/gzvm_arch.h due to simplicity
- Remove resampler in drivers/virt/geniezone/gzvm_irqfd.c due to defeature for
  now
- Remove PPI in arch/arm64/geniezone/vgic.c
- Refactor vm related components into 3 smaller patches, namely adding vm
  support, setting user memory region and checking vm capability
- Refactor vcpu and vm component to remove unnecessary ARM prefix
- Add demand paging to fix crash on destroying memory page, acclerate on booting
  and support ballooning deflate
- Add memory pin/unpin memory mechanism to support protected VM
- Add block-based demand paging for performance concern
- Response to reviewers and fix coding style accordingly


Changes in v5:
https://lore.kernel.org/all/20230727080005.14474-1-yi-de.wu@mediatek.com/
- Add dt solution back for device initialization
- Add GZVM_EXIT_GZ reason for gzvm_vcpu_run()
- Add patch for guest page fault handler
- Add patch for supporitng pin/unpin memory
- Remove unused enum members, namely GZVM_FUNC_GET_REGS and GZVM_FUNC_SET_REGS
- Use dev_debug() for debugging when platform device is available, and use
  pr_debug() otherwise
- Response to reviewers and fix bugs accordingly


Changes in v4:
https://lore.kernel.org/all/20230609085214.31071-1-yi-de.wu@mediatek.com/
- Add macro to set VM as protected without triggering pvmfw in AVF.
- Add support to pass dtb config to hypervisor.
- Add support for virtual timer.
- Add UAPI to pass memory region metadata to hypervisor.
- Define our own macros for ARM's interrupt number
- Elaborate more on GenieZone hyperivsor in documentation
- Fix coding style.
- Implement our own module for coverting ipa to pa
- Modify the way of initializing device from dt to a more discoverable way
- Move refactoring changes into indepedent patches.

Changes in v3:
https://lore.kernel.org/all/20230512080405.12043-1-yi-de.wu@mediatek.com/
- Refactor: separate arch/arm64/geniezone/gzvm_arch.c into vm.c/vcpu.c/vgic.c
- Remove redundant functions
- Fix reviewer's comments

Changes in v2:
https://lore.kernel.org/all/20230428103622.18291-1-yi-de.wu@mediatek.com/
- Refactor: move to drivers/virt/geniezone
- Refactor: decouple arch-dependent and arch-independent
- Check pending signal before entering guest context
- Fix reviewer's comments

Initial Commit in v1:
https://lore.kernel.org/all/20230413090735.4182-1-yi-de.wu@mediatek.com/

Yi-De Wu (21):
  virt: geniezone: enable gzvm-ko in defconfig
  docs: geniezone: Introduce GenieZone hypervisor
  dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
  virt: geniezone: Add GenieZone hypervisor driver
  virt: geniezone: Add vm support
  virt: geniezone: Add set_user_memory_region for vm
  virt: geniezone: Add vm capability check
  virt: geniezone: Add vcpu support
  virt: geniezone: Add irqchip support for virtual interrupt injection
  virt: geniezone: Add irqfd support
  virt: geniezone: Add ioeventfd support
  virt: geniezone: Add memory region purpose for hypervisor
  virt: geniezone: Add dtb config support
  virt: geniezone: Optimize performance of protected VM memory
  virt: geniezone: Add memory pin/unpin support
  virt: geniezone: Add demand paging support
  virt: geniezone: Add block-based demand paging support
  virt: geniezone: Add memory relinquish support
  virt: geniezone: Provide individual VM memory statistics within
    debugfs
  virt: geniezone: Add tracing support for hyp call and vcpu exit_reason
  virt: geniezone: Enable PTP for synchronizing time between host and
    guest VMs

 .../bindings/firmware/mediatek,geniezone.yaml |  34 +
 Documentation/virt/geniezone/introduction.rst |  87 +++
 Documentation/virt/index.rst                  |   1 +
 MAINTAINERS                                   |  11 +
 arch/arm64/Kbuild                             |   1 +
 arch/arm64/configs/defconfig                  |   2 +
 arch/arm64/geniezone/Makefile                 |   9 +
 arch/arm64/geniezone/gzvm_arch_common.h       | 105 +++
 arch/arm64/geniezone/hvc.c                    |  73 ++
 arch/arm64/geniezone/vcpu.c                   |  80 +++
 arch/arm64/geniezone/vgic.c                   |  50 ++
 arch/arm64/geniezone/vm.c                     | 425 +++++++++++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/geniezone/Kconfig                |  16 +
 drivers/virt/geniezone/Makefile               |  12 +
 drivers/virt/geniezone/gzvm_common.h          |  12 +
 drivers/virt/geniezone/gzvm_exception.c       |  61 ++
 drivers/virt/geniezone/gzvm_ioeventfd.c       | 281 ++++++++
 drivers/virt/geniezone/gzvm_irqfd.c           | 382 ++++++++++
 drivers/virt/geniezone/gzvm_main.c            | 148 ++++
 drivers/virt/geniezone/gzvm_mmu.c             | 243 +++++++
 drivers/virt/geniezone/gzvm_vcpu.c            | 282 ++++++++
 drivers/virt/geniezone/gzvm_vm.c              | 657 ++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h         | 256 +++++++
 include/trace/events/geniezone.h              |  84 +++
 include/uapi/linux/gzvm.h                     | 402 +++++++++++
 26 files changed, 3716 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,geniezone.yaml
 create mode 100644 Documentation/virt/geniezone/introduction.rst
 create mode 100644 arch/arm64/geniezone/Makefile
 create mode 100644 arch/arm64/geniezone/gzvm_arch_common.h
 create mode 100644 arch/arm64/geniezone/hvc.c
 create mode 100644 arch/arm64/geniezone/vcpu.c
 create mode 100644 arch/arm64/geniezone/vgic.c
 create mode 100644 arch/arm64/geniezone/vm.c
 create mode 100644 drivers/virt/geniezone/Kconfig
 create mode 100644 drivers/virt/geniezone/Makefile
 create mode 100644 drivers/virt/geniezone/gzvm_common.h
 create mode 100644 drivers/virt/geniezone/gzvm_exception.c
 create mode 100644 drivers/virt/geniezone/gzvm_ioeventfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_irqfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_main.c
 create mode 100644 drivers/virt/geniezone/gzvm_mmu.c
 create mode 100644 drivers/virt/geniezone/gzvm_vcpu.c
 create mode 100644 drivers/virt/geniezone/gzvm_vm.c
 create mode 100644 include/linux/soc/mediatek/gzvm_drv.h
 create mode 100644 include/trace/events/geniezone.h
 create mode 100644 include/uapi/linux/gzvm.h

-- 
2.18.0


