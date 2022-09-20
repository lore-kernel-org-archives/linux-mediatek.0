Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA3DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7lzZcB+wCTOpq/I4J4b3D9MEs3lpsunTG7mgG7CDRI=; b=F4DrsRbZZj6YFJTDhB7eFxtvbk
	2lqmlefThV+zf6yr1SlXBnXOGT/s/1g3uOeHR58W9t+deXte7Zv5bFY2ZKcMZjNXp4F5sUwivomd8
	vI/kL9HANqbwXevKVyarH5FpJXGVvEwxJU/2e0kdGWnT3iPPhSQjLXZi2+mf1zZCGeQGRj7dViNlq
	rRM8eswT/nBa6QKVKSLzalb0aqDVvalsuGxN5rvseuvG/jPO19iq9ivetxmDGgz8awLHgzgbgErzR
	mTmhP+38jZInpCyv7RYRsrgzJZmY7tL1EHRTxSAySi0d/JOzTHKOrSGajgrFoJlgR6vCbrCyZ3DBq
	o9r7OH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaenP-004gq3-Ab; Tue, 20 Sep 2022 15:04:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaemy-004gZe-Ry
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:03:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id g3so4701617wrq.13
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=u7lzZcB+wCTOpq/I4J4b3D9MEs3lpsunTG7mgG7CDRI=;
        b=pZ6EiFLPNl8e6/H0Au0y+MFbYIanGZLwXXbLCQeDIQd1XlsPpReAgXodzTcYuT61Aa
         89zzyJrGM1So1I3uZXgPgsoL53xHWUsa8nke7jyJjO2S2Fl/Tfa0JoBGJbe10ujXTy2k
         myFsTLnqt03KF5BNomb9iFIqvAe4dlBWsdagiF/Vb3ujI9X0v+wJXEc2gbg9pZAeJ749
         rwziamgDGIcBsNEf+fdsq2/41S+l/koemt/xk+6/1HB3Ie1mdjwgzIEzjMlLMyvZo7zI
         0EiFuO4Tt5w3QkwGA3VU9eTOAntFo7p2CipZVzgW+7l9UtqX6ByT9SYUKfFjnoD0uKCn
         xHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u7lzZcB+wCTOpq/I4J4b3D9MEs3lpsunTG7mgG7CDRI=;
        b=qn1S3XbZzy4HzU514VaSU1LatyZ5vXXipS3s/FL0IItDrGiZOwdni3rwLzkFrwGVKi
         Xa+o5Dy0zI5m/ceLGFDncdEap1yLPTZpRQfgpe5pDybQKgpGjaJAsN6Kr/fO5aSdaPXg
         43BPrcLWEHEJ+9NKveAfRRaFertdfSiD1A83beKGMKXBMUq0RpQopdXgU+5GgVvKLxh6
         DBMZlcq1aUoGSankXE8ZqAT5DXe1xjUIA6u1MiG0zyf7TKwhK0ZTIBX3EdeuTYiEoJRw
         NgDAa1bF+24mNOIr5CzNTvICWt6cjHBjx8QskHzqy0ZEOT1ASyr4zS2tCIcWdHravpFK
         b3Yg==
X-Gm-Message-State: ACrzQf0RjDKA+ZlMXHdfc2Q5fQRpWT1DmQm/OJwUgaS9MlVoh8R+q5qQ
	HfQPDAA8h/15T/opgY/l1gQ5sA==
X-Google-Smtp-Source: AMsMyM4FjLTURV4Dt0OgXUCHHJVpnZfgXmsFGwBQXoynQ3Novbcx7O0gpXHOBrzgjoeWWrmAN/7EVw==
X-Received: by 2002:a5d:47c3:0:b0:22b:ac9:92e with SMTP id o3-20020a5d47c3000000b0022b0ac9092emr5164232wrc.376.1663686231003;
        Tue, 20 Sep 2022 08:03:51 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id u3-20020a5d4683000000b00225239d9265sm242056wrq.74.2022.09.20.08.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:03:50 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 20 Sep 2022 17:03:48 +0200
Subject: [PATCH v5 1/4] dt-bindings: thermal: mediatek: add binding documentation for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220920-i350-thermal-up-v5-1-123bc852d199@baylibre.com>
References: <20220920-i350-thermal-up-v5-0-123bc852d199@baylibre.com>
In-Reply-To: <20220920-i350-thermal-up-v5-0-123bc852d199@baylibre.com>
To: Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Kao <michael.kao@mediatek.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663686228; l=1160;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=Ub01dL5lJO3HNAW69Ya4ycDE389//wyHtwywY+gaBdc=;
 b=74IdXWfel2MH3YMf/5GSvjnaUPFZaWOdAfv1u1EwWpISTYhcQ2znV5BZFo+6oRG+qqDuslWg7tTs
 7M5ta8gcAZgPrbqwIfS95/tp8jcOcwL48HVgbtTrQygMBOSnE613
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_080357_459999_9E6084CC 
X-CRM114-Status: UNSURE (   6.84  )
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

From: Fabien Parent <fparent@baylibre.com>

Add the binding documentation for the thermal support on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029a..ba4ebffeade4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller

-- 
b4 0.10.0

