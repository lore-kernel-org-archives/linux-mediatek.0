Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F045C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=; b=BsdLMU/RrhOJ3zQUyKtriE60fv
	f8XX5M7z4AOv7LnoPRt4mvN7Ro+x4Ex3d0IQUxDfNbtHfi/wCn9zWq+rJUxuRCtOGX7tpyj8cmF9R
	mFq9sRDE3FCZ1m6vN+H1f2y/6awDLQc00erYwpXMUBdvaiNd3/E78kvcIZ0RDvMAzkDw/4JJq/0I5
	RiKFjIKVYoRtaAa+FKmHTBcmgp0Ms8hCzupIMJZw0afaYjUY+6hGmOg3gVjXN8fE3mb/Dk/9LWhhy
	BLOE4vvyKw8blSpfSXUhfjUKuR2TF1tG8C8Cz1fWU5naPa3RYpuYEBKPvXogdnmnDHYcnCI9sdTqe
	nvNw20/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakb7-00GDvc-Sj; Fri, 10 Mar 2023 21:48:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYt-00GCeq-72
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a25so26295928edb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=;
        b=eazgQcZCrt9Ga/ofEu9u0wbMTdh3cJMSnCEAxHjKojovwHbBqFaYNXexCjrVV8WZmL
         IjIGFy96UGzAd7OYJe6GFIzlkbF3Ce+Yund8jNyCNNz7d5wyWXhYAz4KQryGHzpw6P5A
         syVx3nyQgnSWls3X+D7pzRHVmTiJzgID7JidYHMUoBnhnMm99uyjwBAKRV3leKmTysBB
         LWBkPn+fPwm5N37Y/AGsnnys0xkUahlfSm66E7i7Ce6rBCVFLWiOXgRiu8s1O+WwY8Kz
         gL5AWlwpg49IakfXXEZeLLZuHFCmM5UBCoAA8vz8TKmJ5ULqYx/gkvsBPbR2vjlfodr6
         UD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2Xaj4iSh689/qyGj27neiGsk9yl/lficUi8UV/fm7A=;
        b=BWXYQXyNj2h4wDn+nIw4zLBxz4/6p7KKnPHBPe0HtQ4YbGw6OgeaagpudMicqd9Q9J
         eR8mV4Qjuzy8OAd+68MBUVTWYKyWJ6TnRKm0nlu14dmm6MYCPbxTsB4A3c0tK9GZ1tja
         DZp3uv1ugppKgQfgDu+s2ugzrX9AXQy4+tTdY+iJWunz7mYwZfHts0gqO4k28JmMDUUS
         IUAKcdFROotz7hHhS+EK6wXhFl5KxZ+quUkOHKC7Rgi2QdOhoYuiZ4AF4SXv/dYNkvY7
         dCzxpaByOAr9toLth3rnWidyHXxSUoSWoAwuKTWJr73tQ/v9hrdJBFv7Qt11GZOSVcWn
         ek1Q==
X-Gm-Message-State: AO0yUKUfgvioF9foO4yCAn44R9tuVvzScMLH4HfINDaQE6GTDtLGe4q5
	7uZ0Z1L5VpCKFQjDgKU3xYaZ7A==
X-Google-Smtp-Source: AK7set8Y8CbDyNpUk1qL/iKlbybJRcErNtYcWdpv7HASkaB+D40FRo/ph2ZBE+VfNIL0RyiGBCovDw==
X-Received: by 2002:a17:907:a603:b0:886:7e24:82eb with SMTP id vt3-20020a170907a60300b008867e2482ebmr27928777ejc.21.1678484759246;
        Fri, 10 Mar 2023 13:45:59 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:45:58 -0800 (PST)
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
Subject: [PATCH 3/9] regulator: mp8859: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 22:45:47 +0100
Message-Id: <20230310214553.275450-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134603_268106_B2DFD58F 
X-CRM114-Status: GOOD (  12.74  )
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

  drivers/regulator/mp8859.c:132:34: error: ‘mp8859_dt_id’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/mp8859.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index f2300714d5a9..f893dadf2abb 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -129,7 +129,7 @@ static int mp8859_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-static const struct of_device_id mp8859_dt_id[] = {
+static const struct of_device_id mp8859_dt_id[] __maybe_unused = {
 	{.compatible =  "mps,mp8859"},
 	{},
 };
-- 
2.34.1


