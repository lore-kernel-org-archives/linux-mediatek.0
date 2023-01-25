Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566F2C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffl5HfqVus00IOo7wgMujA9coL7RO1cV9lKXrzUWgAg=; b=sCWCC55T1Po9s/i1UIGf2/AHF+
	+pJOi/t+EXWATQ5U2lZjlg3DaIVdE7ZtDFa4JaHlYDR/lmzXCXUYHYddb/BE7RmGrN5ZG8bNqa51s
	v8mu5TMcqGPaFe3YEpii7BjeTxkq1v+ObvhVIfLUOjcPsRZENUo3Fztx2DMOZkIPat8/vfpgEBvnQ
	UTS6lN8ttfeu8OO0QB53zkAvmcRrpdukHJ9b+vhtMFpEztIdRzji9Cs2Jgk776FGGtKLs4XY5X9GN
	M2V8sKtll2Cp+15wM5mQWgKgiug241uF71j+LBGsJTXZx/fBSCqFyFZ3xzq4IbOvihNdLT4ubii7K
	6u3rtyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgvX-007bRH-36; Wed, 25 Jan 2023 14:39:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrs-007ZOy-Fe
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id rl14so44837842ejb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffl5HfqVus00IOo7wgMujA9coL7RO1cV9lKXrzUWgAg=;
        b=BmbFUdf9CwKT2kI6s8mGzqEAki+CP2qH/tUPAsy53AEXimitOvevkH9EK8c/rrSXcj
         nl3UaK7FKTinaWKUi9XAbf5jYhHmv8lm1Tj38w5jfNyW5FWtmW3ejwJrnWp6f0GgnCJ2
         fm8LdlYXdJe2FoBo+lJE+56zWDe8iMfI3Zi6LBmYVqJb31Zc1ctW9j5LUeEAeWbaeidF
         WRQcZIH0OXuew9tQeEBMFWmHRfq7PIrS0LXyU7wYt5q0s7dB3/G/OK0WQIJgfWsFTmaT
         DjMkf2+jvee8hn+4pPyHFY9zijxCUhtGtXEZrRMQYIQ5wvdbo8j9/VJ1AJB9m5VRUP1I
         Dplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffl5HfqVus00IOo7wgMujA9coL7RO1cV9lKXrzUWgAg=;
        b=5DwU+j23HesWy5HWlb/EZqKjSHC2iYHA+BSx5hsN2dMSgTPAZIJjWnaWV6HcyrHbNR
         fD0FEJhSAxneQVhBnY7ub0SbWZ37vE8v+Vrv11aRMIW4nsMzu2VW7QjI1soPvIrmibGa
         rMfU5CuAr1iwjG5A/Y4e+SGPbnMz0ThOCAgAaGzP5x/gMz7reRM4T9bec1wGLONcBXZO
         xB2VZ2rnQMPlUYxfCLKIq6aQ7vjw1g/+nQCbPPQM1BXu1wZ8ONL05SB1qFoWkFLR/Ike
         Taq98lcarnwOAeo5E9cc7n+lg2+Hguu06d63p7bSDDd0G7/sMUKOvi6/ab59A1D0jYhD
         /dhw==
X-Gm-Message-State: AFqh2kqALhXDkKCrrRi2+PqO9kNkJ9j+F4ehxgAkHdFq+2MuqGY6WwGz
	OmUM/ldDK5kRaFWQZTsUPfpgLJtyMRfLbgnB
X-Google-Smtp-Source: AMrXdXut8oeAnia2W1mIY9PYEWFiUEG0BoWso+bqNF6URRYO0QLRv0+yUeszed1pDo9wzfdP0Y0ncA==
X-Received: by 2002:a17:907:8e86:b0:84d:43c3:a897 with SMTP id tx6-20020a1709078e8600b0084d43c3a897mr50385026ejc.2.1674657315713;
        Wed, 25 Jan 2023 06:35:15 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:15 -0800 (PST)
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
Subject: [PATCH v9 8/9] dt-bindings: serial: mediatek,uart: add MT8365
Date: Wed, 25 Jan 2023 15:35:02 +0100
Message-Id: <20230125143503.1015424-9-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063516_583920_11A0DE90 
X-CRM114-Status: UNSURE (   7.64  )
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

Add binding description for mediatek,mt8365-uart

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index fe098d98af6ee..303d02ca4e1ba 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -45,6 +45,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
 
-- 
2.39.1


