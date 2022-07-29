Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C36C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pn4aRw5vkBAagHpg+viq1Ca5jgOnmCVFfibzBeiQbRc=; b=4KCnAK3lWPYa3k/lSraBZRVkIL
	8zVaEp6OhawysBL6L3azhelIomAeW+L11BbuYpQBJGiTNkDBoTJZM0K8R9HBn+3vW5cgVUIWnU24v
	rpTWI6miaRRT1xelIEIrNxquHrJmzVEi5z0aesdP7QsLGAm/0NhqIsK7dLKYUHdLk6V6Cc6zByeHR
	tOJwNb19S5Ak0cfqFt3/nf9K7EyYxrDCn9UJCWOFfyZAPnFN/ybr7ldY2OHG3hOKBvh5A1HOTcbNs
	epQMeV/R19qVQBQIkEvN+6hTM+tfe2Mwvar/BKgRI4Cabda2hzefNI9UMV0ouW1kHMir8gFFMwsrZ
	D9MPlJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWfp-00C93y-Tl; Fri, 29 Jul 2022 20:33:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWfd-00C8uL-K2; Fri, 29 Jul 2022 20:33:19 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D83D66019F8;
	Fri, 29 Jul 2022 21:33:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659126796;
	bh=JE9yLr73dTeyo3+2VHkB5/L8XO+ZrpQ1qwaLSyUkuP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orf3OoP6cMCHdWcib7IB2wAeMdOGbEK6ft6Z+GntI0KU9g49SGWJ/Qcv46oaAY75+
	 T04nDQxyq5WokkTk42rCN+zt4i3mvzbJC4fTkinlvO51W5ZWHTJSugmUSlLpVKWWlF
	 hl1zBGz+1KMtiqgknyPeg09tqwVIlt1+PU1tU6HOA3q6dfh3+/oRFtZPJyLm0kuZDE
	 XOx9uuGSEEMIuPst5FeYMuKJEef6jdWyJZH6rwbvtplA+nr4IKXxRHQkuxnhnVS/to
	 I9XEkLQWUWIMl9DC59MYNznXRSGarTQ0PdPgJk9vb3A0nXLuQj9+IPLMORwJYCiAgd
	 vXU2URX4cLYRQ==
Date: Fri, 29 Jul 2022 16:33:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8 0/6] Add LVTS architecture thermal
Message-ID: <20220729203310.b26hcmeharlgiq7v@notapiano>
References: <20220726135506.485108-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726135506.485108-1-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_133317_945101_AF4465EC 
X-CRM114-Status: GOOD (  26.47  )
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

