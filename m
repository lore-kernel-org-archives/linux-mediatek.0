Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EC9C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rzLBA0ulSqogErFIVu+8bfox6+q1wNs8YMgbb2gj9O8=; b=39t/IQMUa8GNX+
	zOKK5QAQ8r6PkqeRjykusuy4iLiAFClwJyI3kHAgQQQy6GHlS2qIEMGI8s8Pvl5mIihjM+WnwYCUW
	r/mXDwNyOFllbGhpNDchGh5JzkYhnuuD4fB6YipT1OmpBfO1UB8ayao5Zw4UyZ0wGYjKYRojsJ4f5
	pf+DEMWEyhUMnYFwtl3hm6WwGF5H01mZPIu1C+p3z/xh1cxagrMg5T+C6G2sXrXhwnFxvjrGyMLY7
	b9QOkuF9mCX8ECijudfZTw97ipLuoagdBR2yBRMIh1kMe5fk1cxMA7huOLW6ddfbFD1v8yMtUPbtC
	nVRsGcQBbvO9sx0ME99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NS-00G9fJ-2t;
	Thu, 25 May 2023 09:35:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q1-00G0NO-2e
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:33:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso1754489f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003633; x=1687595633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzLBA0ulSqogErFIVu+8bfox6+q1wNs8YMgbb2gj9O8=;
        b=euIoeFVX5DZLsdnUDVfa0q+ZMfRpA1gsEdhmNyg2lE1Vbl6gvtHaP2d3siI2idJYqt
         OQ7gehXukara5AqefXCbhvvEYpTo7QjwT+Yx2XoRwE7ZvfexW4SBalgLdTMc/KlpBWda
         7qM/7rVcRKh1S8yNKxy9ggaLPUw0ok3k1NJPCEp3OeAWDs/Z2+nqeVslwZFX7Vd6VFWI
         OkeSi3/kiyp0DYUw/84t+4pKEIhb5m4IYFJ0dS5Yv5zP0EEPnBX9iVnQcPM1BU9+8smB
         fXW3+HU9VWS2nFDG6CROMOnUSRS14iGQ/5PmItbTvnaphmO2ivg2rqRmAIHs6xKsTGqR
         IBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003633; x=1687595633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzLBA0ulSqogErFIVu+8bfox6+q1wNs8YMgbb2gj9O8=;
        b=J3WYC/L61CPOK4CaG0YmTwKmVdpZqqwsThxt2GZbCaQJ/GCon++R+V/nqBxaMbcpjt
         y4pxEQ1Thkl/rojQVlO7MlG9V1R8mq22yLUtpN4TBblvGcZNSGjfLHJWxHFk0eaTi2UU
         nE+xxdYJXd+jWK3oRXBrXorC/Sf0Y2lXfvKNMRNwRfZlP+k2zNYmd03rL3R+nNNCn8F+
         x+ZB1O12azIBcNG9SvhPicP2Pzq8MYwoxrSAADI8QIjlN5QNp8lvDPYn7jdzD2SK29e2
         5Vd1sU5/jfpJq2UFozENiTWYEwGqiCiclDSAOvYUFcJz+LLXgdjgvvZcuKF0o6JW5oz0
         uJ/g==
X-Gm-Message-State: AC+VfDym2OgZsecREnxG2JgMYekbeAd8nP1FxxVk47StUAj6fjuQHSSb
	DZ+JYuc/lgAiUdW9cp9YLXmM9w==
X-Google-Smtp-Source: ACHHUZ6Xhx++SlPUZnWwmSO9AC8dvDTg1MvWXGRjxNLtDYYDcMIJA28lqZFQ8FJa7issgyM1OFA/lA==
X-Received: by 2002:adf:e511:0:b0:306:3899:ccbf with SMTP id j17-20020adfe511000000b003063899ccbfmr1962415wrm.14.1685003632957;
        Thu, 25 May 2023 01:33:52 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:33:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v8 00/10] Improve the MT8365 SoC and EVK board support
