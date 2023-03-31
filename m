Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA8C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C+sX6Eh7ZHgMNlI6zAFqcr5ZyEN76d6Gxh7Jrlw1qr4=; b=TzhXU2ohdfPHDN8NG/OZfAle8A
	VtYoVyyMNsssbdXpUksyO1ouvFoTBdRmsyVq/rWKel8WUC2Qy/gEJLyCCaJlGzp0KW9vhMa+Dg/XL
	auT/7c97iVL9O2GdHyufvbsfB6v4bBdxOoqldEuLPz39gEReo4Pr5A7blRv2iBqRg+GJzEqc8yE5v
	QjmpqGqUiIkpnOMxSsWtPhC/nTJkGmTxE0xZEc7t76mApUrBZMGgm3rvTOB46XLWHxC1FBqpTycq/
	YSnJyx8QTkcg6iU16WXnH4yZdTqNkohDeOdNSKHHfp+TfWpj5G9Ak7w0JSw7XFxY/OT2LUQE3Y2/t
	00NUAoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piABU-006Poh-0U;
	Fri, 31 Mar 2023 08:32:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piABN-006PlJ-2F;
	Fri, 31 Mar 2023 08:32:27 +0000
X-UUID: 8bf9dfe2cf9e11edb7d8d11f642b8e78-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C+sX6Eh7ZHgMNlI6zAFqcr5ZyEN76d6Gxh7Jrlw1qr4=;
	b=mWNY0wfIi2gTbTxs2mGw8BLzt2kxBV0MBCtzhKCNvoy9Z6k6Ouzdernm79Cde/m06WKjWvAqeFwiXlQTLdGiyOcfPtoxCkVNFF/qCtihpozDWTXFWrlMv5CnTGyV7P+Jk43Ig9STmf4rDBvvjTVBsam5QQVvbK6YgPlfwSgN9qw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:538f5645-c337-43dc-9c15-c879c4e5e1d4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:161af5b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8bf9dfe2cf9e11edb7d8d11f642b8e78-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 10948348; Fri, 31 Mar 2023 01:32:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 16:21:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 16:21:38 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v7 00/19]  MediaTek MT8188 clock support
Date: Fri, 31 Mar 2023 16:21:12 +0800
Message-ID: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_013225_737791_3F971536 
X-CRM114-Status: UNSURE (   9.26  )
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

Base on tag: next-20230330, linux-next/master

changes since v6:
- modify all clock drivers changed to allow building as modules
- modify mtk_clk_pdev_probe for VDO0, VDO1, VPP0, VPP1
- modify all clock drivers using C-style comments
- remove unnecessary comma

Garmin.Chang (19):
  dt-bindings: clock: mediatek: Add new MT8188 clock
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
  clk: mediatek: Add MT8188 adsp clock support

 .../bindings/clock/mediatek,mt8188-clock.yaml |   71 +
 .../clock/mediatek,mt8188-sys-clock.yaml      |   55 +
 drivers/clk/mediatek/Kconfig                  |   86 ++
 drivers/clk/mediatek/Makefile                 |   13 +
 .../clk/mediatek/clk-mt8188-adsp_audio26m.c   |   48 +
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c  |  157 ++
 drivers/clk/mediatek/clk-mt8188-cam.c         |  120 ++
 drivers/clk/mediatek/clk-mt8188-ccu.c         |   50 +
 drivers/clk/mediatek/clk-mt8188-img.c         |  112 ++
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    |   80 +
 drivers/clk/mediatek/clk-mt8188-infra_ao.c    |  199 +++
 drivers/clk/mediatek/clk-mt8188-ipe.c         |   52 +
 drivers/clk/mediatek/clk-mt8188-mfg.c         |   49 +
 drivers/clk/mediatek/clk-mt8188-peri_ao.c     |   59 +
 drivers/clk/mediatek/clk-mt8188-topckgen.c    | 1350 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-vdec.c        |   92 ++
 drivers/clk/mediatek/clk-mt8188-vdo0.c        |  105 ++
 drivers/clk/mediatek/clk-mt8188-vdo1.c        |  152 ++
 drivers/clk/mediatek/clk-mt8188-venc.c        |   54 +
 drivers/clk/mediatek/clk-mt8188-vpp0.c        |  114 ++
 drivers/clk/mediatek/clk-mt8188-vpp1.c        |  109 ++
 drivers/clk/mediatek/clk-mt8188-wpe.c         |  103 ++
 .../dt-bindings/clock/mediatek,mt8188-clk.h   |  726 +++++++++
 23 files changed, 3956 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8188-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
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
 create mode 100644 include/dt-bindings/clock/mediatek,mt8188-clk.h

-- 
2.18.0


