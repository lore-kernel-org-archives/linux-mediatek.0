Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FC4C001DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=; b=FvC3HPfXbsGg/9c+Ybhj1Qmw3o
	d66kBLQuXxJrvIHGZCXLJL6Ytu9zd7NE5ybHWfA1/p63ZVM2Y7ku42KPU+/wNK3547Sa0v1VBX/v5
	ZGeP7zh3fCi5lEdtUPRNG5CCUvRN2Oh+/HgtqshiJR++6uYp+qfDoJhO2w430jo5ulslHY7WXkVCx
	/0+26OnM7fkLRtLOWx2YZ2YHdG3kJc5al6WGuUOrcvLAY0XrVP1X8HJTSToCTfIK94JtJBhX1hNR4
	rEARfyoJtiBD06B0dqo5Qq4w/naZe8yxkbjK6jfrTHWM/a8pz39GYQajLgc/pwTCk6Pr+l2SfwCU4
	yzWiCR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2y-002ghM-1L;
	Tue, 08 Aug 2023 13:46:52 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2q-002gZG-1X
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:45 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9cf2b1309so69013271fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502400; x=1692107200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=;
        b=TWkBV5gSpiaYBO2pVMPgzgZ4IM3FQnuBDmCjLwNUoY7GhOkFHpjUMZBlLOejOy8Heb
         tslasqykBMWSTuCDNRneM2gIhI/1Q2ZA+vb5UfAppHZOXeyUsan9zDwIPUGEr60iuoNS
         uiRAXfno17VDfkIvrFjVm06imbBlSNzNhOTOd57D/ST9uZV690swlnSLSfFFHCi3MvhB
         xOaHCdARnLnKSSRZ8ZisoW4N/fLfP/tl4wfei9Mk0/JM0ELZP/QRwOjj8joJmLa+986v
         XQAytVO3RvUtdVIzz99d0OjF1h+POn9loERaHApS6Ikr4uZ8JKPnAcakkChMfjU6l0en
         Wjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502400; x=1692107200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=;
        b=kxjevbm0DC1lIH2pLF2PfTrGJ91X+VSbwh5RgDkF8AAd8KmLGhY8ko0OtRKERLt7ed
         vERDbOzg/2D5ykhASoNlsAF7EsG0NLT5K75/RJMcuApY8EQRJ8T/SMof5e4hUsilscAV
         84mY0wQsWDTiTTxEqpsGgYm/qxtWDuxmcTW/bHR0KQrdcFzT7bkW3UORzoeHEPA5O579
         c9Xsa9jyMouHReMurT66Fn7uBlRh12cZFqLK5iRmuQgmYwDrGI0/Y3WDfOXvhpjIFqFZ
         umfhLyAH/bk5t2MedH27BURJREvhCdJLHprmaDgyY1Fd2XNxjxoCHYpmHjfW+XofW+KW
         A5qA==
X-Gm-Message-State: AOJu0Yyk3QbkkGFAoCKxaXBfR203lcS794D6psOKNLePWIg+DwpRmGcC
	1uASCQjWgUs8jgSogUzCINd1+w==
X-Google-Smtp-Source: AGHT+IFZRIPMWmSHgF0DTwYm5vWTgh/ZPFdc/lFtKvf3yaRIIaD/Q5hQaG6S670n+MjP6HDGCY+KnQ==
X-Received: by 2002:a2e:9442:0:b0:2b6:d0c1:7cd0 with SMTP id o2-20020a2e9442000000b002b6d0c17cd0mr2966685ljh.22.1691502400352;
        Tue, 08 Aug 2023 06:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:29 +0200
Subject: [PATCH 02/11] regulator: s2mpa01: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-2-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_064644_517608_83310C39 
X-CRM114-Status: GOOD (  10.28  )
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

The TPS65910 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/s2mpa01.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index b147ff6a16b1..c22fdde67f9c 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -5,7 +5,6 @@
 
 #include <linux/bug.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.34.1


