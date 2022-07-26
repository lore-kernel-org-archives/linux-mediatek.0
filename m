Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39245C19F21
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRAXgknnujaKg4Y8xAc9gwmU3XgmouGtPlayIr+CeFQ=; b=4SY/TquJtjsJwdC1Lq6LM6z4zp
	Tuo+GIDANnCKCeAOTbBKRvVjEgttCMKMEgTc2eFHk3AiTcSn/TZ4DB0Vc/DbM8mEyc6n230VbhfV1
	JVhTbwFTLtS22VU4vrL7KpNh30qr1q50feWC+4Rk7dPg2NLuJYUvpiIZabGhnWQHK+0z5Ny1p1rIT
	aGZKUu8VqnYqlV1ZyVUQl15I39/BGuYEqKDgADvan+uqzBagbp5BgdaMnxe6rvwwoev7mWQRVnLe5
	jmJmH+w5zYR9SH1IjjC7VVTpq5UMRlEduVAhR46sRmybhqyF8qt5FRXc+zH4qAdqZ6fcagZNhMXwL
	Kg10tqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL31-00HZ8e-N8; Tue, 26 Jul 2022 13:56:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL1s-00HYTK-Ds
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:55:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id bn9so9386266wrb.9
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uRAXgknnujaKg4Y8xAc9gwmU3XgmouGtPlayIr+CeFQ=;
        b=KrVhtqwt4ghxBcQ7BHk+gIXSc0ZctgVQNeRus03e1qw1Zb4a9TF+doBcOiaOIIwUFF
         FWRcPWIAVVnV6sMOcMnxH1HwxhsDNx5/YRtWaxR+Mf4JVtFMaPhAOsRl6XmhaJveJQlW
         Mt655y8Bz1uN9vZHplDqRNHvFnabzBLWwSd4f3oVQoPSekjsolFtNP75kuRmDVpgO3P+
         Av9HfTgLCx/lifQnvkRfvhpqMPTy9XVoTRdPJKLkU2XcglCPo8SiGgKY8ZFdHCWHD71R
         pOG5j/iRUnlLmc3y8Ut1uTwIIVlskDbob1uj+sQsgX3FlK97jNzyu9+Cb5aqH9/XCccb
         JxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uRAXgknnujaKg4Y8xAc9gwmU3XgmouGtPlayIr+CeFQ=;
        b=gjLvvBx219Of8a8codsz9efg2MBtCvhFHM4jik9FKb1v9cqembyG7Y5/2avPtQgpK8
         K9+rkCq7oNxB/ZNjkIk5WhnwboQuhdeosBuHkrsmbrp4J8LZ4gpxM4qFqeh7J+CZ/d7N
         QWHNsVabyjfN9MfB/NBaI5Tn//4mB47rxZ30YfSHFysZxCJd9/jJ2KbDrtRZeZCkfCtQ
         ZsbqbVCoUluZUt9N7qke6lxEk6Rm9nZHbiels+d7rkllkYeyqXrrz0AWBiYipe+ivATz
         iBouTvG210eTR6WEvqLyQkrqgucL1uYNhFVAWugfYeK7mkKBS/CKvvVlJuAibNhjZjck
         U0+w==
X-Gm-Message-State: AJIora8fiZwKEh6Oh4ogeaKI/C19ErFztR8Zb3Y8AeVWCpbyXCiZW+uM
	MCay2kEt3JiSS9o0auq2S2r4zQ==
X-Google-Smtp-Source: AGRyM1s4PQktP1/lpdXvhNgX9YiuT1FJm8lx9eDXYPnVNEEQe4+s8xmvMXcX7o+RyaDnO0TXbFY7Kw==
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id u11-20020a5d6dab000000b0021d9fc83029mr11140889wrs.172.1658843716767;
        Tue, 26 Jul 2022 06:55:16 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d13-20020adf9c8d000000b0021e4c3b2967sm15244670wre.65.2022.07.26.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:55:16 -0700 (PDT)
From: Balsam CHIHI <bchihi@baylibre.com>
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v8 0/6] Add LVTS architecture thermal
Date: Tue, 26 Jul 2022 15:55:00 +0200
Message-Id: <20220726135506.485108-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_065520_515019_4B80FD3E 
X-CRM114-Status: GOOD (  17.79  )
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

