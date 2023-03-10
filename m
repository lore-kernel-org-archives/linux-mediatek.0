Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9BAC6FD1E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=; b=zJHj2Pk7OfkTXshzFrepXFmisR
	HFkDrivTlKMjyOPm39IvvDy0bcilyo1d9GpSf/ffaL9uWIm25hkT2O1rNtGZo1obti6Vcc02GmAPx
	hgUkskkoBjHCF+C1cJ/aHuxhsNomyZqxkuWwQWBkt2hBVn74EcNlC7vSEXxnisH75ir2sMeHrE1os
	2uPF2dfcmdUrPHXDL3+ycI6m/nNhze7/H03FnNBY856Uqh7nIYz/Ndn82bEl8/2z11hKJpC2Kd6wj
	/cONzHv85kHIEw56P42NtdYIrkTFCK76Tuo6yNVOYfBxksjGgZNLDreXWAJaOxk/aP8vdXyQFKKkl
	W3laCQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palX0-00GUkn-62; Fri, 10 Mar 2023 22:48:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palVe-00GU3L-1e
	for linux-mediatek@bombadil.infradead.org; Fri, 10 Mar 2023 22:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=; b=TCGaOYyz73uyzgxgoit/MmyG7s
	abl5T0uQ6DlZe4LtlcPPUEOJBpxsgK90RiNnOxoWBhLQti7aHeKCjbqAkNlKa9deDa4qJr+CsvLV9
	1sbHPJU/C4yrAEfDCwRMrA9mv4CqMhYlxvvtPdMDZzaat32PMkq3Z1IMLq6d5qhfyEcvLIrbRSMmj
	K1AyPlKMjWZtfK15flYkHC/ubjZI+cg3STPrE7EMWVMTvwxclZtBK37IQ31qIQ/uNMZ5UyvQtn+ZV
	/H5Ci16SI3e8ieHRjYYV9xsRcPEXZL2edXU51x7roTzIYSVtXJ8cjDdmPaZ0gb4Gi66ChFkpKJ3ui
	UYL+EBOA==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pakYy-000aHI-0m
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Mar 2023 21:46:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id s11so26089011edy.8
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=;
        b=HUdcJC4Cd5zElccuX+GbRtfxo3va0E5mAFfwm70nVNKW9fWz+h4Mm47hy+d4b5Yx1b
         8hRPjxJCB/CYJ4Ni3e6sH/OqeNrVB7Mhu/frfhdBzlFpoKmqWFR+2p/w/zwO9qMY7hxw
         gDQGFVH3GwtaDwu8pooTrF1dvRJAvj6ZLbuEHWyuMUbT8e65YI17iUIVHwqPDKttWlR8
         0jI0k+N0klRxt5SdhxBlnFNzMsqIYzPP9d4DiisRSqecYBvd/Vvy2Ayt01LjJRw59ReL
         Zh7Ky9BdfEHdUuKsLXy9qNyzH3K50nYuyGGhPOfMSAbrVYWWGevxcNyamWZZamNET7T1
         qtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=;
        b=V9X6RCXy99P5ur6zVgXCvlAsxBmxMH4lowgPLLa5UorDoWwydAF0A9KtLm9NAYr583
         jqQGngSEgLXEjkikJSUE8TVSZbX0X2LjV6NapjSX4KtDRS4nLJ5eYoFvCS7IdNkLmjXD
         SnXf4R/mBQFrkZ6hoESpbo605ZueXUnhMWvpNJ+CqHSKQwIDqvCvgRWeatg36puLt/TG
         94jzm25FP6Wr6hXU74+dt0O29DrX0vb5zxkHa1yt6BO1rvlt6V9fsQCDgH/R4cNuRPcc
         bpvrZCVsTPpd2pJu9qTncybaL5RxeA6fTEVIciAyv5D7cyWFS+Tqa3sOfm8HoBQktyqG
         VOAg==
X-Gm-Message-State: AO0yUKXPbDD3K1qRUZlp4srQKIPjpQYYKuMkazvA+Nt0dRXX1+TOil8u
	c02Fi2jzMj1LvtFIrbyT9d0tzg==
X-Google-Smtp-Source: AK7set+FDz8JZEWAMgcBwbvkCP7C1J/GKrOFdld1I4i17Xvc2r83YnSVN8MhDyC9T68rpj0eW9DONA==
X-Received: by 2002:aa7:c2d1:0:b0:4ca:4a5:91bb with SMTP id m17-20020aa7c2d1000000b004ca04a591bbmr26053986edp.13.1678484764382;
        Fri, 10 Mar 2023 13:46:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:03 -0800 (PST)
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
Subject: [PATCH 7/9] regulator: rpi-panel-attiny: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:45:51 +0100
Message-Id: <20230310214553.275450-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_214613_526131_797BBBD1 
X-CRM114-Status: GOOD (  15.02  )
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

  drivers/regulator/rpi-panel-attiny-regulator.c:390:34: error: ‘attiny_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 34514976475e..3953fc1f389f 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -396,7 +396,7 @@ MODULE_DEVICE_TABLE(of, attiny_dt_ids);
 static struct i2c_driver attiny_regulator_driver = {
 	.driver = {
 		.name = "rpi_touchscreen_attiny",
-		.of_match_table = of_match_ptr(attiny_dt_ids),
+		.of_match_table = attiny_dt_ids,
 	},
 	.probe_new = attiny_i2c_probe,
 	.remove	= attiny_i2c_remove,
-- 
2.34.1