Date: Thu, 25 May 2023 10:33:09 +0200
Message-Id: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUdb2QC/4XOTWrEMAwF4KsMXtdFtuOfdNV7lC5sWW5Mp8lgz
 wSGIXev2mUJzUo8wfukh+jUKnXxcnqIRmvtdZk5hKeTwCnOHyRr5iw0aAMajKT1U6Yltiz77XJ
 Z2lVmm3wMZqTsk+Beip1kanHGiZvz7Xzm5VT7dWn33zur4vH2H7kqCRIcGO3BDirb1xTv55oaP
 ePyJd4ZXPUhohlxhB5zUoBYdhBziJifTwAMBSCAce+T4RAZGLFYCjkXTUDYQewhYhlRIRhUaQA
 b8w7iDhHHSMguKSzkix53EH+IeEbGgCmXiM46+oNs2/YNGR4juVgCAAA=
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
 Kevin Hilman <khilman@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3600; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oXFkwv30PQiHsvUw3Gm2oqLRkH85H2byPieMXIgeFvk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vv7eqXrKOVpAFj/UFbNNFu/nubQWEv7U+NGns
 uwmwNvWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURTsKEA
 CbqPknaqksOYG6ClJshktGlpf9J1qcgkGD5llfrDqziweMOEnFodz+wXwa4QUuJiASHuiqs2zEFNmd
 la62LhBvIeZNMhV+ukmcHdA123FoYitY8PvC3rddBNsXYJIusDYSpazahXWWDslFQoaDzmuBjOpAKZ
 M/uPpkY4qrY9oLC4/Ob195jkwuIKrUUFIO2TndPMzZnROgDu+ryV7S3TN+nNo/viW5twNJTurDsleQ
 jGeUL3PotyEKIvj0Wm++e1/QSezCR8VQSDq+4trvIzW0c7MQV4HfsFAnziCJYA6N05x5YENWtCZHdG
 4pGSBz7cyZkhVJzUeUn9IwBOPVfk1A2SA55JgzQpQlenqKEg0GkMW1O32lVouevHjsF6q3ZfqL4dDW
 mdDTTTtcNlne3xzcJx7DpZTmoPc6UHUXXb8Df80cytbmpiFjOdIWHfctrr5vYG3eCSJXlWr0q4rA8y
 VL4VeVrC4JYyCe6kww8sy0F09tcdC5zTHtPO8QxgbyZNoQt7eAFhN9yjLNqrmbTCk8bNjfv9UQBtAE
 2QrB6xnDj1NSPLLcysgq9Smf99qgMxNHU9e08ahs2W6IyKWV/wD1hP5BEHGiFhRarpW77ATHV1n+Hk
 6inCWaIQ0OuuuACrUlhj4DnqQFUNn/bIGz5GhTyVEQX4ElgDUy/0NOJcdUiw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013357_859039_8ABAA7EE 
X-CRM114-Status: GOOD (  15.09  )
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

This commits are based on the Fabien Parent <fparent@baylibre.com> work.

The purpose of this series is to add the following HWs / IPs support for
the mt8365-evk board:
- Watchdog
- Power Management Integrated Circuit "PMIC" wrapper
- MT6357 PMIC
- MultiMediaCard "MMC" & Secure Digital "SD" controller
- USB controller
- Ethernet MAC controller

Add CPU Freq & IDLE support for this board.

All previous dependancies are merged and released into the v6.4-rc1.

=== Build:

To test this serie, cherry-pick this serie, and build it using the arm64
defconfig.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v8:
- Change vqmmc-supply of mmc1 node.
- Remove all always-on regulators from the board devicetree.
- Link to v7: https://lore.kernel.org/r/20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com

Changes in v7:
- Rebase to the kernel v6.4-rc1.
- Remove "dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365" because
  it was applied.
- Link to v6: https://lore.kernel.org/r/20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com

Changes in v6:
- Add commit message for the arm64 defconfig changes
- Fix the mail list
- Link to v5: https://lore.kernel.org/r/20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com

Changes in v5:
- Add patches to build the MT6357 regulator driver and MTK PMIC keys by default
- Remove "dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add drive strength property"
  patch from this serie and add it to the pinctrl serie [3]
- Link to v4: https://lore.kernel.org/r/20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com

Changes in v4:
- Remove v3 applied patch from the serie:
  - arm64: dts: mediatek: add ethernet support for mt8365 SoC
  - arm64: dts: mediatek: add mmc support for mt8365 SoC
  - arm64: dts: mediatek: add mt6357 device-tree
  - arm64: dts: mediatek: add pwrap support to mt8365 SoC
  - arm64: dts: mediatek: Increase the size BL31 reserved memory
- Drop "arm64: dts: mediatek: fix systimer properties" which is done [1]
- Fix style, typo and re-order properties.
- Use interrupts-extended for the PMIC node.
- Link to v3: https://lore.kernel.org/r/20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com

Changes in v3:
- Remove v2 applied patch from the serie:
  - dt-bindings: mmc: mediatek,mtk-sd: add mt8365
- Add trailers and simply resend.
- Link to v2: https://lore.kernel.org/r/20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com

---
Alexandre Mergnat (9):
      arm64: defconfig: enable MT6357 regulator
      arm64: defconfig: enable Mediatek PMIC key
      arm64: dts: mediatek: add watchdog support for mt8365 SoC
      arm64: dts: mediatek: add mt6357 PMIC support for mt8365-evk
      arm64: dts: mediatek: add mmc support for mt8365-evk
      arm64: dts: mediatek: add usb controller support for mt8365-evk
      arm64: dts: mediatek: add ethernet support for mt8365-evk
      arm64: dts: mediatek: add OPP support for mt8365 SoC
      arm64: dts: mediatek: add cpufreq support for mt8365-evk

Amjad Ouled-Ameur (1):
      arm64: dts: mediatek: Add CPU Idle support

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 235 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 142 +++++++++++++++++
 arch/arm64/configs/defconfig                |   2 +
 3 files changed, 379 insertions(+)
---
base-commit: d2b7e0f7ff8e0b21e4c8d0ae6dfa38786fe44b35
change-id: 20230203-evk-board-support-d5b7a839ed7b

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


