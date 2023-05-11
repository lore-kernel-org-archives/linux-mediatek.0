Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E1DC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipOv2lztUzpLia8FmCYNvL1mLniDnk8nXmCSG+X0J6w=; b=SMWINA0CKZKzZ8XUnK3TmWPa15
	LuLV9gW/DjF1YvYiuqKQZca+TIV4Lqdd3Kga1ftfLUYk8m2BtGgB0aev1tl9iyOR49zyRPiKn0y5/
	Z6o+iduIE0kR+TrRm+GJ0J08kjw8r5CKlbY+RlFXMbrQuPeDryXmW3PG6NWJSWZzLtkU9ATcz2DDI
	ntl/w6lPcQ0ztl/v8vxHu3raXro3956qln5XwI1qNyY6KSvjzODjBJCKCD76bhIXRMDRhQ5s1viy0
	hVtEaN8go/zUNEFsvpN20ciKGeazqu5ab4DdoAmtTiDEk5KdEhAaGyE3yhxdNKzjIJXdYAF65JmWR
	yinm2hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxA8F-009YYd-1d;
	Thu, 11 May 2023 17:31:11 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9B5-009MhP-37
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:05 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-956ff2399b1so1671469666b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822600; x=1686414600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipOv2lztUzpLia8FmCYNvL1mLniDnk8nXmCSG+X0J6w=;
        b=xt1Jv0vMM3GWMt/w/W4P/jCAMzVqz5EqcBowbMxBB9cBqXG2B+K6xhz7SZQeSwCc5X
         UMHpbsoxmqOMD0raFtsg6fgVAzGX/mZ1oV0BaURSO9VUpe0NescAmsH7sv9Yc0tU79L0
         n/OSvxy8OZlA0Y2Bn6JGPjncWRe9XdT2AwrW3tZ36xv7RTnxtZTGFb2PxK9Bfn6yVIe/
         I/R/YCdwXovv5+J7ss7P5W4+QyFeCRUb3eQ7ZJL7s1ovSYRjJ0eIQQEjkIOjBHoCrdKL
         MY7+49yxdvGuZPXETSukKamrl5kl83R53x7+V8Gif5sAW94F3UCUzAaBCowdygV9xr+D
         TcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822600; x=1686414600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipOv2lztUzpLia8FmCYNvL1mLniDnk8nXmCSG+X0J6w=;
        b=dn79bAEVLSdGBnfahqPGrxMMe8FzzaQqJbDwA+VCQ+JTSIepRWmMIWKSLvLNBpMTtP
         FmZ/i11NGHchYYhg8ph368s4G0v5Z9vEI6u6wegf2q+kDOz6IgJBPCeYokUV8Be+9K9m
         9oiMDV43Bw0+hOml5yGREJEY2vArQ4qvvLuiHMSUw0ZLvQNiVDQfLcqyS/21PW5GESOt
         GRZX72zllJaK/yGxRXiArVFPk4fUYGmi3XNG4Tg2z1OAvDSozAIkFWoFSVi+NYnO1Qyu
         3L+H1C5Nu9Q2Ia414nlzqJJMD1LkwQeewipRvNB41DF8cF3ccxaYsZQMSDLoAzHffRkG
         RVYQ==
X-Gm-Message-State: AC+VfDymxnYmURoYQm3xjNlXJGASxoBg+/10VROSaRAnVkpbYzAImItJ
	V8vj5ENJXX2P2jp8e9Aha7LpIw==
X-Google-Smtp-Source: ACHHUZ71vCZhPm0J+A82RBrrcLRhb73jCbw1vM4RDGGiQs0XT+d7oMG4cRq7D0dAHglYWdk0gMnkNA==
X-Received: by 2002:a17:907:97c8:b0:961:b0:3dfd with SMTP id js8-20020a17090797c800b0096100b03dfdmr21636902ejc.7.1683822600785;
        Thu, 11 May 2023 09:30:00 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:22 +0200
Subject: [PATCH v7 02/11] arm64: defconfig: enable Mediatek PMIC key
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-2-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=XRrfEG0c7tdATqVetaOHCMByxAwwh3eKuEexDzWoT4w=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgEyGh8t+VYV3zOirZOn0tC3DjrKpnJLxYko1YW
 Bq6EnwGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURT0pEA
 CLX38j2rbyHDohHodWsCHwexPBGtcNM7UgcjV+YqDjeR0JggLVNNi3rwWwaAFxwEVuaoUaqabO928E
 ABCx+0HNpjYuyPy159sF2+wPt5l5BmJ5U7NjOqgMb86wpsWC2a9eT1i/zcI0J/Ht7yXLUIQBfzwRao
 NK1qnfn2cQnj9Agql/EloZzYTpmIno5IqZv60w7rMYHoaeXOrA7v/NVed5ttpDi1iFvi6wGxmTZLls
 fhDhDthJ3lNLV7+wKMW90z/wCUS0CS/iexiDJKPI5EjuIxNgYEIYY5TwfFQmau3YiVofUiXRvf3ojP
 jQWPCKY4oyvwLv9na/6uB5VG8PUxJUzWBbdHSnEjws61Mp1rXfI0qm8NiUowKdPZBRTsuDgWM7LXXG
 W7dJBmA6XdRAPiGC1/F511rPbED7UAen+YFNBRaHN14Ev95kqDrl8XI2FdIa4qXHNoOFkr1BV+R41I
 UJDbCHqLjWkA0lYjlwabmrSrJdrbd5e0OnwYnHhI//oPALeh8ZvoNPoR7NCt/nZ5HwDQzHRjhRift6
 xwS1Ly9Oc36JkeKSWJhV7BzELCmw9tFA8OkHFgu0ABCXrSItDzMS73Lb43UxAgI2i0bxEaEBHa4nCv
 /AQQhO8fb9J/c+wxpUB6nu7vVg5rJBHo5LMyFA4qGyL8OB0vPZbZq9tHbF2Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_093004_008206_0B98664D 
X-CRM114-Status: UNSURE (   9.01  )
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

Some Mediatek PMIC devices can manage Power and Home keys (buttons).
This patch enable the driver which handle the 2 keys managed by the
Mediatek PMIC.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ed3fca298314..0db8293f477d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -413,6 +413,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m

-- 
2.25.1


