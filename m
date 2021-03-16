Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BF7C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 11:16:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80DB64FA5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 11:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80DB64FA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vNzFGG5sJWw21YodPmQBrB6vL4QNsfq7HSp5T73gDTQ=; b=pFjVMIzOdZUwtdgiDbmO8gpEJ5
	utaUD0rgZmZpyONuTt+Od0UF5IAhzIxyxFdEbaojQuDbeRIxK+2mIuT68kgTam4jrdDpVeUZFyjU3
	AdAO02rWxJ4VVLkEKk8jksZxflduloyrFywkaPLoOgyMWsfKzzyTeOhNKG5xwNfQzCLszicPtYX7h
	7JjXxYGvcfy4+4y62Z/GDJndjrbtdlb0R3l545PmwF9VwAcNXPb25LIa96dxTEmpYq51for9ZZ1bO
	rh0dhcPed0FZSIPkxFKY0+HJBqyg3cTGHlret8HFXE7e9vtMs/cmimAiIHQBCQ8nl4gVs95tIXwWq
	wgDleV2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7g4-000WsE-8e; Tue, 16 Mar 2021 11:15:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM7fb-000Wlj-3M; Tue, 16 Mar 2021 11:15:29 +0000
X-UUID: 18cfdbec90e5467ea819e0f371aa2174-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=b0UI5+D+ggiABcwZQazoVgY8uK6KTLuBAAn78FA79go=; 
 b=VbRU22JMZ+Lm6JybtS7Ftv5UD/AOyqnKcYmk6wZiJEIM52tfOucUnHd5ICk/XF7V7c4Xf4PFc+31KJucLAW4d7Ukp9UONgZo7Uv0iWcSnMzO/mX7YkXZcBqjCvStquaDYGSMsFpNPjsDfoQKMp92VKOchU0s3bAhuOeLoSAM+c8=;
X-UUID: 18cfdbec90e5467ea819e0f371aa2174-20210316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1331786489; Tue, 16 Mar 2021 03:15:15 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 04:15:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 19:15:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 19:15:04 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Ulf Hansson
 <ulf.hansson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, "Guenter
 Roeck" <linux@roeck-us.net>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Seiya
 Wang" <seiya.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Sean
 Wang" <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 00/10] Add basic node support for Mediatek MT8195 SoC
Date: Tue, 16 Mar 2021 19:14:33 +0800
Message-ID: <20210316111443.3332-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 34B5F28517A2B2BB210610747DFA29DBD96DC8560E0C1DF5C1860E28986D62C82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_111528_208908_56E945AA 
X-CRM114-Status: GOOD (  10.76  )
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


MT8195 is a SoC based on 64bit ARMv8 architecture.
It contains 4 CA55 and 4 CA78 cores.
MT8195 share many HW IP with MT65xx series.
This patchset was tested on MT8195 evaluation board to shell.

Based on v5.12-rc2

Seiya Wang (10):
  dt-bindings: timer: Add compatible for Mediatek MT8195
  dt-bindings: serial: Add compatible for Mediatek MT8195
  dt-bindings: watchdog: Add compatible for Mediatek MT8195
  dt-bindings: mmc: Add compatible for Mediatek MT8195
  dt-bindings: spi: Add compatible for Mediatek MT8195
  dt-bindings: iio: adc: Add compatible for Mediatek MT8195
  dt-bindings: phy: Add compatible for Mediatek MT8195
  dt-bindings: phy: Add compatible for Mediatek MT8195
  dt-bindings: arm: Add compatible for Mediatek MT8195
  arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and
    Makefile

 .../devicetree/bindings/arm/mediatek.yaml          |   4 +
 .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml   |   1 +
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml  |   1 +
 .../devicetree/bindings/phy/mediatek,tphy.yaml     |   1 +
 .../devicetree/bindings/phy/mediatek,ufs-phy.yaml  |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
 .../bindings/spi/mediatek,spi-mtk-nor.yaml         |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt          |   1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts        |  29 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 477 +++++++++++++++++++++
 12 files changed, 519 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi

--
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
