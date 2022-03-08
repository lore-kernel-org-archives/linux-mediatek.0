Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4RsFELgsT2aMvvOYqH/x9e3zJ2dUQCcR2DAlmzvvP4=; b=Jy5obXI/o7H/Mb
	cW95hIyEke4WEjuxubwzuJSwRoadK7CfRdWW/MtVHDMiXLNBTKJsjRKx68qkaBd44b329b+l7erHF
	3N5TlpQJWN8jLhW3DM+WUjLEYbxBxTO/TkB4MJNQ5gxBvOFLC370tG2mwKuX1vLwJR0idRJ/TVKGP
	IR0Tb2ehZ5FAlHzdbRxrYSg1M12h0MTitPQ5gr4aiDvdAzgq9rRsIvOFHDLG08/aE/kbQwwub2tmS
	6HQJX627Bapk0n58NgC3cJXBXLtLRa+Zq8ulhqPzEh/tsdCdOjQYvkkX1sdf6KMeRfAcZVcB5pv1i
	+pFusAGOsPUH6EO5B0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX0X-003pkB-L7; Tue, 08 Mar 2022 10:23:57 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnQ-003kCZ-NR
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso1785188pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QEmSIEQFxB2Wc84ArL948mjUQ6bp5HIyQKnBGn7bWA=;
 b=e5hlsZ8M6FrXSm5O1f+PV6XxTqqhgfqU73P/IYJh4E0hSqqWGYVO0tRmckACGlOYw7
 /UOEQpi/SLYAuvbg6741+WVuaxEb1MV6seNKX4C0R7k/xBIHIXhx+GyyjIUl/PxX9nq+
 Gio7RkFHIVNjGn7Ma5LMRTdCDaTpZuUesPNVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QEmSIEQFxB2Wc84ArL948mjUQ6bp5HIyQKnBGn7bWA=;
 b=hiKGYKNMDaJLJ0Wffr9SBDoOP1s4nFB25/wjtC/7WjCG4b1mp7brbsitX1jsr3gBtU
 wG/K5+cii2l0yeRqOisXdVy8hkpXtuuRQK3dpbe+TM+IysGqRhI5rbURjp9bCRrVY4fp
 2qjImVNE0Q8BieWFco27wpLUftcPc3xa9ogNHrwBRs57AyXmqhCJFTibW5uEIYcVl4Sb
 63T+K4N/Tbqop2RGWUQ3Xf2VuNZWiHugrW1XB+hBWYjpUrka6xXzRjmtCYdNIbwVdtN1
 yUhXq4m1yLtTi++Krpg/9B4QD52v9I0Ka7rSPtE6If29EutCd2m103y0EHcwyXXheo//
 royw==
X-Gm-Message-State: AOAM530VEnZhkFu+hbGdC5FCoZdzWm17xHmjolv6/sok2BzrV6h9pqSh
 //6QjwZKhLA+3a45nYKMarPb7g==
X-Google-Smtp-Source: ABdhPJzUIGM7/aLnoqVgZbi6x5gKdbjCUJrwbdnqiMSuTVYjMyywx1haZYeF+oYRHLRbmkLV6lNEOg==
X-Received: by 2002:a17:902:f785:b0:14d:d2b6:b7c with SMTP id
 q5-20020a170902f78500b0014dd2b60b7cmr16603240pln.68.1646734222911; 
 Tue, 08 Mar 2022 02:10:22 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 09/11] pinctrl: mediatek: pinctrl-moore: Simplify with
 dev_err_probe()
Date: Tue,  8 Mar 2022 18:09:54 +0800
Message-Id: <20220308100956.2750295-10-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021024_795507_E65E6B48 
X-CRM114-Status: GOOD (  12.94  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 25 +++++++++---------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 5bfaa84839c7..526faaebaf77 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -605,6 +605,7 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
 	int err, i;
@@ -616,11 +617,9 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 	hw->soc = soc;
 	hw->dev = &pdev->dev;
 
-	if (!hw->soc->nbase_names) {
-		dev_err(&pdev->dev,
+	if (!hw->soc->nbase_names)
+		return dev_err_probe(dev, -EINVAL,
 			"SoC should be assigned at least one register base\n");
-		return -EINVAL;
-	}
 
 	hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
 				      sizeof(*hw->base), GFP_KERNEL);
@@ -665,17 +664,13 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	/* Setup groups descriptions per SoC types */
 	err = mtk_build_groups(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to build groups\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to build groups\n");
 
 	/* Setup functions descriptions per SoC types */
 	err = mtk_build_functions(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to build functions\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to build functions\n");
 
 	/* For able to make pinctrl_claim_hogs, we must not enable pinctrl
 	 * until all groups and functions are being added one.
@@ -691,10 +686,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	/* Build gpiochip should be after pinctrl_enable is done */
 	err = mtk_build_gpiochip(hw);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to add gpio_chip\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
 
 	platform_set_drvdata(pdev, hw);
 
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
