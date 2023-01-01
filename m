Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B3C4167B
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=; b=4DsETLaaOYirhB/+AwmoGyjQmk
	x71UnjjcAwxbnSUk07TwRjfHtrzFuYMEztYTNSYfX72ZlMC3+lw7SQf0bBBTzPVygiHDm8tR+GOTM
	EQmF3uLvfa8LQl7A7KP4WttZR8+fZkplBGKca+bKbvAyatz/hhqlqP8uQJ1JJ9Oy/w0LWY9jewZ9r
	vQlf8MmmwSLBowqgsohmrgfsROIuBGycbEq8d4g+ioNi33UKiptnk/4Yu9bdBvWTu75X1AYT8vA/b
	JUFCOp+385/Mp0729lviWREAzT9bs6rQxOEALBhK9yXVZGu4uiT+vTUGCtyFD0EuWidcr72TFMI+h
	zSlqWcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Q9-005fub-A8; Sun, 01 Jan 2023 22:03:09 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Oz-005f6P-MS
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id x22so62947204ejs.11
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=;
        b=IHI2I0hrCdk/wPaLBzx0rRhnvxOsyfb1P4hx6+3YwKy0MsZTBke7af+oKvOCzJ3AJb
         cQwc34Z3TntsucXweypdTpoTq7GWnPWgQ9OAEMIFhEnnbKiDeP/gBLQ6agIwH9PiLGaL
         RItHMyit/PzKf3E/Pa8c+HqiMdTRyjfNJ57UsNwNoVKuGiB52ce9A6rSIzOcTnvyJEHM
         VmdB9pviGVtczIS6OUNqJrVdWZ/e5roLSOzZ+Hpz7v3OhSaZ22GHpYMeL0dEq9so4uJh
         9CwmkYfvpmP7hOk/uOcsJePEcUWFoZfhVki7RqPLwBhT8WW7G6Y2FpauX2+JlHawC3EO
         VCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=;
        b=a3SIpjlPcz7ulUuC3zuywvxvwnNKpfj1ldBsOHOl2FzxS4PdDaj32mo7QBMb7a9AOH
         vM4LgzN9vi2tcIJp35y7ikdYG1v8XddnWdj+/DMJjP22Cdr+bcshwrgfhQ0t+YUn2I3O
         6XepiuP5tN2QkzqbidUnSjnxFwhUU/I0ILLXMSwt7Zy4/R8pTR6hcC3zvfGRT0RJKyPa
         NKsIBNBVrvcgAV2IYcUcJg4zKOvZKUA8M0dKdFdbnvEXQiE2HmjMe70kDqeSDMkPHVyi
         AH5eltNLHwtMe9U0Jr4jdVXtD98+zK/fQA/+SBCgXaG9bjD8q3CpRecVhS5jcTe5Uy46
         Rr/A==
X-Gm-Message-State: AFqh2kpDMKeOrlsmyTIGnOy3XWbJdXLKpa5IG1M+IszJPnym9bYyRQwA
	kTAx2Ext43ds1iKUJowLgs+qYw==
X-Google-Smtp-Source: AMrXdXs32JBof/lpRTYnXmbeljXudDdPP7qoRYzYk7ifPYzymvZflJgDnAUlRfiHkhTC28D9o4gVZw==
X-Received: by 2002:a17:906:6896:b0:7c1:4c46:30a0 with SMTP id n22-20020a170906689600b007c14c4630a0mr35114853ejr.65.1672610515397;
        Sun, 01 Jan 2023 14:01:55 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:55 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v7 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Sun,  1 Jan 2023 23:01:45 +0100
Message-Id: <20230101220149.3035048-4-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140200_117913_EE8F41FB 
X-CRM114-Status: UNSURE (   7.60  )
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


