Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F993C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq8V/33dVQgHge8n1w+kEKrBuJXvNdZoMtd/dxWzcHk=; b=UF+L8aRWALvm4WotyY6Kagy6sG
	n7sWhi6cfwuFzKQLAlqvxLf05EYpMLVzoPBPIcEQ0GFWx24io0iJ06r2nwqb1cEiQCfkLl7FRLH/0
	HXNEPTwAT9iYOm/Ocl7g9vzregbsZZG8RQpuCQaisUoxDLV9JDWH3A/H/3gHl20OKDy00LHbh8ulh
	6zGFO3kAMgc0xHhUIaCbEf9lcSjYP6BhhaCtONydf86szhDyi4d0OPOlsIIpSyioq0on9q4fANy4N
	iTXMhHtCeU0T0dcx6ZQ+TtA9BKasnrzMwHZVGPr9z8k1YemXqmNnA2IYXDM9+s2vuIKLC6ZwDg+iB
	PoYvhVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHDC-00AV99-Bb; Thu, 09 Mar 2023 14:25:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAb-00AThh-Be
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso3746125wmb.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq8V/33dVQgHge8n1w+kEKrBuJXvNdZoMtd/dxWzcHk=;
        b=pH9jhSeWxNT5/kU6L7MNaM5/ur6uhg76pTZHmXmxPPrb61jwjkoI82J6fxbrcHYltU
         2f/rqdQIJbpp064BX0xuheTLdE3q3o9b8UdVvkxdQ1Fju/PSvgZWv9P3mVor/51H9uY9
         3tzK4x420PKNRNRmn46uVcvCNAIc80+NHW81zTmCtXXDCegldGmzuKNXcH8iwbKqaCjk
         2liI9a7jPl1hjRvUzJ1N1/cuDECTPoF1zaEpIU9DYYnnpWRyeO8oxDNf8kiOogHHvZuN
         iNRVCXT07tdieptyyjPFeRSLo2qMw6SUJU7dpXzvZbvIDpaIWfBPN38tKcV3/pEjimCF
         Blog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq8V/33dVQgHge8n1w+kEKrBuJXvNdZoMtd/dxWzcHk=;
        b=oYgel6Cm/UI5z4KcXBbpBzzvX1Zh2nnLLnYtNN+uNSj5uo1Zjqr9ieQ03C2KZSRtd9
         bTOazjgfHrSLCEG/S4JbHjWhq4yU0A17tT31vRba5XQiDG5kfwS1xx2a85oWf/PZxRTw
         oUKA35UxigvIXNuIloUSX/bvKnNzCd2TpO85EiesyovfDMAuZXBtnUKMo9W0euvB5eW/
         DzYRrqTLS+cVfuyB0EAHFUnqADMm3cepbcxgWlfVNw2F5Hu6lgJ/MfdunQT7MebHvQ0H
         Is7aX7nIbXOB3yLzhEn2Rs7r6At+IUa/mgffFfBVd1xTVWQHnw/7CYRHlEk+egIK9tq/
         stbg==
X-Gm-Message-State: AO0yUKV1Uk5XGOx52jzccbnkk2z58N7h7ZXPiKF1YAS+ikr7kFtU1pFU
	j2dd46VNQD7RSuEIYxD/PekXmw==
X-Google-Smtp-Source: AK7set9+xV9RaAG44ZqWCnxRFbCjr4oxsivxsX7sdBfuzr/CZXijhbsdH233AjK4P62T/QKd9PMESQ==
X-Received: by 2002:a05:600c:1548:b0:3e2:1f00:bff7 with SMTP id f8-20020a05600c154800b003e21f00bff7mr15742801wmg.12.1678371779863;
        Thu, 09 Mar 2023 06:22:59 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:22:59 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:52 +0100
Subject: [PATCH 03/21] dt-bindings: display: mediatek: color: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-3-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OsM4WLgGtmA0GySMLOWRA0K7CaicDuwTJXkW1UXnsOE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+UGUPeIJ+S2D6dPzbrAMg7/oQlmswOc0ccN7P
 u6wGgy6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURRgsD/
 9Su2CGheXWgumO/o1+RtFbfV/2NPJ6oPnQjRHboZ76/4aMHfZHlNwom726c+Uenp9FmszOcvURGcIj
 TmX/9MWQYbfvYkztFwVfy4nmU2Lp9yYQICKEqve6LhHz+dgepAxZ9CuwYoGI9TgWVAkWg4EXt/bPe+
 eZFkaY+QNGiZeveyB6YGxdH31b6UsulSwPoITDaTQWDEBbkTM3aSTN1SWim6wsWaMBsDV98L1DI3CQ
 QVmRdfyEx/HclVCmAWgjR0TBQ7m9tWZjvvjgjq5UIu7174p+aFba4UJWap88qZMkhJjthXpn3/35w2
 DbMegV/TT7IpdjFdkK1hjjoTHU2jTuiqEV6uf42D/hZij+QsLsLGFinuYbnKLpiO7fT7Uo6+C9YghB
 EtVsjcvH6jX3ceOhLtOOyyuCclwfemAenUYpDko6mgzobmuv0vQkSYvphhXvZ+SuII8RFPOZP9sy7/
 9XiXkH4j+x28Eld4fgVTZ4YPMMqW9o1Cejxh3AtMX+dfoUpMDDR3ej7BYo1dtmc21kOT9+pgFnuvVg
 TD6NTjMQb+ganTbeOvSHieHp87XYjw+owQMRDDnPpfD4AkqLG/LP9QfdjuZszkCpO5ZP8365csd8lI
 NeHt9xAJ3ArAgCBZLinXAckqQzfm1ebYJKKw/CNcjt9IlH8SSdSQ9KgPctuA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062301_532395_C81EC1A9 
X-CRM114-Status: UNSURE (   8.75  )
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

Display Color for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index d2f89ee7996f..9d081da433e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt8186-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
b4 0.10.1

