Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE0BC54E94
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcsiQs+yEKP/R93zQ24MnM+VOqwbIKPtvzI1bM864qQ=; b=qnMHv32165URApSyEb+vxXhB7e
	Y90I+61sljgSFgavNTthnGX7c14FEP6LUve7gaf2VagPN1msf8xPXieB6+plfcylGuEhvQJyBrYTu
	LvYN77kLkeCUyHnxdgX0Sq/4qhw4Eg8AkUC7hg+vjA5I7eT8D/q/2nmQ5oR9pX6icwqFHV0oLp6DE
	ud+75XPsyUi0mAAvSz1KdT27bDiQYuRU0ew7SfdanxxxQhGzT4jtS+4YXeniu/ffzrTqcxaP8mDvg
	4dj0MdHNWEJsj8AzujfG4ldDHVk4lmATUi674GaS2KSwz/gjx1Vngs539u4xDtcRst4BfUr81XqRd
	/aIkBTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJBh-003vN4-Rk; Tue, 24 Jan 2023 13:18:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJAt-003v38-VC
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 13:17:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r9so13842005wrw.4
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcsiQs+yEKP/R93zQ24MnM+VOqwbIKPtvzI1bM864qQ=;
        b=I2pP7/1u15jyyBRHBmMiScxaj7BUA8Y+HhNNygeSvme5jcP3ppDrFPMseFvC7ZxKd5
         a16Ki+tRfvr7BnHkwTnB+flPrG9KjOuZcTX7hK6mqo2uacc7XIfFW12Tvj00hHg2gHSU
         3xg8OcNxYkt+ylotmu6Ckn6JxeXyDYQNrjXg9GRtJ0nGrQmXFlA1psh17bw37OLIXmDW
         2yutzjCpJOkY+JsgI/MEox3omysfyTKtdGHabsSe4j2I/Y50eee92mNMrKpPYY2LmuQt
         YDCWbtAMzHGFnAwkOPevDRtG1KkHN1cVTY6SOHpGyME/PvjhDsVZh+nGzXvSrDRD3aIn
         fwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcsiQs+yEKP/R93zQ24MnM+VOqwbIKPtvzI1bM864qQ=;
        b=bATufmUNG7toMIFw23nfVXeOlWV6jU33Lno2BXSMJHTAHcxHKwv8JG9txP5FwipOND
         tnqiFqOx8z8DBntdbIokwHdzLd6K4m9B5DE//TIM1WTKVY++Nz94Ou1MbpV7ghA0ldB7
         4qGCKPlpmu63zCKFBhFvjh+3erKI3D/EDuYt72cWUIrEERHorXOggptGL6+D33sGLbSk
         oB2NgOvjAWZOb25cvBu4J/Iqt+PLur17KpZb/jyqzMaMpJTwnXcbvp0n6/jk4NWXGBHx
         iPed+kofgoRiKlblm/VKto0H8vLAh/JR4FXvZ0vlDQHfaeU7CpQd49YiOoRL4LIK6Xl2
         6gYw==
X-Gm-Message-State: AFqh2koV6/xCuLQkGALUZuINsNXzoy6bl7/C7zde4T5I/T9yWlQrmxRB
	/b7exRdrfQNFwuHMFzDzPdFyxw==
X-Google-Smtp-Source: AMrXdXvUdyhgSj74U0J5ooc22dmAfWAPbinzKmfbffJWkBJ0WotFrA3jV94Jm3QF4/pywu4AP5QWVg==
X-Received: by 2002:a5d:4446:0:b0:2ba:c946:868b with SMTP id x6-20020a5d4446000000b002bac946868bmr23432108wrr.23.1674566237463;
        Tue, 24 Jan 2023 05:17:17 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id a5-20020adfeec5000000b002bfb5ebf8cfsm49427wrp.21.2023.01.24.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:17:17 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v11 0/6] Add LVTS thermal architecture
Date: Tue, 24 Jan 2023 14:17:11 +0100
Message-Id: <20230124131717.128660-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_051720_335719_0D65D01D 
X-CRM114-Status: GOOD (  19.57  )
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

The LVTS (Low Voltage Thermal Sensor) driver is capable of monitoring
multiple hot points. For that, it contains 7 thermal control blocks
dedicated to specific devices on the die. Each control block can handle
up to 4 sensors. 

The thermal controller supports several interrupts. One for the cold
trip point, the hot trip point, the return to the normal trip point,
and a specific programmable trip point to monitor the temperature
dynamically.

The temperature measurement can be done in two ways, the immediate mode
where the temperature read is instantaneous and the filtered mode where
the controller uses, by configuration, an average of a set of values
removing the minimum and the maximum.

