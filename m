Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A981CC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H5ZKiBmClJeg28a4s/Jf6HH4ZYjOmnf91oNZCQ78cIo=; b=36Ya0o54MBmX1wjD3/YZmgSmOu
	DtGUPCPMwPlqJHlRY8ptSMAgWi+/hvnKnUpgLzdbjzwGn1AS9AIjMnregSxrOn9ota9CATSSU0tHe
	Tx069SPHMo5dZapUfiWLSNPAatyucy6YNBGmsMyYe+2Dn5E7I/2jceXcbODxnkFJgsQ3ZFqatnPMk
	uWnPcCMQUE3y0TnGtIHh3Ph1tooFb5Y6W/yE78kqIblNbVrElCXNIYY/Vs4o4dIs5GFCFNUcCr6/2
	0W95OH36ELfaJHxrsmiILg9mTkqd4/FOjTEMjkrXdV5e54eJuWJ1QJRos1987NpxzELshfCB1CqHn
	XcgXbBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piDze-007JB6-0i;
	Fri, 31 Mar 2023 12:36:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDza-007J8B-1n;
	Fri, 31 Mar 2023 12:36:32 +0000
X-UUID: a77ddceccfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=H5ZKiBmClJeg28a4s/Jf6HH4ZYjOmnf91oNZCQ78cIo=;
	b=Ag0LmKGg7FLN6C7jYTHCPG1nzBmz1sEr6WDBuj9yj4DzvJISh8r5q31piIesRmrn6S4BZUs1MEndjPt9eK7/QLlovIkPIlGFuZDb0oyZMC+CI8q5YIuz9Ozc+TlFXENXLNeZykQyPryoXCk/qDi34DQN5LaDHu9acyH4SZJ4JTw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:7bad5952-62c6-4a09-82df-660da1c8f5bb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:ac9b88f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a77ddceccfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1033354846; Fri, 31 Mar 2023 05:36:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 20:36:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 20:36:24 +0800
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
Subject: [PATCH v8 00/19] MediaTek MT8188 clock support
Date: Fri, 31 Mar 2023 20:36:02 +0800
Message-ID: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053630_623213_864E327A 
X-CRM114-Status: UNSURE (   9.60  )
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

Base on tag: next-20230331, linux-next/master

changes since v7:
- modify Makefile typo in camsys driver patch

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


