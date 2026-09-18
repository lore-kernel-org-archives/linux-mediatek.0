Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D9BC982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=; b=HOvqsuPHJVbK/8RVzuxN+mYG7K
	xJ9tv3TB/xuguUy9VpvyQvIf1jdjrH/sv4p9e8/0dMSmxknodQFOq47cxr0erflcal1rYVKe2sM8W
	arwjoz2hUrVEpVdBJdjfHb6ptMuz465Vr7Yqr2pueP0nmp/DsUQZFTFI/sUj/k7hAescZZuJn5Cv1
	dWgsMXGXB1T4TtCzpDo/GMQdGxwopaoGcEMpDO5dcdpxDMkYKheR1ell6NrAVm/YmF4hnBNGtc42K
	X9El8cIBkOfcErTevwvrZtDvmqUJndPqcgE0lNQ4PqIvRVYtJI4m4xZtscPPQ3XUAzBcSsgcr9fai
	jk3mQ0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpY-0000000EbAt-2KHB;
	Fri, 18 Sep 2026 13:40:44 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpJ-0000000Eawn-2tQ0
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:31 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f6so4934805ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738829; x=1790343629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=;
        b=PoKCzO5ievlrN9ZDA/EcvT6nEUh/mHQ/vgCNKVErtcydGstft2vxlN8hTw9HcTZMNn
         mMMDFP0vMnVioERkiFJZcnTc3HlO4ERTs+BRaCIK2+Xra47bt0BgDOFfS87GAw+tOs/c
         yzgNL7//BJ4QOHkBzYkt2rY0EKAWxne0NNTa7nlNo3KvzbI7z8AHo7MCDznOlYHSSRhb
         IJwnYDu0CxdrSRj/bfOOBq2170z17Y6SdYaGf3jXZscQhKE4G91jJcVnVbxKfFKheFAH
         wzaUzsN89Tped3+TZLjUKjnsQIP+TFQumh5d8L2/PAe0/wAlfrJJFFQ7rpNfvNv2IdGD
         6Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738829; x=1790343629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=;
        b=QpT8/Wo72sZ9eKWX5xeKZ+SK0Do+8Qgw/iRNr1hBxtZAfDhK8u+yrzdzPfbBa3NU/v
         lE+y1Lb+vm9yAIBXrxv6BhnJPPwbbHBsb/ou7XxcquJZGvj04X7CMtdkAg0YFG7UoIJF
         fGj/VRUTUL64t+mk+kalch6GRgSplsP9VwaBfHSbmh8uIKXt1vPlAWWUV6nJ9h8YtX26
         jc7AC6niaugZ9lutLKLSew50iQqwhyUjI03a4ng7ZS4Bcv0e+XzXJfQz0c6kwZH7tzfz
         J7/815ps2CIOMnc1jIfA4qhY0B+uHM4m/uypcQHUnxjjmGpnXt9euyRCOm8HF9OpdwX0
         iWug==
X-Forwarded-Encrypted: i=1; AKwUvBwCWLpnTcRnElseKyNURT5/XCN+0n53NkRxzlbb3IkEuEMalbzFSbL1PO1Z56BnSEPSfp0QLF1fYgeMRAvCAw==@lists.infradead.org
X-Gm-Message-State: AFuF++k7bhtTFoTQDqPeD453sivTTANm/zgTjeG+K0+qFoW71KPNoQvA
	ihQlm7fBuIHTtDPXcxxAkvnC/P6YZm5bs/HlLhrOtDjHcN6a627E10cx
X-Gm-Gg: AYBFou2sn8qi5OGV7fcXuJ2GAVghsQbFncEj5IagJqFzjqmGWa68UnyDG9qyjihb6FC
	Er1c/jASR3nmBh8t4HqGJyWIhsrVu5sY/E0/9udgBkXKAndQpeMHZoFnVta46fgMDECwkk4eChU
	lL/esoFwG0WQkOzYzxg46NYF+8/rTGGpaL12uawgVWKssz4sq3CpbbsP6Hqz/HTTynGckQs5Wb1
	L+JnTlZ9an2n+ouRt2Z7nndgvwkcpBdPLEeSK7hQ+MnnfmINFWMEMQ9vEc1cWQMFOu+SVZobsDQ
	IUoWmUdw6O/ioipNtQk45YJVqkV83eVJWczbqxCv7AYNwciWOgg3EoRaILHvqI8Hl7dFsijH5Ul
	p4uCBTZPbIVtLoIRyHrE4zdulBLqsjWmlnHZEgkYZ4UojcOz+5Q5nIUoSgNABKVTSeuo6AjOvKW
	efK/bWdtSDrEuqykM4yU/KXnHEK2r1/IdGbHRuYekQAi6hLzAGmuH9IWP+eVLvPPixDI5jVNA9v
	0rHAYpFat8ElWHnhYZtoQW2o5BJI7X9o8PyXMHsiO3hYakZqvcdDs80JKwzNPQRs2VjaPMp+HTr
	eanrvU7bV/OKqA==
X-Received: by 2002:a17:90a:d005:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e54f2bf77mr10812405a91.16.1789738825626;
        Fri, 18 Sep 2026 06:40:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/15] ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
Date: Fri, 18 Sep 2026 20:39:05 +0700
Message-ID: <20260918133912.133799-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064029_975136_1D5A7876 
X-CRM114-Status: GOOD (  10.48  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, mt8192_afe_gpio_init() ignores the return values of
mt8192_afe_gpio_select() and mt8192_afe_gpio_request(). If configuring
GPIO states or requesting GPIOs fails during initialization, the function
still proceeds and returns 0, masking the initialization failure.

Fix this by checking and propagating the return values properly.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index d4218f9708f7..d2e99c55b8c6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -147,13 +147,17 @@ int mt8192_afe_gpio_init(struct device *dev)
 		}
 	}
 
-	mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+	ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+	if (ret)
+		return ret;
 
 	/* gpio status init */
-	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
+	ret = mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
+	if (ret)
+		return ret;
+	ret = mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(mt8192_afe_gpio_init);
 
-- 
2.43.0


