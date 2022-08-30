Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81074ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=25vij1UR/6n5GNPHiUmQkmyl016Kc+Gq5ww2wTsWwlU=; b=3HH3BwIKmjOVgV+nleihLOhEUX
	cEsepnWW6uvql9gGfDx2SDfc/1TroR2r1HsUql3T10s7MrPI/gpUc333TO1Bthi1kV/sqwu8EJ0Mm
	1B+GLzmi9we6B6TQ8yy8HvcHKg0xg245GdyRwj6YW09Ex10IFt9ZlXgv9PBJ2EaD3P+l6ZRFC5S+M
	gOlcLxNA+GRa+X0NtUcbTinNl2qxd/lgNbhdAdoQRCEoqG7Lo2+5TqI63i+eDjaCEQIE3i2iTCzBh
	u0JOxMXpTvaQdxeV4foV8X5ny8RGUDGBHYiDhHLPlxDyfNEIDERtwtLcdcjdfQWjNtf/cBOAoDTXQ
	u/81+jRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvnS-00EoCN-Eo; Tue, 30 Aug 2022 07:36:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvnB-00Eo52-Hq; Tue, 30 Aug 2022 07:36:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88443614CC;
	Tue, 30 Aug 2022 07:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04C3C433D6;
	Tue, 30 Aug 2022 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661844972;
	bh=N5gaZtyYBowf9OQhQgYdpXYv/RxoiHfSaAtM2SKjB4Y=;
	h=From:To:Cc:Subject:Date:From;
	b=MC1Z0vxFG9LMcLq41YRlMOWaezF4X/AFoqzr7qg294jNMUs8JeENcaQ9Q3HpG9IK2
	 6efyquLZvW3Tm9pR5cl3q9vq3y6luV8bmsmg48RaOgA6X9pmm7vxI6qkLWYD8zuZNf
	 TlDQcX4lBUe1iBeMdbC50cm91ZFY+0C8zOAlAmDlfOfOZ+LPDb4gFooEWFphclgNMa
	 h9ao+/QMD5ktHMmHYoSNeh3IG14ISKDd85uxTINnYio0ld+EuuNk332Gt7YfVYgFoD
	 w84naT+zwD3+kQdq6CTysamc8rwpZVWbEBPOs7FKgkp9PWAgDdXGOsTRv5DliI/5vz
	 YJfuw0rHvPjww==
From: matthias.bgg@kernel.org
To: nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: mtk-svs: fix compilation error
Date: Tue, 30 Aug 2022 09:36:04 +0200
Message-Id: <20220830073604.21260-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_003613_676290_D05409DD 
X-CRM114-Status: GOOD (  10.98  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

When compiling on other architectures, compile test fails due to missing
bitfield.h include.

Fixes: a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros where possible")
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index da1a3bfc8633..11a571d3f013 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2022 MediaTek Inc.
  */
 
-#include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/cpuidle.h>
-- 
2.37.2


