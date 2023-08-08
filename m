Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F70C001DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=; b=eouAgok2t3Q8dZgUQU6TTspt74
	9lt5VFRx/OM8L9QDI86HBFciUezdjUVKzmIFs4eR5hITseYd+vJZ38O+fbll7GbRAchjP4DWVAFIF
	JpcJH57TB83LZy6hj9v3+uyfKyIcDsUmh86bDqOqraLHG6mUxwvJyJCJI+OKc/eUPLs5mCDyqwnJo
	/xhQ5nQIy2cNtqNhAFjFieH7E/vmQNS28neyYY0rHNenPsGf5qjS7IB8hqDng+o4RyRznDN9wgpgL
	8Sv/4RncrXcWX8G3Rh9otWc9yA7gh4dhOJwWNXKbgaDxg2BZ0A8HHZDzcmePig34agTwK8IvyokBx
	H2z3XDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2r-002gcO-3B;
	Tue, 08 Aug 2023 13:46:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2p-002gZ1-0U
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:45 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b962c226ceso91148871fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502399; x=1692107199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=;
        b=puotFRE3SUIzkIcb/ifMLSZcoXwQ6hZm+y0dlF7QgkdDW902D+Txn55GnvmXMXmkVF
         LaoM55PY1W6oS5ng43y+jwKg2K1oUXrmLqoZaOBIS6xoI/QnQAiUHRjyYOA3GV4kr8bK
         jB59vSc0V/+bmRYet1NhhiD7CWm7ADqW3uXTmcZpxwVoL8P1siSFQz5XRUIfK8JTBK+X
         baX/xwNDrADlqVs96eA4cQ4+xVQRFUjWwg4iaeFNdNYGPV/m3gFqZ/MjagJY8EV3XDZ8
         +BTyOQzxQtmJxQh0iQbdZc8/fDvY0wS/7KXK9gquAuPJ2D70R0Wdu0B8LICT1Qi1AcH3
         kJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502399; x=1692107199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=;
        b=hk1i2SHMU1XHKdvjM+Ht1Y5Kbx/LzlbTPZsaxUOqH0DPt54eT6iCQPRHawhCBakz6N
         kW8Nn9uzEFPlrEF7LBULisQv2wgNFawjgYbud1o8fTAmQeb1a7t2HLlY7nBU78plxCbB
         7oxGQtAH77tYzkygHLdIEVJx/qrnsFJWmDYojtM+TGhuxBwgLSIqV7pKk8zzZle62TPq
         ZX59/Eszaddhn32cbLvSiJF+pKlSyk/q3CepsKJzDx9X6TVRyjgbCwOR5IrbOcCJK/WK
         g0ZiVetm9buRP6bvkGqwTe9BjDCBDsT5HfkhHfc30Pr3NY7gjrFe+fk2gF+p2zH5dQIL
         odwQ==
X-Gm-Message-State: AOJu0YzYJElxBsb9TMH+2gbdWSx/5QCyYFc3KzrNzsBi9O0t2qma4/C0
	zWTGJyL+JCZpj4GZCh67TQ/Piw==
X-Google-Smtp-Source: AGHT+IEowhkuCmUF+r4Qwu7Ea/j6SLAKl0ohXdiWZmoM/iU49rY/8TQNDS4E142VCQ8PM8iR2Ecgeg==
X-Received: by 2002:a2e:90c4:0:b0:2b9:615b:39a9 with SMTP id o4-20020a2e90c4000000b002b9615b39a9mr8639502ljg.52.1691502399150;
        Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:28 +0200
Subject: [PATCH 01/11] regulator: tps65910: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-1-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064643_188122_E8E5EBBD 
X-CRM114-Status: GOOD (  10.09  )
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
 drivers/regulator/tps65910-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 2a0965ba1570..3a3027e0b94e 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -17,7 +17,6 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/mfd/tps65910.h>
 #include <linux/regulator/of_regulator.h>
 

-- 
2.34.1


