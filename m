Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4758C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVhLO6IeIUxh1QFiZBmbjpLCGJ3+9nNP+wo1R9nPwf4=; b=oLTV5jyDXpJW9Cg6lfP6KoMO8q
	hz8rUQSQ5Gg237CO4m2yeQmkr9tDxkeOFxZ8p+tBQBqpFPIJD2Thh7LkcoHTWHj3cgqmozXzVC9r+
	4yzThp5PSF+5c2zdrrb6lgnJZyMIs6CSIblpP1f1ZgXSW0IOpIz/er7xBNlfYULcyeG8o8TIcyxjw
	Rpbhp/mBytp6V2xIxu4DtU+PtBrRWWpDGeZXH092YRmOuWtu6K7v+tHtoZ+pSuLcV2T81O/+Qxknr
	KyLwjwfgiZV/lTmr/7SkbFewA/5VYyTTJ3NY+p4NdM9L8YWz+02vvpKDNjT78DSP2FJebgYr6gs8B
	Cs6Iwiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPx-00GzaG-2o; Wed, 28 Sep 2022 15:56:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPL-00GzH0-1Y; Wed, 28 Sep 2022 15:55:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C68DCB82118;
	Wed, 28 Sep 2022 15:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CC5C433D7;
	Wed, 28 Sep 2022 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664380532;
	bh=l7UiBfO3UBUpJjyUbjigXJWcDJxBC47DwLgzoIjb9LE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhJyaPwmhuiLzXMKUZYdCtsE01Tzi1rUzGRAt/TpvtkdOg4dESYEYnp6CXS+jM1bA
	 +aQOoKv8Srf5vbqctuqXDvOmccgCcKJoDVSHdzSKenLXJOs862wKyfVWlyYoVGUOBi
	 Cg0061wCbSGGNilC2RUUgo2EsaOkhtElYDXLG+TIB8t7R6Qej/g9hZe7Ap6wWyciYs
	 9YLRcKMPs7r2IcsTc8f/w6naFrazDPhFU0lv/RS5rkG9BcwS5OVKbUv1O8NrxiZ3Tz
	 NCzEHB8dC9su112IuP8yyYbpqHsaYJMSxAWxGsFDiHoE6rOd9xDu8ZLMfL5+CoOtVi
	 rXIbAj4NRpu9w==
From: matthias.bgg@kernel.org
To: roger.lu@mediatek.com,
	jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/8] soc: mediatek: mtk-svs: improve readability of platform_probe
Date: Wed, 28 Sep 2022 17:55:13 +0200
Message-Id: <20220928155519.31977-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928155519.31977-1-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085535_258965_8BAB5555 
X-CRM114-Status: GOOD (  11.38  )
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

If a compatible misses a match data entry, then something is wrong in
the development phase, we don't need to check for that at runtime.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 drivers/soc/mediatek/mtk-svs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index fd0f636e8644..52bb4f8bbe6d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2332,10 +2332,6 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 	int ret;
 
 	svsp_data = of_device_get_match_data(&pdev->dev);
-	if (!svsp_data) {
-		dev_err(&pdev->dev, "no svs platform data?\n");
-		return ERR_PTR(-EPERM);
-	}
 
 	svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
 	if (!svsp)
-- 
2.37.3


