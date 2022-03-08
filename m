Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xrr780ADEx+mhk4PWmR3fze/b3rHYP4wMnZBlAy+Yc=; b=HuxAqzD4dSADp5
	8S1zNxwU4gqysOl3kh4ZneN9ryDRg+o733wA64bqTfX5UP1CvR/pDpr2Ahqy8S+hX2d8hDjY8jLHZ
	PJQfo8cFqx78lebWWZj9H0r2Rb+JD5pz/5NWSe9rSj3EMAllenoWQkOuoSB4JQUVCVyoZVsbICjfo
	OHq9m8i+6txfWKiGsQouZUOk/Ng9igEG5J0+OPCc3wScoKSIe0Hu8JH1Om3SfwM+vkCS3BkzZX+hG
	+YPHhpfbAUzyFQ7WUt0CXUBoK1bkdffKG2mBsh9R0LpNp96gtwMhClnw77vq/xl4E+L6sR03dk8Nj
	MWZG3zu3dxjNxur2+JaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX2u-003qoO-B1; Tue, 08 Mar 2022 10:26:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnS-003kDf-JI
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id z11so16605353pla.7
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XAPYlXfrbQb3eNY+AafE+ihWQbItq1u/P6A4TCShoQ=;
 b=hFJUBUeTgT0nhSfBieWGKfelni90TSaIJERtQxilM8ZLSJl9NORTRX+eYAHr0Oo/KN
 rtF3oBwXKEbzQ5WY3SP7hQuS4sRXkse6SHLPPpMV5onMsLuGrNungp8YKWBWIjDI+jhQ
 KDmzDYVcK9y3FD/VsxCam5wouCWfbI/FbjoPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XAPYlXfrbQb3eNY+AafE+ihWQbItq1u/P6A4TCShoQ=;
 b=7YvjWOuUpZy/k53KYfl/Vgb9oe2eoDexeDIK1n+Xicnf6+eqoFxPflBkNvUGnn0aaW
 GVhmnjM7Yyf/Qz5fi02qZIaWTXWqLtdyTlAoxJp4MxDWeIrCgO+AcT8wApCn/+le5FRx
 pveL56ux+Ofjd74YpPaYXx7VXBcCsKOB/mHjA1mbNZrcQRKQgRHWv/CZVeONemwjrc5K
 s3epolV4NOB3Vf7eK6V9MvuK/hCfZ65ee2NaT7fvkV9vPXFbMqytFteQ6iyOnteLiZk/
 ibKmflswUCG+Rr7aZkQKpYKeVrWhOz/3YgTbSCb14RY9qD5rvwKbNkHAKAmNhI1YO6U/
 9k6Q==
X-Gm-Message-State: AOAM533wBVAFHghev3ctb7V1/jJ6q6fHNYDVxbFN7Prf/ccZrRg1lBEV
 G6OOEfehST1xrty1fsQEleH8lg==
X-Google-Smtp-Source: ABdhPJzGrWZUwCSTl12rRQJ06sxqRAcLOqol6JfTehC0xhhxAaiMBo1vwZYNvhWDGPkLqvhA3N3OEw==
X-Received: by 2002:a17:90b:4a92:b0:1bf:2a03:987c with SMTP id
 lp18-20020a17090b4a9200b001bf2a03987cmr3753511pjb.186.1646734224826; 
 Tue, 08 Mar 2022 02:10:24 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:24 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 10/11] pinctrl: mediatek: pinctrl-paris: Simplify with
 dev_err_probe()
Date: Tue,  8 Mar 2022 18:09:55 +0800
Message-Id: <20220308100956.2750295-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021026_721616_16AAAB08 
X-CRM114-Status: GOOD (  13.62  )
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
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 25d999848c2a..b587379eef4b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -1024,6 +1024,7 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
 int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
+	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
 	int err, i;
@@ -1036,11 +1037,9 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
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
@@ -1065,10 +1064,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
-	if (err) {
-		dev_err(&pdev->dev, "build state failed: %d\n", err);
-		return -EINVAL;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "build state failed\n");
 
 	/* Copy from internal struct mtk_pin_desc to register to the core */
 	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
@@ -1106,10 +1103,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
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
