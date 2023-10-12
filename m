Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F8FCDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V9Ha1tPoh6dVTvqYgTNLLl69UYatye7Ch50vBppvcQw=; b=xtu+ZdKtIKMyHruW7IZQmq3Wbl
	ex8mQFL5AMktWRKXp76q88rL0ZzVLX3oUJ+iukd6aEpEI8+QBN26TcK79ztWlxmUOFHIFE+sChi5z
	NUpSGZJraOA/pGQQ3XBG/n19yrEEdicwcBIyiZZ0DDtD9P8xbBn4z4fVhXrCDP6XF6jj14yse8MZw
	2emk8aO2BxJo6tx5xozsaVj4W0nc8YMxYTKmDksTnHe6R1ZUcZFAl0EXGhYTosM3i5lBXAB0Pogd+
	ZqKfoulPsLoRng8E1qWj1YQdVKb5As7BzyKF/heyhNBvVvGuJE2RSSqmltwMcoQGFkql/NuHCoOik
	/NRN1E+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsC5-000QR2-0Z;
	Thu, 12 Oct 2023 09:41:25 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsC0-000QQB-2A
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 09:41:22 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c1854bebf5so9633731fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697103676; x=1697708476; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9Ha1tPoh6dVTvqYgTNLLl69UYatye7Ch50vBppvcQw=;
        b=UATX+vo2zKbTfyco3HHRSk/J/iFNGZ5Tgl/Srozrvz1REdz1I07RgWfpnFfvEP7njk
         Fjvmcpw/XdAIbierIapc8TpUtFhsHK0tCY+DogZpO9L6qQ3nhrGe5gVNTcNqf8BhPAls
         dUdS+4M7u9cZpf0DWWmrYRnxH8+GyqBwphhHKq7WT1lOKeTn6fC+CalPMp8FPnWvZQu7
         r3pxKp+Xm3ePs29TgcosGYmD+ROLLKExovMe/ZeLzzg8dZMW4+rCqvwGcY5xSzC68+53
         djORQrgFjd2Lpcz5k3jc0ipH8uazH9KrdxQ6PPnKm7pXruRdSRH7cSedCAQlOO4WCwUM
         Ww/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103676; x=1697708476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9Ha1tPoh6dVTvqYgTNLLl69UYatye7Ch50vBppvcQw=;
        b=erFXnOsNwSj6BlIhXuErtyOUez1vDBt4OfJFgYRb/oEesgISHBLVxBF59SRIfjZjZN
         xAT4vN1qnOPuCpcSbL4Ja4CcB/1bJx4GJ+em9wzSP6ej8NAuGGsgNJFU0liK1jrnxdqP
         LJozKCSF8jWofaUm6IdHkMSuTOIecLTENPutR8lGBWr2ubRJ+VIlfe7qXxGxtx7j0CBo
         QA87NCbi7DPj+mShkjgGuypvOgD//0YMI9DVE3UmDo6r6lSItL+w99ZexEslumA9Ju9h
         OcszyngBJjOCcIbUXuLh74y7CcvxZ6Y2mtvqfFJ0QlCgGohzWphDvBN+v/TrBX3NkCtu
         pyFg==
X-Gm-Message-State: AOJu0YxsR3cQACu6dZKjY6FNNxCWC9OFDoZ8LaMfXf5PJydsp8GQSYeO
	hxm9dGQTqYAaHmRHqn+yOlp85w==
X-Google-Smtp-Source: AGHT+IEaL1Aj5cIMJu9KIjuRu/rF5MoFIOwR2MxjF+RWVDhV2KmCzFNegrVLqtcs2W2wfLtFgVf2RA==
X-Received: by 2002:a05:6512:3d15:b0:505:6ede:20a8 with SMTP id d21-20020a0565123d1500b005056ede20a8mr26060481lfv.42.1697103675962;
        Thu, 12 Oct 2023 02:41:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b0040596352951sm21495929wmj.5.2023.10.12.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:41:15 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:41:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] PM / devfreq: mediatek: unlock on error in
 mtk_ccifreq_target()
Message-ID: <1bada9b2-d276-4123-bfdf-03d165569543@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_024120_730576_1121D418 
X-CRM114-Status: GOOD (  11.50  )
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

Call mutex_unlock(&drv->reg_lock) before returning the error code.

Fixes: d2805601988f ("PM / devfreq: mediatek: protect oop in critical session")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index b0ed25e33f2b..11bc3d03494c 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -146,7 +146,8 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
 	if (IS_ERR(opp)) {
 		dev_err(dev, "failed to find opp for freq: %ld\n", opp_rate);
-		return PTR_ERR(opp);
+		ret = PTR_ERR(opp);
+		goto out_unlock;
 	}
 
 	voltage = dev_pm_opp_get_voltage(opp);
-- 
2.39.2


