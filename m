Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2D0C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBGP8+ktL4ywlJvW0lmVhlwvhFE47q82UhD5J/2MFQU=; b=sFOL12SX6c/ICPXvIk2a1wNu0l
	rr8mcc4nLc38AnqFwFLiOYhzrgBQz1llhC3GXxPmVkyjMjG6GOtNtaiKxKQK6jDVd5UIbFexHWVRI
	70N+Ln2jQJTXep5hHteH7w/bdKu6g1nYckUv8uzJEIE4N/svLt0arHGgX8kR46lo0yjbssRSYAuMR
	5Za6v22f4vY2CKx3GttbMIU73Ast3HkmU64o7+Hacc8GjyB2zAtKITzdMlPnTQ0p3Khzjh+z480Kb
	KJPyE/PzgSTTLvyGLIBlJuYPh+YF9aMzY8oabFXhtnkDkok/xeNuN6+lmFjsWm8F3iyHegnaO93y9
	2BIvKqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamFJ-00GeOr-UE; Fri, 10 Mar 2023 23:33:57 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEg-00GNlj-JY
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 22:29:16 +0000
Received: by mail-ed1-f46.google.com with SMTP id o12so26454979edb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBGP8+ktL4ywlJvW0lmVhlwvhFE47q82UhD5J/2MFQU=;
        b=LwLmThATdX5HNobFSO+brNDu9RIY0acCKrwYmzGtVVzjJZhxTQOKm1spvMnktyhki3
         GDwqNCGFwqRn/7kUnE2lvo6YeFswYlvoaGlsKar5EQh1lq3Rcjjwqy6OGpcVDNU3megk
         WFF0BAcHkCebD9I2lbM+rrRRozHdxVVBtVHvFK6l2abJTAdNDYnWD8b36mCK61PQMFeI
         SkDYYKWQY3CFhDmOmFII38SNil/wTwBD4rDZJ7kqUJI1MdEdL2MGcroBZUk2eWcbU7cc
         yDDyqclvrv9smz6jIhBdL78omNdTQvynMcvOFzZBmB1Mspasb8f3jl1xnD5+cYctGRR3
         CY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBGP8+ktL4ywlJvW0lmVhlwvhFE47q82UhD5J/2MFQU=;
        b=Cvj3e/3Ut9MI1X/An0vfgU1BppSJ7tvNqi5KhNMKcX0Z76JzqGF3ghcvyV63cqyT+p
         KsacpcFIxIsUq4kE8xziOorQq3lbp5G8/Z0SLGLH0tOtnubllxHEX0FF4LoTqRMm2iZ5
         JrTpGDGbGGnZbtN14crNttD8wFN0PpQAcPojf4LFzbBlXsVrdGmPh9YKEyj6YE7Yeh6W
         jHw+kj/oprdOd2pZ53/ZSK34yfYpM0GEUp/4NmcFuHnU98NOR8Wa+DFz7DSlq7KOmenB
         0onnjMZj1ByYPiUjQuT65x9Hy02EQi0awewU7pPuQWQ84Y+9sOsW++aXSgtSguwCMghL
         iD7g==
X-Gm-Message-State: AO0yUKWQ3Cv2NzYduT4tLTwktJC0XF5DrjQ24Gp5WK+fGsoaNcOx28uZ
	ElTz0Dv5/43xZlO91B1l5qtIUQ==
X-Google-Smtp-Source: AK7set8uL4nXFDVb7rsO+o6EWoU4A34ihg/j/XmN4ZE+rbabtjirYsg20d8X3gBVCVm6QRcADU/42Q==
X-Received: by 2002:a05:6402:5154:b0:4bd:6b93:1289 with SMTP id n20-20020a056402515400b004bd6b931289mr24124882edd.15.1678487354154;
        Fri, 10 Mar 2023 14:29:14 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 11/16] spi: st-ssc4: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:52 +0100
Message-Id: <20230310222857.315629-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142914_692991_CB45E5BC 
X-CRM114-Status: GOOD (  15.62  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/spi/spi-st-ssc4.c:439:34: error: ‘stm_spi_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-st-ssc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
index 9141f19c7f8e..3fe266c336ab 100644
--- a/drivers/spi/spi-st-ssc4.c
+++ b/drivers/spi/spi-st-ssc4.c
@@ -446,7 +446,7 @@ static struct platform_driver spi_st_driver = {
 	.driver = {
 		.name = "spi-st",
 		.pm = &spi_st_pm,
-		.of_match_table = of_match_ptr(stm_spi_match),
+		.of_match_table = stm_spi_match,
 	},
 	.probe = spi_st_probe,
 	.remove_new = spi_st_remove,
-- 
2.34.1


