Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AABC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tIQXMTgd2Z53KD65SHONfOVnJSMSZxWHc2xaigKc1XM=; b=YdRqhOZE98G1iX
	oAIdgI1r6DREtaZyFPPzDPKeeHImK7PrlwR0IfKckOxLc1nz20w8EA5m30GwEKT5zeQaZoQrDFUlV
	qXN1P4vh1k9VoJoJ+eAGXb9oL1CweWvzx0VIT7H9fbjhvC9vRMkCWRyYSGwcK6B5A2B4zUee87gB7
	B3WovvmKmGykkQWQBWy9puabYpVrxDksZt6fIuXrKSpRDcdvi5/b+uvg0aiFhrQX+DsudXXHlTtXT
	WOPMVrRuhU0zUd6xTAxD6rVd6YyMUsn8NR9aNk/RwQAtDmDZUwIXuO1Dl+YcconiAI5ysM3SV6zYw
	czX2ygLq0sSqY57BWRHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryZ0-0047ZU-T1; Tue, 30 Nov 2021 08:32:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryYl-0047Wz-F2; Tue, 30 Nov 2021 08:32:20 +0000
X-UUID: 8fcd94fa084541eea89b256e37b73774-20211130
X-UUID: 8fcd94fa084541eea89b256e37b73774-20211130
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1167390062; Tue, 30 Nov 2021 01:32:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 00:32:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 30 Nov 2021 16:32:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 30 Nov 2021 16:32:12 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v4,0/5] Add Mediatek SPI Nand controller and convert ECC driver
Date: Tue, 30 Nov 2021 16:31:57 +0800
Message-ID: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_003219_526112_B34518D6 
X-CRM114-Status: GOOD (  12.66  )
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

The Mediatek SPI Nand controller can support multiple SPI protocols,
which can support other SPI device in theory. And the SPI Nand controller
can cowork with the HW ECC engine for high performance at the pipelined
ecc case.

This RFC v4 series fix coding style and move some ecc related code form
snfi driver to the ecc driver based on the RFC v3 comment. And, also try
to resolve the read/write OOB issue in AUTO mode, which can also resolve
the data format issue with Mediatek ECC engine.

The RFC patch v1 and v2 only try to get nand info and ecc status
in spi driver. However, this can be resolved by pipelined ECC design.

The RFC patch v3 realize the HW ECC engine in pipelined case.

Only take mt7622 project for dts node example.

Xiangsheng Hou (5):
  mtd: nand: ecc: Move mediatek ECC driver
  mtd: nand: ecc: mtk: Convert to the ECC infrastructure
  spi: mtk: Add mediatek SPI Nand Flash interface driver
  mtd: spinand: Move set/get OOB databytes to each ECC engines
  arm64: dts: mtk: Add snfi node

 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts |   16 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     |   13 +
 drivers/mtd/nand/Kconfig                     |    9 +
 drivers/mtd/nand/Makefile                    |    1 +
 drivers/mtd/nand/ecc-mtk.c                   | 1207 ++++++++++++++++++
 drivers/mtd/nand/ecc-sw-bch.c                |   71 +-
 drivers/mtd/nand/ecc-sw-hamming.c            |   71 +-
 drivers/mtd/nand/raw/Kconfig                 |    1 +
 drivers/mtd/nand/raw/Makefile                |    2 +-
 drivers/mtd/nand/raw/mtk_ecc.c               |  593 ---------
 drivers/mtd/nand/raw/mtk_ecc.h               |   47 -
 drivers/mtd/nand/raw/mtk_nand.c              |    2 +-
 drivers/mtd/nand/spi/core.c                  |   93 +-
 drivers/spi/Kconfig                          |   11 +
 drivers/spi/Makefile                         |    1 +
 drivers/spi/spi-mtk-snfi.c                   | 1117 ++++++++++++++++
 include/linux/mtd/nand-ecc-mtk.h             |  115 ++
 include/linux/mtd/nand-ecc-sw-bch.h          |    4 +
 include/linux/mtd/nand-ecc-sw-hamming.h      |    4 +
 include/linux/mtd/spinand.h                  |    4 +
 20 files changed, 2691 insertions(+), 691 deletions(-)
 create mode 100644 drivers/mtd/nand/ecc-mtk.c
 delete mode 100644 drivers/mtd/nand/raw/mtk_ecc.c
 delete mode 100644 drivers/mtd/nand/raw/mtk_ecc.h
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 create mode 100644 include/linux/mtd/nand-ecc-mtk.h

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
