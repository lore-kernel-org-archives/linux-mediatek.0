Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8665C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxmeitX7k+pt7LKwKyE06pRMsoPEIMJt4SA3Awi0vTM=; b=hCZWStax0DBSMmXv3LcrFnvGIk
	bP0QR26HslJlCP4vYKivyDrd3Y1YeSoOIhmqnWfYjzjSf1g/ey01vuq/8/NzbRbpTIzIcbuxq+v1o
	wgtm86nmsF54WmS53Ym7MxWNMX172GWuNX5JnKlRWXHxJbBT9EvXUXkq2RbCiGYYTWF/B1GSVb0ku
	JYzV1lTz6wt7NhTNACY4rm0UDGNB6icu7X5wDcybPyDrL8f+FiNuMpj2nOmiNaCppF1rDOSuXrQ9q
	RpR02GUUTM28zkQe8bAOzcJVjABlPuSkuW8gvROGUTbsq8qQI0nR1k9WGwrD0zfcZw+hjg9nATjBw
	Y7wrDdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdGbx-0000000GOGO-0aT5;
	Sun, 11 Aug 2024 22:00:25 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdGbt-0000000GOFj-0Sml;
	Sun, 11 Aug 2024 22:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723413621; x=1754949621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5dDFPzlso+518BsD7FxakDrzbMJ7pRsaOi+q4gwwmpE=;
  b=hU7n1VD8WHWHPM0FjHTBqbqDL7V8s5NIhVILe6+eXN1N/5P1myEwsoWl
   aQV9MxeIQZpGzarD+CdsKT6seVD9k29ooYyqoZ0333fBp23lKLXGAoagd
   8x6jB77fEQTGwSNQVoqza6NHdxk3J4MWRUp0Y7bS0NFPlWDIw7Chwh4+K
   56lZmiasmMe8Egnr7SNvbFzZbMu/7bAUCZwDayVFE+1hWGgX8+0DHvjrJ
   ULBGdz1CgLw7o6ECHyxUjiQQgHl6Lzfiw+Dxy2KVkp4FH/DDkK4RR2/FZ
   CU77kbA6qYtEGGWdL2ImuV65Pazt2f861JuYVhcMg4QLPGBAJ5/d/ZFRq
   w==;
X-CSE-ConnectionGUID: nHEg4PNnSmCq0Eo25Rfxiw==
X-CSE-MsgGUID: 0xWwb7VyRPiRXofSRB3HRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21641744"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21641744"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:00:21 -0700
X-CSE-ConnectionGUID: iZ2rRz0tSVeF4n5itSEQOQ==
X-CSE-MsgGUID: CwV2PbkuSD+rWCyJZAoQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58040030"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2024 15:00:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGbm-000BAx-16;
	Sun, 11 Aug 2024 22:00:14 +0000
