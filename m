Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13311611F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13311611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gp6/csO/vR0ECcjOI1/D941POB5f82Oc0UqbyBNxc3Y=; b=zFWFZlVyjV1n9z
	M/CfonM9HTvpLuRsAft9fTm59zPlr4bTMhQzyX4UjwDDdoi62Fi3vjKMpoXJ1m0VQw3LLXR1w8NPE
	cbSFfpUg21+63uAJ1yWoxmamYurUx9JrQUJtuoVawCe3HvpExIgL3TDxGg6AYSNqlovaidQR59seN
	mA/Geyej+P3J4k6QAFyaQz9q9J0ZdXeordEWLYAL5gB2HwFdOYQR1KJlX3p/aAaw2dDsfSretaDse
	mCNZ54JWJ14QpxyzW4wl9ha3Y5FLR0lZoAp386PIGy10VnOafKeQuW1VXENvG2DqjVJ8CJi1kiK3e
	FgJ+rLTjs4xoC7imXGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdkUQ-009bQ9-TS; Fri, 22 Oct 2021 02:41:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkU9-009bNt-NG; Fri, 22 Oct 2021 02:40:47 +0000
X-UUID: 6f975247a93143b8864c711a1988e1d0-20211021
X-UUID: 6f975247a93143b8864c711a1988e1d0-20211021
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 607221174; Thu, 21 Oct 2021 19:40:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 19:40:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 10:40:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 10:40:36 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v3 0/5] Add driver for Mediatek SPI Nand and HW ECC controller 
Date: Fri, 22 Oct 2021 10:40:16 +0800
Message-ID: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_194045_785644_1381EAE9 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a driver for Mediatek SPI Nand and HW ECC controller

The Mediatek SPI Nand controller can support multiple SPI protocols,
which can support other SPI device in theory. And the SPI Nand controlelr
can cowork with the HW ECC engine for high performance at the pipelined
ecc case.

The RFC patch v3 realize the HW ECC engine in pipelined case.

The RFC patch v1 and v2 only try to get nand info and ecc status
in spi driver. However, this can be resolved by pipelined ECC design.
Only take mt7622 board for dts node example.

Xiangsheng Hou (5):
  mtd: ecc: move mediatek HW ECC driver
  mtd: ecc: realize Mediatek HW ECC driver
  spi: add Mediatek SPI Nand controller driver
  arm64: dts: add snfi node for spi nand
  mtd: spinand: skip set/get oob data bytes when interleaved case

 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   18 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   13 +
 drivers/mtd/nand/Kconfig                      |    9 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/core.c                       |   10 +-
 drivers/mtd/nand/ecc.c                        |   88 ++
 drivers/mtd/nand/{raw => }/mtk_ecc.c          |  490 ++++++-
 drivers/mtd/nand/raw/Kconfig                  |    1 +
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 drivers/mtd/nand/raw/mtk_nand.c               |    2 +-
 drivers/mtd/nand/spi/core.c                   |    6 +-
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-mtk-snfi.c                    | 1234 +++++++++++++++++
 .../nand/raw => include/linux/mtd}/mtk_ecc.h  |   38 +
 include/linux/mtd/nand.h                      |   11 +
 16 files changed, 1927 insertions(+), 8 deletions(-)
 rename drivers/mtd/nand/{raw => }/mtk_ecc.c (52%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename {drivers/mtd/nand/raw => include/linux/mtd}/mtk_ecc.h (64%)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
