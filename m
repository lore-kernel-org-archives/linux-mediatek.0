Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562C5C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNAP8XOhS4LLuKpYRGvk3aTC1kcIWQVhxMWfMNAmKbo=; b=VxYCgw3u6C6yPmkgd/oTdkjVAp
	FOIQLtZjIcNrmDBqZlAO5EKYDAxwUTDPGLHknKOhz2YWVCx5cKOd6cN5o1gy5P/cz7fS2lI9jOdlm
	RdojO2xJPD2qnlelXHhOJLd4HpQbY0oXiTkIH84IsM00liYQIokPA343TcFAIMyr5/JzT3nfHmqpO
	RFSHBv7vcLcJLBurD1zTi14rG0LrAZf/jeJoh8JoTSr1bOmeoiMChvLSrPxlWCCiRfWGZHTon2kVW
	S21jCRZzzG80eVeyII5CY9vwmwAwvHbxVndIakqywmuuA+no7pmEVyxxBzfcvRsxwkbtyVbqtGLLe
	9vgHomkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzv0-000dtB-QI; Mon, 23 Jan 2023 16:43:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqE-000brP-8K
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id vw16so32017346ejc.12
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNAP8XOhS4LLuKpYRGvk3aTC1kcIWQVhxMWfMNAmKbo=;
        b=aT6upsI1JwMzSY7eVukOsifpXNDMezdPymjRLFWsmDkv2FFcM5HnniUWjCEvur2IJG
         ABaUlO+5S9l7OrD/Z4zo0E2oiAGasCk5prx1QDdZvZE8Kl1Zuh4AdErrbABXItCpN92G
         eiyvoEIx+A3EfFYaseOLk1Gf2Ezsk0ec3vua+feYS6mwpfc6cb1Mmrg8l00QtRK5HF0C
         seOa2fNPXYW2+EMIbcwSGtQ+3tSzYWtgJvWwfBD+Z1+qyt8CP3ANkExD8sJ/uWyp+mua
         1zMdB5bTndUhfSA4GRmmEP7e+X8Erfu/rMo38I9CLaWEwKgA2Gz8seRwG2aI09unAwBp
         skVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNAP8XOhS4LLuKpYRGvk3aTC1kcIWQVhxMWfMNAmKbo=;
        b=mq2LU6fp1wr3jydo2sysTcZEjq7SBE7x9Zw7tgqtxwdtEAXsJkqW5pXJwTJZ8eadcn
         +1FJwvUd1uRTdJLKsoYaUCYx43jLow4uspSIbR8MmwcoX064mOhppvKDQ8K3qcKVxFmt
         CccMV7anH1JmmktiizMBZ4bB0VhBTL2wwoqI6weXpTbe305aTi6RlGt3AxwjH3tynndq
         LH9SKJ1kBKvR/p1E71DHYtJoK0jgubS3irjNdf4Jj3v+DVrbY//kgaJ3q7r75I6lQOV6
         rXwqWVu5L8xuyPfV8vEf1t+XnA8bgPtXIocnwkjkUrpVTtePVaEgOQBEqtAu6tBqKv3i
         mXZw==
X-Gm-Message-State: AFqh2kovvzrDuF/RRveR1aO/CAvgSzH5Hwst1jfUEJL6cl7DCIaAItTK
	nNBO4gfEi9wZWF0Hmzz47jC5Wuzb6wbB9lnd
X-Google-Smtp-Source: AMrXdXtsaJFktS7KBs7eT5zNQMwVttcrDG+2mLD83vxFGQGT0aZ/o5dx5K+s8MXDl4SSXUdsgCn/xA==
X-Received: by 2002:a17:907:8b08:b0:86e:e403:4f2e with SMTP id sz8-20020a1709078b0800b0086ee4034f2emr30513666ejc.76.1674491917877;
        Mon, 23 Jan 2023 08:38:37 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:37 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	andrew@lunn.ch,
	gtk3@inbox.ru,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v8 2/9] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Mon, 23 Jan 2023 17:38:26 +0100
Message-Id: <20230123163833.1007181-3-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083842_330543_05AEA4B8 
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


