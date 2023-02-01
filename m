Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE68C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMv47dsyarshbYE433f6FUYix6Y033mig2nobecy5zI=; b=PPz4KELv7psXX1ICm8ATv6i75U
	wBjhW44PppyyMn8LcuT17N31cW13iNInJQ8XT9lkvGyddTLNNpiBAnU1JOdhT1v5w3LepCocLJK8v
	7G+1gUxcAOBy3EHjBELcrlVgcED3BNsLamxekzYtOgR4lDfvlDR5oBt0S1uk2rsv2T6ADAIRkgpHj
	rM083xbOBtpC0NzahonMmlwOwdu1xEXfxHNWyg5H1AhTtn92VxbVX3VP1EeC8cdsTsbY6z3DxXmuU
	cCQ3sQLsRPI/D7roapCwTrZC/O0w0giK2sU3AxDOgBuyHo6z8LDjR8YQZOfqxmFw79snVqJeikPBs
	qSFs6L1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHjs-00DArl-4J; Wed, 01 Feb 2023 18:21:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHjg-00DApe-By; Wed, 01 Feb 2023 18:21:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id hx15so34453407ejc.11;
        Wed, 01 Feb 2023 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMv47dsyarshbYE433f6FUYix6Y033mig2nobecy5zI=;
        b=kDe0ZLlzNaomYz5gxYYyCjprPwOdNCFBg5sb2SQ3kWVqCR0qggLN5B7JkHTKM8TBA4
         DKf4XMga7crPp0CyD6701LONiSz5YrQgw1EdsHNcRwILvEctfb0NFv+RGLlB/CApnkyU
         ZRhPbWn/2c/+0R35kDL/MKLWyAOZPlZN8MDKtNPQpFm5kR9vJXJqxLl1YTYoDNHFoWbb
         Gs4nSMfJtR5V7IquFF2ZT/HaovCqx0cw/Zttt0Ivv6E9lfJwa8mIEk5nYlCieNDkcZ4e
         CeN3/Xqar6i/rLAS1CY2cfgJRZDV1LswlCxINVYx5eZaWXnMmAAWYiXJuXEmNsd9mg05
         905A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cMv47dsyarshbYE433f6FUYix6Y033mig2nobecy5zI=;
        b=nqdLzcBomh2R0k/MaNlaNfFogghKcbVu8EpGDP6sXSbFFt21CyACOIwx/EOCq/HQqE
         +m1ouMJHaHXvAPG9AJRwxZMHJT6gwYsKHQ8MGkvevy3bh+gwTN1X2tBiKbptg/Pb6e0d
         Un/ezZLKaLSXW3zZcJVL7kAx0jqFJSMcNJBo9ivazSqLVXP9kujtL2/VlG+7F6Dk7VRS
         PxvZMYzP5yYLJ27gZnPUF0lLXcVsWfuYkVwI8Ro22DfjSSpgOTLGJhjFOdlFOzPIzLoz
         mQB2ux3t8KAMu45NQXRJHLaYSQIz+YgWpGEezRBd+lYCIhQMDLm9KTPh4eWCy/QUr169
         Tdvw==
X-Gm-Message-State: AO0yUKUFBIBxIR47n3/CyIyvdIChtA3f3I8Z8vSebb9gfINbewF2Cjuu
	cTpK/N0jnxUWweEDuGs6kQ0=
X-Google-Smtp-Source: AK7set/nyHoeaz7DFUhS5Q4XdlaSZKO2O1PlWBVdjoYgFS+ngazoJpJJqoIo2e0RyTLXtb+3gmrgnA==
X-Received: by 2002:a17:906:694c:b0:881:ad59:97f5 with SMTP id c12-20020a170906694c00b00881ad5997f5mr2980458ejs.2.1675275690134;
        Wed, 01 Feb 2023 10:21:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bx26-20020a170906a1da00b00889c115cf6asm4529779ejb.145.2023.02.01.10.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:21:29 -0800 (PST)
Message-ID: <396d51fc-81f3-4a2b-d7a7-b966bfe3002a@gmail.com>
Date: Wed, 1 Feb 2023 19:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 "nathan.lu" <nathan.lu@mediatek.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Roger Lu <roger.lu@mediatek.com>,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>,
 Shang XiaoJing <shangxiaojing@huawei.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Zeng Heng <zengheng4@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_102132_459514_5C104336 
X-CRM114-Status: GOOD (  21.74  )
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

Hi Arnd and Olof,

Please see below for the list of updates to the MediaTek SoC drivers. Lost of 
things have happened.

We got support for MT8188 in the mutex, mmsys and power domain driver. Mutex and 
mmsys now also support the MT8195. There were several improvements for the SVS 
driver. Apart from that the PMIC wrapper binding finally was converted to yaml, 
this included some PMIC patches, which hold the corresponding Acked-by tags.

Please have a look.
Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-soc

for you to fetch changes up to 6f42f5e73bb431c7e01c15dadfdc15872aa85db5:

   soc: mediatek: mtk-svs: add missing MODULE_DEVICE_TABLE (2023-02-01 14:35:12 
+0100)

----------------------------------------------------------------
Introduce MediaTek regulator coupler driver to ensure that the SRAM
voltage in par with the GPU voltage. This allows for a stable use of the
GPU.

mtk-mutex:
- add support for MT8188 vdosys0 path
- allow it to be build as module
- add support for MT8195 vdosys1 path

mmsys:
- add MT8188 vdosys0 path
- allow to be build as a module
- add MT8195 vdosys1 path
- add support for CMDQ
- allow for up to 64 reset bits
- add supprot for the MT8195 vppsys[0,1] pathes

pm-domains:
- keep power for the MT8186 ADSP on by default
- add support for MT8188
- add support for buck isolation needed in specific pm-domains for
   MT8188 and MT8192

