Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9A0C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 03:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9fA4Q8Eu/7r79+HGr+WgcfxZUyDhzDjsfyrl60cGNPw=; b=Lhv/cUyc73JGR/elMAeKUs5usT
	TdS90UqcaeH/Kfn3IXhxtobI7O64j8RX4OMB6eOYn6IcOEoD+McQGAzDbRvtVB80M0uJCuMoR+Yky
	067zaNDN/Eh5OfRTSxRMlCNFwFWl0wRlhT+P6Le9hCbYCNkeACqrwtkMWtyLOn00yapNXeo1Z1z9Y
	eZEtpVJO700utSGZFtLbuAcGqvwq17K+WlqmjmkQed8+UCZJfPj9jSmHCV/sbsYZBcG/8ODGy61bY
	b4ue4Wqc4dge6qeZpJpAHFg/5ZqaCBHLHsoq4Ef67CTjWJlwCgh/qfcX2sbLW6vPFiEZJi/jYl3fh
	R3R+TNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphkJ-009YZ3-33;
	Fri, 21 Apr 2023 03:47:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pphkG-009YY3-1i;
	Fri, 21 Apr 2023 03:47:38 +0000
X-UUID: 3e766452dff711edb7d8d11f642b8e78-20230420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9fA4Q8Eu/7r79+HGr+WgcfxZUyDhzDjsfyrl60cGNPw=;
	b=Kn+c0UUocb5x4sQmKbZafj4CMN/YtG+1dGJO1uomfLVho/KPIgdMcWn6P+a7m2ptvA+m+KNymg5pVikkP4Lj6m3EYRVGkJPW8nP25wSeQoO8foqu9ZH26pVa0+GHdKcbf5ePd0v/l5GeDJZLnLItcZ7h8AuXknmaRfRXKp01P8w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:c19e4d87-8776-4de1-a998-2f4c18588854,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:e7680ba2-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 3e766452dff711edb7d8d11f642b8e78-20230420
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 287596096; Thu, 20 Apr 2023 20:47:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 21 Apr 2023 11:47:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 21 Apr 2023 11:47:28 +0800
From: <walter.chang@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<Chun-hung.Wu@mediatek.com>, <Freddy.Hsin@mediatek.com>,
	<walter.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH linux-next v4 0/4] Support timer drivers as loadable modules
Date: Fri, 21 Apr 2023 11:46:45 +0800
Message-ID: <20230421034649.15247-1-walter.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_204736_718634_19EE0301 
X-CRM114-Status: GOOD (  10.38  )
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

From: Walter Chang <walter.chang@mediatek.com>

This set of patches aims to make SoC related timer drivers, such as 
timer-mediatek.c become loadable modules for the Generic Kernel Image
(GKI).

This driver registers an always-on timer as tick_broadcast_device on 
MediaTek SoCs. If the system does not load this module at startup, 
system will also boot normally by using built-in `bc_hrtimer` instead.
Besides, the previous experiment [1] indicates that the SYST/GPT, in 
combination with a loadable module, is fully operational.

The first three patches export functions and remove __init markings to 
support loadable timer modules.

The fourth patch makes timer-mediatek.c become loadable module for GKI.

[1]
https://lore.kernel.org/all/32777456f8e0f98e4cd5b950f421d21f71b149cf.camel@mediatek.com/#t

[v4]
- Fix review comments pointed by Angelo

[v3]
- Rebase on linux-next

[v2]
- Convert timer-mediatek.c driver to loadable module

Chun-Hung Wu (4):
  time/sched_clock: Export sched_clock_register()
  clocksource/drivers/mmio: Export clocksource_mmio_init()
  clocksource/drivers/timer-of: Remove __init markings
  clocksource/drivers/timer-mediatek: Make timer-mediatek become
    loadable module

 drivers/clocksource/Kconfig          |  2 +-
 drivers/clocksource/mmio.c           |  8 ++++---
 drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 +++++++++----------
 drivers/clocksource/timer-of.h       |  6 ++---
 kernel/time/sched_clock.c            |  4 ++--
 6 files changed, 56 insertions(+), 20 deletions(-)

-- 
2.18.0


