Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D9C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U7O3B7/vLpCaO2LpJCG06vJuxF+jy+nD802aTy7BRyg=; b=xx5HJvAUwGomLv
	CyBXn707OJxHTvs8o2ZnYnOnPLdn67artctv+KEBUTND7Vejwar341oNWy+QZRfD4om08P8YLjdDi
	GZdyv12DIfZEr+xVzadhbZCayNRlZTxxQ2FoTahjIc3SMwLLOK5tMtLqfeyrU+Aew3CbjaQ0w1QWu
	tk5yA5AYD+ThbLVVWoBTkbRm8z/zjS8YCYBmH7Z6v+UUgEl8YqR+e4KsYpJ9A2grUfBau5smukMNd
	6bZOvWo2UIcjdxg5ZnZz9CcgIYkmdFoEQ1bJsXvLZfTm4gLj1TFLInsy7Fn5Q5QxJmaG7owSQh4wu
	97dLUd/0nkU+XRwgBR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQum-00FUui-F8; Fri, 27 Jan 2023 15:45:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQui-00FUrZ-9A
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 15:45:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id b7so5353891wrt.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 07:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7O3B7/vLpCaO2LpJCG06vJuxF+jy+nD802aTy7BRyg=;
        b=jN0fna7SWiAQX6BRCXoOI62/7XwgmaqMcj4KJg01mPjQPYaoq4EmXBzeOQc3sbqEvE
         80SoBCSY1Cd7ydMv3JK3yEnvhruRKxBQ244HGbXnHEyPVh+OTkook+3orQAZL4zIjuv2
         2A8iUmR8VcPklgQVIsATo5TIOM7sKayDvxGajvlJuXE2arSuoUfZSqnV+zepWzvRTICZ
         DYR27G2BFypdcK8+KDTJN9G+CjA1tZm/5pR6NmpI7tgxjyBXsWKHjI4gnPZp3Jnn+fGF
         3DQQfjiT3Ct3Kohs6N7BU1aNulx91aQSwFdFid/xtow99yOk1kO7dkaqQS/z4GFxC9sr
         L7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7O3B7/vLpCaO2LpJCG06vJuxF+jy+nD802aTy7BRyg=;
        b=TeeFQAD6Hm3AIV7pBB4N2tAwK1bLQzZHIDCS965Vr87M6wDmeqeTU3gFySLSMakX7P
         xESnHrB68XsdulVJ6GaSx6F5iMw23Klugn72pnYAUJA3OC9cIouPD9cN5jLKxoZDxiCz
         OH+tXy11I1jcXT5viXpSHJhUdUBhzCgouVitQloz+4RCqMP1QpolDDccf0gxqsehn+tS
         M3oMKgdoyrgzZVuWZ0wvlS3E+zJwFWqMIPlnLxexA4Zq/b3nkatd02mC49J+ic465Tpu
         /n8j74sLbz8TlXUB02CfYXN/BqEQcXco3e8QDqdXBygpY27sKaxa9MdKn1Mh0fP7lIZl
         qNqA==
X-Gm-Message-State: AO0yUKWPrHAZCcSJS/J8UO+OPYv4x7UykXF3VqDwoeLm9CNQl8jfjl6s
	YXHYXu+wlsELfrNkEB1CkgxKTA==
X-Google-Smtp-Source: AK7set/1N8OKgU6tc4kZzvVACzpKa42p7Gmqom6ltJ7wxHRsG05T3LCbFnCz5HHJ7SEML+YBFO4jtw==
X-Received: by 2002:a5d:45c8:0:b0:2bf:b11d:91b with SMTP id b8-20020a5d45c8000000b002bfb11d091bmr12646769wrs.44.1674834314420;
        Fri, 27 Jan 2023 07:45:14 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id z12-20020adff74c000000b00291f1a5ced6sm4381153wrp.53.2023.01.27.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:45:13 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v9 0/5] thermal: mediatek: Add support for MT8365 SoC
Date: Fri, 27 Jan 2023 16:44:42 +0100
Message-Id: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrx02MC/43NwQrCMAwG4FcZPVvpWrpmnnwP8dCsqStsnbQ6E
 Nm7GzyKoKfwJ/xfnqJSSVTFoXmKQmuqackc+l0jhtHnC8kUOAuttG5VC/J+lclYJW8jldlPEkvK
 F176YKALxinbRcFt9JX46PMwcj/fp4mXY6q3pTze39aOx+k3vHZSyQEc9tFZaxUe0T+mhIX2wzK
 LM7Or+5NyTBFGBTFqCuEbBX9SwJQ2BBFRARj3QW3b9gIa15CHXAEAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Michael Kao <michael.kao@mediatek.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674834313; l=1258;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=6laNfaEfbdufAfkWmKX8igRePO4WwHhwM194Js7Oc24=;
 b=VrYSZmEuZHHpu/DIvUiw1+OoJp9kJ0ns2YRybFA00Pgpx5duuBgxFl5MKSq8AKPJxmqHJe/Nw97f
 ngWcKRl6BKE4TxP5RwaNXrh7pow6KtPPdB8dQ6Jsv+KWYo0F6an1
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_074516_351978_8EDFA994 
X-CRM114-Status: UNSURE (   8.88  )
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

This patchset adds thermal support for MT8365 SoC.

MT8365 has 4 thermal sensors, one for CPUs and the rest for debug/dev
purposes. The CPU thermal zone uses passive cooling device with
CPU{0..3}.

Changes in v9:
- Use delay between bank init and the thermal zone device register.
- Link to v8: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Amjad Ouled-Ameur (2):
      thermal: mediatek: add callback for raw to mcelsius conversion
      thermal: mediatek: add delay after thermal banks initialization

Fabien Parent (2):
      dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
      thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
      thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt          |   1 +
 drivers/thermal/mtk_thermal.c                      | 117 +++++++++++++++++----
 2 files changed, 96 insertions(+), 22 deletions(-)
---
base-commit: a2c81dc59d41e92362ab7d41d0c15471ea50637d
change-id: 20221018-up-i350-thermal-bringup-ad386d37056f

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

