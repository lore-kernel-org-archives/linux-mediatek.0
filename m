Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54F6C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/WnIurKTA/klVwNtf/9Cop0h4BJ7/sg/7UeiDmRErkI=; b=mNG5daKXljHap/mh2CeZV4qqOw
	aPqGV7+9oZarjIR9E5/XBm8ePKZ8fdYfr/nNRa9J3Vlgut8Vf8+9ghzA0pbM0CN9CUWcywF8zyD27
	vPHXT235j2bsnVXEmszMTkj/j03TD99nX0CZIzV0N39zo2Ucp270dDh/poFD3IvaEouEgAUkU/6wh
	zxkpPTEgCiVwnaFzGaZA7T2iXhBIWaPIOCGC5O4DYVHDX61J6dXtLY4CXyA6CDpX4MoeRUxHaL7wI
	+ngNOlDKd036t4psaVEJ8uDviEPahSXydS9aNwojvyRJKfSNnPTOV73EmT1TdxT+wBhpK+aaEEwqK
	sb7UlbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCNk-00000008YSh-33ME;
	Mon, 18 Mar 2024 12:46:24 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEV-00000008OD2-3MVR;
	Mon, 18 Mar 2024 11:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710761565;
	bh=/d5mJxYY4XDPQ3SgGmz93D2aIiHlNJP2hzTiAI2mHJw=;
	h=From:To:Cc:Subject:Date:From;
	b=DwDAwUJePBLCCDWQPb6+9mbOnzo5lmTbjLowhBYzzO7xsxnxQ6VVmr6q0qYsgumvd
	 32vzMhI4guZ5sTlz04PTtkGnVIwj6LNBesNsajbUw40WLNJo40Ujo5YF4ZF3TVBUNW
	 oWW9dgw3lzq6KRFnGNYQuks9JK83P2wFmMYqhcMDKfdP4mW4UuT5WrYSdPt6Ne+rFj
	 gRlZlgLyof6Xf9IfzeZB3mmm7cn5+h5F4MZjLTuCrHtKzNjlWzlHVdUb7m/kOhH3v7
	 +meubq4217R3HPsT/K5bI4vXvLNcQBIWbbg8UMzLnRX66NA9yzss5BotsJWQO3lK2o
	 2C45V7SctO4rA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D41A37811D4;
	Mon, 18 Mar 2024 11:32:45 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	treapking@chromium.org,
	kernel@collabora.com
Subject: [PATCH] soc: mediatek: mtk-svs: Append "-thermal" to thermal zone names
Date: Mon, 18 Mar 2024 12:32:37 +0100
Message-ID: <20240318113237.125802-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_043248_144064_45DBA491 
X-CRM114-Status: UNSURE (   9.21  )
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

The thermal framework registers thermal zones as specified in DT and
including the "-thermal" suffix: append that to the driver specified
tzone_name to actually match the thermal zone name as registered by
the thermal API.

Fixes: 2bfbf82956e2 ("soc: mediatek: mtk-svs: Constify runtime-immutable members of svs_bank")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index e553800a9e4d..e431e0a53ed9 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1768,6 +1768,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 	const struct svs_bank_pdata *bdata;
 	struct svs_bank *svsb;
 	struct dev_pm_opp *opp;
+	char tz_name_buf[20];
 	unsigned long freq;
 	int count, ret;
 	u32 idx, i;
@@ -1819,10 +1820,12 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 		}
 
 		if (!IS_ERR_OR_NULL(bdata->tzone_name)) {
-			svsb->tzd = thermal_zone_get_zone_by_name(bdata->tzone_name);
+			snprintf(tz_name_buf, ARRAY_SIZE(tz_name_buf),
+				 "%s-thermal", bdata->tzone_name);
+			svsb->tzd = thermal_zone_get_zone_by_name(tz_name_buf);
 			if (IS_ERR(svsb->tzd)) {
 				dev_err(svsb->dev, "cannot get \"%s\" thermal zone\n",
-					bdata->tzone_name);
+					tz_name_buf);
 				return PTR_ERR(svsb->tzd);
 			}
 		}
-- 
2.44.0


