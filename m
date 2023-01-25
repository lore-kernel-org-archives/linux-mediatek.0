Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC951C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tN16lN3tQI1TVAWs7NSp7WntR2GpAGJj0GT7j6mK3Fw=; b=1Wp421KspDulaKA43hz0SIUVKL
	/LhKQPHUa2uw4QS38nfTxPvA8ULKXWJrEoafpJzXq51fcUbBQJuqGRurluVS2gxco5HX+vbgkUjut
	GwU9ccELgU1mjof7b+E+WzAtcTdt1dHPOM3ZEdGbreqWREQlfeynCcxxdNhCr56Yog/9UhlTcEkoI
	Z67k9vyjUVRxKdyydouFiwBtxsFMsCa9muChKODT57GE0wjeVEx39xqWq8ic1p10m1UJ27kw2twUg
	VJrawQQCOdlHP7iBzFr/4NRwcKYGxNJBZYaATk+yQC7LnyUMT3eac5WcTWuicJEF2I+4bjixeOy0g
	twYjY5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKguC-007akE-0N; Wed, 25 Jan 2023 14:37:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrp-007ZQc-Mk
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id az20so48235768ejc.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN16lN3tQI1TVAWs7NSp7WntR2GpAGJj0GT7j6mK3Fw=;
        b=of6sbOD2tWa0RW4bJ3Il9EJBg+LeGX17z0Hq0/avk/NtM8cKmwTyKRRl7nPyyOxGwL
         mr2Qdv5TZ8iivrClY+6MV38YSUbwAhpZqrydvD5VKDl+CtN9Y74N2yPX/CGMF8yCJ4E/
         ZS2OOvWGfZvThUoOd4g6sWvzN9yRMzSFLS6Ghi5PQWElAMgukvYaUXy0oCSqzKAePT8D
         yuHKCh+b3jdVSLeVzCFnGM0F4f6KkE+8vNF63ZDI3J3v2Kx3//mnI3uzGU2d5ASxOBFl
         CS+oQf1lZQ9j5TpXVqmaAm39eKut09JSsWx2XLA5u1g+oj63Q1JJsUSk/F8KrgLDMLhT
         SK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN16lN3tQI1TVAWs7NSp7WntR2GpAGJj0GT7j6mK3Fw=;
        b=UZIJwyrUmJWHTDHzHyZ6fOimf+kg18m3veS73y4IrX21su9p6weA/xEJ4MIKxxVI28
         eOlRoOxgcKqRdjQ5Nao5sEgxMLlugdmuMmS63wfYWCeVveX1bgktDDiMbhuN0wsPnTQ2
         KuQpUZbHDmHtTlJbKVHRTxevy5Ep8PLQWaoIKLSIFBe0hf6ykpZvBR/f+bcEF7fxjKky
         7QjcJkIJGhX1SYO4ZIV+zigin60ITc9PxAHzLLCetc6JNjFWtUheQLylObHW+2aRRLGn
         dPyFrhzgG5EBLKjrL/UTSj6977WrW1Mg2CQAMtNIxzBsmuyYqc6hQUhEyewi1huUD3cw
         C1jw==
X-Gm-Message-State: AFqh2korPVh2oJKmKmA3AQFMyNvKBG949j1ELG3aegsk/UOMpx60Hs0O
	CxelQgmNyS0izqACvKMgVO+Yqp2iSkCrQ8yB
X-Google-Smtp-Source: AMrXdXvaspNlldvkzbbWkaCPYnTmR1+Wj4YdgO5nLJERa80fBJ5oe8bu2kzgEQ/qdrEdkw2J/9fytw==
X-Received: by 2002:a17:906:40a:b0:86f:a21d:62b7 with SMTP id d10-20020a170906040a00b0086fa21d62b7mr35265266eja.9.1674657309549;
        Wed, 25 Jan 2023 06:35:09 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:09 -0800 (PST)
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
Subject: [PATCH v9 3/9] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Wed, 25 Jan 2023 15:34:57 +0100
Message-Id: <20230125143503.1015424-4-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063513_772124_0134DD39 
X-CRM114-Status: UNSURE (   7.45  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.39.1


