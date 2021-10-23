Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8FCC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:14:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E4C960FDC
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E4C960FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NGGrJnWWSv1Ioqk7saFbKZpQA4GecdjhrZranGebJtQ=; b=UCaSlwHVakoCDE
	Py1qgwZPGw11DXh4QHKfF44Zev6tHT51n/VjwC0kaf58QGEm6v1XZqmgtQu3BkqvdiVz6hH5KJJ+4
	shzQ5bxrqP6hJqA0xFKZqb4kzIBC4Z3AsrT4i28/7Etf+Hq+20NG/rOZj2I7cFV//fuEEl4Kdi5+S
	npdmQvRi3dCwV6XtUMmlCA43NbGXHsGNL0VUX+w2kAPCanK+KNTFiXumBjd8fBRC64TiV+Bl9s7Wu
	/2eh11WnJjOL0yyNGfF28T1NyU/Bj1v3N/EVe3q7gtULPdjn5IiLRnXixKyX1DqS0DUnmBQFLH3iU
	BnzA40Z/QY6QhRcZcAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meEyo-00CcFi-Fx; Sat, 23 Oct 2021 11:14:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meEyk-00CcEz-Dg; Sat, 23 Oct 2021 11:14:24 +0000
X-UUID: 4a68e846f63c480d8f3908bbb4986d42-20211023
X-UUID: 4a68e846f63c480d8f3908bbb4986d42-20211023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1163551949; Sat, 23 Oct 2021 04:14:15 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 04:14:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:14:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:12 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 00/13] MediaTek MT8192 APU
Date: Sat, 23 Oct 2021 19:13:56 +0800
Message-ID: <20211023111409.30463-1-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_041422_520522_1012F60C 
X-CRM114-Status: GOOD (  11.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add Support for MediaTek MT8192 APU.

The MediaTek AI Processing Unit (APU) is a proprietary hardware
in the SoC to support AI functions.
The patches support the MT8192 APU running on internal microprocess.
Software packages contins power control, tinysys controller and middleware.

This series is based on drivers implemented in
MT8192 apu power domain[1] and IOMMU[2] patches.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=568927
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=551641
The device tree depends on [3][4][5] which haven't yet been accepted.
[3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655
[4] https://patchwork.kernel.org/patch/12134935
[5] https://patchwork.kernel.org/patch/12140237


Flora Fu (12):
  dt-bindings: soc: mediatek: apusys: add mt8192 apu iommu bindings
  dt-bindings: soc: mediatek: apusys: Add new document for APU power
  dt-bindings: soc: mediatek: apusys: Add new document for APU tinysys
  iommu/mediatek: Add APU iommu support
  soc: mediatek: Add command for APU SMC call
  soc: mediatek: apu: Add apu core driver
  soc: mediatek: apu: Add apu power driver
  soc: mediatek: apu: Add apusys rv driver
  soc: mediatek: apu: Add middleware driver
  arm64: dts: mt8192: Add apu power nodes
  arm64: dts: mt8192: Add apu tinysys
  arm64: dts: mt8192: Add regulator for APU

Yong Wu (1):
  arm64: dts: mt8192: Add APU-IOMMU nodes

 .../bindings/iommu/mediatek,iommu.yaml        |   2 +
 .../soc/mediatek/mediatek,apu-pwr.yaml        |  88 ++
 .../soc/mediatek/mediatek,apu-rv.yaml         | 140 +++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |   5 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 107 ++
 drivers/iommu/mtk_iommu.c                     |  57 ++
 drivers/soc/mediatek/Kconfig                  |  18 +
 drivers/soc/mediatek/apusys/Makefile          |  22 +
 drivers/soc/mediatek/apusys/apu-config.h      | 100 ++
 drivers/soc/mediatek/apusys/apu-core.c        |  97 ++
 drivers/soc/mediatek/apusys/apu-core.h        |  18 +
 drivers/soc/mediatek/apusys/apu-device.h      |  39 +
 drivers/soc/mediatek/apusys/apu-ipi.c         | 486 +++++++++
 drivers/soc/mediatek/apusys/apu-mbox.c        |  83 ++
 drivers/soc/mediatek/apusys/apu-mbox.h        |  27 +
 drivers/soc/mediatek/apusys/apu-pwr-dbg.c     | 167 ++++
 drivers/soc/mediatek/apusys/apu-pwr-ipi.c     | 377 +++++++
 drivers/soc/mediatek/apusys/apu-pwr.c         | 599 +++++++++++
 drivers/soc/mediatek/apusys/apu-pwr.h         | 260 +++++
 drivers/soc/mediatek/apusys/apu-rproc.c       | 806 +++++++++++++++
 drivers/soc/mediatek/apusys/apu-sw-logger.c   | 429 ++++++++
 drivers/soc/mediatek/apusys/apu.h             | 256 +++++
 drivers/soc/mediatek/apusys/mdw-cmd.c         | 618 ++++++++++++
 drivers/soc/mediatek/apusys/mdw-drv.c         | 211 ++++
 drivers/soc/mediatek/apusys/mdw-ioctl.c       | 331 ++++++
 drivers/soc/mediatek/apusys/mdw-ioctl.h       | 256 +++++
 drivers/soc/mediatek/apusys/mdw-mem.c         | 938 ++++++++++++++++++
 drivers/soc/mediatek/apusys/mdw-mem.h         |  23 +
 drivers/soc/mediatek/apusys/mdw-rv-cmd.c      | 158 +++
 drivers/soc/mediatek/apusys/mdw-rv-dev.c      | 386 +++++++
 drivers/soc/mediatek/apusys/mdw-rv-msg.h      |  90 ++
 drivers/soc/mediatek/apusys/mdw-rv.c          | 131 +++
 drivers/soc/mediatek/apusys/mdw-rv.h          |  98 ++
 drivers/soc/mediatek/apusys/mdw-sysfs.c       | 200 ++++
 drivers/soc/mediatek/apusys/mdw.h             | 208 ++++
 drivers/soc/mediatek/apusys/mt81xx-plat.c     | 320 ++++++
 include/dt-bindings/memory/mt8192-larb-port.h |   4 +
 include/linux/soc/mediatek/mtk_sip_svc.h      |   2 +
 38 files changed, 8157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-rv.yaml
 create mode 100644 drivers/soc/mediatek/apusys/apu-config.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-device.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-mbox.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-dbg.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-rproc.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-sw-logger.c
 create mode 100644 drivers/soc/mediatek/apusys/apu.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-cmd.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-drv.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-ioctl.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-ioctl.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-mem.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-mem.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-cmd.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-dev.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv-msg.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw-rv.h
 create mode 100644 drivers/soc/mediatek/apusys/mdw-sysfs.c
 create mode 100644 drivers/soc/mediatek/apusys/mdw.h
 create mode 100644 drivers/soc/mediatek/apusys/mt81xx-plat.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
