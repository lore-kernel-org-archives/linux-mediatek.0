Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C5DC46467
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9nAEQgskD1p+skSduuar8ryWV0VfVRmc/5BdM22AEHM=; b=Hq7ommFRRor6G1q9O6rBEY/iyf
	+QW8WnHATQHeP33w4ZTcITR2CTLKprwWllsc7I12vMxGCKeDtYP4M7B9+UMjgCudYNyVhFRwNdRcS
	rnZi4wB40sqZ/3y0dout0U6SVBF/G1Ri66kglSHJVZwMSX65HGNwF0jNQZjHoApYwUfX23VcKzZNJ
	QaqWNN5vtq2XR0AfcE6HcBRIbBFYeDxUzllfvvpmhf2HQnj5znyIkzku/o06Vdgnch6MiZ7bLWiH1
	ewaUkqgZqseMRNPilJOFEBVpOQIyvl/GMbrg4p28D9DcZXZ8IGEV3GehlLpW7ugjGk5PlGd+BkP7T
	Ck0p73tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6PH-005fKF-Nq; Sun, 01 Jan 2023 22:02:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Ow-005f57-5s
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:01 +0000
Received: by mail-ej1-x633.google.com with SMTP id kw15so62886804ejc.10
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nAEQgskD1p+skSduuar8ryWV0VfVRmc/5BdM22AEHM=;
        b=QHZknpCyz6goEZvOFtEpnRgZs7Bjhg4tCY45czBLsETy73xMfeLOZ4svEmlqO04aQd
         P2Gg9WJzpPVmELWtFMIsV6H+ZWqHwl5d3zrBhQsWycE0LTzR60IahcIDIqWPLGl9WrV6
         5yavHHY96RmAlStBCsNXggvH6hougx5I0KWCDSUEUafetM5qMopZBuyhqq0JdXn5mfJO
         rdpJyq9YsOkEBEza1HdCMpLSx6xgQrvM19dtEnT68fvtBhfZYdrdwi2yIU4LuLJ0sV4B
         cdayUYAR5IAu+KDUGY0ktUjOEOluvrgWGYb2GfoUzZi2QM3/txkf9fj2x2RR07rg4u/T
         qCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nAEQgskD1p+skSduuar8ryWV0VfVRmc/5BdM22AEHM=;
        b=KUTZihBQqmCl406hdraIz/XZLkaUIhRCBPoX246E0THRXMbLtY72XzE1aBqrWP3Gy9
         OGUROOoz1t67itPh2+Lla9ucdqLsl4cLtGSlWZ0KC1OhWfPjk0Txx4vb6HezZ++nrBlG
         TaopzJeXSgDiG+76sx8oP9Bm9huOGOKbYrizzgXQ0pVB6tGGn9jt3IWcV263b1DTpZDS
         sQlldgagVFbiUmuMfrEqnbZrk+Q0nFCVFGGG8vRILR2akcQhjeZpDMq64eavUGvJUuzp
         QT2agVepwq/zPFo7NpDsvcRjLyx1tAgLjg5Lc+Cox5k18Z9E+iYUEPvhBjeESKuWSEQQ
         BliA==
X-Gm-Message-State: AFqh2kqZLe4o2fKWAMsV7XQRNkoubfKOyzBlQuhiwOgkq7KHuRZosY+Z
	RU4fRbld13Tp5hMOzTTulh2ftw==
X-Google-Smtp-Source: AMrXdXvEfhtw8CmHeGkLwdMMPysWFJzv5uV+nc1KGgWUinvLxJebmQBqV1yB7wAGo/jHBa6kwrZbdA==
X-Received: by 2002:a17:906:6807:b0:7c0:9805:4060 with SMTP id k7-20020a170906680700b007c098054060mr44649306ejr.38.1672610511451;
        Sun, 01 Jan 2023 14:01:51 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:51 -0800 (PST)
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
Subject: [PATCH v7 0/7] Add minimal MT8365 and MT8365-EVK support
Date: Sun,  1 Jan 2023 23:01:42 +0100
Message-Id: <20230101220149.3035048-1-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140159_836998_ED47878B 
X-CRM114-Status: GOOD (  12.64  )
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
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 +++++++++
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 .../bindings/usb/mediatek,mtu3.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 169 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 378 ++++++++++++++++++
 9 files changed, 753 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.39.0


