Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA10FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/rxNTO84lGNbLtEhhcJ+p8E/TLPbCKcIw5I8PPATXI=; b=E8QY8IQ7QuILfv
	z6EJQKBYGYqoiNJVF5Csesy7NPYlX5xwuKPu/t95m0WKJkQqmmR7DgrXScwKOkFZppK48J+wuErwP
	8sGGrcaziF0upBrKB51YvzqT06xTeq4AGkkQnYr9IRyx6ND2qU6/RRyV1/+WMLiZEIQEG3rpp46iD
	pwrdpcAIa2BeOZiu9cCuchmjGlXJTh7MbMWVWzlNzSjOjLJj6QD5dDuCZGnJ63kmgS62pxo9dYpZL
	TerV+2avSZBmdX5CM1KLBJR8JO2jqZ4pxzPlksKXtHiliQFimEbCcpFC94c9KzlqOaRol2pUlgHfn
	mU1RzBqtD/+QpXMp5wGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLfN-00En2Y-8d; Tue, 26 Apr 2022 13:55:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdE-00Elwj-Tu
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v12so18771268wrv.10
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IG33gJfmQ/EOz8na70kwRaCTRZKTSW8kT9nFppeB52c=;
 b=7SFdF4zW4cjXauDzX5ndJqFVFTh7/DHREEin69o26mGqlPfl0nG84eROQy35s/D4im
 jUG6HIxe07HEZE9T/vDxZK4ickju6ZQTM4GyRq+f5Ttwl+hKmyq6o9JY6CbSmHIFdPGi
 h20VCnQFAVTNxCP8i45bIqn1AdJIIrODlI1sKI7aT9X1tNIUKfKJhdnDspUCWKePIeo5
 2APk0x3U3rKX+g9oY14l1tZIrrsUIcFop1N7WymIWfz5V42gMJ4bCX70Qej1DSRhJZji
 a23LjglTVJB9+wkW0cLPP+8q/J8iFntvk4wEvG236G1mLfb9GTL228BfptWygNayNnVQ
 /SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IG33gJfmQ/EOz8na70kwRaCTRZKTSW8kT9nFppeB52c=;
 b=lT/PCc+DTbv/SJZVyA9rfUO+y3kOUaSYujsfAm+qkTC1U7Yph4wsyuGqrFJKgkDWp8
 0gLK9BxmF6lY5uNR8soXQpWnKS0uh4uiuUuEicx6uM0zurHM7GcSQLSY9yvYqttPNvrC
 ZBSARoG9x+ugMLFzJ++sbi+dY5jmuVv7xtvJ/4AbteXLwRNhZANI7Lvpk2z6Am5Fd+Rz
 8Bnur9UcCqD28zbjzcAnGyCJuP+9liefcwYJ4rSapxcqnbJRmv/L0CshcwHLdWuyNPo+
 vkww8fAXO4dGhv5zOkvIxBkEarYV0wvUxSb1+oRQVpl2xcRmvHo9WOllhp9mZX0c7sNG
 3kOw==
X-Gm-Message-State: AOAM530mMq4Y5gt8Tbo7i4TsF6aguEg58xdIVdkEVnJ6S3lRHAgyojzS
 EKtdRGEXgRamasIKH8H4/wqnig==
X-Google-Smtp-Source: ABdhPJxoxTSsYvW2Te7nLeCmhF9o4bMlwjSRtCtf0E4uy+KjA6IngSDYs7AGW5znIkg5xhCcXc5Icg==
X-Received: by 2002:a5d:59a9:0:b0:20a:9047:24ac with SMTP id
 p9-20020a5d59a9000000b0020a904724acmr19063965wrr.396.1650981211477; 
 Tue, 26 Apr 2022 06:53:31 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:31 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] mfd: mt6397-core: add resources for PMIC keys for
 MT6359
Date: Tue, 26 Apr 2022 15:53:08 +0200
Message-Id: <20220426135313.245466-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065333_085080_090D842B 
X-CRM114-Status: GOOD (  12.48  )
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

Add the MFD resources in order to be able to probe and use the keyboard
driver for the MT6359 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 drivers/mfd/mt6397-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index bddb40054b9e..1a368ad08f58 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -54,6 +54,13 @@ static const struct resource mt6358_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_HOMEKEY_R, "homekey_r"),
 };
 
+static const struct resource mt6359_keys_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_HOMEKEY, "homekey"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_PWRKEY_R, "powerkey_r"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_HOMEKEY_R, "homekey_r"),
+};
+
 static const struct resource mt6323_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
@@ -122,6 +129,12 @@ static const struct mfd_cell mt6359_devs[] = {
 		.of_compatible = "mediatek,mt6358-rtc",
 	},
 	{ .name = "mt6359-sound", },
+	{
+		.name = "mtk-pmic-keys",
+		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
+		.resources = mt6359_keys_resources,
+		.of_compatible = "mediatek,mt6359-keys"
+	},
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
