Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50BCC54FB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4CiWflMa0UUyp9NbGyD/T0A000MhIAnhks0L2DnG2Q=; b=t4T3I5SI0JpoEjd+baIcMIke7R
	Ts4vT6gyZTupvkWXUMEWqCUs7sjQFJpz3rhzuiPknEpvgCzk03UaWU0ZWIuya2/6au/DtnlGGrb9A
	XB70n1WsQbsdtWp5ybW6d54jDkt6VykOEI7CY3o7ddJ0ffVF1MWLBwLL4DWrSHy9NNnZKY/YxEDpx
	0yHXjIKtNHE/52+ziX2rUwHnqBDWbB26PzBA+ZTWMC7JqLKtOptIjv/mJ0WIQ+WcZ8Qvxh24EWMM9
	p3PqXrfSMVq2CfkmtiWrOLnqDfYuArXcU8jZoDYj5kuhjHM7GxBNxwNRqd/K6xhjfW5YqkN6L6TXL
	qTsMlTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNL-00GdRB-23;
	Tue, 21 Nov 2023 11:57:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMt-00Gd1p-10;
	Tue, 21 Nov 2023 11:56:41 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 347AE660732E;
	Tue, 21 Nov 2023 11:56:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567798;
	bh=rbMxFG/9Z/MvXIMSXdH+Z5ELUWvpXJ2G/c2LivRCtOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOJXhvq4C9UV/vImSye1MfJJrb0nTSDZS32sdnmUOS93jx/wHGT85watYQwvucA8K
	 e7pEls/wtVZp5e6i0GG+ffeJ4wTz62QLYPS+VIdRm3oujpBz0n7XdE/AEWo2ahi8d9
	 JM4dWTqvf11DWirTYh1dFvwYHpi8cKoOiRDISlnEQ+KqdSWwT5oS4eXgHA+psjm1KT
	 kXjhniyB+uMidk2Dz/fIlcBB7x0FqpXAGD0r1HtAETKf0xlIvHbeNCa29nviOAZWiU
	 RP5rfwyc2B1YtyoSb/etDScxpw+M/UjreXP83L12Rjvxl+kVySOv9sPx/Bff82dA0U
	 a0YZSVjc/2suw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 06/20] soc: mediatek: mtk-svs: Change the thermal sensor device name
Date: Tue, 21 Nov 2023 12:56:10 +0100
Message-ID: <20231121115624.56855-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035639_500592_1C285405 
X-CRM114-Status: GOOD (  11.18  )
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

This driver tries to create a device link to the thermal sensor device:
change all instances of "lvts" and "thermal" to "thermal-sensor", as
that's what the devicetree node name must be.

Note for MT8183: As specified in a previous commit, this SoC never got
SVS probing, so this is not a breaking change and it does not require
fallback for older device trees.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 6c27fb523bfa..b5beb33c95ba 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2329,7 +2329,7 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 		return dev_err_probe(svsp->dev, PTR_ERR(svsp->rst),
 				     "cannot get svs reset control\n");
 
-	dev = svs_add_device_link(svsp, "lvts");
+	dev = svs_add_device_link(svsp, "thermal-sensor");
 	if (IS_ERR(dev))
 		return dev_err_probe(svsp->dev, PTR_ERR(dev),
 				     "failed to get lvts device\n");
@@ -2362,7 +2362,7 @@ static int svs_mt8186_platform_probe(struct svs_platform *svsp)
 		return dev_err_probe(svsp->dev, PTR_ERR(svsp->rst),
 				     "cannot get svs reset control\n");
 
-	dev = svs_add_device_link(svsp, "lvts");
+	dev = svs_add_device_link(svsp, "thermal-sensor");
 	if (IS_ERR(dev))
 		return dev_err_probe(svsp->dev, PTR_ERR(dev),
 				     "failed to get lvts device\n");
@@ -2401,7 +2401,7 @@ static int svs_mt8183_platform_probe(struct svs_platform *svsp)
 	struct svs_bank *svsb;
 	u32 idx;
 
-	dev = svs_add_device_link(svsp, "thermal");
+	dev = svs_add_device_link(svsp, "thermal-sensor");
 	if (IS_ERR(dev))
 		return dev_err_probe(svsp->dev, PTR_ERR(dev),
 				     "failed to get thermal device\n");
-- 
2.42.0


