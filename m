Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC98C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ceXalHAuIksnuFiIVd7wTCqvK2NPmLbhprmDrAqNiRY=; b=Wu0pTPbEvwel07
	FsJXNXoeDDZEoFZTBMW6sna+3QJ+ORuIrQeH7FhapbQKJxY/KDkSWhxPJgMvMDrz+lS+GFyidtEcw
	S3em34J/wWtWC6l90SDRKNVDoSLi/6fLyN4W5rRMsE2qeyR7u0oqBelR8b+exF1w1WvJ/+UHL8b0P
	zba9kYf4tKzX9xfaGQjZyiDayOjLZ/wBNAZ1uk7Hny07AAE9Wq3062evW0DSencPO3ei/5zYrDLby
	dHqcYlFhChwqS+dJIg0wJjZXCOCGwkIv3lC145VwA8bFCSd7UgG4zgwSlnF514vVNAXqGS2MELjzj
	GUdM4IxsiPR+0tKNyaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjez-002ofN-Rv; Fri, 10 Dec 2021 17:26:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjex-002oeO-2b; Fri, 10 Dec 2021 17:26:17 +0000
X-UUID: 79c71320d65342ee8ee5559c9f1e7894-20211210
X-UUID: 79c71320d65342ee8ee5559c9f1e7894-20211210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1924781939; Fri, 10 Dec 2021 10:26:11 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:26:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:07 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 00/17] MediaTek MT8192 APU
Date: Sat, 11 Dec 2021 01:25:48 +0800
Message-ID: <20211210172605.30618-1-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_092615_154753_5E62F9CD 
X-CRM114-Status: GOOD (  11.89  )
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

The MediaTek AI Processing Unit (APU) is a proprietary hardware
in the SoC to support AI functions.
The patches support the MT8192 APU runs on internal microprocessor.
Software packages contins mailbox, iommu, APU remote processor,
power control, middleware and debug looger.

This series is based on drivers implemented in
MT8192 apu power domain[1], apu SMC[2] and IOMMU[2] patches.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=593809
[2] https://patchwork.kernel.org/patch/12670253
[3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=551641
The device tree depends on [4][5][6] which haven't yet been accepted.
[4] https://patchwork.kernel.org/patch/12456165
[5] https://patchwork.kernel.org/patch/12134935
[6] https://patchwork.kernel.org/patch/12140237

Change notes:
Initial RFC: https://patchwork.kernel.org/project/linux-mediatek/list/?series=568939

Flora Fu (17):
  dt-bindings: mailbox: mediatek: Add APU mailbox compatible
  dt-bindings: memory: mediatek: Add MT8192 apu iommu bindings
  dt-bindings: remoteproc: mediatek: Add APU rproc compatible
  dt-bindings: soc: mediatek: apu: Add APU power compatible
  dt-bindings: soc: mediatek: apu: Add apu logger compatible
  mailbox: mediatek: add mtk-apu-mailbox driver
  iommu/mediatek: Support APU iommu and config data for mt8192
  remoteproc: mediatek: Add APU remoteproc driver
  soc: mediatek: apu: Add Apu power driver
  soc: mediatek: apu: Add APU software logger dirver
  soc: mediatek: apu: Add middleware driver
  arm64: dts: mt8192: Add APU mtk-apu-mailbox node
  arm64: dts: mt8192: Add APU-IOMMU nodes
  arm64: dts: mt8192: Add apu tinysys node
  arm64: dts: mt8192: Add APU power nodes
  arm64: dts: mt8192: Add apu-sw-logger node
  arm64: dts: mt8192: Set up regulators for APU subsys

 .../bindings/iommu/mediatek,iommu.yaml        |    7 +-
 .../mailbox/mediatek,apu-mailbox.yaml         |   47 +
 .../bindings/remoteproc/mediatek,apu-rv.yaml  |  106 ++
 .../soc/mediatek/mediatek,apu-logger.yaml     |   42 +
 .../soc/mediatek/mediatek,apu-pwr.yaml        |   80 ++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |    5 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  118 ++
 drivers/iommu/mtk_iommu.c                     |   45 +-
 drivers/mailbox/Kconfig                       |    9 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mtk-apu-mailbox.c             |  162 +++
 drivers/remoteproc/Kconfig                    |   12 +
 drivers/remoteproc/Makefile                   |    2 +
 drivers/remoteproc/mtk-apu-ipi.c              |  474 ++++++++
 drivers/remoteproc/mtk-apu-rproc.c            | 1054 +++++++++++++++++
 drivers/soc/mediatek/apusys/Kconfig           |   23 +
 drivers/soc/mediatek/apusys/Makefile          |   17 +
 drivers/soc/mediatek/apusys/apu-device.h      |   39 +
 drivers/soc/mediatek/apusys/apu-pwr-dbg.c     |  167 +++
 drivers/soc/mediatek/apusys/apu-pwr-ipi.c     |  377 ++++++
 drivers/soc/mediatek/apusys/apu-pwr.c         |  613 ++++++++++
 drivers/soc/mediatek/apusys/apu-pwr.h         |  260 ++++
 drivers/soc/mediatek/apusys/apu-sw-logger.c   |  540 +++++++++
 drivers/soc/mediatek/apusys/mdw-cmd.c         |  618 ++++++++++
 drivers/soc/mediatek/apusys/mdw-drv.c         |  226 ++++
 drivers/soc/mediatek/apusys/mdw-ioctl.c       |  331 ++++++
 drivers/soc/mediatek/apusys/mdw-ioctl.h       |  256 ++++
 drivers/soc/mediatek/apusys/mdw-mem.c         |  938 +++++++++++++++
 drivers/soc/mediatek/apusys/mdw-mem.h         |   23 +
 drivers/soc/mediatek/apusys/mdw-rv-cmd.c      |  158 +++
 drivers/soc/mediatek/apusys/mdw-rv-dev.c      |  386 ++++++
 drivers/soc/mediatek/apusys/mdw-rv-msg.h      |   90 ++
 drivers/soc/mediatek/apusys/mdw-rv.c          |  131 ++
 drivers/soc/mediatek/apusys/mdw-rv.h          |   98 ++
 drivers/soc/mediatek/apusys/mdw-sysfs.c       |  200 ++++
 drivers/soc/mediatek/apusys/mdw.h             |  207 ++++
 include/dt-bindings/memory/mt8192-larb-port.h |    4 +
 include/linux/remoteproc/mtk-apu-config.h     |  100 ++
 include/linux/remoteproc/mtk-apu.h            |  217 ++++
 39 files changed, 8181 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,apu-rv.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-logger.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
 create mode 100644 drivers/mailbox/mtk-apu-mailbox.c
 create mode 100644 drivers/remoteproc/mtk-apu-ipi.c
 create mode 100644 drivers/remoteproc/mtk-apu-rproc.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-device.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-dbg.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr-ipi.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-pwr.h
 create mode 100644 drivers/soc/mediatek/apusys/apu-sw-logger.c
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
 create mode 100644 include/linux/remoteproc/mtk-apu-config.h
 create mode 100644 include/linux/remoteproc/mtk-apu.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
