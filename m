Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BF4C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/550FRoRwhwiWa23UJcURfUhwjAKd0WneHpFmZPlwqw=; b=Ctgs3QpOTA48ER5AKdLXnj/RJw
	lPLCAK193HdFqmTlQE2uGucr3mPpaeOx4wtk7R8aANeg0JujvS/8DzG6HEi+8KJg4qS4DvI3JBTz8
	df/1xgLfuaW77butwXWte/GZSQ3X93GeAEXJkS3Qho6yV0/JZxa+U62fJpcstdm+MAINr9plKhyvv
	/KC57Wbrz7t6Q7B/COMD2A4nrFn7u/IyKFdHLwEOfDgnbnWaBbm9Z9kUsvKgICGIlgETJjHTy4Lgo
	xPZ9gqnK5JE2KqTG5dxX4wrz0WMM36Wm+SgoJATDPRlY/go7I33wLaJD7Dw3KUbncCmfotQxFtDcS
	pXT0tDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJacE-006Ajy-P5; Thu, 04 Aug 2022 13:10:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJabu-006AVo-LE
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 13:10:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so2318501wmj.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/550FRoRwhwiWa23UJcURfUhwjAKd0WneHpFmZPlwqw=;
        b=nHKiKcjX72Na/r5yh2xsHteZvjaIFfk3+PwiCpogq5p/Or0Oc//pj3zPrKYmUlEr5V
         zLzQZ6rmU6Vfkv7uL/DnL7HAtHYnNAakGKkSMbjXhzbQs4HqtZv6UZOy2M016wbIWgOy
         +wApUHQaQwm0NLF//egJ1amCnId7COEMhnaOMeqGrgXo926zvAgU95BqKK5Gb+xQjBT3
         78zRJKXfTDc1hvcTOVzh3sfxdDQIiDw8zG0v8RDVUyZXLquxH67A7briquUYzekmDgs/
         igPuK2C7sPS8vFK0ZEK4GTesaEfgxsLQ4Hxy4+Bi1uFlZI8LKWcSu89Zami5qbnQIanR
         A5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/550FRoRwhwiWa23UJcURfUhwjAKd0WneHpFmZPlwqw=;
        b=1egMzgtR4qWic4WKXqnOWUz0IVDkLC/fCfSZCgRXmTJsao+ruoO8RaZd71Q0M65xX1
         77C0Up+YnitaBEtSC9t4aqL2S5vnXRx+vQm5LHKDjR3rjdEHmeeeWhs2ML15zGPw5McB
         pjJgcoxqEwtogKpL+w5bFPNPzR7dLaVrteCeeeD7nzCAmT2nywCx7Ze0yNLrhjg/Tjib
         Qe+8mlQx4hn9hKl8vQV5yc1gBU8P57nL5q8A/LxXvTRekL0gatnkTiWWs8oWtcE2v0vi
         bjWUl+jLbeutX1SPprJqlgf0SfBaC1CS+BxYY4WRFf1LCPkqY95wiaIhcx+vkzjo5DOl
         0b7A==
X-Gm-Message-State: ACgBeo3C9XEQUWOXOW7VAGWGEM323q78HlZV2o42HHECqPi9AiuZKX2F
	oVuIQAcGJXyOGLoSzM/OAAjV9g==
X-Google-Smtp-Source: AA6agR5EDjcdFhE33k318QdP42SioQ8FJinf54Xtn+XGNTbDKaLLK6czAFeIqHHSqOI7XN4hCvAOog==
X-Received: by 2002:a05:600c:4fd4:b0:3a3:2c30:5749 with SMTP id o20-20020a05600c4fd400b003a32c305749mr1405025wmq.62.1659618596268;
        Thu, 04 Aug 2022 06:09:56 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.. (235.163.185.81.rev.sfr.net. [81.185.163.235])
        by smtp.gmail.com with ESMTPSA id o15-20020adfcf0f000000b0021d6a520ce9sm1156817wrj.47.2022.08.04.06.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:09:55 -0700 (PDT)
