Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD32C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=; b=D/8Ac7EnHfloeHH+BdCA34gr45
	MicagZm91MEY76Zz10q53K6WkRC4AMMfTAXBbFk8/yjsIZ3k1+AtNvKoUwgtyaK+nGdkHt0Qy/25k
	IoJT8fGbBLcead1I8R7gakLUzQ/PQ3F3Y5kYeV7WWI6whwAqconEQ5VUU7S3Jjn/j/O5taLFHMoo2
	juHiA9O47/0EDCg4PIvfTGV1UClDc0UPhOIO9JKAHNVixiX369AxqN+Jo40F4xwSxhBDl9iZGUxTy
	57anEhsKbH2uRHmOEVB0OKK1vyyS/4kEFlD0xrymgABO1YKd+z8UjaJBzrj91Yb4bVBmbzKRCDiou
	fN/D8cjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybNz-000DzW-RT; Fri, 25 Nov 2022 16:17:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyaMO-00HNMn-CI
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 15:11:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id t4so3671171wmj.5
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 07:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=;
        b=0xyqcEpuVWgMhJdQBmHRgrTlIlTsFE2Q2Xx8JlNh56g/UJIDWGlzJJjRwuP3+kBqSb
         ZgJygCEEOXr3wQwh28ucV/JjIWdA63d95erRyvaSQFLbaWaE4zK81qtuaDz6v+Kr3J3A
         ul9Kpu1FSO076KzITtA019P/YedmI2jSTBr1g48wHivOwRw+K57V21OrSavoqVu6PYkx
         55KNqf8DCFCvSrrEmQVyILU4VqZZ5tXWPipkQc8RxKN1RGnLypHT2bSrh9MzKeRLHjHf
         jqIqgRRptD7nHiS+o8lQ37RRuHwzLbVo4VfjbQ/AATlG5HWUQ52Vzh4NoEcpz43tGc/K
         XccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlDqIjsLXTsLOVaB8vd3OkA5S2UoaPdLtsIDpj43x2c=;
        b=L/uVhkjuLw+k17n+OsmXkuy0hKDxlSHCJlgz5oNYK77+jaB3v1FRyg/HIJCWcerID8
         HOvhcXGn9lRkZ+96mh+39fAH+aMHPpUoORQXXY5jgJkwb1xTI0tiKZ0W2ZU4hBRHc7PX
         RQfzMxHhU3StEJEQDwd54E1CvfEMUVKL5ppb8lmzsoJi4yEjMV0hXv+Zep+s1dNOgfdr
         AZjQ4oAY1jbihymOdXC5zdyt8TMOowrXLjuv2wz9KbN1xc+w4jY0uO1cj0RLn+9b9RpZ
         Kc0bjUri9/ROfWO8tKJLjNTsScU5C5fH7DuzIwu/7wDtEJLBayHFpWXynPxBssoG6ZJF
         Ndrw==
X-Gm-Message-State: ANoB5pnd8oy4fAYWTNEFk0D5bJQYafLuDlz29+HJ7dGtbvMrv3Rrjwbr
	pXdORz4XBbDkVUr897RDFeeHjw==
X-Google-Smtp-Source: AA0mqf7VRkDXdyTHraTIggF3hl4hRThRoQ1Cum5vs0jhbzwuZ51ODnL7kreNEEFypcUPiuCpJFGw0Q==
X-Received: by 2002:a05:600c:4e09:b0:3cf:55bd:4944 with SMTP id b9-20020a05600c4e0900b003cf55bd4944mr31272067wmq.64.1669389081810;
        Fri, 25 Nov 2022 07:11:21 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm11565885wmo.0.2022.11.25.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:11:21 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 25 Nov 2022 16:10:12 +0100
Subject: [PATCH v6 01/10] dt-bindings: input: mtk-pmic-keys: add binding for MT6357
 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v6-1-4f589756befa@baylibre.com>
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=acIU37N8P1oQiEeAFVfuuIgjK7XT7A/zFtqy1fGJDhM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjgNsWWZDdwoLf/Rb2AU6TJp1j5Of+uaN7zUCgekqo
 ZCgL05SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4DbFgAKCRArRkmdfjHURa0oD/
 95wHQ5+U7hl58gSJwszReViGY6DKPWH/ihnDPhk6ryLI3o/2xnFnqVAVvNcZkKxIyXBRcnI2txdll8
 ynvVkvnt1idkQevWBMNV30PTAgH+GUjeczGTSZZLA2e0iAPomE9YoCZI2JQgYDZLmvx77dB1m+7ayz
 Qr5xRPrkEUyYJfKtFHxMN28AeMia8+0o8N/sklrrj+1kPzFYub/LdhWGegOlV6D6MjVsfrCOhDFxts
 xgVeutSlAD4YlRmGvdGYirXOgqow21qIxkZkHidLJl3aEDx/9AAgreME6ARMXq1qsUu/9hsvS5S4sP
 tsRirbSAOaffwLolt4/RxvBk8j6G3yZAHIVwZQ6YEWZqS6jJh7Lhyho2/Pnm/xbx+ZLUf91zuNj3qs
 uUObedBl1h3FzF3fi8LFkc9zOVjVFUmkut18bgX5swXkCD8AxqX7WuaBFlW/rmzAF3Sq3Ibx3Wo5W6
 ZGTMjv9e4smBWFkodhGM7Yg0pPgYF19EINb3CScsPvlWS6X01mq5aIQOS4QXtz4YeFh+2O7b2i/5O1
 IyOB+/I8l9ft1cnu77UiIBHPjupGODDILzv2nzNXJcwf4thOr2wGKl/y7T0K05IB9ez8mvX4pr6crr
 Ozd7qR/UGNVRgAqDqxTbsArppi3rLfWempLVRSwW4f8J7uMSHPpkob6GBVkw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_071124_478394_7F4170B7 
X-CRM114-Status: UNSURE (   9.52  )
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

