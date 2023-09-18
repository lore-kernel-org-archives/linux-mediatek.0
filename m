Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E20C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmBaiRUeRt+55ioUYPSma19exdAZQxKKsEgvUwNh0oM=; b=4IWxjnr71/lw9TdzKoABSADwjM
	njMEL+zaa8xEocbzDueeJPymUA3w2I/AP3OqNbMAeIE+OVtXdbS6lnXf3WJrtVkkrQRpEgd8HLihv
	Xf1hsiFFFX9gnjj9W7QZhWeZgjSv7bHa8p18kQjPzR4q5f4Hpi1SUXiLfaGpdOvCiolR/mcLzpDTm
	F0CXBzuejpS1425FmqUgvG7koK7vkPdmFo2eA6v1gPPFNC/EmS/YUy5LRWzL3xr8stmeiV3T2eaFp
	sQT0jL0KB77clLwG+oOA4m8l62NRvaYKfweaQf+eIbWzXWEdEqkvVIpqz0pt5tlnS9Uux7xom8N1D
	46uimEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAiG-00Ey0v-1u;
	Mon, 18 Sep 2023 09:38:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAi0-00ExpJ-1E
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:38:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9adb9fa7200so860868766b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695029902; x=1695634702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmBaiRUeRt+55ioUYPSma19exdAZQxKKsEgvUwNh0oM=;
        b=ZsQ3nmRYAGqSdcKmgled/0HEdI1bMmnpHAtR9mZhHQzVnT0iNhYQfybsLOH5xqj3ZJ
         OcDn+bmN/UqZJ4wUM2OLcgUo1TVocdAZWkF0WzO6eKPp1TXV5EANu0TuJOvYafbnWRFM
         +nAI3bblC02Q7Fw4EBJFzzwMJ+oWSryWk/j53SexHZCdN0G9Gv+5AdQeHkkgGA//gSRV
         odgwYlsTqm9qprgT/zf5rdTH8Z4x3nBe3AIdAuoJDPwoCzZETRmFjoqEWSV1rIxKu2H1
         Ue49AXnm6N9jsY85lCivVF3KpcM4ckKShpFkBIYc4JAk5iEWIGbpsLMhVxcH9gRAYeY4
         ASwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029902; x=1695634702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmBaiRUeRt+55ioUYPSma19exdAZQxKKsEgvUwNh0oM=;
        b=ueyezWKg/18QcIflJrue7sfHsOzOsFb6i1Pe8UNsjmEFkZwaiPkcltYQ1+B3p9hEnp
         f3k/4ikEpFzza6CADbpMUHde3G0wChPQlWFDjqGlIX7LlOEeXBkox9nJ3CG88ArLeBms
         DMphX+qOUh0uXtEbvJOjFiNeAhMCIUxCKD30jW3pFRc6bK+94CiMjY8oUXYO9kBxYC4t
         FbZD7NeqiIU2E9SJFjchnNJUx+yaqaAGeoOzsFsxdGq3j/sXLclI7ZbKFG9WegrJU2m3
         Y7da51JZ064F1Ni1HJeSFJ1NYUHUsSohocllSkIlTwzcVo+5IEJtSnYKCuYg5Ygrm6jj
         T8NQ==
X-Gm-Message-State: AOJu0YzKrhqq3Qb9cG2lpmJnJF7HjCRpH9MJOuj6icBQVTIKUdrp7Z/S
	Df4j5kw0AN9D/GKh1yjsnFjV0A==
X-Google-Smtp-Source: AGHT+IFalAgWKxViYbzYsG+o021uxkUxBvgs9JUpyWldMNZcLignfgl5INl7y8Bw5zVLkaMOU8PIpg==
X-Received: by 2002:a17:906:dc8b:b0:96f:9cea:a34d with SMTP id cs11-20020a170906dc8b00b0096f9ceaa34dmr15647396ejc.21.1695029902555;
        Mon, 18 Sep 2023 02:38:22 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm6251164ejh.145.2023.09.18.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:38:22 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v8 4/8] soc: mediatek: pm-domains: Create bus protection operation functions
Date: Mon, 18 Sep 2023 11:37:48 +0200
Message-Id: <20230918093751.1188668-5-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918093751.1188668-1-msp@baylibre.com>
References: <20230918093751.1188668-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023824_417123_588E5506 
X-CRM114-Status: GOOD (  13.24  )
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

Separate the register access used for bus protection enable/disable into
their own functions. These will be used later for WAY_EN support.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 68 +++++++++++++---------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index dbb268e96310..5b694fde7b56 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -118,26 +118,50 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 					MTK_POLL_TIMEOUT);
 }
 
+static int scpsys_bus_protect_clear(const struct scpsys_bus_prot_data *bpd,
+				    struct regmap *regmap)
+{
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+	u32 val;
+
+	if (bpd->flags & BUS_PROT_REG_UPDATE)
+		regmap_clear_bits(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
+
+	if (bpd->flags & BUS_PROT_IGNORE_CLR_ACK)
+		return 0;
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
+					val, !(val & sta_mask),
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int scpsys_bus_protect_set(const struct scpsys_bus_prot_data *bpd,
+				  struct regmap *regmap)
+{
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+	u32 val;
+
+	if (bpd->flags & BUS_PROT_REG_UPDATE)
+		regmap_set_bits(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
+					val, (val & sta_mask) == sta_mask,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
 static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
 {
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
-		u32 sta_mask = bpd[i].bus_prot_sta_mask;
-		u32 val;
-
-		if (!set_clr_mask)
+		if (!bpd[i].bus_prot_set_clr_mask)
 			break;
 
-		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
-			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
-		else
-			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
-
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, (val & sta_mask) == sta_mask,
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = scpsys_bus_protect_set(&bpd[i], regmap);
 		if (ret)
 			return ret;
 	}
@@ -162,24 +186,10 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 	int i, ret;
 
 	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
-		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
-		u32 sta_mask = bpd[i].bus_prot_sta_mask;
-		u32 val;
-
-		if (!set_clr_mask)
-			continue;
-
-		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
-			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
-		else
-			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
-
-		if (bpd[i].flags & BUS_PROT_IGNORE_CLR_ACK)
+		if (!bpd[i].bus_prot_set_clr_mask)
 			continue;
 
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, !(val & sta_mask),
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = scpsys_bus_protect_clear(&bpd[i], regmap);
 		if (ret)
 			return ret;
 	}
-- 
2.40.1