From: bchihi@baylibre.com
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
Subject: [PATCH v8.1, 0/7] Add LVTS architecture thermal
Date: Thu,  4 Aug 2022 15:09:05 +0200
Message-Id: <20220804130912.676043-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_060958_943234_FB7FC68C 
X-CRM114-Status: GOOD (  16.23  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

This series moves thermal files related to MediaTek to the mediatek folder.
And introduce the new architecture LVTS (low voltage thermal sensor) driver to report
the highest temperature in the SoC and record the highest temperature sensor,
each sensor as a hot zone.
The LVTS body is divided into two parts, the LVTS controller and the LVTS device.
The LVTS controller can connect up to 4 LVTS devices, and each LVTS device
can connect up to 7 TSMCUs.

The architecture will be the first to be used on mt8192 and mt8195.

Changelog:
Changes in v8.1 :
        - Fix Coding style issues
        - Rebase on top of next-20220803
        - Add multi-instance support :
          - Rewrite DT-binding and DTS :
            - Add DT-binding and DTS for LVTS_v4 (MT8192 and MT8195)
            - One LVTS node for each HW Domain (AP and MCU)
          - One SW Instance for each HW Domain
          - Add a Kconfig sub-menu entry for LVTS and LVTS_v4 SoCs
        - Replace platform_get_resource by platform_get_mem_or_io to get Base Address
        - Replace platform_get_resource by platform_get_irq to get Interrupt Number
        - Add "lvts_" prefix to functions and structs

Changes in v7 :
        - Fix coding style issues
        - Rewrite dt bindings
          - was not accurate
          - Use mt8195 for example (instead of mt8192)
          - Rename mt6873 to mt8192
          - Remove clock name
        - Rebased on top of to series:
          - https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849
          - https://patchwork.kernel.org/project/linux-pm/list/?series=639386

Changes in v6 :
        - Remove temperature aggregation (it will be added in another series)
        - Update the way to read the temperature (read one sensor instead of all)
        - Add support of mt8195

Changes in v5 :
        - Use 'git mv' for the relocated file.

Changes in v4 :
        - Rebase to kernel-v5.13-rc1
        - Resend

Changes in v3 :
        - change the expression in the lvts_temp_to_raw to dev_s64.

Changes in v2 :
        - Rebase to kernel-5.11-rc1.
        - sort headers
        - remove initial value 0 of msr_raw in the lvts_temp_to_raw.
        - disconstruct the api of lvts_read_tc_msr_raw.
        - add the initial value max_temp = 0 and compare e.q.
          in the lvts_read_all_tc_temperature.
        - add the return with an invalid number in the lvts_init.

Alexandre Bailon (2):
  dt-bindings: thermal: Add binding document for LVTS thermal
    controllers
  arm64: dts: mt8195: Add efuse node to mt8195

Balsam CHIHI (1):
  arm64: dts: mt8192: Add thermal zone

Michael Kao (3):
  thermal: mediatek: Relocate driver to mediatek folder
  thermal: mediatek: Add LVTS driver for mt8192 thermal zones
  thermal: mediatek: Add thermal zone settings for mt8195

Tinghan Shen (1):
  arm64: dts: mt8195: Add thermal zone

 .../thermal/mediatek,lvts-thermal.yaml        |  77 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 113 ++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 125 ++-
 drivers/thermal/Kconfig                       |  14 +-
 drivers/thermal/Makefile                      |   2 +-
 drivers/thermal/mediatek/Kconfig              |  47 +
 drivers/thermal/mediatek/Makefile             |   3 +
 drivers/thermal/mediatek/lvts_thermal.c       | 855 ++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.h       | 377 ++++++++
 drivers/thermal/mediatek/lvts_v4.c            | 464 ++++++++++
 .../mtxxxx_thermal.c}                         |   2 +-
 11 files changed, 2065 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 create mode 100644 drivers/thermal/mediatek/lvts_thermal.c
 create mode 100644 drivers/thermal/mediatek/lvts_thermal.h
 create mode 100644 drivers/thermal/mediatek/lvts_v4.c
 rename drivers/thermal/{mtk_thermal.c => mediatek/mtxxxx_thermal.c} (99%)

-- 
2.34.1


