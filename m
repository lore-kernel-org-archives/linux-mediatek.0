Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F28BC54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0UEHvv+ooYXn197qVs85mzFfHrgyDeNXJnNpfyHdoY=; b=U3Kok2U3CrXz+nHq7gay3GZaar
	sssvz60+BprAl/3EjhgMagrNTxbbKcKIQPFF6FQeG1ClMLBNLTF/x5icIhubDTDjTK+ftUGQz5CaX
	9PBqjDf2d1rLzMSuXkLzPAweD3T0dV7qL2jqeHzk1p5pOEWbCsL8cbshoHk/OMYIWoyUY3M1NdDXk
	+hONDavA8sLlo1tXtiQanFJVxCou8oVMd/5+UPWWXnxyo0ffMMV3Fq4ozJWutr2pqK3EKQS5jhfOv
	hInVHjz0KXrP7itryDsxgrICZRMkEaBHVsmQVIc9ktOLsShgL4//tfZ1RzrnRVvNuGEmmCqf9ueX2
	/CAwUnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErWt-001HOl-8Q; Mon, 09 Jan 2023 12:45:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErWq-001HMf-L3; Mon, 09 Jan 2023 12:45:30 +0000
X-UUID: 0af018f31d354776b8f092f4162af8bf-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=n0UEHvv+ooYXn197qVs85mzFfHrgyDeNXJnNpfyHdoY=;
	b=MeMFbErFaMazjMC8Bts+sZMkmWIKoXEOhUUzd2nqaCV9ReNXn+PZvwAosc0Z1iD2jCwrngTdoOqlXSYt6sEGEyk6Z1FL57vh3HvCyelchs1EWZJzd0h8qAPkhaJWUkFqoAr0VG6tO4IjN9qseaetU4grm0gTtSAZqL2JJv7rCDY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:ac5ea6f1-764a-460d-9296-7b9c40a08a11,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:6b2b47f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 0af018f31d354776b8f092f4162af8bf-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 700753109; Mon, 09 Jan 2023 05:45:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:20 +0800
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
Subject: [PATCH v4 00/19] MediaTek MT8188 clock support
Date: Mon, 9 Jan 2023 20:44:57 +0800
Message-ID: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_044528_870261_F145E59A 
X-CRM114-Status: UNSURE (   9.24  )
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

Base on tag: next-20230109, linux-next/master

changes since v3:
- modify yaml file

Garmin.Chang (19):
  dt-bindings: ARM: MediaTek: Add new MT8188 clock
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
 drivers/clk/mediatek/clk-mt8188-infra_ao.c    |  190 +++
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
 23 files changed, 3964 insertions(+)
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


