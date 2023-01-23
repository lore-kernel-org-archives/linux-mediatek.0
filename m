Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79A2C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ImwX9kdkxyCrfSxchCRVxcHp/q4vXtkqJGNHQ8DEkjc=; b=p48/2lzhn8uCfbelKWtB99zvIV
	5IfXfvF0WM0rc3u58A06P9iJRP4htcpkDhtkzIpFaCgn/qYttlKBxpKVzMhybgLjt7yxT1Dtf+nF7
	1FOPF99ka1EAY+8rA8m/HYmsAa88y0qE6bGPD/0Whl01qG+3ZvMdOM6vBEJSlFKBLDticu6041JfA
	H2d5bdXhWj8JsKTzo0/lMzGN6g9CQIsvrm0o5QIjYKiK5Tkb4U/gExBZYE/pUCEUi7P0oUNUKhtZT
	GcZtgKvxKQBze2bIlmwRKni/vA05Rwxyh7nflG2d2phQ6GpRXuOgRuLI4YHmXa9eSQUiwqGY7BFzR
	yqIzEmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzr0-000cIh-U8; Mon, 23 Jan 2023 16:39:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqB-000bqH-2I
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id u19so32032434ejm.8
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImwX9kdkxyCrfSxchCRVxcHp/q4vXtkqJGNHQ8DEkjc=;
        b=4far6+BsQeuVq4zWunDyumaobqqRyJHEgIeK3YLhZuroLjse6yoHs8JvXbmF/KqStg
         rxnQhqZG9GFcdehTbyghgkiwxJ93Pb9M3tDf2TlghV/DYVS/COt7tR0621b3nBn6hwDN
         fCokuOrFJ4eYLI0wThexPivBWg+hZXx/qnar0kNH+XWPhojhV+WdFwD+OgTEh/OCIlmc
         srWpBYsWvgPJJM6MT1YWIhh2lNAYoAQMwz2lMr4PErN8gzHx7GKJwI7UGILIKg2kqUPw
         Zs1f6CL1SMdLVl56CIIbUh/TVyG+bBRlhGabUBhfIhiFQ7DkrM7e+aeNcZkoAYNomyQ5
         VaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImwX9kdkxyCrfSxchCRVxcHp/q4vXtkqJGNHQ8DEkjc=;
        b=HnVv6rbktz5PqXDOM3rhB5ju9qcgGHObHy4TXdhhRrh/zDDvfLDoxGJRP9wGkM/eG6
         2Vip541mwKb4N4W+uGhj/dria7SZbGyOvuchh1MU36Cz+99IuIMHKKbPjJxaZgA62j5l
         M/p+/6M0Qf+qC1njPFOa6kuizL2FVG8WmSWR4Qq/WzGloajgH3Bsz4rhgOqyUkweCF65
         IgUFKrUYq0ixSlCfBTQJA2J5WEKWT2NT1gtaKIYFiGO/H0d/X2udJCkTBYTrIGDAuHyQ
         DsRFnUKG9weY2w8VXitX2/EuRkxWUvAdiYKlWCfP4HjP9guWnHh8osQrJf2Bflk5CnAw
         6hMA==
X-Gm-Message-State: AFqh2kr/4a72Srx61oRI5NppQVTVCVpSAf/PM5bzTR6h1nn2W2eqB6VL
	O8KgeyyViLEhLjj2+XrJT4Yj4JWtS04kJ1O3
X-Google-Smtp-Source: AMrXdXul5MwiqQPpuhaRDMh0z5iXKOLd18UX/Lh/JbvN2UZqcd23wEqRedFecww6DX+nHF1piP4TeQ==
X-Received: by 2002:a17:906:4ed9:b0:7c1:7145:5b3c with SMTP id i25-20020a1709064ed900b007c171455b3cmr26822145ejv.46.1674491915346;
        Mon, 23 Jan 2023 08:38:35 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:34 -0800 (PST)
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
Subject: [PATCH v8 0/9] Add minimal MT8365 and MT8365-EVK support
Date: Mon, 23 Jan 2023 17:38:24 +0100
Message-Id: <20230123163833.1007181-1-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083839_216099_F6288B37 
X-CRM114-Status: GOOD (  12.03  )
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

v8:
  - Add binding descriptions for mediatek,mt8365-systimer and
    mediatek,mt8365-uart
  - Specify ranges with parameters for u3phy

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


Bernhard Rosenkränzer (6):
  dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
  dt-bindings: irq: mtk, sysirq: add support for mt8365
  dt-bindings: mfd: syscon: Add mt8365-syscfg
  dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
  dt-bindings: timer: mediatek,mtk-timer: add MT8365 SoC bindings
  dt-bindings: serial: mediatek,uart: add MT8365 SoC bindings

Fabien Parent (3):
  dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
  arm64: dts: mediatek: Initial mt8365-evk support

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../interrupt-controller/mediatek,sysirq.txt  |   1 +
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 +++++++++
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt     |   1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 .../bindings/usb/mediatek,mtu3.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 169 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 378 ++++++++++++++++++
 11 files changed, 755 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.39.1


