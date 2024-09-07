Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A35EB64C5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXsH5LJvJPjfl8LGQ3kA9ZngC/lDzclfCxCSocPAMtg=; b=3w9cb499gNFJYbTrf0TJCAt3Hm
	1jq4GyOOGPTMWeP5clU4G3yFzXmWmWjqPKWK7HfWB5CtQmoWCsqtG8KDfKqZZuL9IseBSXBv5SEpq
	GrZKXRgsjQlODdcdQOFDhqIr8QrFgUbYkxxZcT1t5jufwhmYPtCMfHVGx5onZFK7/3Gr/T+MFrgcy
	oJYQrn2vSics+7j30ga1BoKmJkPNSaQeXpKSW9yCVojB7GkYwRv08TivlpuNV+2YyRwdSNUf9MVL0
	q5YJOisvN00FnqVdsyioAOk69WeYxk4NkYYBsTqnw8Bbasi0f4x2cLWzzSx67EPOKp6ev5Pxxx/cW
	wXeXVbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smv0f-0000000F2F6-3Igj;
	Sat, 07 Sep 2024 12:57:49 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuzd-0000000F24L-2JCQ;
	Sat, 07 Sep 2024 12:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725713805; x=1757249805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XWYeBfU9YGlnAP8uvAzhTiWCBSzhyADF+d3tbeOseH4=;
  b=Wp7UEZn6XZITwITVtGtiWBmVxYOoehE83oZVzCVNHaKg0vA8CEzxSyWo
   vQgppZK8AvtB6TUW6+TjOh5LwpsbQKLoOXFfWuVxursPmmBk+Lbp4gv32
   8wAKyk6vZMzcjLeLlsg17ZxvyHz+Zx5LndHy1xinJ+VkaJ2fFqVI/RUow
   7ioS53qgN9iTHG6S7jy7+HrgC8OxdldkA7tuaA8/R2W1DIRzBCutXHipR
   LYbfBApPk1ds8GfuRWcIPas4C08Gr7fBkRBz+PPLnquAcDukd6AkF6fJd
   Io1qc0Fimc6BQV0kx44OTTTlZCrEDfNiVxpucxwfRB6fE+o+w8r6YPhhv
   g==;
X-CSE-ConnectionGUID: jeNXcfNxR42k+bYCcpZMew==
X-CSE-MsgGUID: gVYCkNsUTbSlUmQoT9dCYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35842484"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35842484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 05:56:40 -0700
X-CSE-ConnectionGUID: X+D8WBqzQfqefupHhO11nw==
X-CSE-MsgGUID: 9ZBObMzMRZW6VWhwoT8HHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="65850074"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2024 05:56:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smuzT-000CYn-0u;
	Sat, 07 Sep 2024 12:56:35 +0000
Date: Sat, 7 Sep 2024 20:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chunhui Li <chunhui.li@mediatek.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	Chunhui Li <chunhui.li@mediatek.com>,
	Petr Pavlu <petr.pavlu@suse.com>, kernel test robot <lkp@intel.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH v3 1/1] module: abort module loading when sysfs setup
 suffer errors
Message-ID: <202409072018.qfEzZbO7-lkp@intel.com>
References: <20240906115748.5367-2-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906115748.5367-2-chunhui.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_055645_621433_FEFDCE25 
X-CRM114-Status: GOOD (  12.63  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunhui-Li/module-abort-module-loading-when-sysfs-setup-suffer-errors/20240907-000002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240906115748.5367-2-chunhui.li%40mediatek.com
patch subject: [PATCH v3 1/1] module: abort module loading when sysfs setup suffer errors
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240907/202409072018.qfEzZbO7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072018.qfEzZbO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072018.qfEzZbO7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/module/sysfs.c: In function 'add_sect_attrs':
>> kernel/module/sysfs.c:232:67: warning: no return statement in function returning non-void [-Wreturn-type]
     232 | static inline int add_sect_attrs(struct module *mod, const struct load_info *info) { }
         |                                                                   ^~~~~~~~~
   kernel/module/sysfs.c: In function 'add_notes_attrs':
   kernel/module/sysfs.c:234:68: warning: no return statement in function returning non-void [-Wreturn-type]
     234 | static inline int add_notes_attrs(struct module *mod, const struct load_info *info) { }
         |                                                                    ^~~~~~~~~


vim +232 kernel/module/sysfs.c

   230	
   231	#else /* !CONFIG_KALLSYMS */
 > 232	static inline int add_sect_attrs(struct module *mod, const struct load_info *info) { }
   233	static inline void remove_sect_attrs(struct module *mod) { }
   234	static inline int add_notes_attrs(struct module *mod, const struct load_info *info) { }
   235	static inline void remove_notes_attrs(struct module *mod) { }
   236	#endif /* CONFIG_KALLSYMS */
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

