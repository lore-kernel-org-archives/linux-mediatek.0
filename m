Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288E8C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2UpaiCD0FxyUPYU6HtCVNlTsMf6TK5eg2XA1fT07gU=; b=BKQrrcNs5IcUy+JiDVBIgEDRQB
	zXYdSRLp1a2QODH2+/LrTUqkCBBlsT7NLUEnpWjtrSn5m8kEDYwI48kbCgXi4CsM+HaFAhwGsekgK
	QSG/nAE6AplPvYyELVdQgpRhJaQ8u/knTJNWtNvEdj8qrdRToX2kj9/C3ZJ0y9MIXdc8TySgqGZED
	3Nludg5myUJfdLHAHHAzCuYu/TWCTnta8BFJwacO0hYENYFEvCv098zBgANw4DpFl3dD09IHTwCO1
	xlG/MfTKFh58IVRJwvYkkbZ1Bm/hC+z6+PNwxtHaHJrLJyYoSqd9LYDpxap/sj9Ilc4qP/LDiROr+
	CuSUbAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12w-004Alk-1d;
	Wed, 19 Apr 2023 06:12:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12r-004AjF-1i;
	Wed, 19 Apr 2023 06:11:59 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1007E6603204;
	Wed, 19 Apr 2023 07:11:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681884713;
	bh=aJRWxVnGzaGr2J9P6apJi4W995EeNeVBfHiYi7QxHyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PHr8J0wKmm7tde/rnTrd4tzahXo0FD9+w38AygmVIQBAEd+P5Vpg7za5cTPowyhO7
	 vlHIgGGnqqwnEs/J4QSl8KiX4BUklaP/pu54gcOfSSmeCUw6zlY2wHxz013bvthZg4
	 L6p7R15+wddaFtGbgbsvdynxvzr6tw5G12qhRuTptjAG3d/vtHJ2E2WCxjcVlT0Wwr
	 pIc+yABvm+gM1Rq6iWsonDMKpNE0DPNZUbETvqUVca/GNkVW/ugs+I0JZOl9ZiFmrp
	 75l7vZ08k3iwTrQnXREsdbuo85scacvuWCjuQZWcoZo3Bv/WTtxVu0tvEFvDwQdxiW
	 xwlZeWFlfZaBA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aouledameur@baylibre.com,
	bchihi@baylibre.com,
	daniel@makrotopia.org,
	ye.xingchen@zte.com.cn,
	hsinyi@chromium.org,
	michael.kao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"kernelci.org bot" <bot@kernelci.org>
Subject: [PATCH 1/2] Revert "thermal/drivers/mediatek: Add delay after thermal banks initialization"
Date: Wed, 19 Apr 2023 08:11:45 +0200
Message-Id: <20230419061146.22246-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
References: <20230419061146.22246-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_231157_776191_6EB0E17E 
X-CRM114-Status: GOOD (  13.27  )
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

Some more testing revealed that this commit introduces a regression on some
MT8173 Chromebooks and at least on one MT6795 Sony Xperia M5 smartphone due
to the delay being apparently variable and machine specific.

Another solution would be to delay for a bit more (~70ms) but this is not
feasible for two reasons: first of all, we're adding an even bigger delay
in a probe function; second, some machines need less, some may need even
more, making the msleep at probe solution highly suboptimal.

This reverts commit 10debf8c2da8011c8009dd4b3f6d0ab85891c81b.

Fixes: 10debf8c2da8 ("thermal/drivers/mediatek: Add delay after thermal banks initialization")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index b6bb9eaafb74..3c959a827451 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -816,6 +816,14 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 			mt, conf->bank_data[bank->id].sensors[i], raw);
 
 
+		/*
+		 * The first read of a sensor often contains very high bogus
+		 * temperature value. Filter these out so that the system does
+		 * not immediately shut down.
+		 */
+		if (temp > 200000)
+			temp = 0;
+
 		if (temp > max)
 			max = temp;
 	}
@@ -1273,9 +1281,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
-	/* Delay for thermal banks to be ready */
-	msleep(30);
-
 	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
 					      &mtk_thermal_ops);
 	if (IS_ERR(tzdev)) {
-- 
2.40.0


