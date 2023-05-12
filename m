Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C591BC77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 08:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AMbQ9Qu1wDja5nPqrqBXR7L2u92eUh8oFq5SF5DEkZk=; b=BKdKD3bheWuwovcPhzzuV0vcNr
	CoVubEq3+5wjI+AVUU7Ob7fbz45xC7QBwTkNO9rfYXVq0SlcihYMRUSwU5larOwYeZtzEQU0kyPCP
	9IV4i6LVL7TkiKhIWNvVOByAl0yGn5PxGDUNk2HgIltFz121TOO4+f6PH5opoGNiGcHY8jkLTThmU
	O1W5HNfDiIIahZ0k29+zT7HtXrRvIsE/RQMb2j7u0hYDoHGRPVzp0MeyI/wuwuJDudydQNAaCYYul
	GVfgXXCm4ju0isQMG/aa1UhBZ7cI5s/qwIhNJR2/zJk6vWhGp6iYsrtO2zida+0iJKypH+fngHK0P
	4g9VfQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNlg-00BHDc-2o;
	Fri, 12 May 2023 08:04:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNld-00BHBI-39;
	Fri, 12 May 2023 08:04:47 +0000
X-UUID: a6417e46f09b11ed83ed1395ce914268-20230512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AMbQ9Qu1wDja5nPqrqBXR7L2u92eUh8oFq5SF5DEkZk=;
	b=m6nVTWz7SCg807o/w5EH7Cgpgh+1FY6BKBYl5/48qYOiNuQ54nNCtsuyfMfVyEUw/ns9tZPaHj1+hlP/kvv/dKrOleUxlfDAyWhf3LIU6QsOfHmba6zyrJgwhdWLp8UmDlJ4UU1YzM7basuxCXpP2GwF+XvSWQ1mhS4PtC34B6c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:1473c670-43f8-4156-9ad7-6c793033d44b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.24,REQID:1473c670-43f8-4156-9ad7-6c793033d44b,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:178d4d4,CLOUDID:74c1a1c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:230512160409VTPWCBHJ,BulkQuantity:1,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a6417e46f09b11ed83ed1395ce914268-20230512
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1544767616; Fri, 12 May 2023 01:04:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Trilok
 Soni" <quic_tsoni@quicinc.com>, David Bradil <dbrazdil@google.com>, Jade Shih
	<jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan Tseng
	<ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao
	<shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
	<liju-clr.chen@mediatek.com>
Subject: [PATCH v3 0/7] GenieZone hypervisor drivers
Date: Fri, 12 May 2023 16:03:58 +0800
Message-ID: <20230512080405.12043-1-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_010446_016201_B370B80E 
X-CRM114-Status: GOOD (  14.29  )
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

This series is based on linux-next, tag: next-20230512.

GenieZone is MediaTek proprietary hypervisor solution, and it is running
in EL2 stand alone as a type-I hypervisor. It is a pure EL2
implementation which implies it does not rely any specific host VM, and
this behavior improves GenieZone's security as it limits its interface.

To enable guest VMs running, a driver (gzvm) is provided for VMM (virtual
machine monitor) to operate. Currently, the gzvm driver supports only
crosvm.

This series supports ioctl interfaces for userspace VMM(eg., crosvm) to
operate guest VMs lifecycle, irqchip for virtual interrupt handling,
asynchronous notifcation mechanism for VMM.

Changes in v3:
- Refactor: separate arch/arm64/geniezone/gzvm_arch.c into vm.c/vcpu.c/vgic.c
- Remove redundant functions
- Fix reviewer's comments

Changes in v2:
https://lore.kernel.org/all/20230428103622.18291-1-yi-de.wu@mediatek.com/
- Refactor: move to drivers/virt/geniezone
- Refactor: decouple arch-dependent and arch-independent
- Check pending signal before entering guest context
- Fix reviewer's comments

v1: https://lore.kernel.org/all/20230413090735.4182-1-yi-de.wu@mediatek.com/

Yi-De Wu (7):
  docs: geniezone: Introduce GenieZone hypervisor
  dt-bindings: hypervisor: Add MediaTek GenieZone hypervisor
  virt: geniezone: Introduce GenieZone hypervisor support
  virt: geniezone: Add vcpu support
  virt: geniezone: Add irqchip support for virtual interrupt injection
  virt: geniezone: Add irqfd support
  virt: geniezone: Add ioeventfd support

 .../hypervisor/mediatek,geniezone-hyp.yaml    |  31 +
 Documentation/virt/geniezone/introduction.rst |  34 ++
 MAINTAINERS                                   |  13 +
 arch/arm64/Kbuild                             |   1 +
 arch/arm64/geniezone/Makefile                 |   9 +
 arch/arm64/geniezone/gzvm_arch_common.h       |  95 ++++
 arch/arm64/geniezone/vcpu.c                   |  84 +++
 arch/arm64/geniezone/vgic.c                   |  91 +++
 arch/arm64/geniezone/vm.c                     | 174 ++++++
 arch/arm64/include/uapi/asm/gzvm_arch.h       |  47 ++
 drivers/virt/Kconfig                          |   2 +-
 drivers/virt/geniezone/Kconfig                |  17 +
 drivers/virt/geniezone/Makefile               |  11 +
 drivers/virt/geniezone/gzvm_common.h          |  12 +
 drivers/virt/geniezone/gzvm_ioeventfd.c       | 263 +++++++++
 drivers/virt/geniezone/gzvm_irqchip.c         |  13 +
 drivers/virt/geniezone/gzvm_irqfd.c           | 537 ++++++++++++++++++
 drivers/virt/geniezone/gzvm_main.c            | 151 +++++
 drivers/virt/geniezone/gzvm_vcpu.c            | 260 +++++++++
 drivers/virt/geniezone/gzvm_vm.c              | 448 +++++++++++++++
 include/linux/gzvm_drv.h                      | 154 +++++
 include/uapi/asm-generic/Kbuild               |   1 +
 include/uapi/asm-generic/gzvm_arch.h          |  10 +
 include/uapi/linux/gzvm.h                     | 270 +++++++++
 24 files changed, 2727 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,
 geniezone-hyp.yaml
 create mode 100644 Documentation/virt/geniezone/introduction.rst
 create mode 100644 arch/arm64/geniezone/Makefile
 create mode 100644 arch/arm64/geniezone/gzvm_arch_common.h
 create mode 100644 arch/arm64/geniezone/vcpu.c
 create mode 100644 arch/arm64/geniezone/vgic.c
 create mode 100644 arch/arm64/geniezone/vm.c
 create mode 100644 arch/arm64/include/uapi/asm/gzvm_arch.h
 create mode 100644 drivers/virt/geniezone/Kconfig
 create mode 100644 drivers/virt/geniezone/Makefile
 create mode 100644 drivers/virt/geniezone/gzvm_common.h
 create mode 100644 drivers/virt/geniezone/gzvm_ioeventfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_irqchip.c
 create mode 100644 drivers/virt/geniezone/gzvm_irqfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_main.c
 create mode 100644 drivers/virt/geniezone/gzvm_vcpu.c
 create mode 100644 drivers/virt/geniezone/gzvm_vm.c
 create mode 100644 include/linux/gzvm_drv.h
 create mode 100644 include/uapi/asm-generic/gzvm_arch.h
 create mode 100644 include/uapi/linux/gzvm.h

-- 
2.18.0


