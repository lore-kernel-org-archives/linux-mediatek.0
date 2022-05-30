Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664D7C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xeDK4QbVd3CT5XBgrfPXcBRcd28kx1ORtJ3+YaTf7eI=; b=RigYh+FEjIk0tQ
	7bFnqlhKnzCUg2IxIDwaNkH9bKRoYCLBawxtJ/oitOPVQWYDKIUnmGYOd9Y4RNG6bGip0WMGKCNu3
	s4v6V2briTEqfaLlTtxVz+2iXoJ32dExZ15a/rk0ES8+lNL4AJinAA5Tz6adSVAyFwsxV1ATpvOMr
	modU+9Hm6LTkgEOPI2lroqSmRWjS3Y+Xp8M0eBkfSsFKPkjYkp1SagsPeb0dE3VrYAY2yOR+ypRYx
	pVCEKxABF8A2af7BNC4inKPRYtuU5AsHlMF9vsR3K8BnuDqO1rMHYinOD7Hs2NE3xrUeKcsy1OGFl
	rcOAc3HmrOldqc8e+VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvec6-006WRi-Is; Mon, 30 May 2022 12:35:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveby-006WPp-3s
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 12:35:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id q7so3495080wrg.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZpnujIPcolEhKbIJZUfooL6oIUs8mzgT5bxqd2OLwk=;
        b=civVMl7MXBedL2Fy/RdMR2hvoMq61sw/bSOuRyUnGfnpbQlu1B1vaETDk2eoLtMg61
         xxvEM0CcGiuHnAv6EMTxHCVekfHJ443IW5HAHw1nPPodMQDAgQb/Z8wkdyR2n2oVdc02
         rEchF77XObT5skBCADYM/9HeAkGoea+j9J1auHdrH25hfsrcuBh06zz0PQOUIkBpRAHo
         9mlga4VSDuJ7sjz7UYdmr50MV3YV9+ezDISlXifrMQirUadM1ssMASjkx+97cXDUuyeb
         JhphSXc6/ervgN2b3jAzZSnPdDVaaUjM91vEkyX+Un5qEiD2lJPkDNrYMhf/x2hF+OXy
         7cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZpnujIPcolEhKbIJZUfooL6oIUs8mzgT5bxqd2OLwk=;
        b=JaJmZTidJPT7gTDBloFoX16lHppYuJhHwag8o0SkjOIcZHnpO1/sX2RMM77DW70N+c
         J5tCzzTY1vvpZvMHpKu31z+5s2TDkY+xUt1PTrORH/p8W93Gtd84QKigELw0OnQSWisF
         o7alLJeAkK3LrE7tKxYAcazPPgrNrVItMKltjHii+BiW9SiESVnamFYJm8tY7FLAuiVp
         pgpp233CLQECFnAKHVB5vOtZcyD8dZzlNE+tjsnddbaf4uT3WMAyCM3ysRR8MLvPFVuo
         sTXR+Cv4xLDZUj6a6uYPFsJWoTbjnIQBMFmhApQHzK03V9/dk8e6u7ObSjIafet+cdxc
         lFqA==
X-Gm-Message-State: AOAM5311CogeG0JA8X/g4AInV4lI504hGsZxdebr8jAjU6AUe/uSq9LH
	S2sMAfemRPqgPLvgqyqqaWKteQ==
X-Google-Smtp-Source: ABdhPJxvnP7l8SO28NpVJS5NOclYzbNoRLMyWaTv8lhRa6I5+hFmHhKsWwpdaDK81i85ecqujt0hRA==
X-Received: by 2002:a05:6000:1611:b0:210:28cc:65dd with SMTP id u17-20020a056000161100b0021028cc65ddmr8793920wrb.700.1653914102514;
        Mon, 30 May 2022 05:35:02 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d47c3000000b0020d0cdbf7eesm9380895wrc.111.2022.05.30.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 05:35:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: mediatek: common: add quirk for broken set/clr modes
Date: Mon, 30 May 2022 14:34:24 +0200
Message-Id: <20220530123425.689459-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_053506_343032_2BD52CD6 
X-CRM114-Status: GOOD (  13.71  )
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

On MT8365, the SET/CLR of the mode is broken and some pin modes won't
be set correctly. Add a quirk for such SoCs, so that instead of using
the SET/CLR register use the main R/W register
to read/update/write the modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 46 ++++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  3 ++
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index f25b3e09386b..156627d9c552 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -330,23 +330,37 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		return -EINVAL;
 	}
 
-	bit = BIT(pin & pctl->devdata->mode_mask);
-	if (enable)
-		reg_pullen = SET_ADDR(mtk_get_port(pctl, pin) +
-			pctl->devdata->pullen_offset, pctl);
-	else
-		reg_pullen = CLR_ADDR(mtk_get_port(pctl, pin) +
-			pctl->devdata->pullen_offset, pctl);
-
-	if (isup)
-		reg_pullsel = SET_ADDR(mtk_get_port(pctl, pin) +
-			pctl->devdata->pullsel_offset, pctl);
-	else
-		reg_pullsel = CLR_ADDR(mtk_get_port(pctl, pin) +
-			pctl->devdata->pullsel_offset, pctl);
+	if (pctl->devdata->quirks & MTK_PINCTRL_MODE_SET_CLR_BROKEN) {
+		bit = pin & pctl->devdata->mode_mask;
+		reg_pullen = mtk_get_port(pctl, pin) +
+				pctl->devdata->pullen_offset;
+		reg_pullsel = mtk_get_port(pctl, pin) +
+				pctl->devdata->pullsel_offset;
+
+		regmap_update_bits(mtk_get_regmap(pctl, pin), reg_pullen,
+			BIT(bit), enable << bit);
+		regmap_update_bits(mtk_get_regmap(pctl, pin), reg_pullsel,
+			BIT(bit), isup << bit);
+	} else {
+		bit = BIT(pin & pctl->devdata->mode_mask);
+		if (enable)
+			reg_pullen = SET_ADDR(mtk_get_port(pctl, pin) +
+				pctl->devdata->pullen_offset, pctl);
+		else
+			reg_pullen = CLR_ADDR(mtk_get_port(pctl, pin) +
+				pctl->devdata->pullen_offset, pctl);
+
+		if (isup)
+			reg_pullsel = SET_ADDR(mtk_get_port(pctl, pin) +
+				pctl->devdata->pullsel_offset, pctl);
+		else
+			reg_pullsel = CLR_ADDR(mtk_get_port(pctl, pin) +
+				pctl->devdata->pullsel_offset, pctl);
+
+		regmap_write(mtk_get_regmap(pctl, pin), reg_pullen, bit);
+		regmap_write(mtk_get_regmap(pctl, pin), reg_pullsel, bit);
+	}
 
-	regmap_write(mtk_get_regmap(pctl, pin), reg_pullen, bit);
-	regmap_write(mtk_get_regmap(pctl, pin), reg_pullsel, bit);
 	return 0;
 }
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 6fe8564334c9..cc0dce8818c6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -22,6 +22,8 @@
 
 #define MTK_PINCTRL_NOT_SUPPORT	(0xffff)
 
+#define MTK_PINCTRL_MODE_SET_CLR_BROKEN   BIT(0)
+
 struct mtk_desc_function {
 	const char *name;
 	unsigned char muxval;
@@ -271,6 +273,7 @@ struct mtk_pinctrl_devdata {
 	unsigned int mode_mask;
 	unsigned int mode_per_reg;
 	unsigned int mode_shf;
+	unsigned long quirks;
 };
 
 struct mtk_pinctrl {
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
