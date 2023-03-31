Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B520C77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QkkEgowsBjZnjX/gOtAy8+xgH7LTkosTkX/GzGdyGM=; b=qgK+lpLwIc/KF0Anv94uft60GM
	mbPJu+0cYdpGhtHCNuTpo93idou/nPS8S/k7J5ribzDeqmKFNlNQ8HFmu8DOq/mZhBYs3LEFpv4Ab
	1Ll1qhp76Jodm7Ke+xzicWJdhHgTI6QmH5VDfSB4MxdkdLTLZMAl+zBHgjF0PN3o4N6LS7ZmgoAsX
	DhNPNVNA+MSQGdDGnCgfXxtjUNzaDipjH2YUMpwfb6MmoVkTGe8ORq7DLLoeQxGJXDrOvYeeWCAGq
	5ABZG/E8sIrsx7auQyfc9KPdJrQ+XsrKy9SmakQk9JL9rl7zXs9YcQprU0+TB/tsbhR8LPj3IZ5Lt
	YxtTPEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyh-008Mkx-1K;
	Fri, 31 Mar 2023 17:55:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyR-008Maa-2t
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:55:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so14412308wmq.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QkkEgowsBjZnjX/gOtAy8+xgH7LTkosTkX/GzGdyGM=;
        b=XxTBPV4KNcEe0qPmkZRrKyQI5uhQxtQU/7gDyEpIWalnmi94Qk4DmEkGrL9oH39gpH
         942jLhOGte/z6PyFr7pnjP798UhzFFx1gYheTGAzM8cmc/PLEUht2ePK9dUOox+5oJrj
         5JkJKAXYdnzy4G3bu5M508dculDRr34xnOLXJXEcSe0TgUGCBADodzMbwQNswaAmLxi0
         0eLLC/ZmU/FnqIHUmuJSdFvCUsrp8TI0vN9Mw8BVcmQ7A4L0t9py4vQuSOBRLJsnFnw2
         o631GIkfqFXofwlGUffDj3KQ/3My1MbdiqKfKYQYOe1mYA7VU8O/FJQc8nhxjkgOhzvE
         IDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QkkEgowsBjZnjX/gOtAy8+xgH7LTkosTkX/GzGdyGM=;
        b=nuzuhjhLMtP/MMikaNxe5cjBx/aOADCObFPVPQ/Gwt0RQY1qu5s7LXD5lg2PeeIZkD
         odRYODIoevDPusSofNgNsvVVTQGChPE35Gqrqb8LVIuU0j/yLkST/CukwtkDXA2e/RK9
         tS2XClIz7w6KFSXInNzJghrTXq8UT2ERrgBAx+JksOcEbB6Psmzyfccqc5cqtQIpzAZI
         Ibsr9qmwiQPaCwLjYKJ838tHu/iL383EFWB/bsNRAJsyoM0tgQSJmNmpvVA7kIN/xAPZ
         7LJEQr30941Ry3tkTb7t9EGrSDHsnit9gLQXkxzf1rVDBjm9pUQ97cQVDttwms+inv9N
         Armw==
X-Gm-Message-State: AAQBX9cjevbwrrzyvCNZg1Rz7gnFacpFtkxU9VGhXy7Ev9Ozy6lxpQ4i
	uIlCsp9LM6GaJa0lVG0mTSphsA==
X-Google-Smtp-Source: AKy350Z1Zp+HAJjMVsRnd0RSQj/iy8owoVZuBlU/QzAW/hhi49p8EfXc8/Am/kKX+2hEOs8VeQosKQ==
X-Received: by 2002:a1c:ed15:0:b0:3f0:39ab:347c with SMTP id l21-20020a1ced15000000b003f039ab347cmr4719000wmh.23.1680285334697;
        Fri, 31 Mar 2023 10:55:34 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:45 +0200
Subject: [PATCH v4 01/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-1-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=e/j+wpeA8gY8YWfUFggkrkBUqt/uFn1RH7+Bbqouv28=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6ThWr+36gSjZmFPEG0zdxk33vsAzu6ZhTBFMOW
 4r6UzFmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcekwAKCRArRkmdfjHURcC9D/
 sHF98xyCV9ux8a8j63oXjR4rwT+x72x1oBMjK4zHRXv1kRipKbyGzB0WZ3g4Feusrz6Kwua0SFvejA
 GSQCu+BhEpIDS12gbC9tUY771EKuUla0XJ6WRNVX6Z3iwnbPGJk9QO2Dww0AWgR2/NZIrL+upjRlbD
 imrhhexpY9x0YhszDoZFfEs82J8/sNd/LEsqboduMTiBt75b+PFSGO9W95AhVA9ubB4bOm0MmFWSSn
 kDrZu2Rc1H6KvLHUclS2mq6Z/o6IiLNeIKAj3ZxZpwWlXENq3h78iz2MAl/JCpgxNfJrXJlyv9VN/f
 t669pTa6eWagYP678MPg7/AGKdQlCAosoGPSDUDclVTULmJGDJovpb6ia/7nYDZdSnrtZ13rvF7efE
 BbGY3I2iWvNm/GBxqjYq1qvyv2EenRe4Y/yGOClc6p6oMxkHvQe79/vTr36OEw32wn38zjb6ouJUxa
 SiFNG8V7Y1vu57OpfOKlh0YHW69XdUwvcx7Pb3I6AyTNR/qsq5/gDwWgkQ3leykV5YuyQYh9hDDdy6
 hFQcXdn7TClzRwLcQbAV0fkXnJuElc1Nmpk3lkvTUm6ZKGb3RJdykQ9HV+dYKu9H9KL9Ynk+tCQSRq
 g5XhZ0D1UP3Vp3gdBKFmAinx5yWPez2EfIrcSezJ/QPZgj2Qf/rSB2SI14dQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105542_473973_ABB157C5 
X-CRM114-Status: UNSURE (   8.84  )
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

Add binding description for mediatek,mt8365-wdt

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 55b34461df1b..66cacea8e47f 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
 

-- 
2.25.1


