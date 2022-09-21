Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC1ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcQnQhLaO6fGinlzAYyFGlxrfQHdXifdne2D0+nwBo8=; b=ZyftOs6lVbnesGHQJtpqeYxiHO
	+vO1O1QGPUMaxdUrTliv+dkLUMEWAELdyQPwo4Wp8AWB86DcENIRaYcYfGBYaQFDPhQ3N9jXoERjz
	wQuL9/K1+fnAe6oME6Da41SuMdPRuv7FHP1MjJdWb/ONpFbhlaR59VPy2npK0rqJcAZ9DGRKEATiV
	I5Asx7l049wyvriBSdBVAiP2zv/O6l5zzHCPYRIqKxCGXkTaKUF98Jze9BXfqR10/ZEdQ/G1dwyvf
	IYR2zeG9zmtqwcaPwxj3tKNfHeSO96OkBCSGR/v1jDoT3A0lYBTlyUauwDpA3psp2a6KNVzAE4/60
	+jzWCAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawL2-00Aack-JV; Wed, 21 Sep 2022 09:48:16 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawI1-00AXl0-Lj
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 09:45:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id lc7so12472863ejb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=qcQnQhLaO6fGinlzAYyFGlxrfQHdXifdne2D0+nwBo8=;
        b=BtZBIL1KHuomtHqRQXk7130LxJRBG6iEPPC108i/uUc1zv4vtgKCRLoo92bcByFpIF
         vI0ROss4+TZ0r+d44NYvZKCBsnoPZuAaj06CgUJ7JbIbTHS5sVUVr4LxWDMIW18cS9Bl
         pieAUjljj9sMT9Hasg62luiSjPpBOsazARnp17BOwJkZeYBc6tUKcrI+m7W7QL2jDWhp
         nIJDgX1yQ527pxCDbpF1FQo+d5dPY+mc/sTH5NJtyfswXR39RJ+Snip4BC2SultPg1cT
         pcqBmuDE3fTWldjF7WFhFQPW2KMdJTYPj+AwyAWjg0M1DT25+IKfP54wYaJJpaTXj8ph
         E+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qcQnQhLaO6fGinlzAYyFGlxrfQHdXifdne2D0+nwBo8=;
        b=rFP5vD6Yi6dt7qmjqWD7oqaK3/4xD7+JP6i7groFianbePZNOSJ5zNogdZ91NVJDxc
         4yuB6uey9dO0hoaj3DPo1Fpz4Vw6vSRk7sNR8dvh3bRIzfGCcZPAuRRGai9OtCP5yN8D
         DTi0FXDdNlzMVKmLqsHsuxsfiGlc8bxE7d0YUZIgH9iURbIYWfvEwyScTQWIqIm4JVV6
         vaBc+q/tMnYuVw1avkq8jLnfXvcbJbGbsa9QLRI583SmUCF/Rc4O9kf3hVbx7BFCd/FT
         /V9YEfyHqRWvYW4cucEyvAs5eMmhDg0/KjtniA3zscnsou5pQZvZM8J2aPvYkVrZnqlR
         XhkQ==
X-Gm-Message-State: ACrzQf1wzy8HuV96VFSgunhBAy2PWdTMi2VJ2J7ppKeMrBdLtCqzY0oS
	GOwdFRHkTt/VunxLOBioMMGnBbfVjyxXuVSaRtsWqQ==
X-Google-Smtp-Source: AMsMyM5SFTgTYiX8ufQU/7T9uAxbJb2nQtH8wwq24aVCveMh7Phf3u4mkG9wFMawfgPj/2o3XFsj+LE+O93wVevFl1c=
X-Received: by 2002:a17:906:fd8b:b0:779:dcbe:3a9d with SMTP id
 xa11-20020a170906fd8b00b00779dcbe3a9dmr20557155ejb.235.1663753505689; Wed, 21
 Sep 2022 02:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-3-bchihi@baylibre.com>
 <716d6471-f0e2-489e-5f9e-9e38e9e7953a@collabora.com> <CAGuA+orxfcycwcUMpLe+dkjnXPQkELQsz0vBggGKTQ04XRGc+g@mail.gmail.com>
 <2073b6bd-a4bd-4ab5-300d-2ce989e25d5f@linaro.org>
In-Reply-To: <2073b6bd-a4bd-4ab5-300d-2ce989e25d5f@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 21 Sep 2022 11:44:29 +0200
Message-ID: <CAGuA+or40GSH2QvVw033+KsGC-B9D6nRYj8zXvTs91iNDqgr8Q@mail.gmail.com>
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, rafael@kernel.org, 
	rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, 
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	james.lo@mediatek.com, fan.chen@mediatek.com, louis.yu@mediatek.com, 
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_024509_740471_0C089295 
X-CRM114-Status: UNSURE (   6.15  )
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

Hi Krzysztof, Angelo,

Thank you for the suggestions.

I tested this (below) and it worked without any problem.
"make DT_CHECKER_FLAGS=-m dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml"
"make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml"
Should I keep it like this and submit it in v10?

[...]
nvmem-cells:
  minItems: 1
  items:
    - description: Calibration eFuse data 1 for LVTS
    - description: Calibration eFuse data 2 for LVTS

nvmem-cell-names:
  minItems: 1
  items:
    - const: lvts-calib-data-1
    - const: lvts-calib-data-2

"#thermal-sensor-cells":
  const: 1

allOf:
  - $ref: thermal-sensor.yaml#

- if:
  properties:
    compatible:
      contains:
        enum:
          - mediatek,mt8192-lvts-ap
          - mediatek,mt8192-lvts-mcu
  then:
    properties:
      nvmem-cells:
        maxItems: 1

     nvmem-cell-names:
       maxItems: 1

  - if:
    properties:
      compatible:
        contains:
          enum:
           - mediatek,mt8195-lvts-ap
           - mediatek,mt8195-lvts-mcu
  then:
    properties:
      nvmem-cells:
        maxItems: 2

     nvmem-cell-names:
       maxItems: 2
[...]

Best regards,
Balsam

