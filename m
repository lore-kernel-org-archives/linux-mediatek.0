Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809CC77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wuDAOPQ+IcuYra/XB7w83lfA0G7+zI32rxXt1SI1hs=; b=g5I4COYVGbCk3Tj3rTNolGhJAq
	KhW94z0HBbVg1OFVijbWFx1SdWAVxvtM0V/K1SrU1uiEgbLlL/Gy3IOwALLFA1Y+6tWQuaBq94Rgc
	uDSFm6HvJ8ks7bB4MutdW7LybN6h2X/4qcJF2lUU/GDZPlPqM+qJlA4bqhaKwuaRiRTM2MM4hA/b8
	fHIQBJsYUI0FJb3z0OBaIwi7W0wtX3oBYDSFptZ75SlYspcPnwQclZkbR41trOC20CSl44SaH4IQD
	XxU15Xw8NLOqgFL8mYodHUThkIJiq0KF/WefplMcdhx+qo0jeFRPVM/XGkyN54IFP/zOyQDYib9Mj
	qosY0h3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plzcA-00Fze2-1f;
	Mon, 10 Apr 2023 22:03:54 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plzc5-00Fzck-37
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 22:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681164229; x=1712700229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4W4Pk2ES5/ySuHySu5gOKD4o31qkgpk+oubIxxD38hs=;
  b=j/kA8wBR8hvw63VM85zWFEsbH+siq+jQKh5sT+GBJaKH8kU/rUNPNgy9
   EHruKWJUeVv+QZ9SFMC5Dc9bXsVYg7UQ8fKWmJMDlZbMPbnpCb22dtcsL
   w2nVPvwAOoaDaxkji++dWeHR+gHKp1ZW2dKJgk/pOvL9fs5Dr9UlwBztk
   /H0MohRG5+ImLCZnp0uwgjPSsWwiVcTV2EDINThpQYtlFTfHM3h9rtIma
   Fas5h4HKxq8ctT/g/8L2XIOYBHbdj1+lqSl9NvbAOmpPyB1Q/aadovIos
   CHuYdOOUFewKgt48Nx7LNtM4xxcUS9/Ir7KuEPLYZAZP9lQoOU9BcjI1s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371307982"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="371307982"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 15:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681854260"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="681854260"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Apr 2023 15:03:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plzbv-000Vgj-1i;
	Mon, 10 Apr 2023 22:03:39 +0000
Date: Tue, 11 Apr 2023 06:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, sean.wang@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
	km.lin@mediatek.com, jenhao.yang@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, ted.huang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, arowa@google.org,
	frankgor@google.com, kuabhs@google.com, druth@google.com,
	abhishekpandit@google.com, shawnku@google.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: fix kernel panic by accessing unallocated
 eeprom.data
Message-ID: <202304110556.xbu5H3ka-lkp@intel.com>
References: <c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_150350_016233_5782F53C 
X-CRM114-Status: GOOD (  11.51  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.3-rc6 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-mediatek-com/mt76-mt7921-fix-kernel-panic-by-accessing-unallocated-eeprom-data/20230411-043801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/c9e2a44da4daa00166c802a8c10527359358219d.1681158440.git.objelf%40gmail.com
patch subject: [PATCH] mt76: mt7921: fix kernel panic by accessing unallocated eeprom.data
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230411/202304110556.xbu5H3ka-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9825ad75cf770d2a15f7008eca476121b9b3d794
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/mt76-mt7921-fix-kernel-panic-by-accessing-unallocated-eeprom-data/20230411-043801
        git checkout 9825ad75cf770d2a15f7008eca476121b9b3d794
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110556.xbu5H3ka-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7921/mcu.c: In function 'mt7921_mcu_parse_eeprom':
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:22:40: warning: variable 'res' set but not used [-Wunused-but-set-variable]
      22 |         struct mt7921_mcu_eeprom_info *res;
         |                                        ^~~


vim +/res +22 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

23bdc5d8cadfc9 Ming Yen Hsieh   2022-09-07  18  
1c099ab44727c8 Sean Wang        2021-01-28  19  static int
1c099ab44727c8 Sean Wang        2021-01-28  20  mt7921_mcu_parse_eeprom(struct mt76_dev *dev, struct sk_buff *skb)
1c099ab44727c8 Sean Wang        2021-01-28  21  {
1c099ab44727c8 Sean Wang        2021-01-28 @22  	struct mt7921_mcu_eeprom_info *res;
1c099ab44727c8 Sean Wang        2021-01-28  23  
1c099ab44727c8 Sean Wang        2021-01-28  24  	if (!skb)
1c099ab44727c8 Sean Wang        2021-01-28  25  		return -EINVAL;
1c099ab44727c8 Sean Wang        2021-01-28  26  
fc6ee71a2a8f2d Lorenzo Bianconi 2022-06-20  27  	skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
1c099ab44727c8 Sean Wang        2021-01-28  28  
1c099ab44727c8 Sean Wang        2021-01-28  29  	res = (struct mt7921_mcu_eeprom_info *)skb->data;
1c099ab44727c8 Sean Wang        2021-01-28  30  
1c099ab44727c8 Sean Wang        2021-01-28  31  	return 0;
1c099ab44727c8 Sean Wang        2021-01-28  32  }
1c099ab44727c8 Sean Wang        2021-01-28  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

