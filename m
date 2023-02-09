Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E477EC636D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEiNvwdsh50/luN7kcdBw0tT4i5v1/6EEunHYjmNZXs=; b=Bj/I7rVeOmCr4QnrNcLQVzUivy
	Qpygbc1uCEgQW99dWE9xMqXIDZleuKmSMpr0rkfKWYLU9VarQorSWoeTELPkz9+kLsIajZ5gRi4FP
	en5nRBAABo2R77LJas5EWcgI6KWQo9+/1hXC0Mvrx8H6LfA4flLgML4vwsF+1he6eJvlZ8+bIW6AA
	sEiSPt6SO4HHcNVzAGgPuz3j2dvnIyt3puOiF6NaonXLBuwlWvbNhsj5oSjhfqI/oYZkBDNU/xQF4
	0/kQEsru04X4Sj0mXoUu7OO44MreS5Vkr7rT3sK4296nUdBxW4dYzx/9xYgQrDXA8uwuSVNYM7jfv
	4X4Kf0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4ft-0018NF-CT; Thu, 09 Feb 2023 11:01:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4fV-0018AM-Ri
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 11:00:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id qb15so3108328ejc.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dEiNvwdsh50/luN7kcdBw0tT4i5v1/6EEunHYjmNZXs=;
        b=Cc5tn2CKinqZh1y6GDQOh3jtJ28lfw2AwbOsVKLtGeveXXSVLDmwew92x9ux+0z56F
         OfAYNU/fNb6jcMpYuzPpdqEP+cy1mUVEFyu9uOmyx9g2lYIp4o9FqtnL+bv04Ojl193D
         BUU/NFJ8GwOYJ8E7P2goc0AceLXUIIbs8jlTxm6w9sRRkXKfV1vviPHYRD543YgiL4Q4
         pivztwB4TrK7gBRgy5u2ivXhVjbx3SNjI2kr+zn2GO8xZ7oLhCjtviVLKl66WkEaViyu
         pujsrnKl/l5Z4xl0Dd1Wm+OgAfj7DVpTK6iyBB+gyKK9YmCSR27IIyhsIaAbHQGoTTLm
         z1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEiNvwdsh50/luN7kcdBw0tT4i5v1/6EEunHYjmNZXs=;
        b=nCmEkt3rAtHHuW2vr8GfxQNiijVhYSRLMQCymst3Xrfbc1jhnGzuXyWIhy97g4XwTH
         cT+ljDRg5iMwvduJ7OTmDRyN2UmfM0hwHAyS22f1dikjMUqKKvWR2w0Z633s0Wbms+ix
         3yZIZSPTiUOvUS9XPE1Cr5k/w0BtpoXtk874d6JRjbm8yja240faUFh3Vst0Mf4wq0kf
         BrwSnrQUEtb1dVw+IbdWfzfmA84HIJPZPpQBn8ddBxryeBp6yGwLfypOC3NIAZUMmiKG
         un6PLco/MUe271Y/S6i4gXWfTozFi6/cIEzNxcrcStN628MTNc2mEN1yHfdRRFBRabpH
         sgAw==
X-Gm-Message-State: AO0yUKUdICE96Gi0Of905yW1Fj30+MaFRceR/FERlp9bH8ECqVNN9X0z
	s7jqQfpW5iTbgXxLwCqjubF3hVDBBU9X8PiGvhOfVA==
X-Google-Smtp-Source: AK7set+RaPbg+SOCzwGndo1Wa91cwrheg38QQCBg99GhoVwyzzAvFtOaofSU6Q5pBzPM0CXKp4JFifhFaFx0rd/k0bs=
X-Received: by 2002:a17:906:ca04:b0:7c0:f45e:22ff with SMTP id
 jt4-20020a170906ca0400b007c0f45e22ffmr2702674ejb.104.1675940443471; Thu, 09
 Feb 2023 03:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20230207130958.608305-2-bchihi@baylibre.com> <202302080018.wNeWiKqz-lkp@intel.com>
In-Reply-To: <202302080018.wNeWiKqz-lkp@intel.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 9 Feb 2023 12:00:07 +0100
Message-ID: <CAGuA+ori24xtbHnzYXGVSUOiU-T+V=33DPsHnsruGnP5Y_L7ZA@mail.gmail.com>
Subject: Re: [PATCH v13 1/6] thermal: drivers: mediatek: Relocate driver to
 mediatek folder
To: kernel test robot <lkp@intel.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_030045_954270_38C1C0B0 
X-CRM114-Status: GOOD (  13.58  )
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

this warning has been fixed by this patch :
https://lore.kernel.org/all/20230113064449.15061-1-rdunlap@infradead.org/

On Tue, Feb 7, 2023 at 5:14 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on a2c81dc59d41e92362ab7d41d0c15471ea50637d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230207-211351
> base:   a2c81dc59d41e92362ab7d41d0c15471ea50637d
> patch link:    https://lore.kernel.org/r/20230207130958.608305-2-bchihi%40baylibre.com
> patch subject: [PATCH v13 1/6] thermal: drivers: mediatek: Relocate driver to mediatek folder
> config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302080018.wNeWiKqz-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/0eb89997925c0d7b47bbeee93016146fc660b259
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230207-211351
>         git checkout 0eb89997925c0d7b47bbeee93016146fc660b259
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/thermal/mediatek/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/thermal/mediatek/auxadc_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead
>
>
> vim +562 drivers/thermal/mediatek/auxadc_thermal.c
>
> a4ffe6b52d27f4 drivers/thermal/mtk_thermal.c Michael Kao   2019-02-01  551
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  552  /**
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  553   * raw_to_mcelsius - convert a raw ADC value to mcelsius
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  554   * @mt:     The thermal controller
> 3772bb422072d4 drivers/thermal/mtk_thermal.c Amit Kucheria 2019-11-20  555   * @sensno: sensor number
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  556   * @raw:    raw ADC value
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  557   *
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  558   * This converts the raw ADC value to mcelsius using the SoC specific
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  559   * calibration constants
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  560   */
> 54bf1e5a629dfb drivers/thermal/mtk_thermal.c Henry Yen     2020-04-30  561  static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30 @562  {
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  563      s32 tmp;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  564
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  565      raw &= 0xfff;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  566
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  567      tmp = 203450520 << 3;
> f84514766985d3 drivers/thermal/mtk_thermal.c Michael Kao   2019-02-01  568      tmp /= mt->conf->cali_val + mt->o_slope;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  569      tmp /= 10000 + mt->adc_ge;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  570      tmp *= raw - mt->vts[sensno] - 3350;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  571      tmp >>= 3;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  572
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  573      return mt->degc_cali * 500 - tmp;
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  574  }
> a92db1c8089e82 drivers/thermal/mtk_thermal.c Sascha Hauer  2015-11-30  575
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

