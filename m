Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AA7C02185
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jan 2025 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=; b=rgzyWfi9GP5ZafrRjWG2upWwxN
	axU3km7Wc3nbsHUtPNvRDdd9Gqz3EOjpv2AZ30RSO+L0eMUYK3Q9vQjoj/wEwI5r7DrApruOD7DKq
	lE9iw9fO74umBAc2UG0LvW34UlMslmwevIzMS/5ceymdSmSi86MN5pvBnMYP1NpgeyoGM1vDzBPRo
	Glz6meMs6w9Xy6b9hPKhp+MMUL9uWZubZrgE/X3WrGsbPe1YD42stDFHnm8mxYYyOuPMIU1R/1rWV
	RS4JULu89t0noHsr4vFuy3pL2NNd4/IHnKECiT/Vr1toDGja1ysZgCDICdq0ByESeYTP5q/ZOgf+k
	rPy/yQJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBLY-00000002gLg-1OMg;
	Sat, 18 Jan 2025 16:06:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBLW-00000002gK4-0tIG
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jan 2025 16:06:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43658c452f5so4314615e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jan 2025 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737216408; x=1737821208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=;
        b=TvIlTS/J1b7b2O0uMLT7kpZqcfVhE5ueAvpeAS+NjishtXBk9fdQV8y0g4VMKppV1N
         lzl1fgXHMXhGdevDBSdZK8T0vfoO7tKehHx4TflsBrk7ba3l01Z729sTnL9p0EWpD8wC
         KolNfywq/oyRUkFs4k+5PUDNoi5EoZ5jqANPI1nYVwkQ9eQcGVpBVnupU6AWnthUyCQ+
         fB7h0ODuOtMgMOkJ9q8PJNTSw33JM/YXNq21Mn4t//RzqcuQzU7rT6HVsNkWoRVs9lVC
         gpAuEVy1vSDoADqUvVlY6u8nMdwlHJgCG79LFosixyuiNUmJayJqDgYfj5DahwKM3hy4
         n9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737216408; x=1737821208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=;
        b=KMIsN/IN8CK2uG7anwop4pB1Tu/IkqBUnAp2XdZpOF709nglG9w261ZNaWui16cWOf
         YmbDdEPLxcJ+YJgt927pJV0KA6cJvLEhOqECSMx3edfnKsmSscPhOgwnwhpNjtJv0HCD
         yfPjXB0oqqQFzumY1hd8IeXgaSbjHlMzr5ghgkax7tBEjwNr/MhgzUj4tHO3dl05/EwA
         4whoc5RghICKuLMYSnMFqdtbA39Y9ZFfZj7+FZzcUj/CrHldgwyD4q2MLgSmnr2vwaV+
         MnjWPvCYZFRUSwTsSRQfycXM5IzsDUaZa/ykCbS2YjRbuufVjNXcnMUv8KxKG0FzHf6/
         N4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVYlgoOHcX55JcvC3HqWi2PabvV/1nxls2mbd+jGcXTkslzX/LH7pm1MkqM/Rv+e+rYndZLozllhIrvnn1gTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBFKgecvZ6AMa5+s9iKtBOETikudVsq0cGn0WesMy5ZuoEeYZn
	UoKG67qvWihVpV0JxRI4j86jx8oTKEPXY+PyaIBRH88otFLQtrXxeEhVobWy6N8=
X-Gm-Gg: ASbGncvnrF0cas0uYgGk/EwAwy+Ped5WtSE+qHU4j1dhfGwYdfBoKSqCEfON+T6sChx
	qXMdRfoA1aVzbYv6LovyOKPKeU1QbffLy63Tv/m2cyiRUzh3MN7+dQyFt4RwtFRz2WhtC3A2fio
	DCM214CDko/tXzku9ZGsT21l/rzhm+XPPLLmOR7wIWUMRMb6oYursoiKJfv7SGodgGHaVpgp8kC
	iWVPOG0Z9y0rx9ghHZcH5CIXwkJtiZUMtzVWoQAX1dTvHdsPFmNoO0ymblW16ynVHQFm3l1qV70
	H0ubftgv
X-Google-Smtp-Source: AGHT+IFMVBWg/sRcSunUViba7PAtliDqmSrFRcKnOLFwmE1beALCtPs34+Tkf+oAZ7uLqe5eQ56YKw==
X-Received: by 2002:a05:600c:510b:b0:436:fb10:d595 with SMTP id 5b1f17b1804b1-438913bff64mr26793385e9.1.1737216408218;
        Sat, 18 Jan 2025 08:06:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c475csm133966725e9.20.2025.01.18.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 08:06:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/panfrost: Drop redundant Mediatek driver data
Date: Sat, 18 Jan 2025 17:06:45 +0100
Message-ID: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080650_308447_6D19099B 
X-CRM114-Status: GOOD (  11.53  )
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

mediatek_mt8192_supplies are exactly the same as
mediatek_mt8183_b_supplies.  mediatek_mt8188_data is exactly the same as
&mediatek_mt8183_b_data.  There is never point in duplicating all these
structures - it only raises questions or encourages bugs when someone
updates one variant without changing the other.  Drop duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..12ccc5a11c0e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -817,21 +817,11 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-/* MT8188 uses the same power domains and power supplies as MT8183 */
-static const struct panfrost_compatible mediatek_mt8188_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
-	.supply_names = mediatek_mt8183_b_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
-	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
-};
-
-static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
 static const struct panfrost_compatible mediatek_mt8192_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
-	.supply_names = mediatek_mt8192_supplies,
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
@@ -857,7 +847,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
-	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
+	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.43.0