On Tue, Jul 26, 2022 at 03:55:00PM +0200, Balsam CHIHI wrote:
> This series moves thermal files related to MediaTek to the mediatek folder.
> And introduce the new architecture LVTS (low voltage thermal sensor) driver to report
> the highest temperature in the SoC and record the highest temperature sensor,
> each sensor as a hot zone.
> The LVTS body is divided into two parts, the LVTS controller and the LVTS device.
> The LVTS controller can connect up to 4 LVTS devices, and each LVTS device
> can connect up to 7 TSMCUs.
> 
> The architecture will be the first to be used on mt8192 and mt8195.
> 
> Changelog:
> Changes in v8:
>         - Fix Coding style issues
>         - Rebase to kernel-5.18.rc8
>         - Rebase on top of these series :
>           - [RESEND v8 00/19] Cleanup MediaTek clk reset drivers and support SoCs :
>                 https://lore.kernel.org/all/20220523093346.28493-1-rex-bc.chen@mediatek.com/
>           - [PATCH v6 00/12] thermal OF rework :
>                 https://lore.kernel.org/all/20220722200007.1839356-1-daniel.lezcano@linexp.org/
>         - Add multi-instance support and SRC Modularization :
>           - Rewrite DTS and DT bindings
>             - Add DT bindings for MT8195
>             - One LVTS node for each HW Domain (AP and MCU)
>           - One SW Instance for each HW Domain, for each SoC
>           - Add an SRC file for each SoC (MT8192 and MT8195)
>           - Add a Kconfig sub-menu entry for each SoC
>         - Shrink LVTS instance iospace length from 0x1000 to 0x400
>         - Replace platform_get_resource by platform_get_mem_or_io to get Base Address
>         - Replace platform_get_resource by platform_get_irq to get Interrupt Number
>         - Add "lvts_" prefix to functions and structs
> 
> Changes in v7:
>         - Fix coding style issues
>         - Rewrite dt bindings
>           - was not accurate
>           - Use mt8195 for example (instead of mt8192)
>           - Rename mt6873 to mt8192
>           - Remove clock name
>         - Rebased on top of to series:
>           - https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849
>           - https://patchwork.kernel.org/project/linux-pm/list/?series=639386
> 
> Changes in v6:
>         - Remove temperature aggregation (it will be added in another series)
>         - Update the way to read the temperature (read one sensor instead of all)
>         - Add support of mt8195
> 
> Changes in v5:
>         - Use 'git mv' for the relocated file.
> 
> Changes in v4:
>         - Rebase to kernel-v5.13-rc1
>         - Resend
> 
> Changes in v3:
>         - change the expression in the lvts_temp_to_raw to dev_s64.
> 
> Changes in v2:
>         - Rebase to kernel-5.11-rc1.
>         - sort headers
>         - remove initial value 0 of msr_raw in the lvts_temp_to_raw.
>         - disconstruct the api of lvts_read_tc_msr_raw.
>         - add the initial value max_temp = 0 and compare e.q.
>           in the lvts_read_all_tc_temperature.
>         - add the return with an invalid number in the lvts_init.
> 
> This series depends on [1] and [2].
> 
> [1]https://lore.kernel.org/all/20220523093346.28493-1-rex-bc.chen@mediatek.com/
> [2]https://lore.kernel.org/all/20220722200007.1839356-1-daniel.lezcano@linexp.org/
> 
> Alexandre Bailon (2):
>   dt-bindings: thermal: Add binding document for LVTS thermal
>     controllers
>   arm64: dts: mt8195: Add efuse node to mt8195
> 
> Michael Kao (3):
>   thermal: mediatek: Relocate driver to mediatek folder
>   thermal: mediatek: Add LVTS drivers for SoC theraml zones for mt8192
>   thermal: mediatek: Add thermal zone settings for mt8195
> 
> Tinghan Shen (1):
>   arm64: dts: mt8195: Add thermal zone
> 
>  .../thermal/mediatek,mt8192-lvts.yaml         |  73 ++
>  .../thermal/mediatek,mt8195-lvts.yaml         |  75 ++
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 131 ++-
>  drivers/thermal/Kconfig                       |  14 +-
>  drivers/thermal/Makefile                      |   2 +-
>  drivers/thermal/mediatek/Kconfig              |  62 ++
>  drivers/thermal/mediatek/Makefile             |   4 +
>  drivers/thermal/mediatek/lvts_mt8192.c        | 241 +++++
>  drivers/thermal/mediatek/lvts_mt8195.c        | 253 +++++
>  .../{mtk_thermal.c => mediatek/soc_temp.c}    |   2 +-
>  drivers/thermal/mediatek/soc_temp_lvts.c      | 928 ++++++++++++++++++
>  drivers/thermal/mediatek/soc_temp_lvts.h      | 366 +++++++
>  12 files changed, 2138 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
>  create mode 100644 drivers/thermal/mediatek/Kconfig
>  create mode 100644 drivers/thermal/mediatek/Makefile
>  create mode 100644 drivers/thermal/mediatek/lvts_mt8192.c
>  create mode 100644 drivers/thermal/mediatek/lvts_mt8195.c
>  rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (99%)
>  create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.c
>  create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.h

Given that you're adding a driver that supports both mt8192 and mt8195, and also
the DT thermal nodes for mt8195, maybe you could the DT nodes for mt8192 here as
well?

Thanks,
Nícolas

