Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A82DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3nZeW09fXhVKKN3KyKLvbBj2rJc2M/wLUemiWl6Iqs=; b=r+LXqc44/4KzK+reh/I/51Epha
	Uds0Yhhm2U6G802pTF1/bOtwCS2JylpCs2NdtjUl/Xoa/bBb05pvGgyeczULH+ZCdYSXJr3AjMMSd
	on90Rx42X5CJDYDucNqRTqNNTGStzYfB1M7noOte9MUQlNRzG56CUQOHxvjroXsgOZvw8+cfi8Fh6
	gYixveNB9GteiJHw3QXzX6zaHRLR7XpN1sJvoAyw80ciS3EsHB6HaCxTjuDaRhtMuOLKyfQod4O9G
	Ra1iMmizSSERVjpqn5+vBtqNFXRrE+lx8pp4O3TKd2FCtXvxD9wPP+EdAQ9f0l+vJYAXIWKx+IzGd
	SzGRRxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JoK-005FJF-Be; Thu, 08 Dec 2022 16:31:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrG-003Ud5-HQ
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id bx10so2067493wrb.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3nZeW09fXhVKKN3KyKLvbBj2rJc2M/wLUemiWl6Iqs=;
        b=YyB4q4SP2Ry2z6DrrRHmmwjWcPgRFwce6rxxmTxyykraQzc/9RkRP51FXEwHqZO7m/
         20wYbxkj8FWEHX88116T3WnWkCOFXqerpwf5iZ/n3l4lqcXnGpqP0AswXb6io8a3bJDE
         0tYCR3oJ9z+1xzl7MFTvoXVgohGjqbKUq/Ubv4wvkgzmemfm1HWm1ElB7eujYVenf5eq
         SERSELje+miYCcp9/+8hwqMAcaGpx6ry8DXjpTMXfLqhCBMtoWjoSnItTH/Uf2rmethG
         iofiTxEVvRhzFkl0Kat1YIuNJwBEb1OCyu9ZInTMC1nJ/z8o0LxSnyyjw3R7nGYPc9uj
         Q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3nZeW09fXhVKKN3KyKLvbBj2rJc2M/wLUemiWl6Iqs=;
        b=VT0v/GmYufsD7IfHNIQGrrFkQIAMA2Vk3Y3a72zy3lqwohOiYXQ2f2HRqCumEGozoZ
         g7RWI0G2x0i8KRV4ubEb9h5a71S3Gw0+soPmkoV9jVi9jcu71Zh11VbjZ4et8nEo0eAG
         O+uBeDTkNg2sHuwSRV5Fs7PwuJbGYeFlajgfcGLipwigPlGQMAUtle3bMi5HM+QsgEEQ
         aqdY+eKKw0SeZ+P4/uNsh3e4TmXHgSXFzI84yfNOybivmVbU7zSoQ7yJ8W1pZZzfkcb7
         SvwNuhHAsYJ9Hw60P7IoTQP2i8JgosERabqk6dL7FodOCPy4fgi6zKDd2ne79e8tAuyF
         Ssmw==
X-Gm-Message-State: ANoB5pl/c1nNHIvI21nSAgSfVO/QqpOyKnJrXFT/5S9BHwBbl2iTOawb
	/LEOmYGrFiSGWUBYjWqr3tPVuj+7NqWHGrB0XbhtDg==
X-Google-Smtp-Source: AA0mqf7iR2EvjsGHr5MUa13qi18194p51dzW5Cj4dAGfA4boSpbwmRh+IGQ2kMfCSK6jzlU1UqxyFQ==
X-Received: by 2002:a5d:58ea:0:b0:241:f85e:75ca with SMTP id f10-20020a5d58ea000000b00241f85e75camr1571723wrd.9.1670513445136;
        Thu, 08 Dec 2022 07:30:45 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:44 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v4 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Thu,  8 Dec 2022 16:30:36 +0100
Message-Id: <20221208153041.3965378-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153041.3965378-1-bero@baylibre.com>
References: <20221208153041.3965378-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073046_600283_CECB487B 
X-CRM114-Status: UNSURE (   7.18  )
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
2.38.1


