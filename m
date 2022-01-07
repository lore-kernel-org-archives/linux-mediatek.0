Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17794C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kSGURmTvG6W67xfKRl4pf0kfLAx6HjiVOA6bIXvWTYQ=; b=4Nxpkpf0QAFNXg
	6zd77CHrDRMOaT/xcVh9dXQ4FoLfX2XiOQOcw5DhosAAfgNnR9o9Ap8blMbIVfKELPMyCBvndl3pB
	1G/knjQnLcyeTwvLQvcG95gTHVORu2kEUWU9cNbI8e/7f50+hqO7N7AttCadCkIwc/uFMIPhvkYAC
	VEgCsL2be8qsLYfTYnPUmz082ZtqiXLBu90XPwVWix0Hhkbl47g5RmtzWazI5v2NttqFioEdyuFRe
	r+D8y9tiCT/zYon20fZM97frh7xO0aI6W2eI5aUSkfjxhSZD/woGPf5aJIQhqauLfdg2kcRa49PsG
	v8PDSTJRGwYUSt0N3HrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5lxg-003Aif-GV; Fri, 07 Jan 2022 09:55:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5lv1-003966-TR; Fri, 07 Jan 2022 09:52:21 +0000
X-UUID: d241ae1c9a8d4f96a1542242e00df552-20220107
X-UUID: d241ae1c9a8d4f96a1542242e00df552-20220107
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1000683658; Fri, 07 Jan 2022 02:52:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 01:52:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 17:52:01 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 17:52:00 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH v21 0/8] soc: mediatek: SVS: introduce MTK SVS engine
Date: Fri, 7 Jan 2022 17:51:52 +0800
Message-ID: <20220107095200.4389-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_015219_984123_753A26ED 
X-CRM114-Status: GOOD (  13.14  )
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

change since v20:
- Rebase to kernel 5.16-rc1
- Separate mt8183 svs as two patches for minimun version support. patch1 (init01 ~ init02) and patch2 (mon mode).
- Remove unused flags in each patch.
- Move @SVSB_PHASE_ERROR before @SVSB_PHASE_INIT01 for order correctness.
- Reorder the struct member comment and coding for the consistenty. Also revise the ambiguous comments.
- Use [writel,readl]_relaxed instead of [writel,readl].
- Fix ->efuse_parsing() not return "false" mistake.
- Move more commen settings out of svs bank structure for shrinking data structure size.
- Split up the "get platform data" and "platform probe" behavior.
- Change the naming of "svs_is_supported()" to "svs_is_efuse_data_correct()" for better understanding.
- SVSB_DC_SIGNED_BIT is configured as BIT(15) instead of 0x8000.
- Add the missing variables comments back in the structure.
- Add define "MAX_OPP_ENTRIES" for representing opp total count.
- Add more kernel log description when error happens.
- Add missing error handler when using nvmem_cell_read().

Roger Lu (8):
  [v21,1/8] dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v21,2/8] arm64: dts: mt8183: add svs device information
  [v21,3/8] soc: mediatek: SVS: introduce MTK SVS engine
  [v21,4/8] soc: mediatek: SVS: add monitor mode
  [v21,5/8] soc: mediatek: SVS: add debug commands
  [v21,6/8] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v21,7/8] arm64: dts: mt8192: add svs device information
  [v21,8/8] soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   92 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   39 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2461 +++++++++++++++++
 6 files changed, 2619 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
