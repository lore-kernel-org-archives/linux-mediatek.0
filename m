Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1F7C00140
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IpQvWXV43k3jb8kb7K9GI8o3RXdEg7e+Ubw22Ua7QE=; b=GOrKGFypsO78M79IOr0mpFwlhB
	qwDsedydRMqQGVBXTyw+/XiMAPj0FhUnnx5JEo7fKOabEfdz6TMuA1m62ugOjbGYHwgkQSipXnNAi
	R7ZYOIU4a88696y2XmTMGVcrUUsmWktWAs2QS6OUagWomHE/TziRj57hwCg64yHbPu9OuYHudp/cX
	U+uDxAw753FbkJXaAoFTeEPM8R17+ccoaHgaj6p5KohMz8NcJ2hJ6mFIrwB8TBXgnhQlDdBjtW7LX
	5e1ncYLq2n0Oy/jHp5kzwJSk2jkZCjsTdDaxgzCGZuI/p2sohuQPvtPUd8z7nV5e75xiWKsn1UpAe
	RMm5EjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ4Ji-001iXS-Pp; Wed, 03 Aug 2022 02:41:02 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ4JV-001iOg-0d; Wed, 03 Aug 2022 02:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659494448; x=1691030448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4+h2x6MTJbiDLT4UD4ZyULbN7mB4aghqMawKynLeEXk=;
  b=fhffcWT2VlSfsn7mky9SyuR7uixE3wEuQILskhV3GBZeKyJXuvD9whts
   q2NQOTqm9jS6hoCMvP+nVHoi2aeU7jwCNNGM0ebeGr3Vro1xi4FJ+Uf4D
   qsxJt0vFqiVdxSSab9bf43X5yc+ZwXIqJd/EXCisMDRY8nJKZ0jo8Lp8U
   TBHwWu6pG985RoapLBDRdAiXZVVBV2kW6IWupPOaNQOe0b5QbagCclbzt
   UcUv0DHVDbnycUNMC7ELt1i2pMz2Do8EsGM545PuTP9qzeONxG3aXRZlK
   QrXUrnoiK9dUHCqn9gaiywQnPo1otKgYTHoWZR01bwAXi5Nwi/tU4/7Ak
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269337236"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="269337236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 19:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="553153353"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Aug 2022 19:40:44 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ4JP-000Gi7-1q;
	Wed, 03 Aug 2022 02:40:43 +0000
Date: Wed, 3 Aug 2022 10:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Sean Wang <sean.wang@mediatek.com>,
	Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] leds: mt6323: Get rid of custom
 led_init_default_state_get()
Message-ID: <202208031036.PJtAjxAm-lkp@intel.com>
References: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_194049_095381_741FEA4C 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-mt6323-Get-rid-of-custom-led_init_default_state_get/20220803-052811
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220803/202208031036.PJtAjxAm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/30cc6458329b3d5a593e0d2173dc63d8dc6446f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/leds-mt6323-Get-rid-of-custom-led_init_default_state_get/20220803-052811
        git checkout 30cc6458329b3d5a593e0d2173dc63d8dc6446f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/leds/leds-mt6323.c: In function 'mt6323_led_set_dt_default':
>> drivers/leds/leds-mt6323.c:345:17: error: implicit declaration of function 'led_init_default_state_get'; did you mean 'led_get_default_pattern'? [-Werror=implicit-function-declaration]
     345 |         state = led_init_default_state_get(of_fwnode_handle(np));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 led_get_default_pattern
   cc1: some warnings being treated as errors


vim +345 drivers/leds/leds-mt6323.c

   337	
   338	static int mt6323_led_set_dt_default(struct led_classdev *cdev,
   339					     struct device_node *np)
   340	{
   341		struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
   342		enum led_default_state state;
   343		int ret = 0;
   344	
 > 345		state = led_init_default_state_get(of_fwnode_handle(np));
   346		switch (state) {
   347		case LEDS_DEFSTATE_ON:
   348			ret = mt6323_led_set_brightness(cdev, cdev->max_brightness);
   349			break;
   350		case LEDS_DEFSTATE_KEEP:
   351			ret = mt6323_get_led_hw_brightness(cdev);
   352			if (ret < 0)
   353				return ret;
   354			led->current_brightness = ret;
   355			ret = 0;
   356			break;
   357		default:
   358			ret = mt6323_led_set_brightness(cdev, LED_OFF);
   359		}
   360	
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

