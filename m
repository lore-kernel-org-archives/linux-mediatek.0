Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BCFC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoNrg34kc+6lem2kMar0uYOihFZSJhPiBifZFvTS5g0=; b=AbFl8OYRH26x2G8MhCDKJegDwf
	0BxgHQy74gnBaGee69RqSzoKiqk9OQQbdrkPSTrQgBJ4Ci+jJfQq3XbUggoj6Fxgaz1Cjzov/h2SH
	b7FkqaVtbuZ8i19XnnZ+bAUbsZtN9teCjSy66ysdq6OXZGJhDv6Z+eb/OpzjV4JST9Y3IztVcSIvn
	2F6oDJv6DTj5K5CqTjTaagXc0uwurpbS9JfYe9Pp7SK1S8izczCFC42aSt0ANe5B6Zubd6QVjfzyG
	H7DeROWJawcVWSiw2XT2gNANL6vhFYCSBrhJGsOLwgO/PPAPlYnkpPM7v4c5NmqLbVEqEQYtOcd6G
	/ZAOZEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwIJ-0069uS-0y;
	Thu, 13 Apr 2023 12:43:19 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwIE-0069tM-2E;
	Thu, 13 Apr 2023 12:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681389793; x=1712925793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AUmRE/yebNXpdkid5N0KqFC4R4ByzvArot+xXbENuPM=;
  b=LIeJTh9VK0cCdpLMCF4UUPJa09/Q4WensQUeQu3hWV7CHmWxbSIqrhCA
   XnalD0+gLX9nShW8p0WYbSIuEzpSwTnqe6gih8daj0cTnCpcxYwjd+Smz
   K+Y/eYDroCmNP2xaue4tIFYzp9kqPuUpx5ddrKdLWW8u3zQhzuUdFZwgD
   z/FXMWQluiIsOkMgc14zydqX73mCZ7+VOhBeIGikeZPc9bVc7LQMk4n7X
   bwU0qHfiWqnj1Bgk9hd6ep50NiC1830L5PQ0on4xYdIAe2Nz+fIzIMckc
   MHid3F/xoYs/tFAFGVOhpqblxtuPBqt4mlCg2jyI97d3KX2gPkt2zpLUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342916938"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="342916938"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 05:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800801980"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="800801980"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 05:42:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmwHo-000YgZ-2M;
	Thu, 13 Apr 2023 12:42:48 +0000
Date: Thu, 13 Apr 2023 20:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jades Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Yi-De Wu <yi-de.wu@mediatek.com>
Subject: Re: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce
 GenieZone hypervisor support
Message-ID: <202304132051.wGFK08qz-lkp@intel.com>
References: <20230413090735.4182-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413090735.4182-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_054314_746252_730FFF76 
X-CRM114-Status: GOOD (  14.97  )
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

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next arm64/for-next/core lwn/docs-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230413090735.4182-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce GenieZone hypervisor support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304132051.wGFK08qz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d01949ddd48b1bc2cc9849154afe60781068f39
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
        git checkout 2d01949ddd48b1bc2cc9849154afe60781068f39
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/mediatek/virt/geniezone/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132051.wGFK08qz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/virt/geniezone/gzvm_vm.c:31:5: warning: no previous prototype for 'gzvm_gfn_to_pfn_memslot' [-Wmissing-prototypes]
      31 | int gzvm_gfn_to_pfn_memslot(struct gzvm_memslot *memslot, u64 gfn, u64 *pfn)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/gzvm_gfn_to_pfn_memslot +31 drivers/soc/mediatek/virt/geniezone/gzvm_vm.c

    19	
    20	
    21	/**
    22	 * @brief Translate gfn (guest ipa) to pfn (host pa), result is in @pfn
    23	 *
    24	 * Leverage KVM's `gfn_to_pfn_memslot`. Because `gfn_to_pfn_memslot` needs
    25	 * kvm_memory_slot as parameter, this function populates necessary fileds
    26	 * for calling `gfn_to_pfn_memslot`.
    27	 *
    28	 * @retval 0 succeed
    29	 * @retval -EFAULT failed to convert
    30	 */
  > 31	int gzvm_gfn_to_pfn_memslot(struct gzvm_memslot *memslot, u64 gfn, u64 *pfn)
    32	{
    33		hfn_t __pfn;
    34		struct kvm_memory_slot kvm_slot = {0};
    35	
    36		kvm_slot.base_gfn = memslot->base_gfn;
    37		kvm_slot.npages = memslot->npages;
    38		kvm_slot.dirty_bitmap = NULL;
    39		kvm_slot.userspace_addr = memslot->userspace_addr;
    40		kvm_slot.flags = memslot->flags;
    41		kvm_slot.id = memslot->slot_id;
    42		kvm_slot.as_id = 0;
    43	
    44		__pfn = gfn_to_pfn_memslot(&kvm_slot, gfn);
    45		if (is_error_noslot_pfn(__pfn)) {
    46			*pfn = 0;
    47			return -EFAULT;
    48		}
    49	
    50		*pfn = __pfn;
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

