Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B0BCD13DE
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DINtYNzLSNLJsPEK7cQoBruTAPacOE89tfe7CjOqFDc=; b=eHJ6jnuYqzoXCyQVhUWGMG97rH
	n78+IBNnevtOblAbLDlHoNBx2V95oxorTxt5jjwRwSKgnr3bVeqLiEZbQFQ4+DVfy3g+Gdieus/gm
	ZzeGsHi0nAKXoeBXjwkmBsGbZChZuUWwbf5BDz122Rh5t3k7sd3MaB+QBQkU7FBvubkdamTImdRSu
	tB2WnnfQY9Zj7irH7LMC6nxiFSRqHUmFFYDwf6HysmE3EusxR977j34cb05ZY+WN2J8UrFO4p1Fhg
	emSwXcXkD0IVbU6NFAsHM/d7NgmLQrKEi0vhlAf1tGoUq8NOJj6bw2UvLbiw3+3XRU3DUqSurHjBV
	rnU+eP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skQju-00000009drc-2VZI;
	Sat, 31 Aug 2024 16:14:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skQj0-00000009dm1-2tOR;
	Sat, 31 Aug 2024 16:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725120798; x=1756656798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V3PH/iwNcUY5XOXUetc7AOO6fwQ8F1FmwYao+OX2WxQ=;
  b=j2DFQofTwFlOBKzkd3HmQP2MZM5QT2UjyjmxWB+AgOG6JkzPyhL8E/Cl
   TRjmPdwGNBO16SMzwc1C9VF2c4A55NNk2MFwBmRhB1JPFDIZPsOdx40Vo
   Al4iqq+ByvJ9k+/4HG5WVTz2XP45SaEJNnXts3hbZMUKcpkTXrueQiO+c
   kvXnt3F8j2OKY6NbzsEVkWXhy4VU2Taxyv8rhyugSEPJ4i5R5jzJnDdQN
   x1PzuCgRkdr7gTpg/fzKpi+t0+6iPjzMRP65+hXfJmyOE22/xfTxzyaCi
   y57Ukto33ZWq1MMGL6j5j7hAqqWs3KAoZPYbCS5E+ZUUZcaFu9hknTui1
   Q==;
X-CSE-ConnectionGUID: rpswuTelQ0OLS5rJ+SrjSw==
X-CSE-MsgGUID: sJRpRDIFQpyCkrONDYA0/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23934306"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23934306"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:13:15 -0700
X-CSE-ConnectionGUID: Nxv4tAiMQmCtOKeyqJ/uoQ==
X-CSE-MsgGUID: tWREeUztRS6E15J6ZG+5AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64681651"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 09:13:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skQir-0002uM-2s;
	Sat, 31 Aug 2024 16:13:09 +0000
Date: Sun, 1 Sep 2024 00:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chunhui Li <chunhui.li@mediatek.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	Chunhui Li <chunhui.li@mediatek.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH] module: abort module loading when sysfs setup suffer
 errors
Message-ID: <202409010016.3XIFSmRA-lkp@intel.com>
References: <20240830054400.26622-1-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830054400.26622-1-chunhui.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_091318_767031_7C7D8EF1 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Chunhui,

kernel test robot noticed the following build errors:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunhui-Li/module-abort-module-loading-when-sysfs-setup-suffer-errors/20240830-134417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240830054400.26622-1-chunhui.li%40mediatek.com
patch subject: [PATCH] module: abort module loading when sysfs setup suffer errors
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240901/202409010016.3XIFSmRA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010016.3XIFSmRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010016.3XIFSmRA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/sysfs.c: In function 'mod_sysfs_setup':
>> kernel/module/sysfs.c:400:13: error: void value not ignored as it ought to be
     400 |         err = add_sect_attrs(mod, info);
         |             ^
   kernel/module/sysfs.c:404:13: error: void value not ignored as it ought to be
     404 |         err = add_notes_attrs(mod, info);
         |             ^


vim +400 kernel/module/sysfs.c

   370	
   371	int mod_sysfs_setup(struct module *mod,
   372			    const struct load_info *info,
   373				   struct kernel_param *kparam,
   374				   unsigned int num_params)
   375	{
   376		int err;
   377	
   378		err = mod_sysfs_init(mod);
   379		if (err)
   380			goto out;
   381	
   382		mod->holders_dir = kobject_create_and_add("holders", &mod->mkobj.kobj);
   383		if (!mod->holders_dir) {
   384			err = -ENOMEM;
   385			goto out_unreg;
   386		}
   387	
   388		err = module_param_sysfs_setup(mod, kparam, num_params);
   389		if (err)
   390			goto out_unreg_holders;
   391	
   392		err = module_add_modinfo_attrs(mod);
   393		if (err)
   394			goto out_unreg_param;
   395	
   396		err = add_usage_links(mod);
   397		if (err)
   398			goto out_unreg_modinfo_attrs;
   399	
 > 400		err = add_sect_attrs(mod, info);
   401		if (err)
   402			goto out_unreg_sect_attrs;
   403	
   404		err = add_notes_attrs(mod, info);
   405		if (err)
   406			goto out_unreg_notes_attrs;
   407	
   408		return 0;
   409	
   410	out_unreg_notes_attrs:
   411		remove_notes_attrs(mod);
   412	out_unreg_sect_attrs:
   413		remove_sect_attrs(mod);
   414	out_unreg_modinfo_attrs:
   415		module_remove_modinfo_attrs(mod, -1);
   416	out_unreg_param:
   417		module_param_sysfs_remove(mod);
   418	out_unreg_holders:
   419		kobject_put(mod->holders_dir);
   420	out_unreg:
   421		mod_kobject_put(mod);
   422	out:
   423		return err;
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

