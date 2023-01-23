Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A22C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re/iBS/krfavbjAybh8kxWH3jwUIJgUXVLFDpOuxVaQ=; b=zmfJdE463yXR70cV5S8EAwCvWf
	2Nv2RYjBup4YYR/Q/p+aKbIYCjVFs9yP7ui01qxUdUEH9Stgum2OmNEoxfUpmMo1eKEA8bXu9bGYc
	e2yRbd81mx9DMSdzyYRFqn8a5gh1if6y1IEjoQXaPpJlMor5D0903hu71InqRZ3AGGh40dK6DmvgV
	4wxjWomEzqXiirIGiyBlZoZZebT8RSW5g3Yv8uauoNkn9rO/7zXYS7Z/izQGIb0rxUonQZPqa1Abf
	G9novfJaz7eaX/71IhbzozjfQ4I+NBJBVqV9857B01boa7MO7QZgxXFiX88oNRPbynmdqcb94LDEg
	Yryxr4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzws-000ekR-9D; Mon, 23 Jan 2023 16:45:34 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqI-000bxg-E7
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id bk15so31992096ejb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=re/iBS/krfavbjAybh8kxWH3jwUIJgUXVLFDpOuxVaQ=;
        b=tte5UV9bJSfSYqJ7ySed85BL8AL0jf3Szrq2yD2EprWKr4hrug4SnSoRf2ZXdGkcYH
         7EVPyKY7z8kv4jSmr/YWXpVpEV5kqmAc+XLUWyQrGo40UWI2Gc2CCySrzuyifdituidQ
         UcEisgl01lpt4XPsYmAk/Bt4gEr5LbDgn7++ah0ohiSa7JzWaqpcA6rtdoPNhUj91NDS
         q9MjGODS04+gDtCQh0dNKg6JDwLHh4qqXhzyzbtLTUGDlNPx8ZZ+JZeaQLE86JoJAQoO
         uR9e4k3HG3VGSFAq0ASYg3f62O5vqmD0hzx7WUYXpi1VCQxUjHQtTG+8TGpBeBFI54Xb
         91EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re/iBS/krfavbjAybh8kxWH3jwUIJgUXVLFDpOuxVaQ=;
        b=LcV6BTLCcediTr228ZWGIgHaGSDbEwN41Dl1iaTCPvdoFleh9WjyUPhtObUTdIaIfF
         qLvGLYeYRuZOr7wxe3Boo85/K79evs2VjuE4lfGwytYVG44BNJnuAdiSOMPVHCP+kGuD
         gf0spa6fTvMR+Jawjac9iWwBtbXAQA6ZdjGhTzf+0TjeB9sYRWDpdHwwNyBYzosN2AYu
         qkupeqrZCxbXySfl42uKK0OFxAP6zuvGW8v8Qtk1BZKrosuEvLyZSfSDro7bNQToq7tV
         /zgqG4iNzIIvT3VwMqrXaHjf6ozEw+e2ULL6HhghJuXAdqTrLAnTK9T0xAZLY33LAnPz
         Lgww==
X-Gm-Message-State: AFqh2krgWPrvw0ANjR/0pHXxqKIShpUa7nCfwvapCS5IsPTMExdrDKdr
	XZYpege1djSQZ7ijh9Zf4PAi7SnyWfF5IbbI
X-Google-Smtp-Source: AMrXdXvh5fhFr1zDZgmt1Fk7cgrD4iLURkeGSSmFiCTQtEWqT12tYjTRyMlLpFC6Yl1qMfW7FzGM7A==
X-Received: by 2002:a17:906:368f:b0:877:593a:58d0 with SMTP id a15-20020a170906368f00b00877593a58d0mr21327808ejc.29.1674491924794;
        Mon, 23 Jan 2023 08:38:44 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:43 -0800 (PST)
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
Subject: [PATCH v8 7/9] dt-bindings: timer: mediatek,mtk-timer: add MT8365 SoC bindings
Date: Mon, 23 Jan 2023 17:38:31 +0100
Message-Id: <20230123163833.1007181-8-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083846_543460_528533CD 
X-CRM114-Status: UNSURE (   7.82  )
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

Add binding description for mediatek,mt8365-systimer

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 8bbb6e94508b2..b3e797e8aa313 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -33,6 +33,7 @@ Required properties:
 
 	For those SoCs that use CPUX
 	* "mediatek,mt6795-systimer" for MT6795 compatible timers (CPUX)
+	* "mediatek,mt8365-systimer" for MT8365 compatible timers (CPUX)
 
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
-- 
2.39.1