mtk-svs:
- enable IRQ later to allow using kexec
- several improvments on the code base
- fix modalias

pmic wrapper:
- convert binding to yaml. As this is thightly coupled to the MT6357
   PMIC, I took patches regarding it as well.

----------------------------------------------------------------
Alexandre Mergnat (2):
       dt-bindings: soc: mediatek: convert pwrap documentation
       dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC

Allen-KH Cheng (2):
       soc: mediatek: pm-domains: Add buck isolation offset and mask to power 
domain data
       soc: mediatek: pm-domains: Add buck isolation setting in power domain

AngeloGioacchino Del Regno (2):
       soc: mediatek: Introduce mediatek-regulator-coupler driver
       soc: mediatek: mtk-devapc: Switch to devm_clk_get_enabled()

Fabien Parent (2):
       dt-bindings: input: mtk-pmic-keys: add binding for MT6357 PMIC
       Input: mtk-pmic-keys: add MT6357 support

Garmin.Chang (2):
       dt-bindings: power: Add MT8188 power domains
       soc: mediatek: pm-domains: Add support for mt8188

Matthias Brugger (4):
       soc: mediatek: mtk-svs: clean up platform probing
       soc: mediatek: mtk-svs: improve readability of platform_probe
       soc: mediatek: mtk-svs: move svs_platform_probe into probe
       soc: mediatek: mtk-svs: delete superfluous platform data entries

Moudy Ho (1):
       dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS

Nancy.Lin (11):
       dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible for MT8195
       dt-bindings: reset: mt8195: add vdosys1 reset control bit
       soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
       soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
       soc: mediatek: refine code to use mtk_mmsys_update_bits API
       soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
       soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195 vdosys1
       soc: mediatek: mmsys: add mmsys for support 64 reset bits
       soc: mediatek: mmsys: add reset control for MT8195 vdosys1
       soc: mediatek: add mtk-mutex component - dp_intf1
       soc: mediatek: add mtk-mutex support for mt8195 vdosys1

Nathan Lu (4):
       dt-bindings: mediatek: modify VDOSYS0 mmsys device tree Documentations 
for MT8188
       dt-bindings: mediatek: modify VDOSYS0 mutex device tree Documentations 
for MT8188
       soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
       soc: mediatek: add mtk-mutex support for mt8188 vdosys0

Ricardo Ribalda (1):
       soc: mediatek: mtk-svs: Enable the IRQ later

Roger Lu (4):
       soc: mediatek: mtk-svs: restore default voltages when svs_init02() fail
       soc: mediatek: mtk-svs: reset svs when svs_resume() fail
       soc: mediatek: mtk-svs: keep svs alive if CONFIG_DEBUG_FS not supported
       soc: mtk-svs: mt8183: refactor o_slope calculation

Roy-CW.Yeh (1):
       soc: mediatek: mmsys: add support for MT8195 VPPSYS

Shang XiaoJing (1):
       soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in svs_init01()

Tinghan Shen (1):
       soc: mediatek: mtk-pm-domains: Allow mt8186 ADSP default power on

Uwe Kleine-König (1):
       soc: mediatek: mutex: Drop empty platform remove function

Yongqiang Niu (1):
       mtk-mmsys: Change mtk-mmsys & mtk-mutex to modules

Zeng Heng (1):
       soc: mediatek: mtk-svs: add missing MODULE_DEVICE_TABLE

  .../bindings/arm/mediatek/mediatek,mmsys.yaml      |   4 +
  .../bindings/input/mediatek,pmic-keys.yaml         |   1 +
  .../devicetree/bindings/leds/leds-mt6323.txt       |   2 +-
  .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 111 ++++
  Documentation/devicetree/bindings/mfd/mt6397.txt   |   2 +-
  .../bindings/power/mediatek,power-controller.yaml  |   2 +
  .../bindings/soc/mediatek/mediatek,mutex.yaml      |   1 +
  .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 147 +++++
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 ---
  drivers/input/keyboard/mtk-pmic-keys.c             |  17 +
  drivers/soc/mediatek/Kconfig                       |   7 +-
  drivers/soc/mediatek/Makefile                      |   1 +
  drivers/soc/mediatek/mt8186-pm-domains.h           |   4 +-
  drivers/soc/mediatek/mt8188-mmsys.h                | 149 +++++
  drivers/soc/mediatek/mt8188-pm-domains.h           | 623 +++++++++++++++++++++
  drivers/soc/mediatek/mt8195-mmsys.h                | 146 +++++
  drivers/soc/mediatek/mtk-devapc.c                  |  11 +-
  drivers/soc/mediatek/mtk-mmsys.c                   | 200 +++++--
  drivers/soc/mediatek/mtk-mmsys.h                   |   2 +
  drivers/soc/mediatek/mtk-mutex.c                   | 113 +++-
  drivers/soc/mediatek/mtk-pm-domains.c              |  13 +
  drivers/soc/mediatek/mtk-pm-domains.h              |   5 +
  drivers/soc/mediatek/mtk-regulator-coupler.c       | 159 ++++++
  drivers/soc/mediatek/mtk-svs.c                     | 155 ++---
  include/dt-bindings/power/mediatek,mt8188-power.h  |  44 ++
  include/dt-bindings/reset/mt8195-resets.h          |  45 ++
  include/linux/soc/mediatek/infracfg.h              | 121 ++++
  include/linux/soc/mediatek/mtk-mmsys.h             |  25 +
  28 files changed, 1975 insertions(+), 210 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
  create mode 100644 
Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
  delete mode 100644 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
  create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h
  create mode 100644 drivers/soc/mediatek/mt8188-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mtk-regulator-coupler.c
  create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h