This series moves thermal files related to MediaTek to the mediatek folder.
And introduce the new architecture LVTS (low voltage thermal sensor) driver to report
the highest temperature in the SoC and record the highest temperature sensor,
each sensor as a hot zone.
The LVTS body is divided into two parts, the LVTS controller and the LVTS device.
The LVTS controller can connect up to 4 LVTS devices, and each LVTS device
can connect up to 7 TSMCUs.

The architecture will be the first to be used on mt8192 and mt8195.

Changelog:
Changes in v8:
        - Fix Coding style issues
        - Rebase to kernel-5.18.rc8
        - Rebase on top of these series :
          - [RESEND v8 00/19] Cleanup MediaTek clk reset drivers and support SoCs :
                https://lore.kernel.org/all/20220523093346.28493-1-rex-bc.chen@mediatek.com/
          - [PATCH v6 00/12] thermal OF rework :
                https://lore.kernel.org/all/20220722200007.1839356-1-daniel.lezcano@linexp.org/
        - Add multi-instance support and SRC Modularization :
          - Rewrite DTS and DT bindings
            - Add DT bindings for MT8195
            - One LVTS node for each HW Domain (AP and MCU)
          - One SW Instance for each HW Domain, for each SoC
          - Add an SRC file for each SoC (MT8192 and MT8195)
          - Add a Kconfig sub-menu entry for each SoC
        - Shrink LVTS instance iospace length from 0x1000 to 0x400
        - Replace platform_get_resource by platform_get_mem_or_io to get Base Address
        - Replace platform_get_resource by platform_get_irq to get Interrupt Number
        - Add "lvts_" prefix to functions and structs

Changes in v7:
        - Fix coding style issues
        - Rewrite dt bindings
          - was not accurate
          - Use mt8195 for example (instead of mt8192)
          - Rename mt6873 to mt8192
          - Remove clock name
        - Rebased on top of to series:
          - https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849
          - https://patchwork.kernel.org/project/linux-pm/list/?series=639386

Changes in v6:
        - Remove temperature aggregation (it will be added in another series)
        - Update the way to read the temperature (read one sensor instead of all)
        - Add support of mt8195

Changes in v5:
        - Use 'git mv' for the relocated file.

Changes in v4:
        - Rebase to kernel-v5.13-rc1
        - Resend

Changes in v3:
        - change the expression in the lvts_temp_to_raw to dev_s64.

Changes in v2:
        - Rebase to kernel-5.11-rc1.
        - sort headers
        - remove initial value 0 of msr_raw in the lvts_temp_to_raw.
        - disconstruct the api of lvts_read_tc_msr_raw.
        - add the initial value max_temp = 0 and compare e.q.
          in the lvts_read_all_tc_temperature.
        - add the return with an invalid number in the lvts_init.

This series depends on [1] and [2].

[1]https://lore.kernel.org/all/20220523093346.28493-1-rex-bc.chen@mediatek.com/
[2]https://lore.kernel.org/all/20220722200007.1839356-1-daniel.lezcano@linexp.org/

Alexandre Bailon (2):
  dt-bindings: thermal: Add binding document for LVTS thermal
    controllers
  arm64: dts: mt8195: Add efuse node to mt8195

Michael Kao (3):
  thermal: mediatek: Relocate driver to mediatek folder
  thermal: mediatek: Add LVTS drivers for SoC theraml zones for mt8192
  thermal: mediatek: Add thermal zone settings for mt8195

Tinghan Shen (1):
  arm64: dts: mt8195: Add thermal zone

 .../thermal/mediatek,mt8192-lvts.yaml         |  73 ++
 .../thermal/mediatek,mt8195-lvts.yaml         |  75 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 131 ++-
 drivers/thermal/Kconfig                       |  14 +-
 drivers/thermal/Makefile                      |   2 +-
 drivers/thermal/mediatek/Kconfig              |  62 ++
 drivers/thermal/mediatek/Makefile             |   4 +
 drivers/thermal/mediatek/lvts_mt8192.c        | 241 +++++
 drivers/thermal/mediatek/lvts_mt8195.c        | 253 +++++
 .../{mtk_thermal.c => mediatek/soc_temp.c}    |   2 +-
 drivers/thermal/mediatek/soc_temp_lvts.c      | 928 ++++++++++++++++++
 drivers/thermal/mediatek/soc_temp_lvts.h      | 366 +++++++
 12 files changed, 2138 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 create mode 100644 drivers/thermal/mediatek/lvts_mt8192.c
 create mode 100644 drivers/thermal/mediatek/lvts_mt8195.c
 rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (99%)
 create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.c
 create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.h

-- 
2.34.1


