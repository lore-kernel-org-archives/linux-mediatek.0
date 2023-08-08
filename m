Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D0C001DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=; b=WbNCtcE7mn1R6ToS0L23twrgCC
	Yazd0UyC18zdRxqvgN/eeUBO7IdqMRa6qH+DbVhNBNunhzwj+Knfk7XtnDihVtA0jhpeukyzhTXzx
	iJo+pX2wLcxROvxI+tjteU0v2BZHqPyDfxpm2pEFSCcRUZH4H8eW3rC6/Kkh/g3vQ0fuIvTKwdkMN
	DaK/Ue4TONB4qlSiYRMmQy3lfjWyurcgtOB66oEJpVwjVuiYumXzdnmV6wUrgsa3rtdNjIWln9Fc4
	+4OvRedatw8fYzoLZVFsMgMvYGpnc2IxurmWzsPjoD9gaWeJVsJILzMRm5YK1CCfCV5dbMdfIGhlj
	gsEK8mKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN3A-002grC-20;
	Tue, 08 Aug 2023 13:47:04 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2y-002ggH-0b
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:53 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9a828c920so87420621fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502411; x=1692107211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=;
        b=f26WxAxtdS2/Cvq4kbJd1Y9TXeK3Xh4vDaIqU8niE8AIVgl4qTzAKafb/+LUQ7gVIL
         CkCdFSKuCimCU35XFXuHTZakMax0DMxNIyYIA60XqP/VBNi0inC6x3ebKFDxuCaRKgls
         XIfXouChSqwf6fVxR0UrLJsScYU1aNE3t+YcuxW/GIEN/ajIRuXND24nAalXKvxNlPbZ
         G+Rb2UVBkyJgEF0ivlEBvbV1CnA4nzdlQ6+0Tut7uuEIpBz64k7ONRrLjvp+dbyCGv5d
         wTnqzjTsCpsUSb3x6X33kY9uuWBxsF47a+JQeBDLM3JCGdtoGVv/88t0/nNj89uoWlfF
         ozOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502411; x=1692107211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=;
        b=dJMKuNH0vLwmUm7HSzCpS/9SI+KM35O1diZ7TuhSuYz4bpip32F5yR1Hwj6vc1DUip
         DLzSlsJM5X3WSnfG6YbzUI/BJwZSWDsyj6xYfCwrfEA4KXhgso2t8uy9MPMSj7vfV6/o
         hP0gYA5m83C5MHJ2jC1YZrORSsHecpqd16jqpwNBHiuRpk5QLRBwTHseRgriL5srpOzx
         Pf1Ev+zqzINLjgbf2ntM0UYZeQMecisis8bGGvph7jbei7TdU2ntxiKjWdoCEq1jB7Q0
         FLYQeRYvUtu4D+0LAvSaJlsX0VFCRbFY7I8UUUv1N1aICgyw1QvVqaLwq/iomFeUFsdL
         Gjxg==
X-Gm-Message-State: AOJu0Yw2EpmpAUdviRJ1zK6eGy5ijGxRFKqUd828LLNuYLPphiznGiGk
	vNxKJzYNFucUGdbxAFZ68kFSWA==
X-Google-Smtp-Source: AGHT+IE+SDMqqQOfzDMcBQm6Q8z18mxaHPEwNvAM53y4c2JzhwsSdcZlgBmTg4v2rNjwyQRUpQmonw==
X-Received: by 2002:a2e:8791:0:b0:2b4:7f66:8c92 with SMTP id n17-20020a2e8791000000b002b47f668c92mr9274596lji.31.1691502410752;
        Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:37 +0200
Subject: [PATCH 10/11] regulator: bd71828: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-10-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064652_241561_441AB8F5 
X-CRM114-Status: GOOD (  10.84  )
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

The bd71828 includes the legacy header <linux/gpio.h> for no
reason, drop the include. The documentation mentions GPIO but there
is no usage of the GPIO namespace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/bd71828-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index f3205dc9d4fc..08d4ee369287 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -5,7 +5,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd71828.h>

-- 
2.34.1


