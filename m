Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BBEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 06:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nokQ++S+iayI0mn0Mhxc/ABCOEa1fO86bv3WtLy6I5c=; b=PUtBLexRsMgDIP
	RuVBUIQ6uoEZyjZvSGrux4iWJbAr2X8hhTVDrMqko5EOcQ0UYHZknLlOI4t0Q4WfR3f/B6APKveLi
	duEVkg43uqbIXNUxJS9FS9KkLtYQ8SiXcSbYMunzNVJic3XgCzwbFq1mUyqZ3sH45oICEs8PHQuF7
	bmLzclOaWbiMD0d/15ULA9yd7DPWKA601k54j468UsL86sLxVFU0RBCxyuswtGkN3gbwN/rPu8F0o
	dMOc3c2NyyD6Vv4YL/e1dHP8lYe18GVn/Ndy7a9oyOUssYUnvg1mA7vTW281RjdtyXsDlhawvLXJ+
	fXAtieKX+gNtGn0G6QGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2Rn-003nSV-1u; Mon, 21 Feb 2022 06:45:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2MR-003klr-C8; Mon, 21 Feb 2022 06:39:56 +0000
X-UUID: 6ff96c2a113843e79d4ee5fee5e81da3-20220220
X-UUID: 6ff96c2a113843e79d4ee5fee5e81da3-20220220
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1206578361; Sun, 20 Feb 2022 23:39:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 22:39:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 14:39:39 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 14:39:39 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: [PATCH v23 0/7] soc: mediatek: SVS: introduce MTK SVS
Date: Mon, 21 Feb 2022 14:39:32 +0800
Message-ID: <20220221063939.14969-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_223951_520554_23D4FACB 
X-CRM114-Status: GOOD (  10.49  )
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

The Smart Voltage Scaling(SVS) engine is a piece of hardware
which calculates suitable SVS bank voltages to OPP voltage table.
Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
when receiving OPP_EVENT_ADJUST_VOLTAGE.

1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=25cb20a212a1f989385dfe23230817e69c62bee5
[2] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=b325ce39785b1408040d90365a6ab1aa36e94f87
[3] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.16-next/dts64&id=a8168cebf1bca1b5269e8a7eb2626fb76814d6e2

change since v22:
- Make "svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);" become one line.
- Remove voffset read/write commands for better system safety.
- Add more comments on @turn_freq_base.

Roger Lu (7):
  [v23,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v23,2/7] arm64: dts: mt8183: add svs device information
  [v23,3/7] soc: mediatek: SVS: introduce MTK SVS engine
  [v23,4/7] soc: mediatek: SVS: add monitor mode
  [v23,5/7] soc: mediatek: SVS: add debug commands
  [v23,6/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v23,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   91 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2398 +++++++++++++++++
 5 files changed, 2516 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
