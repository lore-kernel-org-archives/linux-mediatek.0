Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A349FC77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jv6uesjmZKFlcTpR6W4nlDS/ErUwCnhH53sWS64Er7Y=; b=a8dVGw/RgAUB9cAFD8eEN1Cntf
	ck6WaH18RI8MtbZCL+wO9ONAZx8uetjDZhzz8ie7YiEETABpYNa0DmV/IuF98zhAn9O2lrw0iKDV/
	4Lad7WQpxqNKdSHwVDbl4jD9sz+7p57LnkbJ3hGpZJTl6zx2sJWpxF81ovhwj3ni8yQ7fi+S95J8d
	P9fnC4zrL11gfNEcu39jvgMamJOt9nsLgRVvuR5Si8I5s1LZzdVMZ0S+FY0YAwP2teF4Yc8C48dKK
	LxpLA0omnllKcTAJt4abs0pwb4sveeST3hxgoLZA8DjwdD9TIynytTKhxNDuRdlw+nHdtK4wz5zjr
	aQAgZ2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgK-00ART5-09;
	Fri, 07 Apr 2023 14:03:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgw-00AENM-0c
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id r29so42224178wra.13
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872381; x=1683464381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv6uesjmZKFlcTpR6W4nlDS/ErUwCnhH53sWS64Er7Y=;
        b=A4jWSwGhGdz3yvWFgpqe9NlDODCzwwx6DOkR9O2UY4Yrxy8/9kLzreZ3L6bbXD+Ae/
         sFCTqVlYSMyMMTmgSI3sJRi3qrDakv9CUBLVEaTMAyr+ojkyy2JpxsKZkaS1K9NpK3mN
         pI477JBg4osigvpTiX7ys+Jp/b/r8TzrdP2Q5AnOS1ZO3xU4KZF3j0zHC55bMY1GA4rv
         DH0SwlR10edgD28Eh8mpLyjKVPLRLya/1w8QexMl34AgIa9FlzqWv39f8mjqgQuyvMVm
         PNEld+aLyOlYKthMU+MhbPRJCzpaL6wDkqa1kJiWGSrp5xM0XmiL7gB3VAE92bNKKQnC
         J3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872381; x=1683464381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv6uesjmZKFlcTpR6W4nlDS/ErUwCnhH53sWS64Er7Y=;
        b=MxmBHqPhGCQS0X7kXckeGLVmZCye9U+T0qJiA8k9GXZgYSeXD4ZuBCu6PKjJNWp/fq
         X9PrBmzQ78SupUlqZdQqu+vMcS8y/g6YK7Dp8Io3juD5rVlMyLIdzVudm+2KxdiKr429
         1b9rOU0CrxD22B6lvbW0bo8obd01rU/kxTSgxkOqqkcaCTyyn57FGLbLJ1AIgzVYSBZE
         iZgI0cA4X72rtWwe9/CL/oyMF9dwqg3tv1ebyhbzUIbGApeMLrTl0i5F2wB9UoXbncM1
         S6rN3fnk7tr3f+m3xcsIdFW+GJEf5vlUv17l41KTBI6hQHEOUdOdYHaniHDjBj8E1/Fb
         ViVQ==
X-Gm-Message-State: AAQBX9ea5l+Dx7jZK59NcZv26SBwuVabhDde6f21yJ890MY2PhyyHsgG
	6X86pcDcXBzruCqnWPTKVxtjF7UnMzlizr0/xck=
X-Google-Smtp-Source: AKy350ZaLC8TwIDCmSoJ6SvrwuhOk/cXz0vgHxCRAEK5iSsV3euYHNdphxuidvBWfdm0bgUek9GLgQ==
X-Received: by 2002:a5d:5383:0:b0:2d8:82f9:9dbd with SMTP id d3-20020a5d5383000000b002d882f99dbdmr1333922wrv.11.1680872381567;
        Fri, 07 Apr 2023 05:59:41 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:20 +0200
Subject: [PATCH v5 01/12] arm64: defconfig: enable MT6357 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=583; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sS9Bqjy2f/wrV6dRVMTpSR6wSBcC15zFUiRoUmJvDA4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO60PeWsaAgjDgdQZqw9UM2aDFQwIk354Xe6wol
 CMWufB2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURUwiD/
 432JUu5PRVuk/Ky8foy11MAu6x4+2Jz5kyX0fIx8QccHaDynhPpyfkh90nbmjpkJlYhaBw4A6WREt6
 RklRROJLK2wqYHMw4GAKXkar26H5sz8Re9qJghzBJ9VKr7r1OHolgHE6Ky0SGsIE2H+3oWjOxeTjLE
 kUiwv5ALamsdrFm8EJKTRUAiG4mOLp44lKXI/AimkQ8OWrjfhM0KuKBPoqMxdNkiBk60a5/k1UA6v7
 iJr2+TZw+/tVL4ZLVgq9j81hBHWdbRN7isFoQXmWfnNZ0rcrV4vxgEARZ0HHFxisWo9UemYUveMu14
 gpc96Vk9GKqmIUsIEf74yrKV4Jnc7Cxwl0QPtQUUblsfE8noSobQOYW+JslYOslrDrMyjI6FtXM6nO
 Q6Zm1CIqxrOTivgnNWx3jmXr59yEZ0Wd39mOooAwvO8PvOq/dpxz360q/I+/v4aGM4s+gziUXVcTt9
 OQt+yrdSYxB4UyA1Jzit4/q/ZlCFo6Q9pN/T6N82OY/lhU6OvyugB/pTWVVyHE0iXV8i5FGECEC7Rr
 eSwZ9GNJKzHZn2oCJSUOBx7043b84zmNUOzD38EQRyi5je6vGWxuegxhRtuzWyjF0zdDE49adCH8O9
 +N6XoUXjCS3k8Ze1qkblfSHW1wYotVpgo1CT8HnQ7IXp38UyQkgcKs95WxJg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055946_231226_0EF34FF4 
X-CRM114-Status: UNSURE (   8.73  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7790ee42c68a..e4cb65889ae6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -685,6 +685,7 @@ CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_MP8859=y
 CONFIG_REGULATOR_MT6315=m
+CONFIG_REGULATOR_MT6357=y
 CONFIG_REGULATOR_MT6358=y
 CONFIG_REGULATOR_MT6359=y
 CONFIG_REGULATOR_MT6360=y

-- 
2.25.1


