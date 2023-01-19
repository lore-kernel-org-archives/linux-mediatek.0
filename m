Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA85AC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOcWWrqauDBRZ5RKAs25XGV9XBvNLchE1Gd1yNIHU/o=; b=hwaFq8MRWManZYC6OSwT0B4njL
	DsNpnaTRUzPOZYpKuqmcADJ4kDvnCgCe7opn+JpEI59bKWiUAKpFE6xTzbbZtk+FWQMlSuuF9vA1/
	RRz1whbKuWCVhocvvHaZ0RjfAiAwoR7N4Ess8F0WXF6UXI6NCiqXUcBqyoPUcvvRQi8AtMBxrqpw/
	81ZEylXgh9NPUl1vN0RI3dOtN4Mj6niilhUMxPiywuEFBK3OANhLhpbljCqu1wpLRfUXfzdglZO/4
	6Mu9tqhp8v5zDYQc5MZzEXKCP658rkmLXxUxV+PqIEObhmcuocrdXzWQR1KVW2CptzN9Exxj/Fjpd
	/nT1PFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMO-004rjM-JZ; Thu, 19 Jan 2023 12:49:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMM-004riT-OW; Thu, 19 Jan 2023 12:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OOcWWrqauDBRZ5RKAs25XGV9XBvNLchE1Gd1yNIHU/o=; b=iiw99Ej1P+6csa5QfALSA5JgGx
	ShGn+WXrN4pM8Boxq2QbhJPO+VaI1pU/Co30zC0kXBRtTFGC+cQKehK0OynhTazp/WbHZoEr0/uzw
	CyxkRNBciwRXGQQRrfU231CsjOBrWPv1EsgPvcq9G/l+YKZ9a2kYFt0ko8bUegCEsyQ3BQlM8j5mL
	0DctIBZflYw+CM1xSn9qeoFAc2249nBw5Je7bmsGRkQXkAT2Ww2Vbq5KXh5EPcEaQKvICsefa0NoW
	HsDQ7SznmdsnqUYAbXIQEi4DCdGrBnlNBvozXAOu2dMMDR5X0IZcHAjkRFb3lPwcHsCZ6eluYsYvW
	wu/s9m4A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULl-000IP0-0f;
	Thu, 19 Jan 2023 12:49:06 +0000
X-UUID: a387547097f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OOcWWrqauDBRZ5RKAs25XGV9XBvNLchE1Gd1yNIHU/o=;
	b=VkeeMYc39yg2SqjSgr9IkXyGFYLM8NRN8JWZdkd8qNDI+0vy2zcO8CUeDz7OF5e+vkFp6nRMAoitrrq9sJOPpvEaDQ4+WqZuL2Bd/VA7gNFBLVyZVrmuf0fjn6ySe1n3g4N/OI8feyc6I2b2P84xQNbp8toa3v5Arc3bAGe96A4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:befa8bba-fd5a-48b1-8c43-b0f1c5d2b082,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.18,REQID:befa8bba-fd5a-48b1-8c43-b0f1c5d2b082,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:3ca2d6b,CLOUDID:bbba1f55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230119204900BIK2K2XC,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: a387547097f711edbbe3f76fe852e059-20230119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 456088079; Thu, 19 Jan 2023 05:48:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 20:48:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:54 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v5 00/19] MediaTek MT8188 clock support
Date: Thu, 19 Jan 2023 20:48:29 +0800
Message-ID: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124903_671326_BE082800 
X-CRM114-Status: UNSURE (   9.22  )
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

Base on tag: next-20230119, linux-next/master

changes since v4:
- modify yaml file
- modify infrastructure clock

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
 drivers/clk/mediatek/clk-mt8188-topckgen.c    | 1352 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-vdec.c        |   90 ++
 drivers/clk/mediatek/clk-mt8188-vdo0.c        |  134 ++
 drivers/clk/mediatek/clk-mt8188-vdo1.c        |  181 +++
 drivers/clk/mediatek/clk-mt8188-venc.c        |   52 +
 drivers/clk/mediatek/clk-mt8188-vpp0.c        |  143 ++
 drivers/clk/mediatek/clk-mt8188-vpp1.c        |  138 ++
 drivers/clk/mediatek/clk-mt8188-wpe.c         |  101 ++
 .../dt-bindings/clock/mediatek,mt8188-clk.h   |  733 +++++++++
 23 files changed, 3970 insertions(+)
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


