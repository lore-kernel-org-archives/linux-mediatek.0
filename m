Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98CCC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYn5o6MTCl+kR8xQeqOfDTAl9QCVyoyCsDwxcpnn9Yg=; b=4MPD8fFHNTzaVm+1QH83Y7dxOE
	KBDGY+j8xGEJfbjBbBimmMFnGOl4ZtoIiKZ28HMxGP1vyMtT7wLq/2o9iq3FEvbDNrhdqRCAZjYF4
	vs12b+QUKmwP+quRsuc8zYHpjpHBPUQcoDMyr3ibasF1ydhUhGMRMGvrmjxlqIPQKqIZ75I17UhAJ
	iONncJau/2FCpjgHY2LUBMocmxrRYzXXi+Os+sdklpHHTevZXS39bzzqUZtJIe9aPg1aFq5m9B51o
	p/SVEc0v7xCbNMBc0vr97PZTBHL3dkwzCQNfRo6uqOaGuA35bqhyZRgRg99HFcVdI/nWDO2Hj25sL
	9bOjgCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUNo-00BhP7-1T;
	Fri, 28 Apr 2023 20:07:56 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUNj-00BhNm-1h;
	Fri, 28 Apr 2023 20:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682712471; x=1714248471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PRZUzl2+jUQ5/3Y8Iv0j6iOFtZtJybzPsYUqZNHp0vc=;
  b=MSBIiQPkbfQPaJzyGnqRjxkZm/3ZKv1ZD2RpL/VydHJleUCtNICM2U69
   Shk5AgRZEUn6tZFdmtqxIc0hAwU97L+rR8lCCoLM2ZtA0Pihay9Tr4Cdt
   qrDE960pN47a0GXgjgUDaf4FqbvLj1fea29nIcatCeUF4l58WE4XvjcC0
   pe1ATTByqB64toH38aqjOoCwm8PTPdQYi/0ogi/3nf8icaW9m8JRfI5YA
   coj+RRY4TKreUJcsbVB2Z/KbosBfx2a6/zyUek8UQwQKHAUu8dsSTEvcr
   XYyJayM0N02zY60E5Prz0LN+DmmJB5Eoaok5A01t+iXXoyytvRSQh+7U7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346616665"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="346616665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 13:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="838971503"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="838971503"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 13:07:43 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psUNa-0000er-12;
	Fri, 28 Apr 2023 20:07:42 +0000
Date: Sat, 29 Apr 2023 04:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v2 3/7] virt: geniezone: Introduce GenieZone hypervisor
 support
Message-ID: <202304290334.fCw7PKYU-lkp@intel.com>
References: <20230428103622.18291-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428103622.18291-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_130751_581425_13758976 
X-CRM114-Status: GOOD (  16.88  )
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

