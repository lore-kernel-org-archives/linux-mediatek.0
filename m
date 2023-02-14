Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C49C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c5SA0sygA99LkVl15NgxUnE+nHkoRfXhfOKbmDW6wQY=; b=MxApuY1264w/H0JQSjYmXcKpKu
	5APr3Crcyq6SA5zHcKEOw/yfExbkdKhyIo9RTpo+0KKkRy4Gl8PRHOvVWAUk4fCOkU1TmMkthz3Gz
	wFnSrCKEggSfcOBnFR1stS7W/N1o61+olIJFRIQxFRXZjQw4eyXSmnXd26cT63CsXJl2XG5CajIHK
	TkW31PvgACCDhmJs4K7EfOfKXK7F/s0V+T6+vjf0wk4esL8mpC0vCdA5VkdZg16YBMLX3bebI5+3o
	mLBfnw8HD4t3YvlD6xM9f1DSmO7hHuyeEdordshYEBNOh/RKA7E2kQoO8spN5+FDqJHpCjlND5BD2
	TyahYIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsyr-001B1s-47; Tue, 14 Feb 2023 10:56:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsyj-001Avq-Ge; Tue, 14 Feb 2023 10:56:10 +0000
X-UUID: 294b8302ac5611edbbe3f76fe852e059-20230214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=c5SA0sygA99LkVl15NgxUnE+nHkoRfXhfOKbmDW6wQY=;
	b=oSXmPlPxJRpbhwEhpFizrzMlOKEN/4CqIv9rMJR/xsV9IObkMnA33QJv/0xPiqBkCAZJ5NTNMPgDtLOqoqQ4hCjdCYAV2Y+/H2rb8ydWfJgvOs19FV0tb/WUynFuU7Sy+AQGaD4/mYElqP1iEwIkq0OBdY4VxK8oRiLcuiQQg3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:2d1e4a81-88ac-4008-b819-83689a4175b0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.19,REQID:2d1e4a81-88ac-4008-b819-83689a4175b0,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:885ddb2,CLOUDID:eb188925-564d-42d9-9875-7c868ee415ec,B
	ulkID:230214185546P1GTVG7M,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 294b8302ac5611edbbe3f76fe852e059-20230214
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1288738522; Tue, 14 Feb 2023 03:55:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Feb 2023 18:55:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 14 Feb 2023 18:55:25 +0800
From: <walter.chang@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<Chun-hung.Wu@mediatek.com>, <Freddy.Hsin@mediatek.com>, Walter Chang
	<walter.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/4] Support timer drivers as loadable modules
Date: Tue, 14 Feb 2023 18:53:10 +0800
Message-ID: <20230214105412.5856-1-walter.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_025605_597610_940A7C35 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Walter Chang <walter.chang@mediatek.com>

This set of patches aims to make SoC related timer drivers, such as 
timer-mediatek.c become loadable modules for the Generic Kernel Image
(GKI).

This driver registers an always-on timer as tick_broadcast_device on 
MediaTek SoCs. If the system does not load this module at startup, 
system will also boot normally by using built-in architecture timer 
(in this case is Arm Generic Timer) instead.

The first three patches export functions and remove __init markings to 
support loadable timer modules.

The fourth patch makes timer-mediatek.c become loadable module for GKI.

[v2]
- Convert timer-mediatek.c driver to loadable module

Chun-Hung Wu (4):
  time/sched_clock: Export sched_clock_register()
  clocksource/drivers/mmio: Export clocksource_mmio_init()
  clocksource/drivers/timer-of: Remove __init markings
  clocksource/drivers/timer-mediatek: Make timer-mediatek become
    loadable module

 drivers/clocksource/Kconfig          |  2 +-
 drivers/clocksource/mmio.c           |  8 ++++--
 drivers/clocksource/timer-mediatek.c | 43 ++++++++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 ++++++++-------
 drivers/clocksource/timer-of.h       |  6 ++--
 kernel/time/sched_clock.c            |  4 +--
 6 files changed, 66 insertions(+), 20 deletions(-)

-- 
2.18.0


