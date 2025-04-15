Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A54DC369AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=; b=Mt139w85Z1OQk3xDMduEpemw2h
	3e3o2GTdd9WRvoC2HtokzvEdmMwWml/cR2wEoGt/cSWN+bsh5QC/Y3WHhcIiFFJF7w5qgYP8+fmCb
	d1rz1GsRR/6txCJcJa4V0c7h9auCrjXd1dS2gPx/0Bsd2uzsid/t77p2Vph52QcvcEWKm3nrOyroc
	CjrfgqRYb5+5hnQ/6I7qGENh0AEo5AHESDf3WoC8NvsjA9ahpqv/+WgJlC3KWxDxU2di95m5ECpop
	UNwfuTJ6O2m9KOf1N+g7G528YFQChsK9fGNdCsvj5lzsThH/fsWzDbCmJ3ZsMwWzAA2Xe2V9NR+HC
	r/wiXpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fHf-00000005iAy-218Q;
	Tue, 15 Apr 2025 12:20:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eOH-00000005WIM-33qX
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Apr 2025 11:23:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4767278b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Apr 2025 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744716224; x=1745321024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=;
        b=YEuWuOkC4FZu/PeSL56ckBLZqQx9egdNhshXBC5Zs9KnLKFseRwWpVsI2OWrBJBBDd
         /dTzYAYNmT479QKNXAbRtWtLqJyvu8Mp2g9TDb3mF5F4EDC586KOzE3aHXM7Y3W4I7Xn
         84bu0Pcz+DkEcLp2RCriATmTyhXN/cymPi8Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716224; x=1745321024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=;
        b=SzuL0i/h8elGjvhwPM3FAiorC9xIy/08QHp/PpRT8CikLv2b2oO28m8eykCQPCtRhW
         izazS7HLKIVpXYoIRmWlBpsDPEeQE95tXTQ+FcBY7xDYQOoAWAI8ED/ejHWC985qcVlK
         4EP22UotEYfknwp5n1rD+N6GRcl1Td5iT3T/2CWkYsVuOFneugeo0jUfzUmqKPJ93vkT
         ip/FLkJ+6tOfSxHh9T/ZLKkK3IHH+gErrMuFsQiPqLkJ9fPsFXUaKBn6pu6/HJFlGa7o
         o3pnik6chMJ4vZGUSRUY6aKRyEvLTuu5fGfQ1u3G82vfL8/oJyKpte2OcI3VOoH0mdh8
         jTBA==
X-Forwarded-Encrypted: i=1; AJvYcCV/8ssLksh65q/mVpoVRUt5QWsP3T06T3fnc89rH0vYPUIjEt/nXDsujtx6bc7FL0TF2w8DxITqhRZRoIW5Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Kdf14ysTxf/tj77U6CIzms/mgGtaS8aOm0QXFrerg+NzalqY
	yA1FBMi5exu+IUNOGFiW5yH0ob52SlQbEveNIUfjVi/UoIr5HGStNoHSUC8/Tg==
X-Gm-Gg: ASbGncuaNh6vnBPQ9uGK231kaFnDO3WnOgiefslSSdiYIB2+Dd26DSyi9NlzmZgv+Uq
	c3uuhtdhyvryot3Q19L4Bd0pgVWLbuBA7Ovgm/BGwf5NTOXS6JAQsh0UI8fJv86P5MkIJBt69RU
	B4GyMsFkeLdOvLR/3Z0NDRQ8C+6errCNJPJOq699XH4jMtf2WP2jxFM3pciNdnuxXFWD8kh1s2E
	/IIUGbFlOLJrJDmfFs4h6IY3BiLVCIEXaG4fxTMhblYB2m1cHgWFmts2qfO2HhRp7IbYAiUX4HR
	IafZb9iMUsJ0NS/um6jL1o+xuMLON4xiTuSeKJkubQb+/+8ZVf3nCbSFnA==
X-Google-Smtp-Source: AGHT+IHLztgc2AXA8MRVXKVLULr5aHlO9vKzoTKy2KAhml+hRnJpGVjxL+/NKMKFeR5E/N1M9tqKmA==
X-Received: by 2002:a05:6a00:1481:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73bd0e97a1emr19543011b3a.0.1744716224175;
        Tue, 15 Apr 2025 04:23:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:558:e14a:ece3:dc28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f105asm8244136b3a.116.2025.04.15.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:23:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
Date: Tue, 15 Apr 2025 19:23:37 +0800
Message-ID: <20250415112339.2385454-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_042345_760022_DAA05D44 
X-CRM114-Status: GOOD (  12.75  )
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

When EINT support for multiple addresses was introduced, the driver
library for the older generations (pinctrl-mtk-common) was not fixed
together. This resulted in invalid pointer accesses.

Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
what is now expected by the mtk-eint library.

Reported-by: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn/
Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Stepped on this today on an MT8173 Chromebook. Thanks goes out to Uwe
for pointing out what was broken.

This should be applied and sent to Torvald's tree ASAP.

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 91edb539925a..7585de11854b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1015,7 +1015,13 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	if (!pctl->eint)
 		return -ENOMEM;
 
-	pctl->eint->base = devm_platform_ioremap_resource(pdev, 0);
+	pctl->eint->nbase = 1;
+	/* mtk-eint expects an array */
+	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
+	if (IS_ERR(pctl->eint->base))
+		return -ENOMEM;
+
+	pctl->eint->base[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctl->eint->base))
 		return PTR_ERR(pctl->eint->base);
 
-- 
2.49.0.604.gff1f9ca942-goog