Date: Mon, 12 Aug 2024 05:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <202408120527.crbqc6PI-lkp@intel.com>
References: <c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_150021_250419_E18FB2B8 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-pinctrl-airoha-Add-EN7581-pinctrl-controller/20240812-001436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo%40kernel.org
patch subject: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240812/202408120527.crbqc6PI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120527.crbqc6PI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120527.crbqc6PI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
    1922 | static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
         |                                                                  ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   In file included from include/linux/printk.h:574,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/mediatek/pinctrl-airoha.c:9:
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinmux_set_mux':
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2279:21: error: 'struct function_desc' has no member named 'name'
    2279 |                 desc->name, grp->grp.name);
         |                     ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2278:9: note: in expansion of macro 'dev_dbg'
    2278 |         dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
         |         ^~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinctrl_get_conf':
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2359:38: error: implicit declaration of function '__bf_shf' [-Werror=implicit-function-declaration]
    2359 |         *val = (*val & reg->mask) >> __bf_shf(reg->mask);
         |                                      ^~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinctrl_probe':
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2946:61: error: 'const struct function_desc' has no member named 'name'
    2946 |                                                   func->desc.name,
         |                                                             ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2947:61: error: 'const struct function_desc' has no member named 'group_names'
    2947 |                                                   func->desc.group_names,
         |                                                             ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2948:61: error: 'const struct function_desc' has no member named 'num_group_names'
    2948 |                                                   func->desc.num_group_names,
         |                                                             ^
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pinctrl/mediatek/pinctrl-airoha.c:22:
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2952:43: error: 'const struct function_desc' has no member named 'name'
    2952 |                                 func->desc.name);
         |                                           ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2951:25: note: in expansion of macro 'dev_err'
    2951 |                         dev_err(&pdev->dev, "Failed to register function %s\n",
         |                         ^~~~~~~
   cc1: some warnings being treated as errors


vim +2279 drivers/pinctrl/mediatek/pinctrl-airoha.c

  2259	
  2260	static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
  2261					 unsigned int selector,
  2262					 unsigned int group)
  2263	{
  2264		struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
  2265		const struct airoha_pinctrl_func *func;
  2266		struct function_desc *desc;
  2267		struct group_desc *grp;
  2268		int i;
  2269	
  2270		desc = pinmux_generic_get_function(pctrl_dev, selector);
  2271		if (!desc)
  2272			return -EINVAL;
  2273	
  2274		grp = pinctrl_generic_get_group(pctrl_dev, group);
  2275		if (!grp)
  2276			return -EINVAL;
  2277	
  2278		dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
> 2279			desc->name, grp->grp.name);
  2280	
  2281		func = desc->data;
  2282		for (i = 0; i < func->group_size; i++) {
  2283			const struct airoha_pinctrl_func_group *group;
  2284			int j;
  2285	
  2286			group = &func->groups[i];
  2287			if (strcmp(group->name, grp->grp.name))
  2288				continue;
  2289	
  2290			for (j = 0; j < group->regmap_size; j++) {
  2291				void __iomem *base;
  2292	
  2293				base = pinctrl->regs.mux[group->regmap[j].mux];
  2294				airoha_pinctrl_rmw(pinctrl,
  2295						   base + group->regmap[j].offset,
  2296						   group->regmap[j].mask,
  2297						   group->regmap[j].val);
  2298			}
  2299			return 0;
  2300		}
  2301	
  2302		return -EINVAL;
  2303	}
  2304	
  2305	static int airoha_pinmux_gpio_set_direction(struct pinctrl_dev *pctrl_dev,
  2306						    struct pinctrl_gpio_range *range,
  2307						    unsigned int pin, bool input)
  2308	{
  2309		struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
  2310		int gpio = pin - range->pin_base;
  2311	
  2312		airoha_pinctrl_gpio_set_direction(pinctrl, gpio, input);
  2313	
  2314		return 0;
  2315	}
  2316	
  2317	static int airoha_pinctrl_get_gpio_from_pin(struct pinctrl_dev *pctrl_dev,
  2318						    int pin)
  2319	{
  2320		struct pinctrl_gpio_range *range;
  2321		int gpio;
  2322	
  2323		range = pinctrl_find_gpio_range_from_pin_nolock(pctrl_dev, pin);
  2324		if (!range)
  2325			return -EINVAL;
  2326	
  2327		gpio = pin - range->pin_base;
  2328		if (gpio < 0)
  2329			return -EINVAL;
  2330	
  2331		return gpio;
  2332	}
  2333	
  2334	static const struct airoha_pinctrl_reg *
  2335	airoha_pinctrl_get_conf_reg(const struct airoha_pinctrl_conf *conf,
  2336				    int conf_size, int pin)
  2337	{
  2338		int i;
  2339	
  2340		for (i = 0; i < conf_size; i++) {
  2341			if (conf[i].pin == pin)
  2342				return &conf[i].reg;
  2343		}
  2344	
  2345		return NULL;
  2346	}
  2347	
  2348	static int airoha_pinctrl_get_conf(void __iomem *base,
  2349					   const struct airoha_pinctrl_conf *conf,
  2350					   int conf_size, int pin, u32 *val)
  2351	{
  2352		const struct airoha_pinctrl_reg *reg;
  2353	
  2354		reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
  2355		if (!reg)
  2356			return -EINVAL;
  2357	
  2358		*val = readl(base + reg->offset);
> 2359		*val = (*val & reg->mask) >> __bf_shf(reg->mask);
  2360	
  2361		return 0;
  2362	}
  2363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

