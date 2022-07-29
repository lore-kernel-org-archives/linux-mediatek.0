Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0640C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFRfuyWKm2z6no2oS1x3hlDwEglDN+Q0aJSupPIQTgE=; b=ylRF/kqantJDHTxcLgQ8ssWcaG
	I3H/3A5UP6GMW/l3ybEfz3nj6YJBfoLMLnBw7fLRLPVIHs3TqMovuDIH8sbiO12i1TYsAofCBtnOU
	QJpRXAAHjVGKDDKXhBVo7k4+5OOFVJtMwIPxIZDxRW4cbpJbU2oKAt4Zu2PH2djXvQN89MLE0mQ1s
	7+HYXGyyCmdnmibVrbHXyWMR+BMrHipJFjTjttqgDRXRygiWqv1ZV2hWOpaLz4VsZVBMUoDfDdQ8i
	TvxX1i9So6i5CIaTFIzwJDp6NPD57+28yO4Ue075sB6mIDZIXQHCeaR+QpDeIRF8TkVqRb+o2X9hf
	Bj+09vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLvk-003cky-1q; Fri, 29 Jul 2022 09:05:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLmb-003XQ1-Dj; Fri, 29 Jul 2022 08:55:47 +0000
X-UUID: 0ed33493f76848c4805b67915fd84472-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:63fe8e73-e544-4a2a-a78d-221c8b93b2f3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:b4d1aed0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0ed33493f76848c4805b67915fd84472-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1098983203; Fri, 29 Jul 2022 01:55:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 16:25:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:01 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 00/18] MediaTek MT8188 clock support
Date: Fri, 29 Jul 2022 16:24:39 +0800
Message-ID: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_015545_511247_0A83B6A4 
X-CRM114-Status: UNSURE (   8.19  )
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

Base on tag: next-20220728, linux-next/master

Garmin.Chang (18):
  dt-bindings: ARM: MediaTek: Add new document bindings of MT8188 clock
  clk: mediatek: Add MT8188 apmixedsys clock support
  clk: mediatek: Add MT8188 topckgen clock support
  clk: mediatek: Add MT8188 peripheral clock support
  clk: mediatek: Add MT8188 infrastructure clock support
  clk: mediatek: Add MT8188 camsys clock support
  clk: mediatek: Add MT8188 ccusys clock support
  clk: mediatek: Add MT8188 imgsys clock support
  clk: mediatek: Add MT8188 ipesys clock support
  clk: mediatek: Add MT8188 mfgcfg clock support
  clk: mediatek: Add MT8188 vdecsys clock support
  clk: mediatek: Add MT8188 vdosys0 clock support
  clk: mediatek: Add MT8188 vdosys1 clock support
  clk: mediatek: Add MT8188 vencsys clock support
  clk: mediatek: Add MT8188 vppsys0 clock support
  clk: mediatek: Add MT8188 vppsys1 clock support
  clk: mediatek: Add MT8188 wpesys clock support
  clk: mediatek: Add MT8188 imp i2c wrapper clock support

 .../arm/mediatek/mediatek,mt8188-clock.yaml   |  230 +++
 .../mediatek/mediatek,mt8188-sys-clock.yaml   |   75 +
 drivers/clk/mediatek/Kconfig                  |    8 +
 drivers/clk/mediatek/Makefile                 |    7 +
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c  |  153 ++
 drivers/clk/mediatek/clk-mt8188-cam.c         |  130 ++
 drivers/clk/mediatek/clk-mt8188-ccu.c         |   52 +
 drivers/clk/mediatek/clk-mt8188-img.c         |  124 ++
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    |   85 ++
 drivers/clk/mediatek/clk-mt8188-infra_ao.c    |  194 +++
 drivers/clk/mediatek/clk-mt8188-ipe.c         |   54 +
 drivers/clk/mediatek/clk-mt8188-mfg.c         |   50 +
 drivers/clk/mediatek/clk-mt8188-peri_ao.c     |   60 +
 drivers/clk/mediatek/clk-mt8188-topckgen.c    | 1337 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-vdec.c        |   96 ++
 drivers/clk/mediatek/clk-mt8188-vdo0.c        |  129 ++
 drivers/clk/mediatek/clk-mt8188-vdo1.c        |  177 +++
 drivers/clk/mediatek/clk-mt8188-venc.c        |   56 +
 drivers/clk/mediatek/clk-mt8188-vpp0.c        |  117 ++
 drivers/clk/mediatek/clk-mt8188-vpp1.c        |  112 ++
 drivers/clk/mediatek/clk-mt8188-wpe.c         |  107 ++
 include/dt-bindings/clock/mt8188-clk.h        |  759 ++++++++++
 22 files changed, 4112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8188-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-ccu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-peri_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-wpe.c
 create mode 100644 include/dt-bindings/clock/mt8188-clk.h

-- 
2.18.0


