Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0311C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18mlTDNeiNFp6aWfotvUw04NGasXq2KV7GNkrVMvEq8=; b=ylYlOgOLQkevHfIJ7MfYzM3c2/
	4oTxh84u4NglMftHN0c7M1ImWczBZboSlX5/Ok2nbS2sc0ofLWMXdl/Klcw++54O3JA5Tm430hiQB
	EfXI5nK+hhRTaluIlPkg4XRcn/bm2MaPo7M8ii7l2M2zBlNcPf7KNAAbZY+s3PECV8Ns7/psWVfb7
	VjUxGPUChAVwTGVHfBunm4XwP4r2iv6WWzNepTQG4XDL2k15l6gnM4juxM4aNsbWo1VFI+pAvZ2SU
	o2R/7AGWjRFiuu1QGXGV2fpLRoEhi2J7MBwVKPS6tgfSRqiXqgpXklKJ/V6wz0u+2iBFkBZzCHB0V
	XI9ajRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ewe-008BBN-4C; Tue, 13 Dec 2022 23:44:20 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5EwD-008Awh-Bz
	for linux-mediatek@lists.infradead.org; Tue, 13 Dec 2022 23:43:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id v8so20211562edi.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Dec 2022 15:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=18mlTDNeiNFp6aWfotvUw04NGasXq2KV7GNkrVMvEq8=;
        b=T9MdtWhx9DYyvvjsEzjQl6MfBrC9tm62K6mcS9HZ7BmF3ZvVjbZifSDI2vuAgf5gk/
         NbJXPdFr8No+2EhbIPw6rPFe4FpbAytdJYCm6oTqAz0jtF0qmdousDKNpRjV34K3VwpN
         tqh87lFvh7HsTFOnfY7PxJXDwDyMEwJiewiBVCEpNhdJ4k4cQLYumGWQKmZA1P2itFfm
         rvHsnQg5HfCz5Fkq1AP2tYfz/1KeAnMgzYbqhJSkz7aRPrKRd3hl+htZfV0twEsCnm5M
         sDF9Np5pD4aBoiReX/VupgFJ02+bs5SeUGiKW46cR2h5RTWbfDgG7+wffQBY8hRVYnAW
         A17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18mlTDNeiNFp6aWfotvUw04NGasXq2KV7GNkrVMvEq8=;
        b=KNM/SkMqPBXHIdVo+eGuRa6Zlg5g5lh9dWIsRBZpxfcLr+4gKyAPm/nj2Rm5FhZdFl
         WN46tVaGEHUQWmFDkpKNHvW+Pdc0UclBQSrwhq0kf0u5nQIwS2vsGh4eYtbh8tz+YMkb
         jkc+SdNJ+eIafAlSc7YKEZJsLcmsTF1fVb8IC7CDI8oXTkAm64IN5cCXIKL+LvCK62yY
         +7U1KfqD9V4pCd3lQO+zI8qqT8SIf6PVupIR6jjOt+lVf9edCTyAl/saPn0wvB6WOZvN
         ykfjSB9JLb6nDSBh5i3B4PBsccwjn4k71H0g2xHfemEFRSPnfsTWywCpxWAtsMLV+1hc
         Mjzw==
X-Gm-Message-State: ANoB5plEcBojO8zHtrpwmgCB5j4I31Yw5ymFUz8Qc0zaVZf/Zbni8dwR
	rmwdxhFvxwM7FhrfX1bV32aHW+TZxfR6yzEdEHo=
X-Google-Smtp-Source: AA0mqf4/fdjI2Xl5pRIkZamgtW8MHGY4kmaFW+1fTlA7+HIsSasi3rauh4dTiFFNRQjdNZw9JvP9gQ==
X-Received: by 2002:a05:6402:205c:b0:46d:c48c:50eb with SMTP id bc28-20020a056402205c00b0046dc48c50ebmr24569458edb.13.1670975028638;
        Tue, 13 Dec 2022 15:43:48 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-093-129-109-038.93.129.pool.telefonica.de. [93.129.109.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm5407498edx.92.2022.12.13.15.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:43:48 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v5 0/7] Add minimal MT8365 and MT8365-EVK support
Date: Wed, 14 Dec 2022 00:43:39 +0100
Message-Id: <20221213234346.2868828-1-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_154353_426991_5D216789 
X-CRM114-Status: GOOD (  10.17  )
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

This adds minimal support for the MediaTek 8365 SOC and the EVK reference
board, allowing the board to boot to initramfs with serial port I/O.

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

Bernhard Rosenkränzer (4):
  dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
  dt-bindings: irq: mtk, sysirq: add support for mt8365
  dt-bindings: mfd: syscon: Add mt8365-syscfg
  dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC

Fabien Parent (3):
  dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
  arm64: dts: mediatek: Initial mt8365-evk support

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../interrupt-controller/mediatek,sysirq.txt  |   1 +
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 ++++++++++
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 .../bindings/usb/mediatek,mtu3.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 163 +++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 343 ++++++++++++++++++
 9 files changed, 712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.39.0