Hi Yi-De,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on robh/for-next arnd-asm-generic/master linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230428103622.18291-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v2 3/7] virt: geniezone: Introduce GenieZone hypervisor support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304290334.fCw7PKYU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0e3f05a6e4547eb309032d047115a47d8f59641d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
        git checkout 0e3f05a6e4547eb309032d047115a47d8f59641d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/geniezone/ drivers/virt/geniezone/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290334.fCw7PKYU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/geniezone/gzvm_arch.c:112:5: warning: no previous prototype for 'gzvm_vm_arch_enable_cap' [-Wmissing-prototypes]
     112 | int gzvm_vm_arch_enable_cap(struct gzvm *gzvm, struct gzvm_enable_cap *cap,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a0' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a1' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a2' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a3' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a4' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a5' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a6' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a7' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'res' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/gzvm_arch.c:24: warning: expecting prototype for geniezone_hypercall_wrapper(). Prototype was for gzvm_hypcall_wrapper() instead
   arch/arm64/geniezone/gzvm_arch.c:133: warning: Function parameter or member 'gzvm' not described in 'gzvm_vm_ioctl_get_pvmfw_size'
   arch/arm64/geniezone/gzvm_arch.c:133: warning: Function parameter or member 'cap' not described in 'gzvm_vm_ioctl_get_pvmfw_size'
   arch/arm64/geniezone/gzvm_arch.c:133: warning: Function parameter or member 'argp' not described in 'gzvm_vm_ioctl_get_pvmfw_size'
   arch/arm64/geniezone/gzvm_arch.c:155: warning: Function parameter or member 'gzvm' not described in 'gzvm_vm_ioctl_cap_pvm'
   arch/arm64/geniezone/gzvm_arch.c:155: warning: Function parameter or member 'cap' not described in 'gzvm_vm_ioctl_cap_pvm'
   arch/arm64/geniezone/gzvm_arch.c:155: warning: Function parameter or member 'argp' not described in 'gzvm_vm_ioctl_cap_pvm'


vim +/gzvm_vm_arch_enable_cap +112 arch/arm64/geniezone/gzvm_arch.c

    13	
    14	/**
    15	 * geniezone_hypercall_wrapper()
    16	 *
    17	 * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
    18	 */
    19	static int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
    20					unsigned long a2, unsigned long a3,
    21					unsigned long a4, unsigned long a5,
    22					unsigned long a6, unsigned long a7,
    23					struct arm_smccc_res *res)
  > 24	{
    25		arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
    26		return gz_err_to_errno(res->a0);
    27	}
    28	
    29	int gzvm_arch_probe(void)
    30	{
    31		struct arm_smccc_res res;
    32	
    33		arm_smccc_hvc(MT_HVC_GZVM_PROBE, 0, 0, 0, 0, 0, 0, 0, &res);
    34		if (res.a0 == 0)
    35			return 0;
    36	
    37		return -ENXIO;
    38	}
    39	
    40	int gzvm_arch_set_memregion(gzvm_id_t vm_id, size_t buf_size,
    41				    phys_addr_t region)
    42	{
    43		struct arm_smccc_res res;
    44	
    45		return gzvm_hypcall_wrapper(MT_HVC_GZVM_SET_MEMREGION, vm_id,
    46					    buf_size, region, 0, 0, 0, 0, &res);
    47	}
    48	
    49	static int gzvm_cap_arm_vm_ipa_size(void __user *argp)
    50	{
    51		__u64 value = CONFIG_ARM64_PA_BITS;
    52	
    53		if (copy_to_user(argp, &value, sizeof(__u64)))
    54			return -EFAULT;
    55	
    56		return 0;
    57	}
    58	
    59	int gzvm_arch_check_extension(struct gzvm *gzvm, __u64 cap, void __user *argp)
    60	{
    61		int ret = -EOPNOTSUPP;
    62	
    63		switch (cap) {
    64		case GZVM_CAP_ARM_PROTECTED_VM: {
    65			__u64 success = 1;
    66	
    67			if (copy_to_user(argp, &success, sizeof(__u64)))
    68				return -EFAULT;
    69			ret = 0;
    70			break;
    71		}
    72		case GZVM_CAP_ARM_VM_IPA_SIZE: {
    73			ret = gzvm_cap_arm_vm_ipa_size(argp);
    74			break;
    75		}
    76		default:
    77			ret = -EOPNOTSUPP;
    78		}
    79	
    80		return ret;
    81	}
    82	
    83	/**
    84	 * gzvm_arch_create_vm()
    85	 *
    86	 * Return:
    87	 * * positive value	- VM ID
    88	 * * -ENOMEM		- Memory not enough for storing VM data
    89	 */
    90	int gzvm_arch_create_vm(void)
    91	{
    92		struct arm_smccc_res res;
    93		int ret;
    94	
    95		ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_CREATE_VM, 0, 0, 0, 0, 0, 0, 0,
    96					   &res);
    97	
    98		if (ret == 0)
    99			return res.a1;
   100		else
   101			return ret;
   102	}
   103	
   104	int gzvm_arch_destroy_vm(gzvm_id_t vm_id)
   105	{
   106		struct arm_smccc_res res;
   107	
   108		return gzvm_hypcall_wrapper(MT_HVC_GZVM_DESTROY_VM, vm_id, 0, 0, 0, 0,
   109					    0, 0, &res);
   110	}
   111	
 > 112	int gzvm_vm_arch_enable_cap(struct gzvm *gzvm, struct gzvm_enable_cap *cap,
   113				    struct arm_smccc_res *res)
   114	{
   115		return gzvm_hypcall_wrapper(MT_HVC_GZVM_ENABLE_CAP, gzvm->vm_id,
   116					   cap->cap, cap->args[0], cap->args[1],
   117					   cap->args[2], cap->args[3], cap->args[4],
   118					   res);
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

