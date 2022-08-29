Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45358ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFRiffIvzQ9QFbO1m9r0+ADVKxOh8ctJA6Vb37LR4lM=; b=SdreuzHSzZuo7VV4WAtLVG1uFT
	k2rrRBK53VifWQ+xABs7O+yfs390kpn8dknoW4ImI4dgllOxzrlRnbYf2UHJ3tyW5QG6ws+lqruXz
	Ts224HWmWznP54BEFxVHEGlSGvTtRCdg6HNfcBUnKWA50D7lCTf1hUmn+eGp8FnDuEmp73mFTlSq/
	h9yW6Gqda3VXPTSe650ly/LIN4v5qUSlRwH7PdDcgHSKFjRyYRxWh3BXUTEZVu8nIOYACxAa/iphU
	8eKfVwBRGTZ2U+/XIdCd8MiRAmiRfK5ALjDq/M5q6FAWe65JdMmnU+5185aHFVfU81Tu1l8TqKWib
	o2QeSMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSa7B-006BY6-U7; Mon, 29 Aug 2022 08:27:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSa4Z-0069g0-Bq
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 08:24:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id e20so9149946wri.13
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=uFRiffIvzQ9QFbO1m9r0+ADVKxOh8ctJA6Vb37LR4lM=;
        b=DShOJXq5b87D/6GDp/67rnM6rxx9a26JTD4M6JJ98xkpuLmxEduKx+iN+vEG0rToOh
         f1A87IWi5SID7QBCR9Ymnr192zeMv1P/HMm/TVQQbDNz0ZYdhOWObOrF0pO3Jd98OIvE
         WYheNOU6zbenz7Wo+L4irgajhj+V5piQwtvO43VuNoOHZPVjPE0QxZwC3vXoVzBqQt7e
         rgzSBO84hyT5YXV4mnIkm6mPMZsd3WZ1fpcFoidfUS+UAw9nhyAxb4dTzL3tP1Ho8Aex
         9sPejLEeYKjuNBZDk6GxIxvNqtMmUPygZ5a/kOTvtN1bR/kWI+GbTtvqR8NoD/0211Il
         PlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=uFRiffIvzQ9QFbO1m9r0+ADVKxOh8ctJA6Vb37LR4lM=;
        b=E8OIhPWULgeiQu6cTmGDn3VEAxjuTWs5VdL5+2eTHcaDQnyVDD+j3p68Yt8dSyGfjQ
         26sVFy8rw+CTFx6F0huAkhYupiHZyMFUC5zibn+ljsTWxo5pYG9brmM32DmPtg0+mE5s
         PzMwVYE75pFy+ftl55p7j7QjUTXrk5Zj/27EaDXRJ19KlP2SIP8WkUo1XoTh4POq/PwO
         yo/LTiomLOsQB3Vwsqd3+HQLWzR8x9Dduf74DHzFR94oWERyTICs+ReKgg+hnL/ORnnj
         W4lhhlHVp32q/R3UUo/xTaTq7rSp+PtOxrtUzWy6MG1jQfUuCk2dsHNxduFK5M6I5NqB
         x/mw==
X-Gm-Message-State: ACgBeo1Dy+npz4Yl01aK5AGLEhi6e1ZkxBdCzUsHd8J3P+VReUnnytWI
	Div1XdlL3p37atvpLhQ8M/HTkA==
X-Google-Smtp-Source: AA6agR6JS+DZb+wFfzIPJ1CsDKrTCDWPQF9AJL39E3gMEVQHkxXNrkWzYJYM1oTdX5JQaMuz8KWgmg==
X-Received: by 2002:a05:6000:1c14:b0:226:deb1:d7cc with SMTP id ba20-20020a0560001c1400b00226deb1d7ccmr846314wrb.494.1661761479688;
        Mon, 29 Aug 2022 01:24:39 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d4452000000b00225307f43fbsm6283277wrr.44.2022.08.29.01.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 01:24:39 -0700 (PDT)
Date: Mon, 29 Aug 2022 10:24:38 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: mediatek: add driver for MT8365 SoC
Message-ID: <20220829082438.ayz2qqav63odn3t6@blmsp>
References: <20220822152652.3499972-5-msp@baylibre.com>
 <202208241051.Xi9D8DaW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202208241051.Xi9D8DaW-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_012444_896091_279A6D96 
X-CRM114-Status: GOOD (  16.36  )
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

Hi,

On Wed, Aug 24, 2022 at 10:57:12AM +0800, kernel test robot wrote:
> Hi Markus,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on robh/for-next linus/master v6.0-rc2 next-20220823]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/clk-mediatek-Add-mt8365-support/20220822-233030
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220824/202208241051.Xi9D8DaW-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/51c1bac1ab0d284ab6c444966eee437c23095a85
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Markus-Schneider-Pargmann/clk-mediatek-Add-mt8365-support/20220822-233030
>         git checkout 51c1bac1ab0d284ab6c444966eee437c23095a85
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "mtk_clk_register_gates_with_dev" [drivers/clk/mediatek/clk-mt8365-mm.ko] undefined!

This series is based on this patch
https://lore.kernel.org/linux-mediatek/20220813083249.45427-1-y.oudjana@protonmail.com/
which is not yet applied but adds the required EXPORT.

Best,
Markus

