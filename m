Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECCFC10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1o+J70yLyVR2sOUu4UxPxrOg5DN55K4T4PHkpCAWjn4=; b=UEqpV2QXNU5FUD63pIc4urA9N6
	+H1mn5DzshR73r4H0aXl69gIukUd8o9WeaOwyQAtyKlDbc4qdnJrA3gz+fhxt/WA2AZXBIOoTxwgx
	yfRwguYeQH+EC2Yd1aemTtms03Id9ctro/9Jmi5Is65xhMi7iE/aiaHLh5l1U7flzR7/iImA3+u14
	41LTpiMQ+UeFU6iQ45mDj/cRuexIvcJQyN2dAdLfa75JTG0xFpc8LhD3VncSRaiJINNemBqrVF2GB
	FR1xBMII4yTzP3kZWAHuAUNu6L2hQlMoGGXm3yB8vhdqiF1Veci96qXG/edFCShs56haPgoruEGzT
	xomIhcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ewr-008BHG-2d; Tue, 13 Dec 2022 23:44:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EwD-008Ayg-GT
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 23:43:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id d14so20156160edj.11
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 15:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1o+J70yLyVR2sOUu4UxPxrOg5DN55K4T4PHkpCAWjn4=;
        b=wORGT+IErpNloxOBrcuEF3V0K95c28pxI6CUW43ehtacgN64O4wuoQMWVMYwflNV18
         LtfER7cU6y//IYxXH6rHv/nUkSrwpjabljAsTXMEQQVsQOIuxusklexXtRS2HhW2E+M9
         RHL1KamjZitB/2rbpYL9YoyJruQAz8cO17AnxMw5CDCxhqm54IgCKZwwiEdKUAsZMv8Q
         B5dwE1h81HAntKODSwCexeyPsZz/6LMVYPtueVRljyNMgUjPxba8eX+i3tjKYwzTMZXf
         ewC9DISbTQyOl76QBgttZpU1yky1a41JPHqcZ2xCq9pVAysDEqINJvpaN4ft0KDm0gsG
         +aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1o+J70yLyVR2sOUu4UxPxrOg5DN55K4T4PHkpCAWjn4=;
        b=d2UDZWs8A9LBGWdNfJIEL152a10KbeVfcjpWJ31anue9xN+qerMCDThL9dHRqzjEJn
         qlQ1yIq6ERR09V/jDAz99ev2s/RL4HsmQb6kXwoJpOnFa5B/ti94EWUGxqhCEfYOMJzH
         CTeiufX8bdKjjGGjPKAu4/Szq6Knd3WXXWxPRvx7C6Q3eQT/G90slhBiKNEqe9/TTFp4
         n7zihlxBFWQVR6hToIuHr4ENmWepwvLsE5HodbelYK9eGp3kckBzeBeBZy/2GBgD6YL8
         TU10+7g+1ZSnWSEGlQGS0zMaPbjY7hyCHmTWuA15JiDwy45+tNSff+9sFPTanfDNVmpt
         Ts0g==
X-Gm-Message-State: ANoB5pnTBw/Bus9hh1eFI268afaaWO8Fn4RqebHSwsHAvFKpljdOBs+9
	DXGn6I/GZ5P41oA5QapQNlBlSg3dodk30JgeAQc=
X-Google-Smtp-Source: AA0mqf6bcglIg2qJY5ALdaxVVJdoWYM0lGfOFG1QMFMMUhShdk4Z6n00yKzWtIpU77TFfb/M19JI7A==
X-Received: by 2002:a05:6402:3445:b0:46b:14d8:af9b with SMTP id l5-20020a056402344500b0046b14d8af9bmr18887312edc.38.1670975031767;
        Tue, 13 Dec 2022 15:43:51 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-093-129-109-038.93.129.pool.telefonica.de. [93.129.109.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm5407498edx.92.2022.12.13.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:43:51 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v5 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Wed, 14 Dec 2022 00:43:42 +0100
Message-Id: <20221213234346.2868828-4-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213234346.2868828-1-bero@baylibre.com>
References: <20221213234346.2868828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_154353_625457_476AE754 
X-CRM114-Status: UNSURE (   6.73  )
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

Document Mediatek mt8365-syscfg

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 1b01bd0104316..7beeb0abc4db0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -50,6 +50,7 @@ properties:
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.39.0


