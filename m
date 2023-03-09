Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14279C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcvQAWEayhngzcYvtkzp+4NmbmEVpDMUSMsfJ+/Nd7c=; b=D/tdZUVh+k9yEeioEFz5pmUZc0
	NIeIA85UsngMbN7DqDUQd/3d7/HOcHuA1Ih6vspGsl3BLPDpk+26qbMAj1dqBcS3sqTPguNry6mAi
	OSyIMXN93U8mcDhoGywRMc4Czm0SIQQabWNI74co+y9aQcfvoUd79JMUY16jxOs9xr/C/6IdxvXr+
	WjM6sx4ja8tL4kKMCh3R5gtdMPiamC4wUyqDZ8v2HhAS2gkiawBlAtTbY7L2ZWyWvpFc2OBTE0KIW
	gly411bkUb55SJSvTwHlkRWktxZjHbXFTPTq8qikxI+mUvOJRDKYNVy3cgOSbzfJsNfQXuMyaX7P4
	OphmX4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHIy-00AXto-KU; Thu, 09 Mar 2023 14:31:40 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAn-00ATqf-Nd
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:15 +0000
Received: by mail-wm1-f47.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so3463959wms.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcvQAWEayhngzcYvtkzp+4NmbmEVpDMUSMsfJ+/Nd7c=;
        b=inzIoiESMhVJPKDWmSnc9rq2d5ZEHWXybJCCmws/aUqZ9N63Gok7tgyN44uwDRAZ3Q
         UM4gzSxTfDcSBaxMS84sw5MD+7rZnKrDnp2i04kTZvORGGNimCHpvo4G6GY20OQOhkIN
         IDFZTcueS7wSuNuCwG+hk5AlFsHPvBA/cPG/OUFPLRcQHyrFeMgOUf7co+dooowrPCu4
         V1Wfb9jkKcAUFRKsbuIeof9fKBPA/WABcUpfsDVXw6BDmgtKrrYYQTEQ6QxUqL4U/PK5
         AH2CkaJZPkbFEAsGXHTQdaxUfkQWgBd0TXAJ55fhXB0vP9OEQcyHGEkj1K2PUntekLDR
         BMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcvQAWEayhngzcYvtkzp+4NmbmEVpDMUSMsfJ+/Nd7c=;
        b=lNth1Zh0HiCq5uj3ruGsxvblTc/LuYqY7iYOJGrYULewrGUab1fVHM3coEpkOBB4/3
         mfmoj2e+4YyUNWybq5T9Rvul26hKOXpqv4BEFaHuVg/P43fL4Kni0EXdmXdLpOfkdxb4
         MXYn8gCMphDyXI4vATP2bkodeSK5ZXiBcF8u031P74prlbM20+Ka8zEvyYIeaTmTRvTr
         0BbCkMFxwk9q+SG0haseiUmeB5b2LsDusD9J969rpHZBCoBbalLupOiT6SYEkpCAAlvi
         MqnsR4fj0ngJiQCRHe+R8Lb0VJTpGBZvmS30z+7Mm8hn72JaZDrHSpjfYX/pXgquSJi9
         h+ug==
X-Gm-Message-State: AO0yUKWE2qCl99FFLQ+jvCalNBY0frcYmy0426E4QakG7QvPurn6nIsc
	He80MaP7GfauihCwXxn4Mf/uVA==
X-Google-Smtp-Source: AK7set8M1EUCCZusFz4TtaKBc+jWDVOuRwllEILSYeHIvDvv8PEH9RZ87dmG5kiHvo7WJQGlJ75mhQ==
X-Received: by 2002:a05:600c:35cf:b0:3d0:6a57:66a5 with SMTP id r15-20020a05600c35cf00b003d06a5766a5mr19297104wmq.0.1678371790305;
        Thu, 09 Mar 2023 06:23:10 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:09 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:01 +0100
Subject: [PATCH 12/21] dt-bindings: pwm: add power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-12-45cbc68e188b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kJNESBJYj6hSPaR8ChRMowMRY/WR5pgSKuWA0748F5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+nVEDPPb6Gdh+AgHCjdauH29RygOJmjr7a8NR
 ctAw6CiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURa2PD/
 9YzFDJCjDZcgP7CODOpyVYt/cRNXs9p9yTLCepRSRWMz1elUPgasCjdl78j9LEhjdZnZJ7+bWsn4sd
 3pWRltutH9daZALNPyfqq2TuQqg2DxDkAhg25yaJg4DwtBIRfDCPbUYefAfg7dHVq/nQTgp+2Ugwf7
 y7obSg5dgNYB+cP8n+8YVEIcW/X9+AzyMDSlM9VLOfhxGwuY1Qhw0Lb35fyj1BsQuIuJZMTVFXo+n4
 z9G9Irii/MF2/kbweRjOX4bhoREmwPMBTa88ARJjWfafCOB0nN0g30wrvcGeaEoKHF58zv8slZkx8n
 Gyl5636sKO7qpvWuBsalHVEw9zOD3mrWD/B1Z+FlQ5VCpspfnMUP1jW22OUwTjDoam/z7yM3iBPrDN
 7eghxhBtmd7N4z8jtmXJD1i+1Z4nwaLH6huBDUM7+2OlQzh7FvXQX3XKB5e640YK0GNoLlkBsvkcXD
 AX3xJvntzyAA4LpSDjGV5jQqE4NTbZQLAXOYQsACtSmX+Jbdp6OJPt2JPGj08J9OelBjwreAL88OV+
 hyU5UJ7QxvojlmM/YmXvErdnrwpLlM3r7nCNFKwbRtF5LNgyJgu+QORw0+SJguftIAO1L150JGdBd7
 0nLCkQfC7AGFO4tY/0f/dTUpmB8+P5wIZZpU9SrOuiqIk1Ld5leouoE5JK5w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062313_784401_AB7B5BDA 
X-CRM114-Status: GOOD (  10.35  )
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

According to the Mediatek datasheet, the display PWM block has a power
domain.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 0088bc8e7c54..8a0005a8bf40 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -51,6 +51,12 @@ properties:
       - const: main
       - const: mm
 
+  power-domains:
+    maxItems: 1
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
 required:
   - compatible
   - reg
@@ -65,6 +71,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     pwm0: pwm@1401e000 {
         compatible = "mediatek,mt8173-disp-pwm";
@@ -73,4 +80,5 @@ examples:
         clocks = <&mmsys CLK_MM_DISP_PWM026M>,
                  <&mmsys CLK_MM_DISP_PWM0MM>;
         clock-names = "main", "mm";
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
     };

-- 
b4 0.10.1

