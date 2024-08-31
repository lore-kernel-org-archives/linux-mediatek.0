Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E449CD13DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zP3Zre3k8XSa8rrhY7Lucqfo7vODznU125/mWsHj0NQ=; b=qunCfxO1HxR5oooqJazjCMp5+2
	PaNKwTOcizxN3Cm9y38jwTco6iEMsCFzYQJ+UPwsMMCyrV/b5cw1EWopibDf2qhIO09+C8Zj7g9WY
	sqY2qfc+CNrPToRszn5d5j5SXmE/Mzaa29iLAskFbBvQsoGwqSKQF33nMoruCUwIakCgVjtcOlmE8
	joU/N+gS/ZfeVxXK+qQ8DX55OS+p+UvG51NfFawLrC88LAYzUWPurLNhsNA91BzhnwLAziXaRTspf
	fcY8Vjv9UmtY3WW7EIc3K7XssYxw+UAI3Jc975ITQX8PKPsBkDePELn/Y5AehMQ+EpfHYmAYHw1aD
	fD8l3bXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skT9z-00000009s8P-0JEL;
	Sat, 31 Aug 2024 18:49:19 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skT94-00000009s0s-2tc2;
	Sat, 31 Aug 2024 18:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725130103; x=1756666103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vNLx4cr9O3aGVI+0EaJtBOHUEzDm0igOlyxGNzpMucA=;
  b=awsx4uXoV6WYU46CWWYtnrupKkBYuESvS0Gu+ggJBtezqx8b0TNoIpLC
   rde63YUrme/ZZ2dcUXnDpS+RL/ShEJ4VUPgDuC8OzIFq0icOD54MKMMmp
   gB8AHygJWHCuxpzP/DFnE/0gRckP6v5ohl5xff6uAODnhW0TfQV75NKaF
   yZl7XCFif+tdZITpVEO9MvfV47SQZgUvMyee1IcpY8EK/mvalrHjzn2tO
   VLSbvuJttiFsKwKyZ++YUiKOycO/1ItKzTtY8hs/1Czk3o3tUw9cj0pMJ
   nXdZFmH7yzieR6bCx+d6grrBASvhsFcRW7vsHD16U1kiUzJFa6ukv3udx
   g==;
X-CSE-ConnectionGUID: cvj2BbMSTH6UqNPK3u9uYA==
X-CSE-MsgGUID: eNs6D3i7SWeP+Io9/yCbYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23332627"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23332627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 11:48:18 -0700
X-CSE-ConnectionGUID: f4mjMjXfRJ+UWxJ+QP6Pfg==
X-CSE-MsgGUID: NfQMlSULQLSgc4c+LoHlng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="63815430"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2024 11:48:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skT8v-00030o-1V;
	Sat, 31 Aug 2024 18:48:13 +0000
Date: Sun, 1 Sep 2024 02:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chunhui Li <chunhui.li@mediatek.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	Chunhui Li <chunhui.li@mediatek.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH] module: abort module loading when sysfs setup suffer
 errors
Message-ID: <202409010209.FqYOzYEa-lkp@intel.com>
References: <20240830054400.26622-1-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830054400.26622-1-chunhui.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_114822_751396_6DC2ABA7 
X-CRM114-Status: GOOD (  12.79  )
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
config: powerpc-mpc834x_itx_defconfig (https://download.01.org/0day-ci/archive/20240901/202409010209.FqYOzYEa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010209.FqYOzYEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010209.FqYOzYEa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/module/sysfs.c:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/module/sysfs.c:400:6: error: assigning to 'int' from incompatible type 'void'
     400 |         err = add_sect_attrs(mod, info);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/sysfs.c:404:6: error: assigning to 'int' from incompatible type 'void'
     404 |         err = add_notes_attrs(mod, info);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


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

