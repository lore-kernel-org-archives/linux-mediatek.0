Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CFFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lt04FcobeccFkwm0pbtL1PdtHaYZAQj8iSwBTn5U+Tg=; b=RKDuMKq4rI1KXE
	qe3NoWu7p4Q37kXorf5TFM0jM+xTeyjIYcSXXc0L9QsUugi/0I0LtitPVeKHI0y+XNo/qAY4UYGV+
	oa2o2ZfR4/YMHMxEy6f/X44NsP/KVjs3rDkD7JXaI6aepwcI3dhDo1HQD5lMRztSdMfzpjUsEvGgB
	zqNv4d4efhsG5t36mElPR9xXvoRAb30R+3f0F+qaWs+ZvBmXABjsOBmZ/jMaWzhDa4XekassL/uRs
	Ax8180p8HwzWdD1wvT12BHum1rGzBRWu7gxcxuL+LtU3cCVCLd2aYQxn+fWf9iYHOzYMRMdOLCwAi
	CcIGj9a0BgeFa6AsLFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nScaV-00G11I-8U; Fri, 11 Mar 2022 10:33:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nScaS-00G0zm-Hu
 for linux-mediatek@lists.infradead.org; Fri, 11 Mar 2022 10:33:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso5074259wmr.1
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Mar 2022 02:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHzWauNR3dX3JRCdUQ2Wh7sQFhVa1g70Y/fsse/k3yk=;
 b=OgmwPVe3iTZnA/fxf5BvpufbW18UFWKBkE6DauL5sDY3H5EGsXZuQnYiUcls3Xp/Yb
 ngodX1pS/phKVnyzuXFIoy84AfunMsefM49Ss1BSHYZl6/FrupaTRIDnlfY0f8IBKgXd
 7Sb27GyhcyaZiEt0ybiWuBKbtISdNMGVC5OqP/hs6OCZ0k6uAggfx7ulG284ELodkOSO
 b9BmifiA+AEWhfDJsB+JV8hPlwMmAQCKiHeN5IdCpB9fFof9PgSNmRPrZHLq2qijnyLW
 kIzOHxQUZjxBbpRfgPQRVk0EUp+1ki1OYhihN8GHetTjVQ0uIC4DknrszIyxGchHGiaL
 VVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHzWauNR3dX3JRCdUQ2Wh7sQFhVa1g70Y/fsse/k3yk=;
 b=yE6EmG+Npl19F3ixbyyresXATb8iW3m5GqZe9TjZA1uHNGZASPDHa3dsPoPRPlhK7I
 +NTfTXVQzZ0kkrE4LW/WYbOuxuvQmLnMk+390fZTXxcxqYXPgysaPsvCdjIMfCADxZuJ
 FWNiJCtEaT24FzWpgE3nLzQgJbZrHnNS0Hhou4zncaUNmPahrhkE5jhgvOPjaz5/Z52X
 cGkQbrGQkI7Z4eNOP+9CVx3lJwO2ztGwfhC87KJds+OQidtybheFXB7JqMC59iEnxMa/
 2+kgjnNzJDhkwA1ncKSTjv0aKN6aQiGbe9H8Z2pFQ5qwKotKlz+e7GqZFK3Ix8+XW43j
 dmWQ==
X-Gm-Message-State: AOAM533zyCYWOVQEtvV4DnuEie4AW8OTfFoqGoI21GugFgGbzzN8tqqF
 ThyLAFLJIW4I710oWUuIaIGLog==
X-Google-Smtp-Source: ABdhPJwR2NyG/o0epriqRgWZiafPO4iha8N9ZD/x+FYDnBCO3aAzDwH1hjTV0yNCeh6rbGezo3zDgQ==
X-Received: by 2002:a05:600c:4615:b0:386:9f67:8c63 with SMTP id
 m21-20020a05600c461500b003869f678c63mr15020537wmo.12.1646994809922; 
 Fri, 11 Mar 2022 02:33:29 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020393321552sm2264138wrg.85.2022.03.11.02.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:33:29 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Bailon <abailon@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] mmc: mtk-sd: Silence delay phase calculation debug log
Date: Fri, 11 Mar 2022 11:33:20 +0100
Message-Id: <20220311103320.3072171-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_023332_602407_6BB8F476 
X-CRM114-Status: UNSURE (   9.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The driver prints the following log everytime data is written to RPMB:
mtk-msdc 11230000.mmc: phase: [map:ffffffff] [maxlen:32] [final:10]

dev_info is used to print that log but it seems that log is only
useful for debbuging. Use dev_dbg instead of dev_info.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index d5a9c269d492..05c8b4de46f3 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1914,8 +1914,8 @@ static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u32 delay)
 		final_phase = (start_final + len_final / 3) % PAD_DELAY_MAX;
 	else
 		final_phase = (start_final + len_final / 2) % PAD_DELAY_MAX;
-	dev_info(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
-		 delay, len_final, final_phase);
+	dev_dbg(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
+		delay, len_final, final_phase);
 
 	delay_phase.maxlen = len_final;
 	delay_phase.start = start_final;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
