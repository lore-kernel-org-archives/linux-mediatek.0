Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353ACC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53j2Zr5g1CHI4OUeg0l8fF8afX2h7OOtLqGtKgBQpXk=; b=OZL8mlM8RYAgkpWLr0/A58Kwyi
	GoS9CytXxAYFFM5g39mMvT9RMNOIivNI3ecff1thIcjjNzhsrvUHgwSV/PrQwcZuUPBIFs0jL+F/D
	tluxvDtZ22FQCbZsaGni2o1p7BgS8CRZRXD+UEoyvywO+on2eP29RAEyhK2nyXN4S6C1oVnpUOvJd
	4m04SMK05TvP/qdhHgG5BQqwah7OC/YBb+QjOsLg0SrSJP4Y2xEplkzLTcHr2d95MvF3eeWqqSXWs
	wfdyk173/H9QKjcRiFCiBQTiDfh26hvLiWjVOyWMAgUpOceRV+Bhz4k+xhLvo0sEcR2Ond0Qvo0oV
	keA/xmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhEK-00F4Qi-18; Wed, 08 Feb 2023 09:59:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPh5t-00F0MX-5R; Wed, 08 Feb 2023 09:50:26 +0000
X-UUID: fd914ee6a79511eda08d4d6090ec5a5c-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=53j2Zr5g1CHI4OUeg0l8fF8afX2h7OOtLqGtKgBQpXk=;
	b=TIf2FeJ2rF78i2JvokCV10akfOQFmb5WWvQ+zmEwzK4KBOi/zIXkefv1UZYqJVnSSOls8XX5mdYbBZfuVeK6r9ccG0sRVltBFttWi7W2KTNbXMXVWz0y65dOIMpVzzndI7thq+FANJI/o6kbg1LKol5fnDJxGcHdPQTarx7KwSk=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:7d822acf-4aa8-4f85-ba26-3a1edfe40ea1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.19,REQID:7d822acf-4aa8-4f85-ba26-3a1edfe40ea1,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:885ddb2,CLOUDID:be5dd5f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:230208175017NWB9Y17X,BulkQuantity:0,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: fd914ee6a79511eda08d4d6090ec5a5c-20230208
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 551349099; Wed, 08 Feb 2023 02:50:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Feb 2023 17:50:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 17:50:13 +0800
From: <walter.chang@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<Chun-hung.Wu@mediatek.com>, <Freddy.Hsin@mediatek.com>, Chun-Hung Wu
	<chun-hung.wu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/3] clocksource/drivers/mmio: Export clocksource_mmio_init()
Date: Wed, 8 Feb 2023 17:48:03 +0800
Message-ID: <20230208094813.20874-3-walter.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208094813.20874-1-walter.chang@mediatek.com>
References: <20230208094813.20874-1-walter.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_015025_268092_99D49350 
X-CRM114-Status: GOOD (  10.01  )
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

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Export clocksource_mmio_init() and clocksource_mmio_readl_up()
to support building clocksource driver as module,
such as timer-mediatek.c.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/clocksource/mmio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index 9de751531831..b08b2f9d7a8b 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -21,6 +21,7 @@ u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_readl_up);
 
 u64 clocksource_mmio_readl_down(struct clocksource *c)
 {
@@ -46,9 +47,9 @@ u64 clocksource_mmio_readw_down(struct clocksource *c)
  * @bits:	Number of valid bits
  * @read:	One of clocksource_mmio_read*() above
  */
-int __init clocksource_mmio_init(void __iomem *base, const char *name,
-	unsigned long hz, int rating, unsigned bits,
-	u64 (*read)(struct clocksource *))
+int clocksource_mmio_init(void __iomem *base, const char *name,
+			  unsigned long hz, int rating, unsigned bits,
+			  u64 (*read)(struct clocksource *))
 {
 	struct clocksource_mmio *cs;
 
@@ -68,3 +69,4 @@ int __init clocksource_mmio_init(void __iomem *base, const char *name,
 
 	return clocksource_register_hz(&cs->clksrc, hz);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_init);
-- 
2.18.0


