Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8842C00140
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 01:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5WW43fcDvtlZsSFZ5ufwxKjuJ+6GwubCb3u3NumYlY=; b=ugBE0tKh1E04qy9Kd1jvS19mg/
	eMzetyI8VKr5rf8qbviq5hu1ykzESfRiWsD2/VKhV9JY7L6DX0jbesDUg8m30FMb+IV5IN1N275RN
	1Q1re+vvRqJmeoLVYG3F0bbfrWfl/vyI34KqT3a2ilfV8t0XDvegthre+yEIXp+4Kf3WdOC7RV37T
	GuTuEBxbXuPd3UDTiNpi+28+TIxYev18KktJpxbxL/L2bWzcVgxXYKe6BU0hOKmLDSqrBgGpewPhN
	ETUPRLmfI+lhxskoga+cNv4LIQ0PuRXodVB8wbEP/60O7VyacwpCluS7r3YmLajNrxhC8+z/I3CS1
	cSVLNbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ2pr-001BEw-Nv; Wed, 03 Aug 2022 01:06:07 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ2pf-001B6M-To; Wed, 03 Aug 2022 01:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659488755; x=1691024755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2MupJwe/gULHtIjsCr/h/eqv3CTg1GXXXRhryy/IkU=;
  b=D2a3N4DhfmpvMoQ57OU3jWbscWzMx5TiaaN8RtuNsuRp0rvrwG00Pese
   bAk21xD61WOzpNn9sdCefZGbHNu75plj39p6Lm/SaZsB8BZlpbS2M9cXG
   mpVMaI69ygrxApGdlCznHSSmrBJR4dTHFQEENsY8lL3OqCVIeix4L5qfI
   oIO8RQZyj+FqDASSKaLKGz6mtDqHM/YXHPLb95cO9fBZ5Cc/RCvCBexHi
   9PNoz1uwdcMtbFhgLCBq11bVgVUzFmTPNn+DWBx7ifDpSmSVO9FDuDPRl
   mv4YlKMCfkdtOB5EQHozL0aUkjSDjAfzxMHLMcpGGQ4k5mPNEX7Y9zeUJ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269934326"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="269934326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 18:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="635493707"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2022 18:05:41 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ2pQ-000GdX-2t;
	Wed, 03 Aug 2022 01:05:40 +0000
Date: Wed, 3 Aug 2022 09:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Sean Wang <sean.wang@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] leds: mt6323: Get rid of custom
 led_init_default_state_get()
Message-ID: <202208030841.jfVsINQD-lkp@intel.com>
References: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802212537.7122-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_180556_011940_85D71A96 
X-CRM114-Status: GOOD (  13.82  )
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
config: x86_64-randconfig-a005-20220801 (https://download.01.org/0day-ci/archive/20220803/202208030841.jfVsINQD-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/30cc6458329b3d5a593e0d2173dc63d8dc6446f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/leds-mt6323-Get-rid-of-custom-led_init_default_state_get/20220803-052811
        git checkout 30cc6458329b3d5a593e0d2173dc63d8dc6446f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/leds/leds-mt6323.c:345:10: error: call to undeclared function 'led_init_default_state_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           state = led_init_default_state_get(of_fwnode_handle(np));
                   ^
   1 error generated.


vim +/led_init_default_state_get +345 drivers/leds/leds-mt6323.c

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

