Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A84EC352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:33:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57E120726
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJIWqs56";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NppQX57f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57E120726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+2AmRBkWVuhQ77ec8eoks47uMZE/j3V0KXjkMZuCamo=; b=DJIWqs56iuVNJV
	Pxk08mJ/jwS7Lz5xEalsl5rpjdy5e0JUOUtISqKoFeJKzWHX8XbNjdRlE4ad7NgKC1VsLY0qQJ6FO
	hSK3ncf0NEDo6pFmJE3lOq/qh7ZHkW9J9ip0tHCO83feFEfIQhy2lVJ42P/o7403SE3coOqxuNw9C
	tDZdRgRx+T+uAmTearuBHwRouclkdMEt1S9xgQAbDRLBBW6xLQh4BqRtKkcEX0Mj1Ck9u/8USMePd
	dIp+h4kNYzrmq/Rk4aKs6xuGJKax/BiKNmnLtl8bOqVL/lNfevLhS23+Sg8VZ5rplJKCOAhTxniAU
	k+A9UKSd4UhgGufBMe4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j000z-00045O-Vs; Fri, 07 Feb 2020 09:33:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j000x-00044i-AV; Fri, 07 Feb 2020 09:33:33 +0000
X-UUID: d2def8b5c1ae4aeea286d0cd20bf18b8-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=U8FRwP71b/QLr9XY8BWqKkhHb2z9q2xa/koQUBK/dBI=; 
 b=NppQX57femOoZqrCThFU6mK3Iez7kVuIQh+bFga/JdK7FMGBlnK3f7iA0EB8C4EDy7mmeZrhzKI4f7oUvhJ1B73RCRyk/1x5chgiM0XZVO7GK3bj3ZtgMjooHqbl0CENrhtRWC1Uwfp1TFflZ3TwmJuYYvH08aGIqK+tHmEaP74=;
X-UUID: d2def8b5c1ae4aeea286d0cd20bf18b8-20200207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1195897591; Fri, 07 Feb 2020 01:33:29 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 01:24:08 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 17:24:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 7 Feb 2020 17:22:49 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, mtk01761
 <wendell.lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Owen Chen
 <owen.chen@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Evan
 Green" <evgreen@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Joerg Roedel
 <jroedel@suse.de>, Shawn Guo <shawnguo@kernel.org>, Marc Zyngier
 <marc.zyngier@arm.com>, Ryder Lee <Ryder.Lee@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-clk@vger.kernel.org>
Subject: [PATCH v7 0/7] Add basic SoC support for mt6765
Date: Fri, 7 Feb 2020 17:20:43 +0800
Message-ID: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_013331_371585_615F4F63 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds basic SoC support for Mediatek's new 8-core SoC,
MT6765, which is mainly for smartphone application.

Changes in V7:
1. Adapt V6's patchset to latest kernel tree 5.5-rc1.
   Origin V6 patchset:
   https://patchwork.kernel.org/cover/11041963/
2. Correct 2 clock-controller type in documentation:
   mipi0 and venc_gcon.
   [v7 1/7] dt-bindings: clock: mediatek: document clk bindings
3. Remove V6's patch 03 because it has been taken into 5.5-next-soc
   [v6, 03/08] dt-bindings: mediatek: add MT6765 power dt-bindings
3. Update Reviewed-by: Rob Herring <robh@kernel.org> for
   [v6, 04/08] clk: mediatek: add mt6765 clock IDs
   --> [v7, 03/07] clk: mediatek: add mt6765 clock IDs
4. Update SPDX tag for
   [v6, 05/08] clk: mediatek: Add MT6765 clock support
   --> [v7, 04/07] clk: mediatek: Add MT6765 clock support

Changes in V6:
1. Adapt V5's patchset to latest kernel tree.
   Origin V5 patchset.
   https://lore.kernel.org/patchwork/cover/963612/
