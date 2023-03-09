Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D85C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LcEhx6gwR6RWgOvUTF3rgHelWTStZx88DS9IMOMzcYU=; b=U0vp9AvJWT+LXa3kYO5cstZU9Z
	6RU93m/A4T91TLi93HK9mjK9OdSdOEhwp+XPuUBp6WHWNLNKxPbPdA3SpqCC7Rk4/DTUn1Q81PQ+2
	opS/lGSD0Zs6nNep3X7QZcKB4/+a2Jh7H1PR+Kuhck2urVZwrv0wWB9OqO8ezY8n8MYV33LD9RTcd
	fviemUflPY6AD4VGW+mrOxil35GXcqcg7M81f9t9PAGrsIXkzqxH4TVJEgo++6XkQhuS2FzdzEvsv
	Z+3/2FHuRYqpQ7Wbq5YoHo+8fX6zeZ/mu4B0UerFP5Zu+Acgp1bodjxuYJq0iOyWsNPvqw1bSI8ED
	Amup/Vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHRP-00AbUj-Dn; Thu, 09 Mar 2023 14:40:23 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHMQ-00AZIs-7K
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:35:18 +0000
Received: by mail-ed1-x534.google.com with SMTP id g3so7888746eda.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678372507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcEhx6gwR6RWgOvUTF3rgHelWTStZx88DS9IMOMzcYU=;
        b=FIJWNNaofZWm8AxmxcUFTGhqI9nJpkQC4bcmzdHza+fFFH95WrysDBUjPdBXqCHsrg
         R9yc/R7d2RsgDVpk4ddqOvVWwvyU8BO2PDocQ5/anqLEM1PkNz9anPio13HqtNSLW6yP
         QfF/OvhCbWx8Eh/3Via82aOWBwZDP02NyTE0FSNnrtgG9UzwwDa9ybYH/XAE43m4TCcf
         OawvE/0LGFHtu95cS26raTOVlABECe9uZyBZSsxB1h84Dc9vpym/sPJUxHneChRAr/bb
         /94MvFGKBgi/2ceDLnLtmcdyQx1Zaeh3mXQRV6JIsUTovvLYI1TkbtCQ834VKXUfKsF4
         Ufmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcEhx6gwR6RWgOvUTF3rgHelWTStZx88DS9IMOMzcYU=;
        b=zsdSF8rIjVkVVlXf+BsvLfwicCmsHNzXZQnwK4BzfQZqqCJSWroy8y0DZVCpgHZkLu
         8DrT7sES5peUPjDY27nu9udeVZwryh6f6P6Fmt59wvU4QDAzaU4OI/iwzX5eW4qoKxeL
         L//rET4i8Q23l81i5rrePtPIapyLhqq7Bn03f7pRcCVTNfk9I3BU6a3UpD+ii+77CeaG
         AhFQV7RTQPc5+Z/2/C1iPHF5bWkJ1bDzj7IstC9Nw68Z9S9L0NMzfxDFxxYfbKurRLGm
         6a2YR6XOXaB+45GowdcI2Tq2FBwWdV1hby8UKy3FVGUYwEGBH2hwxpXZBJ269oGF+y8J
         xJQw==
X-Gm-Message-State: AO0yUKXgqZaWniyg27H8c9F0CBQtWq1pfeo4sqKLwm4CyYFiay9H6fRN
	VF+Ng8icdT7ndGrouoyiXrFG9+t3F8Mcg4sRN8E=
X-Google-Smtp-Source: AK7set+eI67TsJNA/66GefmT4qzKOSQRbouWIWJn6ZDtGfr+R3ZEuDDFMKPnSJG7bOq8diBflcU+rg==
X-Received: by 2002:a17:906:1604:b0:8af:7b80:82ba with SMTP id m4-20020a170906160400b008af7b8082bamr20836675ejd.20.1678372507320;
        Thu, 09 Mar 2023 06:35:07 -0800 (PST)
Received: from ryzen9.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id w4-20020a170906184400b008cb7473e488sm9046239eje.12.2023.03.09.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:35:06 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de
Subject: [PATCH v10 0/3] Add minimal MT8365 and MT8365-EVK support
Date: Thu,  9 Mar 2023 15:34:56 +0100
Message-Id: <20230309143459.401783-1-bero@baylibre.com>
X-Mailer: git-send-email 2.40.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_063514_341220_8DE9FAB5 
X-CRM114-Status: GOOD (  11.91  )
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

v10:
  - Fix systimer properties (Thanks Amjad)
  - Drop components of the patchset that have already been merged

v9:
  - Fix a regression in v8 that broke the USB port
  - Remove superfluous include in mt8365.dtsi
  - Fix some naming issues pointed out by dtbs_check

v8:
  - Add binding descriptions for mediatek,mt8365-systimer and
    mediatek,mt8365-uart
  - Specify ranges with parameters for u3phy

Tested-by: Kevin Hilman <khilman@baylibre.com>

v7:
  - Update GIC information in mt8365.dtsi (thanks to Marc Zyngier for
    pointing out the problem)
  - Adjust the timer to match the updated GIC information

v6:
  - Add systimer in mt8365.dtsi
  - Add I/D caches and L2 cache details in mt8365.dtsi
  - Move bl31_secmon_reserved from mt8365.dtsi to mt8365-evk.dts
  - Fix inconsistent indentation in mt8365-pinctrl example
  - Further mt8365.dtsi cleanups
  - Submit to additional maintainers spotted by get_maintainer.pl

v5:
  - Reorder top-level entries in mediatek,mt8365-pinctrl.yaml to match
    example-schema
  - Use consistent quotes

v4:
  - Remove pins-are-numbered references that have been holding things up
    now that the patches removing it from dt-bindings have landed in linux-next

v3:
  - Remove a number of components that are not yet supported (they will
    come back alongside the corresponding drivers)
  - Address issues found by dt_binding_check (mostly fixing pinctrl
    bindings)
  - Address issues pointed out in comments
  - Reorder patches

v2:
  - Add missing dt-bindings documentation
  - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski


Bernhard Rosenkränzer (2):
  dt-bindings: irq: mtk, sysirq: add support for mt8365
  dt-bindings: serial: mediatek,uart: add MT8365

Fabien Parent (1):
  arm64: dts: mediatek: Initial mt8365-evk support

 .../interrupt-controller/mediatek,sysirq.txt  |   1 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 168 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 377 ++++++++++++++++++
 5 files changed, 548 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.40.0.rc2


