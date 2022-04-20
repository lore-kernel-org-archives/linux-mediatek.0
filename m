Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93514C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OZhbqxc5RC7LC3/wvb4xYI9a3SvvhZnFusoVXsfo0Do=; b=MR8/aEeavLvJeC
	jD9yPd8v3znYN2ai0iUex7LfM8n/h3yor+14osbvof/eQQ4dhknm75zqv+NmsitwtARnEghuZPSjG
	KyfvmjB+zoLCBV/rHg6kQsI9v9jmbVQ8GOvUid6IqCXgRiUSuMIi4vGwfTCjdmWLP7EYWQRorGAwP
	f8QsY+q/STupsphd+Mm8jUWn7PjAbVtgE5l1TNuAAr8xvyQV86J3NvE5IUey0m7edVJTzsjwib4sK
	IYOqaXDdqzEhLpttSPj/BQo3IwCqaN8aBrt6jFazA+CMDvrPieiyaFUK5ZA2Wcxlhqz2nEKYdJBAw
	SgdJpUYwjZEKpkDhBRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7Vm-008Z8A-7K; Wed, 20 Apr 2022 10:24:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7Va-008YzZ-OD; Wed, 20 Apr 2022 10:24:28 +0000
X-UUID: bf8f67230f6647e3bb2b9d535b946296-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:13e3392f-a6ac-4354-89b9-09d444c985a1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:137d83ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: bf8f67230f6647e3bb2b9d535b946296-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2125279905; Wed, 20 Apr 2022 03:24:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 03:20:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 18:20:48 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Apr 2022 18:20:48 +0800
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
Subject: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
Date: Wed, 20 Apr 2022 18:20:37 +0800
Message-ID: <20220420102044.10832-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_032426_863412_2D66EA3B 
X-CRM114-Status: GOOD (  11.45  )
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

Change since v23:
- Change wording from "Mediatek" to "MediaTek" (uppercase T) in mtk-svs.yaml.
- Use cpuidle_pause_and_lock() to prevent system from entering cpuidle instead of applying pm_qos APIs.
- Add kfree() at the end of svs_probe() when encountering probe fail.
- Change MODULE_LICENSE from "GPL v2" to "GPL".
- Add nvmem_cell_put() in error handling when nvmem_cell_read() encounters fail.

Roger Lu (7):
  [v24,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v24,2/7] arm64: dts: mt8183: add svs device information
  [v24,3/7] soc: mediatek: SVS: introduce MTK SVS engine
  [v24,4/7] soc: mediatek: SVS: add monitor mode
  [v24,5/7] soc: mediatek: SVS: add debug commands
  [v24,6/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v24,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   91 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2403 +++++++++++++++++
 5 files changed, 2521 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