2. Due to clk's common code has been submit by other platform,
   this patch set will have dependencies with the following patchsets
   as the following orders.
   2.a. [v8,00/21] MT8183 IOMMU SUPPORT
        https://patchwork.kernel.org/cover/11023585/
   2.b. [v11,0/6] Add basic node support for Mediatek MT8183 SoC
        https://patchwork.kernel.org/cover/10962385/
   2.c. [v6,00/14] Mediatek MT8183 scpsys support
        https://patchwork.kernel.org/cover/11005751/
3. Correct power related patches into dt-binding patches.
4. Re-order V5's 4/11, 6/11, and 7/11 due clk common code change
   and make dependencies in order.
5. Update some commit message in clk related patches.

Changes in V5:
1. add clk support

Changes in V4:
1. add gic's settings in reg properties
2. remove some patches about dt-bindings since GKH already took them

Changes in V3:
1. split dt-binding document patchs
2. fix mt6765.dtsi warnings with W=12
3. remove uncessary PPI affinity for timer
4. add gicc base for gic dt node

Changes in V2:
1. fix clk properties in uart dts node
2. fix typo in submit title
3. add simple-bus in mt6765.dtsi
4. use correct SPDX license format

Mars Cheng (5):
  dt-bindings: clock: mediatek: document clk bindings for Mediatek
    MT6765 SoC
  dt-bindings: mediatek: Add smi dts binding for Mediatek MT6765 SoC
  clk: mediatek: add mt6765 clock IDs
  soc: mediatek: add MT6765 scpsys and subdomain support
  arm64: dts: mediatek: add mt6765 support

Owen Chen (2):
  clk: mediatek: Add MT6765 clock support
  arm64: defconfig: add CONFIG_COMMON_CLK_MT6765_XXX clocks

 .../arm/mediatek/mediatek,apmixedsys.txt      |   1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt |   1 +
 .../bindings/arm/mediatek/mediatek,camsys.txt |   1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt |   1 +
 .../arm/mediatek/mediatek,infracfg.txt        |   1 +
 .../bindings/arm/mediatek/mediatek,mipi0a.txt |  28 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt  |   1 +
 .../arm/mediatek/mediatek,pericfg.txt         |   1 +
 .../arm/mediatek/mediatek,topckgen.txt        |   1 +
 .../arm/mediatek/mediatek,vcodecsys.txt       |  27 +
 .../mediatek,smi-common.txt                   |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt6765-evb.dts   |  33 +
 arch/arm64/boot/dts/mediatek/mt6765.dtsi      | 253 +++++
 arch/arm64/configs/defconfig                  |   6 +
 drivers/clk/mediatek/Kconfig                  |  86 ++
 drivers/clk/mediatek/Makefile                 |   7 +
 drivers/clk/mediatek/clk-mt6765-audio.c       | 100 ++
 drivers/clk/mediatek/clk-mt6765-cam.c         |  74 ++
 drivers/clk/mediatek/clk-mt6765-img.c         |  70 ++
 drivers/clk/mediatek/clk-mt6765-mipi0a.c      |  68 ++
 drivers/clk/mediatek/clk-mt6765-mm.c          |  96 ++
 drivers/clk/mediatek/clk-mt6765-vcodec.c      |  70 ++
 drivers/clk/mediatek/clk-mt6765.c             | 952 ++++++++++++++++++
 drivers/soc/mediatek/mtk-scpsys.c             | 130 +++
 include/dt-bindings/clock/mt6765-clk.h        | 313 ++++++
 26 files changed, 2323 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mipi0a.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vcodecsys.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6765-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6765.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt6765-audio.c
 create mode 100644 drivers/clk/mediatek/clk-mt6765-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt6765-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6765-mipi0a.c
 create mode 100644 drivers/clk/mediatek/clk-mt6765-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6765-vcodec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6765.c
 create mode 100644 include/dt-bindings/clock/mt6765-clk.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
