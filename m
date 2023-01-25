Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C25C61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNAP8XOhS4LLuKpYRGvk3aTC1kcIWQVhxMWfMNAmKbo=; b=PlueJJt+nQ4C+gdTD1RqIRuUtN
	xLDlwueripPDQD5FJSPH7YVNwzaVctldPBWTrBreBUib6lN2MZH+b61nirr90Ar7mTGeySsufa0hq
	zKgR8XqWnIuxc3C/SN5Krbct6PdBiNKSTVTEK/YbejTE2QVTo05NtapqX8LQc+oOUrXiPmmA3aggo
	3X+xssUVqk136ajaSIm04XVNcCmKc/or0ekZuCUZsSeBJJfdrXNN/ikq8PpcCMCuq1XWqYrxUCuxU
	SNOQtmqODVdaE0vJFb6q+KtJtKYJrqtq1BYmTWj2uVeRul3c4p1zuFP5wct8ZuGxWmuIaUYn0nlTA
	j1dmQnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgtM-007aGS-9v; Wed, 25 Jan 2023 14:36:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrm-007ZQ7-SB
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id mg12so48164957ejc.5
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNAP8XOhS4LLuKpYRGvk3aTC1kcIWQVhxMWfMNAmKbo=;
        b=XI56FY3zdSbodru6XyaSckXAzeKh3QRabQyWKssCiIY3piUefej4aa7TzAGc8aY+O4
         LE5Z4IAgg/dp9SiPmzC/4GrMGUypz1U4tWpJ5eCWEU26PU4+Xq7ziQeD5wyNZbmPWdLm
         VNit3CW95B+L+QAND7QBOSGAdft+DXGmXAtrGEJpsQhonRBE4Fl4VUoqJBCJrr9PyMzJ
         35csBY9r6sdvRn8rHURXDTnLnXGKraiacTlw8dlFuFVzl7i/kH1BBzprfAM+IgGz5A9a
         oUtNs54x7h+EwqNhInwn6Ms2xNmmJKfqFQcmzLZ8qlWBizfZ9Y+ah94Kj9lVsDVAxQGM
         DQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNAP8XOhS4LLuKpYRGvk3aTC1kcIWQVhxMWfMNAmKbo=;
        b=Nf4VlPX23Ru96DeEhZ74/bpPoq+7bb7p2plHXUt8npkPx2Omyj9Zsr7quCRg4Bew5K
         JxIKMW3Hl9YeoP/142tHg3e71nKunHK+vIv/5Vq5YDxEzBmE8qfgHaGwqoLpay3K+dwx
         NSlUkVWw5U4V0B4mq9UhB6sBuDW0zhWeQ7YJLfYTjWSFLjLqGvdiNtGWB6QZb5eG/xV4
         7ZUHTtb8rZxCepFC0FpL0vqz807c6gy3wdKBRzDBJOB6alN62jX4iqt0LMDbg8s9//NL
         jtvU6zEPQi9v4GJryT050tw5Sr5lBHivaPR3nW/StlyoPAtqXnxnh7V5oQs/Xh6bqkyA
         YPuA==
X-Gm-Message-State: AFqh2kpvt5bLk23US9OAkagVhgA07p6QbwTezgkQTV64yTrKBAGkO2+J
	b/Yi96TwlAZFYbbaR4cszSVy7icK8l7pIDmP
X-Google-Smtp-Source: AMrXdXuyV6+EysVX1+hGOVONX/1mtR5/7VVd7TNdEwU5XREjyeamJj5NUnKYcjnWGa1pQbaUxGIN1Q==
X-Received: by 2002:a17:907:214c:b0:838:1b80:9a7a with SMTP id rk12-20020a170907214c00b008381b809a7amr33613635ejb.12.1674657308378;
        Wed, 25 Jan 2023 06:35:08 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 2/9] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Wed, 25 Jan 2023 15:34:56 +0100
Message-Id: <20230125143503.1015424-3-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063510_970165_D129DFE2 
X-CRM114-Status: UNSURE (   9.15  )
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

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.39.1


