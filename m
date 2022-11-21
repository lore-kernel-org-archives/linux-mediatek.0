Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528CDC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 01:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HDlc1+/DcvW68foCbGqR2wdeh+cpwxu/S6MfsBu13E=; b=qyVQJ0GMUfnvne0e/AXl07l5qo
	F6qz9T6jubtZ3ArMjQINPwRglv+0ZLENaDuJFy5sffVuJmIdjVbaNTJGED2dvphsabccVJ+gjGokV
	MvOg9NmjHjEk6nXyS/y9PQy780HFhiCtwbTTgjXhA1GKHVxjI+LJ+pLbu/OQ4nu2LkXDsXiNWR7Ih
	rRTmPRb0ecoc4lN9uvwE6M2YLp70t/VLmZA4zkTeDVynK2aq4I2jhuAOmHd8RyUiZt6EEESF0qL1X
	fb6oY6JOW9EOq1zCYdy7KukQPyEDWZmwm/hfx4qIIOyO+UqXKpPcG5t1WS2tvu9q7iCTwAcow7EcP
	6Ll5psrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww2A-008JnE-LY; Mon, 21 Nov 2022 01:55:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1m-008JN0-3X
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ft34so25267486ejc.12
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HDlc1+/DcvW68foCbGqR2wdeh+cpwxu/S6MfsBu13E=;
        b=xj9EM3zYkhGTbbAM9JInZawShpTSctQotBDNSW7ItekWMTZ9U8sy5oyMxzTcnR1Agb
         N5tEpEdJ4ODHdzHq0tvCg58Sv7C9uDZQPYaRcR0+xtfXY3teMyYoousQsqclTigemrCt
         6uUN3w4Ly3Vd7Q+9xL2WaVTIV6087sIBE1Ua9/jl/wQOAOVikUARmkF4IxH2XWBW+dGQ
         CXOhZgodqE7BTE0M9T2LIHqbOupjNELdLmRu6aGvSvS3lzTdEzhGRTBZUrNNosn6zdek
         Q5BC1l/a/1jl9f/UmIbAm87IIw9EipXGqszyOlw3xvBeXY2K7cMpQs5DQJ1JNHRlvzXd
         nOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HDlc1+/DcvW68foCbGqR2wdeh+cpwxu/S6MfsBu13E=;
        b=1u8LuOHvrDvbFMcvGdPU/5yOMZ7VwjnxQ342S/Y4c/gwbCP8B7MBrd9GUbFE2px5Zq
         WKTf4JKtL6S1ZFC6T1sosI0kwH91t+00XzXZTJ/s51dyME5jsKmZsBLFlhpdiY5CBlPn
         uGTukoVt9E8xpGUQOKIBNrG6TCNWItL2AVVV0R6NZUopbnIkNE7EOXXz8LWr6EZV1WaK
         txYlOkYd+AA4gcJIxxvDh9Yxxlo1waZNne/gXtNUwZ9YmAnQokvwsS/dADZ9GYUfhpyG
         xdibt9cnDOgYadc6RV3CVuFtQZ5SCSDV5mIATOOtBvAnWkL3F0NLmm0wCB77gYjx86RU
         0fmw==
X-Gm-Message-State: ANoB5plYil+xf8K41vP9SuN082R8cQ6Pw9h2l2YNMFVGXJt+QGmJZPZn
	80v6Bbyb2ETm/FE4MKfVtzJQ7g==
X-Google-Smtp-Source: AA0mqf45mD5kj3zujPnEWLxQ5XlNTIKeH3Fdr1qXO7/VsrpRiIZY3/v2O8M++mNoqX30x8LccvSTMg==
X-Received: by 2002:a17:906:4a55:b0:7ad:9ada:79c6 with SMTP id a21-20020a1709064a5500b007ad9ada79c6mr13827861ejv.86.1668995708222;
        Sun, 20 Nov 2022 17:55:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 2/9] pinctrl: stm32: Remove check for pins-are-numbered
Date: Mon, 21 Nov 2022 02:54:44 +0100
Message-Id: <20221121015451.2471196-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175518_351822_9CC18774 
X-CRM114-Status: UNSURE (   7.95  )
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

Remove the check for the unnecessary pins-are-numbered
DeviceTree property

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cc9472b284047..1cddca506ad7e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1499,11 +1499,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!match_data)
 		return -EINVAL;
 
-	if (!device_property_present(dev, "pins-are-numbered")) {
-		dev_err(dev, "only support pins-are-numbered format\n");
-		return -EINVAL;
-	}
-
 	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
 		return -ENOMEM;
-- 
2.38.1


