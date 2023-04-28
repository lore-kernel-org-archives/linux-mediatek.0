Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1690C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JQQfwdXJ3U6QJbtA1YUHv/cnpoSQQmb4BeKmzsuPPEs=; b=Nq7nlsHccnmqZaXS/ieHBSgZap
	tjFneXvG9gNzgNkw4P7EMfcPDpsmwfPV3CQjodDRZ09ySHWLXpvTymHR5WpNehvAtFkApQi4F2SMx
	oJGiI/k3YdbqxdA6QDuKp17c15W73bllWItpbLDnPESlLxMvrRo3DV7Rk7nKlCdUPqgGO5Ygis84L
	vpJaaTpuVptV+bfXAEgGT7Ex+llmDARQaNm+XxdpGGsaSQIjv9U6C7KGyp9MkrorJXTmP7PcIsjVT
	eYl+zJsnvqFcQyeilCWaMsQXrlf+q/UDai9rKg+5MLLF/piVnyKVkXUgr+w6Qpph6BXJUHji92gvF
	vA127Jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psLTX-008ok7-2M;
	Fri, 28 Apr 2023 10:37:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psLTR-008odT-0I;
	Fri, 28 Apr 2023 10:37:12 +0000
X-UUID: 9b1892d4e5b011ed912e1518a6540028-20230428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JQQfwdXJ3U6QJbtA1YUHv/cnpoSQQmb4BeKmzsuPPEs=;
	b=tq/XWUIS9+hMnyKJxUkZ9Td3KkGAfh8yLRBIpmhYBEWFY36Cl8aAfI+prl1wqgpGm/7BmKM0K82waNy7JzW2BrkFxNo1TkxtjvGHJV/Nw669QzBvtFlquAX5RBPn1llDVp0ddDBancqBQ35j+XztAeFCytSAmmDQB6LL/5MGl8g=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b0b4c6e0-22a8-4e38-8a5f-c86dad2618b7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:b0b4c6e0-22a8-4e38-8a5f-c86dad2618b7,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:be8e3230-6935-4eab-a959-f84f8da15543,B
	ulkID:2304281836272LNBBSJX,BulkQuantity:3,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 9b1892d4e5b011ed912e1518a6540028-20230428
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1492400369; Fri, 28 Apr 2023 03:36:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
	<linux-arch@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "David
 Bradil" <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Jade
 Shih <jades.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Ivan
 Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn
 Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>
Subject: [PATCH v2 0/7] GenieZone hypervisor drivers
Date: Fri, 28 Apr 2023 18:36:15 +0800
Message-ID: <20230428103622.18291-1-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_033709_140994_8C3BA0F7 
X-CRM114-Status: GOOD (  11.70  )
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

This series is based on linux-next, tag: next-20230427.

Changes in v2:
- Refactor: move to drivers/virt/geniezone
- Refactor: decouple arch-dependent and arch-independent
- Check pending signal before entering guest context
- Fix reviewer's comments

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
 arch/arm64/geniezone/gzvm_arch.c              | 280 +++++++++
 arch/arm64/geniezone/gzvm_arch.h              |  92 +++
 arch/arm64/geniezone/gzvm_irqchip.c           | 108 ++++
 arch/arm64/include/uapi/asm/gzvm_arch.h       |  47 ++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/geniezone/Kconfig                |  17 +
 drivers/virt/geniezone/Makefile               |  12 +
 drivers/virt/geniezone/gzvm_ioeventfd.c       | 263 +++++++++
 drivers/virt/geniezone/gzvm_irqfd.c           | 536 ++++++++++++++++++
 drivers/virt/geniezone/gzvm_main.c            | 151 +++++
 drivers/virt/geniezone/gzvm_vcpu.c            | 260 +++++++++
 drivers/virt/geniezone/gzvm_vm.c              | 447 +++++++++++++++
 include/linux/gzvm_drv.h                      | 154 +++++
 include/uapi/asm-generic/gzvm_arch.h          |  10 +
 include/uapi/linux/gzvm.h                     | 274 +++++++++
 20 files changed, 2741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,
 geniezone-hyp.yaml
 create mode 100644 Documentation/virt/geniezone/introduction.rst
 create mode 100644 arch/arm64/geniezone/Makefile
 create mode 100644 arch/arm64/geniezone/gzvm_arch.c
 create mode 100644 arch/arm64/geniezone/gzvm_arch.h
 create mode 100644 arch/arm64/geniezone/gzvm_irqchip.c
 create mode 100644 arch/arm64/include/uapi/asm/gzvm_arch.h
 create mode 100644 drivers/virt/geniezone/Kconfig
 create mode 100644 drivers/virt/geniezone/Makefile
 create mode 100644 drivers/virt/geniezone/gzvm_ioeventfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_irqfd.c
 create mode 100644 drivers/virt/geniezone/gzvm_main.c
 create mode 100644 drivers/virt/geniezone/gzvm_vcpu.c
 create mode 100644 drivers/virt/geniezone/gzvm_vm.c
 create mode 100644 include/linux/gzvm_drv.h
 create mode 100644 include/uapi/asm-generic/gzvm_arch.h
 create mode 100644 include/uapi/linux/gzvm.h

-- 
2.18.0


