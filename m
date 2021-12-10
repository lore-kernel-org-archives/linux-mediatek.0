Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974C0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=blrBXQL2ppeGep4CD0XAXKm+ZmEH30UyzkoPcoiyHBk=; b=QejGey9tqYnunz
	gNm4C3c8uBy1uFKegYx0miJTfC6LbH4UJHNunimF9auY09aeMtmFhwSb91j2BX8qOkuEWuihpGzj9
	xdEb7C2VJZu/qY4SVx8gAt1MjLqgwhw5hrBcMB2q+3bDAEUR4T6lSkCpGCaCBnkhaH7iLsufre+rh
	ESQQOIgCPuBMFvVv3+b5B8y+F0qWWxAYHeuDK+7dWmyIdeE3T+xsH3bqOAQe4C20FTw68ldoGnaUJ
	uOPv7jBx2VOFWw/ljMOD3UTU9gxHXPKdG1JCiIE3JxoiXOqxHkeJI/Gl4mQtAq21bSecJzDADKiQ+
	Yjzl6JaPFtkmzwL6sYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjH9-002hAb-QI; Fri, 10 Dec 2021 17:01:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjH6-002h8d-MQ; Fri, 10 Dec 2021 17:01:38 +0000
X-UUID: 586c5fd5f6fe4943b129277632450f26-20211210
X-UUID: 586c5fd5f6fe4943b129277632450f26-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2142310745; Fri, 10 Dec 2021 10:01:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:01:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:01:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:01:30 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "Yong
 Wu" <yong.wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 0/8] Add Support for MediaTek MT8192 APU Power Domain
Date: Sat, 11 Dec 2021 01:01:05 +0800
Message-ID: <20211210170113.30063-1-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_090136_788445_34DDAA0B 
X-CRM114-Status: GOOD (  13.53  )
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
in the SoC to support AI operations.
The series is to create apusys in the SoC folder for developing
the related drivers. Add the apu clocks, basic apu nodes and the
power domain to provide the power controller of APU subsystem.

This series is based on MT8192 power domain[1], PWRAP[2]
and PMIC MT6359[3] patches.
[1] https://patchwork.kernel.org/patch/12456165
[2] https://patchwork.kernel.org/patch/12134935
[3] https://patchwork.kernel.org/patch/12140237

Change notes:
v3->v4:
  1) Rebase to 5.16-rc1
  2) Update mtk-apu-pm driver to be a module or a buildin driver.
  3) Fix coding defects and typo in mtk-apu-pm.c and update
     copyright in dt-bindins.
  4) Split the mt8192 EVB device tree "mt8192-evb.dts" to a new patch
     file in the series.

v2->v3:
  1) Rebase to 5.15-rc1
  2) remove the apu-mbox registers from syscon.
  3) update mtk-apu-pm to fix clock flow and move power status bit into
     platform data to support different hardware settings.

v1->v2:
  1) update expression "s/_/-/" in dt-bindings documents.
  2) drop apu power domain header file for mt8192.

v1: https://patchwork.kernel.org/project/linux-mediatek/list/?series=461999

Flora Fu (8):
  dt-bindings: clock: Add MT8192 APU clock bindings
  clk: mediatek: mt8192: Add APU clocks support
  dt-bindings: arm: mediatek: Add new document bindings for APU
  dt-bindings: soc: mediatek: apusys: Add new document for APU power
    domain
  soc: mediatek: apu: Add apusys and add apu power domain driver
  arm64: dts: mt8192: Add APU node
  arm64: dts: mt8192: Add APU power domain node
  arm64: dts: mt8192: Set up apu power domain regulators

 .../arm/mediatek/mediatek,apusys.yaml         |  50 ++
 .../soc/mediatek/mediatek,apu-pm.yaml         | 144 ++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  39 +
 drivers/clk/mediatek/clk-mt8192.c             |  91 +++
 drivers/soc/mediatek/Kconfig                  |  12 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/apusys/Kconfig           |  14 +
 drivers/soc/mediatek/apusys/Makefile          |   2 +
 drivers/soc/mediatek/apusys/mtk-apu-pm.c      | 727 ++++++++++++++++++
 include/dt-bindings/clock/mt8192-clk.h        |  14 +-
 11 files changed, 1099 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
 create mode 100644 drivers/soc/mediatek/apusys/Kconfig
 create mode 100644 drivers/soc/mediatek/apusys/Makefile
 create mode 100644 drivers/soc/mediatek/apusys/mtk-apu-pm.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
