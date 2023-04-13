Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3148C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IJBhdLEftjKd/RMnGVYFfq0WyqFuvFWPZWbwN8VhW4c=; b=Y8z8IT7cJ56c3BK5z0NjEZvy1N
	1Q+zbGm5foAux5Lk3w04EQpHxeoy9o0VRvhJEnVWLEMRbNSkFSlp2SJ0vscbH6/qcaSHKTQ7KX17L
	Th1WDgcQfNivWvYnqYmIhswwZysf4Mq4l+Sgvy8ThX8KESZTeKruL5epluPrFsd8oMLdgvEW7Rnkp
	caqLude6cMExF0Ud/LNEs4bwOwJz46Hx8YhWgm3ZCBNWGpBUwaeyEZwHNVxGT6GTqqzFoaYBpWmDK
	rywMt0B3o+5akRFPXIlJpXDhEJlemG4IZ6Z5i6rP1Kw0Ot2/OFidhBMX3ab3+Usjc4WLYxbuP5oKB
	Zd7BD1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmswp-005Wnr-2z;
	Thu, 13 Apr 2023 09:08:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmswl-005Wgh-29;
	Thu, 13 Apr 2023 09:08:53 +0000
X-UUID: c554ffecd9da11edb7d8d11f642b8e78-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IJBhdLEftjKd/RMnGVYFfq0WyqFuvFWPZWbwN8VhW4c=;
	b=HwqLloYfiwgtmvMZMDgMYLc4fyc2ujG+zhEyhGIQWwmENIbDkPSwaH6mStqOcpoYVigSSywSUcD2/bO3EiKLn/ljTgqyGjEuU7uFoxLlpAPz27LWi+gn124PCq7P8NvkUfv45dHqp/u+A3gc4DGncNNlVEGaEvXdveLjf6pB75w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:c8362761-1748-44b0-a69f-3c568c8556ae,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.22,REQID:c8362761-1748-44b0-a69f-3c568c8556ae,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:120426c,CLOUDID:3670d6ea-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:230413170805P1IX5SS6,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c554ffecd9da11edb7d8d11f642b8e78-20230413
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 853036706; Thu, 13 Apr 2023 02:08:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 17:08:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 17:08:02 +0800
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
Subject: [PATCH v1 0/6] GenieZone hypervisor drivers
Date: Thu, 13 Apr 2023 17:07:29 +0800
Message-ID: <20230413090735.4182-1-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020851_706078_AAEF8963 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

This series is based on linux-next, tag: next-20230412.

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

Yi-De Wu (6):
  docs: geniezone: Introduce GenieZone hypervisor
  dt-bindings: hypervisor: Add binding for MediaTek GenieZone hypervisor
  soc: mediatek: virt: geniezone: Introduce GenieZone hypervisor support
  soc: mediatek: virt: geniezone: Introduce irqchip for virtual
    interrupt injection
  soc: mediatek: virt: geniezone: Add ioeventfd support
  soc: mediatek: virt: geniezone: Add irqfd support

 .../bindings/hypervisor/mediatek,gzvm.yaml    |  30 +
 Documentation/virt/geniezone/introduction.rst |  34 +
 arch/arm64/include/uapi/asm/gzvm_arch.h       |  79 ++
 drivers/soc/mediatek/Kconfig                  |   2 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/virt/geniezone/Kconfig   |  17 +
 drivers/soc/mediatek/virt/geniezone/Makefile  |   5 +
 drivers/soc/mediatek/virt/geniezone/gzvm.h    | 126 +++
 .../mediatek/virt/geniezone/gzvm_eventfd.c    | 749 ++++++++++++++++++
 .../soc/mediatek/virt/geniezone/gzvm_hyp.h    |  72 ++
 .../mediatek/virt/geniezone/gzvm_irqchip.c    | 107 +++
 .../soc/mediatek/virt/geniezone/gzvm_main.c   | 233 ++++++
 .../soc/mediatek/virt/geniezone/gzvm_vcpu.c   | 296 +++++++
 drivers/soc/mediatek/virt/geniezone/gzvm_vm.c | 551 +++++++++++++
 include/uapi/linux/gzvm_common.h              | 291 +++++++
 15 files changed, 2593 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hypervisor/mediatek,gzvm.yaml
 create mode 100644 Documentation/virt/geniezone/introduction.rst
 create mode 100644 arch/arm64/include/uapi/asm/gzvm_arch.h
 create mode 100644 drivers/soc/mediatek/virt/geniezone/Kconfig
 create mode 100644 drivers/soc/mediatek/virt/geniezone/Makefile
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm.h
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_eventfd.c
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_hyp.h
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_irqchip.c
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_main.c
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_vcpu.c
 create mode 100644 drivers/soc/mediatek/virt/geniezone/gzvm_vm.c
 create mode 100644 include/uapi/linux/gzvm_common.h

-- 
2.18.0