Finally, it is composed of 2 finite-state machines responsible for
the state of the temperature (cold, hot, hot 2 normal, hot hot),
the triggering of the interrupts, and the monitoring of the temperature.

As requested, the thermal driver has been reworked to reduce
the complexity of the code. At this time, the 4 little CPUs and
the 4 big CPUs are supported by the thermal driver.They are described
in a data structure and more devices can be added later.
The calibration routine has been simplified also.

The series provide the following changes:
 - Move the Mediatek drivers inside a dedicated folder as their number
   is increasing
 - Add the DT bindings for the controller
 - Add the efuse node for the mt8195
 - The LVTS driver
 - The thermal zones description in the DT

Changelog:
  v11:
     - Rebase on top of "thermal/linux-next" :
       base=0d568e144ead70189e7f16066dcb155b78ff9266
     - Remove unsupported SoC (mt8192) from dt-binding definition
     - Fix coding style issues :
       - Move litterals to define
       - Add interrupt macros
       - Remove wildcard : only mt8195 is supported for now

  v10:
     - Rebase on top of "thermal/linux-next" : thermal-v6.3-rc1
     - Rework the LVTS driver
     - Add the thermal trip temperature and cooling devices
       for the sensors supported by the driver

  v9:
     - Rebase on top of 6.0.0-rc1
     - Fix coding style issues
     - Fix commit titles and commit messages
     - Update dt-bindings :
     - Add "allOf:if:then:"
     - Use mt8192 as example (instead of mt8195)
     - Fix dt-binding errors
     - Fix DTS errors

  v8:
     - Fix coding style issues
     - Rebase on top of next-20220803
     - Add multi-instance support :
       - Rewrite DT-binding and DTS :
         - Add DT-binding and DTS for LVTS_v4 (MT8192 and MT8195)
           - One LVTS node for each HW Domain (AP and MCU)
         - One SW Instance for each HW Domain
         - Add a Kconfig sub-menu entry for LVTS and LVTS_v4 SoCs
     - Replace platform_get_resource by platform_get_mem_or_io to get
       Base Address
     - Replace platform_get_resource by platform_get_irq to get
       Interrupt Number
     - Add "lvts_" prefix to functions and structs

 v7:
     - Fix coding style issues
     - Rewrite dt bindings
       - was not accurate
       - Use mt8195 for example (instead of mt8192)
       - Rename mt6873 to mt8192
       - Remove clock name
     - Rebased on top of to series:
       - patchwork.kernel.org/project/linux-mediatek/list/?series=637849
       - patchwork.kernel.org/project/linux-pm/list/?series=639386

 v6:
     - Remove temperature aggregation (it will be added in another
       series)
     - Update the way to read the temperature (read one sensor
       instead of all)
     - Add support of mt8195

  v5:
     - Use 'git mv' for the relocated file.

  v4:
     - Rebase to kernel-v5.13-rc1

  v3:
     - change the expression in the lvts_temp_to_raw to dev_s64.

  v2:
     - Rebase to kernel-5.11-rc1.
     - sort headers
     - remove initial value 0 of msr_raw in the lvts_temp_to_raw.
     - disconstruct the api of lvts_read_tc_msr_raw.
     - add the initial value max_temp = 0 and compare e.q.
       in the lvts_read_all_tc_temperature.
     - add the return with an invalid number in the lvts_init.

Balsam CHIHI (6):
  thermal/drivers/mediatek: Relocate driver to mediatek folder
  dt-bindings/thermal/mediatek: Add LVTS thermal controllers dt-binding
    definition
  arm64/dts/mt8195: Add efuse node to mt8195
  thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver
  arm64/dts/mt8195: Add thermal zones and thermal nodes
  arm64/dts/mt8195: Add temperature mitigation threshold

 .../thermal/mediatek,lvts-thermal.yaml        |  107 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  272 ++++
 drivers/thermal/Kconfig                       |   14 +-
 drivers/thermal/Makefile                      |    2 +-
 drivers/thermal/mediatek/Kconfig              |   36 +
 drivers/thermal/mediatek/Makefile             |    2 +
 .../auxadc_thermal.c}                         |    2 +-
 drivers/thermal/mediatek/lvts_thermal.c       | 1261 +++++++++++++++++
 include/dt-bindings/thermal/mediatek-lvts.h   |   19 +
 9 files changed, 1703 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/auxadc_thermal.c} (99%)
 create mode 100644 drivers/thermal/mediatek/lvts_thermal.c
 create mode 100644 include/dt-bindings/thermal/mediatek-lvts.h


base-commit: 0d568e144ead70189e7f16066dcb155b78ff9266
-- 
2.34.1


