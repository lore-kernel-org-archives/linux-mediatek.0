Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ABEC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxlrZWPFCrFQp2sHfL4Kx3y4fi4AGKGpCjaVKusjlG8=; b=ta5JFnnjmt6bBPlXIo3lqhOJAy
	OBN9zYh38NR5vdGk5GLfZrrOpO7GtJrEs2EV8KWDA4PIAwGkP20OhJIFlxunUWpjkBySWkULHvvWn
	Z46ak8vVhFlEm+PcrdIjVJ5sLe7+lx0+mSl5on8Zl0qTnGkCz824OlD0AGDmxZNRcqnGdZYVZaKCG
	E3s4grB5zURZNCB+6nyNYJ9z3u6huPYoQABa7zsCwc54OTMKjpygWqWvrJIJJJCT9BJRamBDRNsPv
	qg+qJ2WABs4K1a7x+iqt/W1ZQaPJ7wVi+jSpzsoK5mbqcS1Pm5syDg67PPOpL66HYBmR8DHW66mMn
	bUC0PGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPSm-00DnwR-C9; Sun, 27 Nov 2022 21:45:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSY-00DY0B-SF
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id p8so14528446lfu.11
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxlrZWPFCrFQp2sHfL4Kx3y4fi4AGKGpCjaVKusjlG8=;
        b=d3jnqhwgV+iA6GcPuBtwyOCQEQeVQuXMje2Yq8vUbum5/zrwX0DR68A9MpR0kFimOo
         Qrygewdp7nUvUyCGwliIOgQ4Ys8ZY0ElyLOK7Rdhdvs9LnOCp61rabMG4vRkHT19AoXQ
         A46i6yJijhds8JhaIvGE5C61lbWI3DGbJlXAAqI/it2mH83OBqa6+IeVWuByIoNUK16v
         qpRqZCD6rst1XD9MfGfUzMl/oQbrS4nF0joWUJwDg6+1uolP/FrOx+MQwyPY4pcOghFd
         X1inSMEpy8Pn3FHOG2Sw7Yk5vB/0DU054+J7hhPQ3t3EehRQBgPOgnVjDbbAtQnnZSMX
         YU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxlrZWPFCrFQp2sHfL4Kx3y4fi4AGKGpCjaVKusjlG8=;
        b=PuCKpCMoHLtxWjgDpQ1SmgJ0DU8lY6S917K472IsEP17kbrW3L+D4NfomY7BuIv2at
         07vpXMy1uKD5yMaL9CGC2Icki+ZrDj6DR96krEC1jqxPrbxhbagvzQyqC8Z0Z0SMXe6Z
         gyqkYizgMbfFrMq0FVSF+u0k2Arr5OvEtudGLIZjIXy6lXZebUsVjffROrHyNNoqTloV
         HZQXxMRRSDN28h95/bH+00wGy8HUsgI2ugokfk5Re+tZyMe8Ss80WpNn2+kJzdpSIsZR
         tg1SbHyH9EoAqgJYdhKOYnmKn7F2yeVLkfI0XEroPKScmk0fzk+fdydpERes2Nkk6wIk
         CPgQ==
X-Gm-Message-State: ANoB5pkjWfwOxh7I2WeM0hXD3tYSuCFCDFvTzgJ3Y7Xpjcd/AenJlOgZ
	u9KBuuGim0kQbbkDKFToa1h6og==
X-Google-Smtp-Source: AA0mqf4MIUAbuFwcGvYcH41oYYkbfEqD9y1cRNS51qz0kBy2pxfU9tMJMCGRZHdofLv65jWUGuSiZw==
X-Received: by 2002:a05:6512:692:b0:4a2:58f0:c0df with SMTP id t18-20020a056512069200b004a258f0c0dfmr14940029lfe.268.1669581664453;
        Sun, 27 Nov 2022 12:41:04 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:04 -0800 (PST)
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
Subject: [PATCH v2 2/6] dt-bindings: leds: lp55xx: allow label
Date: Sun, 27 Nov 2022 21:40:54 +0100
Message-Id: <20221127204058.57111-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124106_937523_FBC2DC52 
X-CRM114-Status: UNSURE (   9.79  )
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

The Linux driver and at least one upstream board use 'label' property:

  qcom/msm8996-xiaomi-gemini.dtb: lp5562@30: 'label' does not match any of the regexes: '^led@[0-8]$', '^multi-led@[0-8]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index 7ec676e53851..dfaa957eee74 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -48,6 +48,8 @@ properties:
     description: |
       GPIO attached to the chip's enable pin
 
+  label: true
+
   pwr-sel:
     $ref: /schemas/types.yaml#/definitions/uint8
     description: |
-- 
2.34.1


