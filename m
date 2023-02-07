Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D61EC636D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHHYbQWTXArEvDpNJJ6Ec38YulVcoF1CmHnyxseWv/o=; b=I5djeOT2x9soKjq7rXbtoErP4t
	IZBkgq5JGchHzvbdYpZVfN3bdHurvyvgXZwZVzKl2vfNPFhM4MdN8fvExBacvw1Guqyzaj1K31oDM
	VD5xgTJZmIuq141eNIIxADIOcJJVyJzd9QvUOsz3wTy3PMbKJc+hB5y9Ca/u0y+HRiXHeVn7tbSO8
	94KOM11c7N9ibGizoe0I9aMBH1jfhpEXAiIBhkO2ARnCjOlCsTHmwpvJEGUAv4oGkTHs7OmYy/n7x
	PstzFfNfO91bfmO+yZ6dQ+f3pfk/Vix94niH0+T0z+nlIe9yBL2KWGus6nLpINls172bP/vUsrWY/
	2NacQDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNkW-00CDO6-CV; Tue, 07 Feb 2023 13:11:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNjZ-00CCtU-DQ
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 13:10:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so13116885wmb.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHHYbQWTXArEvDpNJJ6Ec38YulVcoF1CmHnyxseWv/o=;
        b=hrcPy6lygRPAqNPp68oWhIxCSjNXqTBb2jThr91mU4GdhIGg5lgoVAkT2PFKb6fkZy
         j4Zky8tzxae7gzFiXjCl1drM8rV2Mo68ORaRjdAN9xmPrghlyXq9F8ytzewbZbJLOFuK
         pkKSlHA+7B537tTMOqrcqqZB4oEdXfqD5HbZo6U8mOFZ/y4hOpuvrg2PXygmle8V4okp
         jjQS/8aEPPY40umBsIfahaJ4TMmqSIwGQ7QLaaJG/R78l8Kmf4pFaqRYyNQ9UIz9UQIb
         OtKV5RRPA4hm7Vl/+2M2NAKG548KJHiO42bQ8tcglt46HugQkNRPjPX3uQhj7AENIsl9
         WnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHHYbQWTXArEvDpNJJ6Ec38YulVcoF1CmHnyxseWv/o=;
        b=pVu8SHhQm4wJDb0PK97Z1yOfW/zssbhfdahHXMoyhkCmo/VlYqBH57gmNgib8rgai1
         fiazwkRETZhGUTbGUpVqKNphsQephHDqw4Xetu+sUYJKuXGICBOulEMXpBPD24GaPKE4
         n7CghdUeMchcft6x8iVGQziGxfMCbxfSAhz8k3H6rQ26ZpTsiPaImmiReSjRXiw28yzy
         LVsTytTVYUBGpOI5JIzc/V6EDIsl2n89XOO/xQdVio145B4jDBGUvdG200UIEnp4fGLK
         aR+roaDhucvvRDqZ8YW6eiVB4jH3jZY/H+geHOAPpFMA9DWvflG2X7sU5h85IT6VS1A2
         3aQw==
X-Gm-Message-State: AO0yUKVD7tFGDPP6AS/DVJPSOYqtkDgcW9tbJD9/qqHG7wFUjbi7l8ZN
	hXItQgbJRJefpIlDj5ZKM44Dqw==
X-Google-Smtp-Source: AK7set/NeaJsE2/DeX3qJwmT1gppnlE6SerKN9vJUe16meTPZ2wNwdqPqcVk2AdedAW9/4jQ5iyPrQ==
X-Received: by 2002:a05:600c:18a0:b0:3df:3bd6:63e5 with SMTP id x32-20020a05600c18a000b003df3bd663e5mr2932315wmp.12.1675775400789;
        Tue, 07 Feb 2023 05:10:00 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm17987385wmk.25.2023.02.07.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:10:00 -0800 (PST)
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
Subject: [PATCH v13 0/6] Add LVTS Thermal Architecture
Date: Tue,  7 Feb 2023 14:09:52 +0100
Message-Id: <20230207130958.608305-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_051005_579523_47988243 
X-CRM114-Status: GOOD (  20.20  )
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
  v13:
     - Rebase on top of "thermal/linux-next" :
       base-commit: a2c81dc59d41e92362ab7d41d0c15471ea50637d
     - Fix coding style issues
       - Remove "__init" from all functions
       - Remove "lvts_ctrl_enable" and "lvts_ctrl_disable" wrappers
       - Use "dev_err_probe" instead of "dev_dbg" in "lvts_probe"
     - Fix subject prefix
     - Add "mt8192" to dt-binding definition
     - Change dt-binding license to "GPL-2.0-only OR BSD-2-Clause"
     - Fix debugfs mutli-instance support

  v12:
     - Fix subject prefix
     - Add dual licenses to dt-binding
     - Rename "include/dt-bindings/thermal/mediatek-lvts.h"
       to "include/dt-bindings/thermal/mediatek,lvts-thermal.h"

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
  thermal: drivers: mediatek: Relocate driver to mediatek folder
  dt-bindings: thermal: mediatek: Add LVTS thermal controllers
  arm64: dts: mt8195: Add efuse node to mt8195
  thermal: drivers: mediatek: Add the Low Voltage Thermal Sensor driver
  arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
  arm64: dts: mediatek: mt8195: Add temperature mitigation threshold

 .../thermal/mediatek,lvts-thermal.yaml        |  142 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  272 ++++
 drivers/thermal/Kconfig                       |   14 +-
 drivers/thermal/Makefile                      |    2 +-
 drivers/thermal/mediatek/Kconfig              |   37 +
 drivers/thermal/mediatek/Makefile             |    2 +
 .../auxadc_thermal.c}                         |    2 +-
 drivers/thermal/mediatek/lvts_thermal.c       | 1224 +++++++++++++++++
 .../thermal/mediatek,lvts-thermal.h           |   19 +
 9 files changed, 1702 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/auxadc_thermal.c} (99%)
 create mode 100644 drivers/thermal/mediatek/lvts_thermal.c
 create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h


base-commit: a2c81dc59d41e92362ab7d41d0c15471ea50637d
-- 
2.34.1


