Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B57C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 21:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c35vdC8Z5D9wRATcgK9ZqUx4CbBJ7cxYNHrmTF+xf4I=; b=kZjdJXSHz3SQZpZrCKky5K991q
	KK7nmykmDXfnIjGRQS5ho9VntkMzvL0iwD6+5iOrV0spEJ4YcUn0PS2fREsJevhoN9fUbzxtHTJmv
	zzKmhmu/yxzWlnAPSDDACuGigPr7WYvc1Ug/jOnucj5l/gNf7lcJCIDMn5lYheB+W59OCojXreOlf
	RhZAE6+SAZ3ycuqJ9+9kXK8+/G3StuWK4EIcE+owA2XoQLBsUyxwe//VHsxGG21S7A5Ud2CtvoDiZ
	ICnJRKkiLuSXMmU3/etNhxDo6/15y4fAr+aRswTYcVobLQVn02OVos5c//9dldjqZu4k5b0l3NjC+
	TfArcr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBN6i-00Do9x-Bs; Fri, 30 Dec 2022 21:40:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBM6V-00DLdr-3j
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 20:35:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id c17so31678372edj.13
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 12:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c35vdC8Z5D9wRATcgK9ZqUx4CbBJ7cxYNHrmTF+xf4I=;
        b=DcxVMvOm79eLwrWdJhZUmVZse92z7FHpWJwZlkqpOg/uHYdnE+kpVVgEnkI5YtNQYq
         spz4HniZgaObn+dFrFH548OG070V65hGI9cShwndPvgFjx1m8ECfVK/6M4fEKfTZO4Qc
         vDgHxfYdULPwjT8cITw/MKAdBq8xKRHYLeC7rbPinpu0aut55nCW+1fv7HfJjCa6m8qD
         NojU4/omyWlrXDfiqH0h8wuG5G+SlI3mt+kZhl90++dA+VCQvjv/EbOS1vIJlZKR0ljq
         h1GP5Rfqk/qTHXqG9ueQ6BgxJNzYRtNt2+jb6qEFJnv1m/ONDAD8qqqz7owzMEZ+T6y9
         Ryog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c35vdC8Z5D9wRATcgK9ZqUx4CbBJ7cxYNHrmTF+xf4I=;
        b=LQiuYULck1O3gXche9Cj0b42GtPfzeDgNCTNGUDPwyHNLAKbSGC03Wa+d+qqfofWtW
         RpCi9D7kWnTsSTZ8jaI8BYO7sozuRJok4nDbkVrCqUClbvRKvHndqdocQxW8AGzlQS66
         kVeDPI0Lrti3e0CG3tBSpc0uwr1p2ELYvpmFevsTNYACxo8V7CSjs749wquekH1pg4X3
         2DH8lYdNP15wL2Y8rWTfMzCRtpJ3xTvHmP+IBr6XXVnwj0ysC2hY4maxPJrAKemcJfSy
         UVUXg2z1STvziULEhmDZGK3x5rrlLnMMPoHJRSc+VBdq6fxkWjT6cu486dqciqAmdmyF
         0E1Q==
X-Gm-Message-State: AFqh2koAVBPsMoYfCX134wNH9J6g+xW6WVvCVap0ToEUHKuRDrqpD3oc
	6TrpGTfeDToCzfCE4aEiepS2FDP7OkIBxFMyD7I=
X-Google-Smtp-Source: AMrXdXum8zmq8UrUgHT9L9BYn8Z/+pNc1RjjZ05TtokSFSv7w6vUqMMkRqQyp87Vbdrsvz4y0s/4AQ==
X-Received: by 2002:a50:ab1e:0:b0:47f:8c6f:5f31 with SMTP id s30-20020a50ab1e000000b0047f8c6f5f31mr28219402edc.14.1672432543117;
        Fri, 30 Dec 2022 12:35:43 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:42 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	gregkh@linuxfoundation.org,
	chunfeng.yun@mediatek.com,
	linus.walleij@linaro.org,
	lee@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 0/7] Add minimal MT8365 and MT8365-EVK support
Date: Fri, 30 Dec 2022 21:35:34 +0100
Message-Id: <20221230203541.146807-1-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_123547_159037_63EB3C06 
X-CRM114-Status: GOOD (  11.20  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 374 ++++++++++++++++++
 9 files changed, 749 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.39.0


