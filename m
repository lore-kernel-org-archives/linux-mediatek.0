Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1025DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=; b=o21TQtkSiFt/L++8rCnvQ963ew
	XNnF47tFcUfM3Qu8fawvinDxCcQXeUyjTpFqR1dyHMexCGUm+cvkkXtFpVcCqslEtqIDp89NvFWk0
	ZL3PUV8s8vqi4A8PLOcYVWrsMxFOvrZBNVbthXBf966zDFMIrJttx5Nn379+iOqNZegtDzRtsRCg4
	JeweKCDMIrm9zqhW1AhC+ZH4scLUZs36HZoFscz8go55GfEA/9sNKyW1KtcFFcRVsRuQjaHvUulcM
	bz+jA9PzxoE0avcgndVqxNcmihqIp8KYYjaoIfxyvYv8C78oD03Ey6tqGbMmcXedPCdIpiFnD98/D
	hsvoqkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUXR-007wEp-UM; Tue, 08 Nov 2022 19:45:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTa7-007Zov-7x
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id v7so9418532wmn.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=;
        b=BYOCyO+bb2kdgFf+IQXnllPA8KG+ULOKr2u5pTzNlB19Lf3j40UG1RZijo7Y0/dzq/
         AF/aYrwiiIQaP6x1ELhtaWR9iD+iq5NQ4WKw+w1mWu7BMd/iGE/Oe6BSy+0sq2zMerak
         tKfhtNaasBcmEMbjNcQ+S202FCZ8DHMlSpAcFazGAs3Ztv0/k3CNF+sXyka79AFVN0Yb
         oODBPM2zMi7AM+sMh5oSCd9Snr5CJqFF0Az0yuneh4yvlmm5mA7UjNnPlZ/RAXttBKAw
         ehA3rPKyQ5e76hLebM3PW8ehPYNlVlIRJ1wEgXDn29f3frWeYEs8lUma3DWbj51RsnpH
         YQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=;
        b=E+Iqkh4mKTLx7bidISp2oWLwK5gKUNmhc4MwhIXvqMSYGxLIZiJFly6M7GM1CDYAaJ
         GIADkpPFqcmVOxDOU4AIJ3fiNPudIWJqPHUK+cb+ALE/QMLEseP0jSEydDwinbwQwr0c
         VVtH35OJ3d8ecgRWCAuwHu5s/f4IYDKF1b0l0r6xli8ev9lRpL6Qu3haFOVr82P7THjF
         ZcWAIcAd0HT1GGgxa4uUS83HTPTBHYhftyskiowYmKvnRMvP7s1WqbyH5FHcvT9dKd2b
         7ekPSNUsvuFZ0rKcwG5xwU9Lds9TYn/WKaMNPeDGpEnfay6MzIxsXJvkzZraTQfNeGaE
         tqGQ==
X-Gm-Message-State: ACrzQf2hQDuG3JhEJVCKIU8DOmwACrLyZipKwbmT6tUDO+6VGjXNKF76
	mp2iHhhDv++XsNhQmZOX8HReFQ==
X-Google-Smtp-Source: AMsMyM58wAq1y+h8vVNYOMiF2ELmoU8hLvCu+Jchx0EIlxqBBtZMzUw41rs50l4rbL73f9+wR+N22w==
X-Received: by 2002:a05:600c:a0b:b0:3b4:f9a7:f79b with SMTP id z11-20020a05600c0a0b00b003b4f9a7f79bmr46623457wmp.99.1667933053693;
        Tue, 08 Nov 2022 10:44:13 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:12 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:36 +0100
Subject: [PATCH v4 1/9] dt-bindings: input: mtk-pmic-keys: add binding for MT6357
 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-1-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=acIU37N8P1oQiEeAFVfuuIgjK7XT7A/zFtqy1fGJDhM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN66fYqgivLlb/uwv5YlVdM2vSdwHFMjBG7yoYS
 chbjgBeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURS8vD/
 9gWsBxvGWsnueLnh+8eZVcOIt9VpVXe/hbrY/M7yOPoesCPZrw9orB99mUw7w16iA5vi7QmlADzcCk
 XKCUdnEoSqJU0QQgq2pmaqt4T8G7eWPd9idhG6bOEAly6+/XkomG1VJBJoxO/Xsex9I+L3lsR8XQRe
 Ig8dka7HNNaOwYthiaU4zJlr91/+IdPlxjQTY6NC0N65rYpTGxDHzMlK5TuCcv71gU4+ekosVAedS9
 s1boIO2Gu2laFxKTo7yq15gXZnNgF2yvvCfh45yyvMoIDgP2nL9OOgS2FUDCPAtIs4q7hhNo0udrqt
 kroGhHXGsOpHQxVMDUhCgImaB1uF26RLrfTQ5Z+FAC5rcOL0eMSwVbzkyrLKvFoaarSMI5sFnmUi50
 6LcVB3ZaIgJF/9/fz25eiB86kv4iaVflcodnroQoab8g7EuxTEXyUydVl5RCqZS05gPtexK5viqfnL
 XbEI8dw/ofSgWVHKxQMryxjqPS/uK9b6i/aTBCUco5XMjXSzKHAiZ7497KyUapChIuKR8CiuYXlcYj
 BQSpgqHVt/ZE3Kbp4cZg1eChLbp1J71DpP3bhOw394Z0yE/8RK2Q4+noiTKJ1EsCY2oE8a0lNKAHNA
 vnSGkM/iJVQazBlpAQ9cp83Xrvq8Q0US1bYvss5JF/XX4lRPEI/xTe0gQZ/A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104419_294506_254A8579 
X-CRM114-Status: GOOD (  10.02  )
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

Add binding documentation for the PMIC keys on MT6357.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 2f72ec418415..037c3ae9f1c3 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - mediatek,mt6323-keys
       - mediatek,mt6331-keys
+      - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6397-keys
 

-- 
b4 0.10.1

