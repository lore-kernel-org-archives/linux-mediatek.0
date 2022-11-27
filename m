Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF59C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fnqM8n9PGKGOvzAFEIiFMORJd4lJURGGn2BL+kEfNIQ=; b=1jy525rFhlmpF/MLqBNSEiIb5S
	MF0b/PfzxOLL4dPLt6dRcgysH5zp3KMshd7DKpP2rfoS2fiQuxNmh4h2a04Ka7+97foVdWKK5WfzV
	xtyai/IWWItQLvRphpWXlkUapmKqMbILaaTq15Hs0fb4rP3V6hpRHEBA9iK8UF+Y0zTjCrxyFSXNZ
	TRNRcqdmTL4+jk7SAh7Tcg0GyxyRkWppVlgmeQ1w0pEuljDmOAVwIDkgfgf9EULPF+ZgcRLLDXshO
	DjeZ28LXBwsEqAbgSUDDIHTjt+jDCTa4lJ39g2CUNzreSdFS57VbIeqd9RTQfS4s8M9McSBLOT0CR
	XV3SbUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPSd-00Dntf-8q; Sun, 27 Nov 2022 21:45:15 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSW-00DXzL-Hv
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u27so3534135lfc.9
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnqM8n9PGKGOvzAFEIiFMORJd4lJURGGn2BL+kEfNIQ=;
        b=vs2qhd9D4zvjiwLqg3Vfjy1XJCOSrrmrj9Fm4gBeZv2riWyP8Sbzb/j6TDcAv3txKL
         /Ojqg6f2+NrgPtRI5vVr8cTH/7W4ZEoNEc/9r2uJ1FKQDTK7Lehoj2VsgMh4wJQiUQie
         14qb2VlBUnJhmJ5CxVhjDeUBlLSWNhR646cAGp9fmymUw5Fw/jIKd/7bTrwCHLr6HS/I
         LIeXh09TwEVuvfCo3E6RpwDl2VGeEFUrI1ouKieKaLg4u+Du1U/WPLV46T2L6XapopGE
         o2wUlBgL2md+QslIWkOPzmqVhdRm+HuJqVbvgMrRMud6AEfJ4oA4AOevIHIj5qLL3F+s
         Y59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnqM8n9PGKGOvzAFEIiFMORJd4lJURGGn2BL+kEfNIQ=;
        b=bKDchjKlF2fFtELUCFGUvAQllzjoKjdgBPBD8cCPxkKlCkNIwNk0xfB9vl+q1a9CNM
         gEYo1/ZEYx5vU9sc+6nk7ORT7QZmYQYgiNsGvcZeUXM86Aw+zoCg5zdnRSaEu7JQ+k9K
         jeILQHeOqrQX2a0hsEteZOxO3y2Ct/ITVkBhAiRYEqCBewXZc1CBPTG23IaZFumaQZcI
         67jIagXNcjbs4mCEniAphDmYKsCOD4z5jxxCGechK4fVy7C0GE6wf4dgA9tBalOsVc3k
         SAGbphXmdBY8Qo/UrcSzSHvGi6l90uGMfakhCMaUXaKkgGKAO7dIh+3vkzTcsSsW42B8
         hLyw==
X-Gm-Message-State: ANoB5pnCG7txFsYASFE/dsSkRZbfLLPwIY479dIDeEmToAGI2BOm0N/q
	366ljh/7XRxIbGhZD6IxGsjBtg==
X-Google-Smtp-Source: AA0mqf6p5Yvfm9RBuO07olapiME1mbnRSXDUX3FGr319MQtgH4Z6VWefEbtTH5wZlK3lshfJ9H7zGQ==
X-Received: by 2002:a05:6512:e9d:b0:4b1:8698:9f3e with SMTP id bi29-20020a0565120e9d00b004b186989f3emr15263055lfb.421.1669581661879;
        Sun, 27 Nov 2022 12:41:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Gene Chen <gene_chen@richtek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Neil Brown <neilb@suse.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/6] leds: dt-bindings: use unevaluatedProperties:false and few fixes
Date: Sun, 27 Nov 2022 21:40:52 +0100
Message-Id: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124104_623530_E0AC3846 
X-CRM114-Status: UNSURE (   9.37  )
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

Hi,

Changes since v1
================
1. New patch #3: dt-bindings: leds: lp55xx: switch to preferred 'gpios' suffix
   (Fixing DTS in separate patches, see [1] [2] which superseded [3])
2. New patch #6: dt-bindings: leds: ti,tca6507: correct Neil's name

[1] https://lore.kernel.org/linux-devicetree/20221127203240.54955-1-krzysztof.kozlowski@linaro.org/T/#md1ccb03ee81f820e0c7b8043111d56b5ed0d1e2f
[2] https://lore.kernel.org/linux-devicetree/20221127203034.54092-1-krzysztof.kozlowski@linaro.org/T/#m17f1d2f79a35fce43509edc351a84bc9dab980c1
[3] https://lore.kernel.org/linux-devicetree/20221125173602.cnipos5oo4ncxsac@mercury.elektranox.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (6):
  dt-bindings: leds: use unevaluatedProperties for common.yaml
  dt-bindings: leds: lp55xx: allow label
  dt-bindings: leds: lp55xx: switch to preferred 'gpios' suffix
  dt-bindings: leds: lp55xx: rework to match multi-led
  dt-bindings: leds: mt6360: rework to match multi-led
  dt-bindings: leds: ti,tca6507: correct Neil's name

 .../bindings/leds/issi,is31fl319x.yaml        |  1 +
 .../devicetree/bindings/leds/leds-aw2013.yaml |  1 +
 .../devicetree/bindings/leds/leds-gpio.yaml   |  2 +-
 .../devicetree/bindings/leds/leds-lp50xx.yaml |  8 ++++
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 47 ++++++++++++++++++-
 .../devicetree/bindings/leds/leds-mt6360.yaml | 43 +++++++++++++++--
 .../devicetree/bindings/leds/leds-pwm.yaml    |  2 +-
 .../bindings/leds/leds-qcom-lpg.yaml          | 12 ++++-
 .../devicetree/bindings/leds/leds-rt4505.yaml |  1 +
 .../bindings/leds/leds-sgm3140.yaml           |  1 +
 .../devicetree/bindings/leds/ti,tca6507.yaml  |  4 +-
 11 files changed, 111 insertions(+), 11 deletions(-)

-- 
2.34.1


