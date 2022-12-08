Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD110C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h77EcyzmHrKVFjoWMhSpWChgCbULzYbCN7M8zPTR4Iw=; b=rUyBe0TQjVEwsssdOstuXmQoWx
	2E0cD0FzvqnpPsDrX9bLu2AEXuRpBAWBvubIqq1iN3lF57UG/MrV3SzqlmOAz63GzcYg6OXX/BmVN
	pL6f0UGD/r75EDGEeGpECz04SkRC9sAydCKynYO+KeyMFzr9HZv0Wj/2vK+kae79j5fcOFhVXIVdL
	ew4O7jZjbv9QLcZ0RFJWOLCpi1cK6x75ahcmrsAXX8pA4cUktc/3HjDj4OAlrmP/fWZMEWspXZKtJ
	/QqqZLqdfimaLJ0wWBfw+cZV94B71qk1hyWE9VcOB417qhqvg9XUZyjHfO4FguDq4/2VYSJGo1CB7
	IM47TiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JoG-005FEs-VO; Thu, 08 Dec 2022 16:31:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrG-003Ucy-00
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id d1so2017226wrs.12
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h77EcyzmHrKVFjoWMhSpWChgCbULzYbCN7M8zPTR4Iw=;
        b=QgAChH6txpKBJOTvAjnQBz3MysBSBiOnM5ttfAOm8LpwpJ97PQJ8EmkR9SCHMcabT5
         vFh5XmCYpbB+uyotqBwdWN/MV12wGjYu8sIXBvteNu+qwwGqg0RqxMVYrkL5Fmg42D1s
         Vw+s0On6BlcqG3i2ZEvuWQSAeVxXYNlWqYa/QUL1I4JOu9okydOJVcxTtaAYC/qlTHkz
         It0ii48J1VnQLMQ2PG5qZ3buHA11R5HeBQvTIk2Ef8EvtW9FwRuae4juJ42ocUPuIBQf
         xzNMtHlxR9shDDM4GT1gkvEEFCsqKJvfwposyXsLOnwkhrWXSsf2Q2BMgKQqw41O6pJC
         16gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h77EcyzmHrKVFjoWMhSpWChgCbULzYbCN7M8zPTR4Iw=;
        b=xmlep+p9JwcCMEwRjXxVyVcOeCsXcQgKinI9nGiw8CwgbohycWlmz1mmfO/dJy27By
         tf9NdnOexNKOzxaepjZ4mW2mpwaKeuIxRH0N3XjYhseQj8ZzEWxe0oWbISO9u6fVsoOl
         wfmaH5vTfXPoegeb7o/BTtKwHKLiOmuO2UhGak4glY2RtUuJp9V6cn/6QtT6r2vl3U/w
         NHirt9ZP6vV0q0Nqm5v1mdBsxKCZdYosCuMYMB1spi+Gl6cIMlafR47/eFxE/mBJnCFR
         s1EBz/75ktuEPWm9Z333dgit/BO5L/FsN7fN+CbHtRL1g2vjj4Zolm7vYaYDz6Hh5ngf
         Qhdg==
X-Gm-Message-State: ANoB5plF5BNY4dIzxg6pDj0rM2K1zI1eVbiDqoIfb9u+1lM3XYEjVMfo
	yCvAIZA9r9Eh6A6z48uEnf7YGGLvh2k3+I6uaWWAoA==
X-Google-Smtp-Source: AA0mqf5K5q5nQ3njTNZN5t/9f0Vch718YFsJMVTBQEXPX4bIWOp+q5Hl1/ug4qvyMu45VA6losj1Tg==
X-Received: by 2002:adf:dc4b:0:b0:242:149:9f0b with SMTP id m11-20020adfdc4b000000b0024201499f0bmr1682892wrj.55.1670513442704;
        Thu, 08 Dec 2022 07:30:42 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:42 -0800 (PST)
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
Subject: [PATCH v4 0/7] Add minimal MT8365 and MT8365-EVK support
Date: Thu,  8 Dec 2022 16:30:33 +0100
Message-Id: <20221208153041.3965378-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073046_405228_8DE58BE5 
X-CRM114-Status: GOOD (  10.25  )
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
2.38.1


