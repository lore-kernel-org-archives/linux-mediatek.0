Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3272C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLMbldmg3fqesqTCeOVZ04983eiNsh8wyjeXrl5zmzE=; b=0Rt9K/uQ4C61QM4wJWC1Yz7J2j
	qX5smLmb8ysy5qNlNe+MW10cpPmJED45pOoQnmA7wPn9czD+UNe9+lKvLH+wa9455iU7LK9VEZK4q
	/6xQ2m1Eee+Ddjd6wmZixYc+H7/P9UQbcPVqeZtdGzFexPG71KOX3dtVYOUUJMN55iUu/Rr6rtSj2
	ACEy+X9PjU759jZZZSUooBEJLgxuSrwJTz7QiPp+C5FDxHZU+/pFyXsE8tvoeTJBltMIDuoZQ+11T
	fCF2xmwHCmMDQh4GnVas3vZkGRWaZyMl325La5TwFslSUqlL7qlyId7B23mdZUlG2sx7VnLEKc0ty
	UkbIwgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIsa-003oP7-K5; Tue, 24 Jan 2023 12:58:24 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIsK-003oF4-1E
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 12:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674565087; x=1706101087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vh3ewC0bzSD54uzrUW+Ja1+iDTgLvZthe7PVj9TYz90=;
  b=ZksnnFKzz4HU3OVnKFRjSqkdZtky2fuB+K2RwmZbu9BAuKa8RvsTnJog
   0wqoQAvU4MlbMt47FMy9hjcO+oemfZ0uNsT/5cdDuC1IS9NU0jOCrO1Oq
   NmS74HaA5qOhbM1UQ7gtQEVTs86BN8KZKrhqHQWAFbksRDq488ZW1/zE/
   iJGhS7PsWnS+b88KSNlOztWy2VfwUtQxKcAkvFh9BX5nliNcXErNmbzb9
   wklvtjwQgQKhEz7bDVcIEfxi64HkyaPLy5Po7xgj0o3TWVxNdAZq/uSY6
   si8F5bd1CktJm8fxm1k8axvU9/2eHI27Sy+j1F130A5cz64hz8iH/3OB/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412518461"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412518461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725462266"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="725462266"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 04:57:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKIs8-0006UK-0p;
	Tue, 24 Jan 2023 12:57:56 +0000
Date: Tue, 24 Jan 2023 20:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emma Anholt <emma@anholt.net>, amd-gfx@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>, Pan@freedesktop.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, jani.nikula@intel.com,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-mediatek@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xinhui <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Robert Foss <robert.foss@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio
 latencies to display info
Message-ID: <202301242053.vCYJQIUE-lkp@intel.com>
References: <20230124094154.2282778-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124094154.2282778-3-jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_045808_160883_0C439FB1 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230124094154.2282778-3-jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio latencies to display info
config: hexagon-randconfig-r045-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242053.vCYJQIUE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1e92b5478cfc1b0df66153652111117e9548b0d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
        git checkout 1e92b5478cfc1b0df66153652111117e9548b0d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/bridge/ drivers/gpu/drm/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/sii902x.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/bridge/sii902x.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/bridge/sii902x.c:17:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/bridge/sii902x.c:736:33: error: no member named 'eld' in 'struct drm_connector'
           memcpy(buf, sii902x->connector.eld,
                       ~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/bridge/sii902x.c:737:39: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(sii902x->connector.eld), len));
                             ~~~~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:16: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                ^
   include/linux/minmax.h:20:21: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                              ^
   drivers/gpu/drm/bridge/sii902x.c:737:39: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(sii902x->connector.eld), len));
                             ~~~~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:43: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                                           ^
   include/linux/minmax.h:23:19: note: expanded from macro '__no_side_effects'
                   (__is_constexpr(x) && __is_constexpr(y))
                                   ^
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   6 warnings and 3 errors generated.
--
   In file included from drivers/gpu/drm/i2c/tda998x_drv.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/i2c/tda998x_drv.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/i2c/tda998x_drv.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/i2c/tda998x_drv.c:1156:30: error: no member named 'eld' in 'struct drm_connector'
           memcpy(buf, priv->connector.eld,
                       ~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i2c/tda998x_drv.c:1157:36: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(priv->connector.eld), len));
                             ~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:16: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                ^
   include/linux/minmax.h:20:21: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                              ^
   drivers/gpu/drm/i2c/tda998x_drv.c:1157:36: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(priv->connector.eld), len));
                             ~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:43: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                                           ^
   include/linux/minmax.h:23:19: note: expanded from macro '__no_side_effects'
                   (__is_constexpr(x) && __is_constexpr(y))
                                   ^
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   6 warnings and 3 errors generated.


vim +736 drivers/gpu/drm/bridge/sii902x.c

ff5781634c4116 Jyri Sarha 2019-05-27  728  
ff5781634c4116 Jyri Sarha 2019-05-27  729  static int sii902x_audio_get_eld(struct device *dev, void *data,
ff5781634c4116 Jyri Sarha 2019-05-27  730  				 uint8_t *buf, size_t len)
ff5781634c4116 Jyri Sarha 2019-05-27  731  {
ff5781634c4116 Jyri Sarha 2019-05-27  732  	struct sii902x *sii902x = dev_get_drvdata(dev);
ff5781634c4116 Jyri Sarha 2019-05-27  733  
ff5781634c4116 Jyri Sarha 2019-05-27  734  	mutex_lock(&sii902x->mutex);
ff5781634c4116 Jyri Sarha 2019-05-27  735  
ff5781634c4116 Jyri Sarha 2019-05-27 @736  	memcpy(buf, sii902x->connector.eld,
ff5781634c4116 Jyri Sarha 2019-05-27  737  	       min(sizeof(sii902x->connector.eld), len));
ff5781634c4116 Jyri Sarha 2019-05-27  738  
ff5781634c4116 Jyri Sarha 2019-05-27  739  	mutex_unlock(&sii902x->mutex);
ff5781634c4116 Jyri Sarha 2019-05-27  740  
ff5781634c4116 Jyri Sarha 2019-05-27  741  	return 0;
ff5781634c4116 Jyri Sarha 2019-05-27  742  }
ff5781634c4116 Jyri Sarha 2019-05-27  743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

