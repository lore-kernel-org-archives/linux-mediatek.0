Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D2C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbyswuRmDGOGqggdQqXqT7Cs+m5LJh2VXeBWZLXjLIU=; b=bLf2AZhIIMlr72EYUDFHv+zDZ0
	0CSGaT2XAI1oUVXJoCQqQX404SvcvqYJeqxKQ+NhH3LwEoVqVawlFC5mSgRidwVauoOxn7cmBQ+kI
	/sj8wPxKDzAycpAOJ0OSotRk7bYNZhfdocgCCABGCuV8WXHIUpHUsbsekVWF3baTSKTwX+QRRDbwB
	csm9kQPEnEG9nTBqZ1y/W9YXldToLgXSgo8ONupPlXbbBheyBhNoXAH+5Ld650E7tgoLd8ekq443Z
	446luhVvRoH+a1C+5pDuVku3ZRQtV+FPY2RifonWITbeoJXa2wbZYAzTNGyVgiuRppKBqICjznJk9
	YuoBLjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakb3-00GDt2-UQ; Fri, 10 Mar 2023 21:48:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYs-00GCe2-2u
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:03 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x3so26028955edb.10
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbyswuRmDGOGqggdQqXqT7Cs+m5LJh2VXeBWZLXjLIU=;
        b=L73u41NMzWu8lO1ELlHeKZd3WcB83MwnPVL4fICQlBj98zQVkgvU4JO60lmACXbvIA
         wdwAskhRGPhelfv11jYLOR+ppTUQPMprcl1EV7pZoO9zRqxbEVDyEEe7eOOl7qGl6rcJ
         x31FHExCqCNQGJT91GpVIPcdhxAm1qW8wDKHO2X1ogJZiqYeLj3+C2pPk0wkizUZCD4q
         tZ4TbpTuMKF/XCru+59zmJfA3EDy7ckr6vxQ7iHMstd2Cd9+J9p92b7qUD/TMY5hpkoc
         HRkI7ZyG9BdR7yn7wDteW8M8tnuubbC2EKyf8VxJvUh8e5l4AAqYhyi5u1bf454kDNj3
         sa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbyswuRmDGOGqggdQqXqT7Cs+m5LJh2VXeBWZLXjLIU=;
        b=zBTxaBOJpiKw09vYw8He8NTZw9Q1dCMLfvpUAo4vIRUz5le8gFdrukWo8iSpWtViQ0
         CDmtMnsmei+l02fwtgkgXUUjUFLdKxdJAssUqGPuem6FNbdwScbjmICheZdM3j+DeODY
         GCtLJvBOwfq9Gr5CzVrqPFui9xKJHuuGD0q4JcqYqvSBCYqGgBP4MxPd2JYL9me/gpvf
         LObz177T+RY9NZ8t1Tr0PAwssMjgxETxwLOcoi7PfCSAjCLyGGOakLJrqpnGosTXC3g/
         VYc0V/8FDHqmiXEfTYyHlhk+b/MCKKFNi4KtCBm4jiFjygAPcYd1j2nlyrXj3mwkDVtt
         RZWA==
X-Gm-Message-State: AO0yUKXxEf20CsoklCO7wqd90E+TnCp1OsCDOwFyJeRECGv/RiMlAqgs
	GcShq5yaIFowMcxEgNHOMUaCJQ==
X-Google-Smtp-Source: AK7set9Jf40AEyHbOmvy87vpw1Xb+IaWlreNsCXG2RxDHOTbxWqUwmXTuwkUpr4oApOCilH/43fEng==
X-Received: by 2002:aa7:cb4b:0:b0:4af:7bdc:1891 with SMTP id w11-20020aa7cb4b000000b004af7bdc1891mr3712523edt.11.1678484757769;
        Fri, 10 Mar 2023 13:45:57 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:45:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/9] regulator: max20086: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 22:45:46 +0100
Message-Id: <20230310214553.275450-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134602_165710_16865154 
X-CRM114-Status: GOOD (  12.64  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/max20086-regulator.c:289:34: error: ‘max20086_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/max20086-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index b8bf76c170fe..c98a72f43935 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -286,7 +286,7 @@ static const struct i2c_device_id max20086_i2c_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, max20086_i2c_id);
 
-static const struct of_device_id max20086_dt_ids[] = {
+static const struct of_device_id max20086_dt_ids[] __maybe_unused = {
 	{
 		.compatible = "maxim,max20086",
 		.data = &(const struct max20086_chip_info) {
-- 
2.34.1


