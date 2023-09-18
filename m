Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B55CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CIzAQBDBRAbXi6odnAuwsq+At6oBbxMnuT61WOfur8=; b=sEJPCzxU4Hi+EG
	aLPlV4icBxA46F41kyxq50VVfqcuzAi+oF74aj7DO3Y63lQFTwVUYBERcJLlkLjwzPMAplbFV+ojV
	dSIK+2fTuHrzcqmYZUue4Ppp/tj0AvXbIeSAJ+5uDR2Cc7QRtBB3m0603EgoOgbFhuu5MksCQgXTx
	QS/kOO/Cxl1FzSAU5jcdjKyQhMR0Wyy7lLkLM0mhlv99zaWAmSH1nS+HLSjLH1mGxEMOKX2DgN0Qi
	5PHsFhUfAYOnVcl8OnRCyWEI6+XnQ03M4vGejqgvRFVO88U1fYUmDaAyRC7rscxY6ecjXyQjIMUul
	ySW0kF/v4JzyAQbnoQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBA7-00F2MC-0O;
	Mon, 18 Sep 2023 10:07:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBA2-00F2LI-1J
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:07:24 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so5231579a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695031638; x=1695636438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CIzAQBDBRAbXi6odnAuwsq+At6oBbxMnuT61WOfur8=;
        b=hYPwN6jfcQ/jh5PCUV16ke8rmWi2SThAZdW/6li2iVnj/Ic0U1U0zbYAzUyvLPlQep
         k9PhrEZ/6T7hH5cW0pkKbJRbU8HAcmWJg3/3d749dXJ1Hl+HHowKvdfWPWnEt62M7PZ6
         st/2gbPq2rB1cgfgrm6B2j0X+Lbs/VO48glGhdmuazTuFJeMqRblVIHWEDH+xojRag6G
         e3gPCW9APeurOQnWoFgYiBlS3b5kzsOMMz+dFI4m+b+mlazy/uthViyuN4GckpyLfG4R
         Ffb1NaLeQSDhtfa8I7WJYDpCETIKqyG0eimv0YbeOimimbm+NFS8XdRxijiapXenpGyM
         fxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695031638; x=1695636438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CIzAQBDBRAbXi6odnAuwsq+At6oBbxMnuT61WOfur8=;
        b=rvye4/Xvf3vFtCXfw/PYpG65Jh8Wqq+rwU5ioSLuXHn+v3zoYujtH2AVzghs9dMpJd
         9WxCkeT7eHM/dQoy8oA2HiEex+3neiGYjaCWG3ShJZ9Qi8C6LAYt9GY1IdEBvS+v2541
         5o5LFwm9SG57rvkqh0go2FN3SDuaRK95HbukfVppHl+/tSdpiLmZ5Hw+rb2juaLpvjXt
         8eBTOOvhgbnKpLC+Iu7g+xA3vOcq4aTtQYlrRZe5IWxQvIITU12V2qvUnX1HRIRULlku
         s8lvUJ0yYu1dXjPiIlU75nVhFZ4rpDK4mUf6LbYqM9pYSeevnaAuQVjiY+9hFW7SeFTd
         6H5g==
X-Gm-Message-State: AOJu0YwpMHcfGdxS6NaZoUVM6XX89N8K8NIpP5UxkFRN2Shsj1Rg747V
	y02YaVKLDL8zuhVJHg0VwuKZ1w==
X-Google-Smtp-Source: AGHT+IGidGqFde6MO6aKF0/Be311hyX6HKkzV2FNPU58Qptc75KDLExfyXA/sohTN+Ue1NGSHZDpCA==
X-Received: by 2002:a05:6402:3494:b0:531:28fd:ad10 with SMTP id v20-20020a056402349400b0053128fdad10mr1459070edc.38.1695031638376;
        Mon, 18 Sep 2023 03:07:18 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id p21-20020aa7d315000000b00522828d438csm5824096edq.7.2023.09.18.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 03:07:17 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] thermal/drivers/mediatek: Fix probe for THERMAL_V2
Date: Mon, 18 Sep 2023 12:07:06 +0200
Message-Id: <20230918100706.1229239-1-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_030722_472651_131AE856 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the probe function to call mtk_thermal_release_periodic_ts for
everything != MTK_THERMAL_V1. This was accidentally changed from V1
to V2 in the original patch.

Reported-by: Frank Wunderlich <frank-w@public-files.de>
Closes: https://lore.kernel.org/lkml/B0B3775B-B8D1-4284-814F-4F41EC22F532@public-files.de/
Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Closes: https://lore.kernel.org/lkml/07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org/
Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 843214d30bd8..8b0edb204844 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1267,7 +1267,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	mtk_thermal_turn_on_buffer(mt, apmixed_base);
 
-	if (mt->conf->version != MTK_THERMAL_V2)
+	if (mt->conf->version != MTK_THERMAL_V1)
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 
 	if (mt->conf->version == MTK_THERMAL_V1)
-- 
2.40.1


