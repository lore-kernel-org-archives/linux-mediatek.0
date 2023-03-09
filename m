Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6368C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VE6deOzWU724HC7+5//6PX1XAy1/y6mu5bn8YwbIUus=; b=ZJ6GItDlG44FR0KU+kXjp/WMXM
	/z5Th7v2MTA2iNJcsITDKgRcKQnDDdkrgtIRlLa8iz9xNEQh1kMTfg/bmR0THrwQwWAyzeTwqb8i2
	EwAMe4maIwfqnbw7gJjfrnc4aiP//HQ6gBD/AYG4x55/RaLEln/s7aFFhc/4q8YD8os3g/ss96G7T
	iZUXK1vP/IJXvzD3qQe3a/7tok7UbNEQAOoVFTfKXpxdIsLLI+Nj3oetjKoOs2mDr3i8Cwpe55r10
	eZyyfDgGuSuWKmBEAWUw2mkM6oSGHH2ZlWpJExNU440wBhUGlAwz9qNKgyIG7L9hLgw0/bs96TMDQ
	+gCLflbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGj7-00AEzo-O8; Thu, 09 Mar 2023 13:54:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGj3-00AEvL-ED; Thu, 09 Mar 2023 13:54:35 +0000
X-UUID: e87e7026be8111edbbe3f76fe852e059-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VE6deOzWU724HC7+5//6PX1XAy1/y6mu5bn8YwbIUus=;
	b=JyMDwq8WdNqEgJ9CgWTMLYwEvmpopCcLsF6w9UUnWNZFhPjaejUgCVbv0FTvqhzDGuiOchegzrJCwkI6EGjtDW0LFcoYoL93p5PRNit9qqW6nHA51R+Dv3MtvDz+0Rf68M1dIR0nO+o3VuHntara/IPnC9MB9RQycRBQ4a+WW0s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:cace2c6f-046c-4a89-9ea6-50322ca13660,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:28a4bdb2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: e87e7026be8111edbbe3f76fe852e059-20230309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1621270799; Thu, 09 Mar 2023 06:54:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 21:54:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 21:54:24 +0800
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
Subject: [PATCH v6 00/19]  MediaTek MT8188 clock support
Date: Thu, 9 Mar 2023 21:54:00 +0800
Message-ID: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_055433_532984_1F989C72 
X-CRM114-Status: UNSURE (   8.97  )
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

Base on tag: next-20230309, linux-next/master

changes since v5:
- modify mediatek,mt8188-clk.h
- modify apmixedsys clock
- modify topckgen clock
- modify mfgcfg clock
- modify vdecsys clock
- modify vdosys0 clock
- modify vdosys1 clock
- modify vencsys clock
- modify vppsys0 clock
- modify vppsys1 clock
- modify vencsys clock
- modify adsp clock

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
 drivers/clk/mediatek/Kconfig                  |   11 +
 drivers/clk/mediatek/Makefile                 |    7 +
 .../clk/mediatek/clk-mt8188-adsp_audio26m.c   |   45 +
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c  |  154 ++
 drivers/clk/mediatek/clk-mt8188-cam.c         |  118 ++
 drivers/clk/mediatek/clk-mt8188-ccu.c         |   48 +
 drivers/clk/mediatek/clk-mt8188-img.c         |  110 ++
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    |   78 +
 drivers/clk/mediatek/clk-mt8188-infra_ao.c    |  196 +++
 drivers/clk/mediatek/clk-mt8188-ipe.c         |   50 +
 drivers/clk/mediatek/clk-mt8188-mfg.c         |   47 +
 drivers/clk/mediatek/clk-mt8188-peri_ao.c     |   56 +
 drivers/clk/mediatek/clk-mt8188-topckgen.c    | 1347 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-vdec.c        |   90 ++
 drivers/clk/mediatek/clk-mt8188-vdo0.c        |  135 ++
 drivers/clk/mediatek/clk-mt8188-vdo1.c        |  182 +++
 drivers/clk/mediatek/clk-mt8188-venc.c        |   52 +
 drivers/clk/mediatek/clk-mt8188-vpp0.c        |  144 ++
 drivers/clk/mediatek/clk-mt8188-vpp1.c        |  139 ++
 drivers/clk/mediatek/clk-mt8188-wpe.c         |  101 ++
 .../dt-bindings/clock/mediatek,mt8188-clk.h   |  726 +++++++++
 23 files changed, 3962 insertions(+)
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


