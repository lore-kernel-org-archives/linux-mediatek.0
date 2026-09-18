Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB4C982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=; b=oeyOENx4BjjjRk52cokXLi3bcx
	GrdBNTs1yz82QzVzkr77tGpnAvgBx/K5slCMmNiTIZ1qmcpr5gQHasQclT/G2f1LGNuYIGaQbFM/c
	gwS7HX7NLtj/va4zb8hlQC4hbJwpBs7whvONbI8QqEvj1t8dXHvyM4fbAzdcy9vgE0VwI9sHuy+lh
	g9xuHuK2wldxtWRwTE2xJS2JpNqFV+ferdB3on0zfPTcTEEn70UUwvno5W4j+wm7kJ1NABMMjvs7j
	mrCYDMo+fe6H4w5YZxBZgL5bzAunJ8x+H4ufzXteAcnexiqQcRpBStPr8n5Kpg98fDVaUCv5q8/We
	ZDEf7uEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp4-0000000Eaje-3Ous;
	Fri, 18 Sep 2026 13:40:14 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp1-0000000EafY-2xr5
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:12 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398c066106cso634433a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738811; x=1790343611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=PLKd/oxYNzNtpBNvcZ+Cs04Zv4ePdfe/oYNsK9NYKlLUkYJoT8ENOJJm407E9ZTCJp
         /DyQ1mFEneEPG7elop12kaSIpB6JysoWKP2EVLPMfrhFRg23PLtdtTgHSJpctZ6K6emh
         amimIRtkldVq+zi8PymyVl8hfLwR4T7V1dYA924LGUw2ofC19/3WGFBCcDUwVmD4PRUB
         CTTtO3T7fwJWyEriEGhFi+vyFwj8ID5YGYbOhapObIM0XOn4UwYiDD9lj989fU6BR9DX
         Yg+kFYuutNKOQs4uldZQGEuBke7kCItf7ibufuqtsFoo2v07j3tfS058oKz3nIU22dpN
         umnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738811; x=1790343611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=RgQA8naCkfB2n1EcooUb9KNhT8lko9yexloWmNPqoBm9v2lh1up5vvR/HtTtpH17px
         7/T0AuOwbyDgt3UD/ig7UpSJJkhb3/MBWinCqKkvcxlipXAvpL6KlInl9i64+PukF5OH
         X6Kg07+BKRK+POXcwXgpl2oXDQcyREsswCNMOQ3mqbNKp3vkzZsMLcIY7YMZKrWBn8ca
         j3YwzrcbxcKfQ5G4/xy0QA2jFADjK6vqULskUByNTORPHWF8V7oQvZHzXiOyEiL9ttBV
         orzkWgMj9vbigbmOVpZiqdR2zDnnfH+tPaPkAl3ns4VyHD871MfrPr5tJAxf1pFiT/8C
         cBdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXBbMi2BkWSXzFu2XnlRkvQMXqWvFVqeMCEL2mbAsDkgukBZKcmrIMsVziU+Bqu8Il4+C/dX8YKFIdbIlq1g==@lists.infradead.org
X-Gm-Message-State: AFuF++nFN58qsOPRYJoaahy3xlQ3ibw6fMZde+E6H9A+o1NYNn+duT4O
	wCXX7xis8f+J30+RxYuscYzEDB22vAXU/Rxn5XC1T78JD/KeC5Jf3NvZ
X-Gm-Gg: AYBFou2O6bz/e5qNDuiSbtkEn5lKuimOV3nHYs0AzmmBdmPCfbAisZMytFKC19my6Kk
	qYFkAAqcZ1TwKc/OU4J2yen/P9YTVA8290TBFWwMsFBFvcHa5ZNwGSbAHB4HJ9IcXUPiv2TynBM
	XgmbesOP0MvK7zZjtnh0bHCZIyKfadNV46csv6BH1J6leRE2kO4oXsl7v2AY2KJsVfOIpgGTSRs
	LPhF4Ka16Ev57HmpqIDQps2YQXAUIbf42YQxvL90or2sLBp1plFDbmvHKCMqryC8aLhMgyoB+Zs
	ISuDCUq8fuWOjPjWo3fW30S/JcR+DhaixQgOPK90NdWY1uY1DFLsvFWw6x3h48mv49XcUh8DVc3
	rn39mq/0VWQH7MngDnQikfnb8UapFouK3faHYNzAcWwFNSyLH67JGUHf6veOANC+gKMjKA8aE6s
	kMI5bUKroAwHRr5f3YI/UU0iF/YgFgr4G/Xmgpp/FrFfTiMGHm7xv08qebgMZ4NyC1TOqwLyaIy
	yy/Ungsaehq3msed13ShqfiJCWIZeLRKiFPha+FZj+w4753IUvhcmpdoNnkgMxnvuOtpzFFv6m/
	wUmd8tQAMW1zEA==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr10006575a91.3.1789738811052;
        Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/15] ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
Date: Fri, 18 Sep 2026 20:39:02 +0700
Message-ID: <20260918133912.133799-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064011_782672_68903B1B 
X-CRM114-Status: UNSURE (   9.06  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 24 ++++++++--------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 9b9a3465ddb5..c6ca4fe7fb19 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -680,27 +680,21 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
 							       "mediatek,apmixedsys");
-	if (IS_ERR(afe_priv->apmixedsys)) {
-		dev_err(afe->dev, "%s() Cannot find apmixedsys controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->apmixedsys));
-		return PTR_ERR(afe_priv->apmixedsys);
-	}
+	if (IS_ERR(afe_priv->apmixedsys))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->apmixedsys),
+				     "Cannot find apmixedsys controller\n");
 
 	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,topckgen");
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->topckgen));
-		return PTR_ERR(afe_priv->topckgen);
-	}
+	if (IS_ERR(afe_priv->topckgen))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->topckgen),
+				     "Cannot find topckgen controller\n");
 
 	afe_priv->infracfg = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,infracfg");
-	if (IS_ERR(afe_priv->infracfg)) {
-		dev_err(afe->dev, "%s() Cannot find infracfg: %ld\n",
-			__func__, PTR_ERR(afe_priv->infracfg));
-		return PTR_ERR(afe_priv->infracfg);
-	}
+	if (IS_ERR(afe_priv->infracfg))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->infracfg),
+				     "Cannot find infracfg\n");
 
 	return 0;
 }
-- 
2.43.0


