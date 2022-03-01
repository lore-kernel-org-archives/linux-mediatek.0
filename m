Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D62DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 05:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uARGEJkZ/LHI4RXTFhd3Eb2Zd0gpEVa8fee5hylvRBA=; b=WXh+mt02LUw7GU
	tFCDMAoWohPFhhhodJuXBqlBALgSwJ6E6c45ugGEZqUWBj8i20x6XBZS54D23V5B2WGVPJ/ffSOHB
	enPimHeQ1YPB1Ch0Jbo0/lDdzCdKyT7Vnoomh6zhU49FlpAETOKM3PumTFl0mJMfoJSbc6AybZhF/
	PhnrADvt/Sz9pnRMrgpUcNMQJRh5FIF4bTtExSkEEIioOh8eP390WPbrR2cIBdiOdNIYEMr2IAGVv
	JB5Vu++FwraTC3FS1z9V8VzeQ6O/yTPBEKINk1FEQdpl0KhA77vryQ2IRQ2OwtX4Xvd9cMrNRnqUb
	Se8kDm03kPy04EPRRSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOvND-00F5e8-Hv; Tue, 01 Mar 2022 05:48:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOvJd-00F3x3-1p; Tue, 01 Mar 2022 05:44:54 +0000
X-UUID: 88e6601487174063a7d2e2e10560f911-20220228
X-UUID: 88e6601487174063a7d2e2e10560f911-20220228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2036389943; Mon, 28 Feb 2022 22:44:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 21:44:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Mar 2022 13:44:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Mar 2022 13:44:06 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <matthias.bgg@gmail.com>, 
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [RESEND V2 0/3] Add watchdog support for MT8186 SoC
Date: Tue, 1 Mar 2022 13:44:02 +0800
Message-ID: <20220301054405.25021-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_214453_127065_06F9B01A 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

resend v2:
1. Fix topic to V2.

v2:
1. Squash [1] into [2] in v1.
2. Add tags of acked-by and reviewed-by.

[1]: [3/4] dt-bindings: reset: mt8186: add DSI reset bit for MMSYS
[2]: [2/4] dt-bindings: reset: mt8186: add toprgu reset-controller header file

v1:
1. Add mt8186-resets.h to define definition of reset bits.
2. Add wdt compatible for MT8186.

Rex-BC Chen (1):
  dt-bindings: watchdog: Add compatible for MediaTek MT8186

Runyang Chen (2):
  dt-bindings: reset: mt8186: add reset-controller header file
  watchdog: mediatek: mt8186: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
 drivers/watchdog/mtk_wdt.c                    |  6 ++++
 include/dt-bindings/reset/mt8186-resets.h     | 36 +++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8186-resets.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
