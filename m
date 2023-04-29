Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A820C77B60
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Apr 2023 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUN4WREL5M7QvpRpDKpjnXXAVjPocOYt+z85I6qis+k=; b=zfO5WF+JHKtQ4MsJq6PQ6l5SPS
	CvNv5fmqzFhf+pPhw3yaui8I73F1IfnTmogLsmebeG0sjveTPQ8pQODxRF1PUcywydTNr8QV1KS/n
	NRt8IAq7GlQrjqo/klhSbTWBLzIi4M8RMYLpT9THwPtGJBoT5mdJ1sKd5/yg17RzsQmElVtW0xHwx
	WbIu4SvezqidNUw4SoZOZ4MjzqCJh+SCIahVLxUmX2hbrhwRy5iQVtWDsE8CRBBThZKwnV1F+V7el
	G3yU4dQZMxg8kcyEACdnR4/1ck0B8DZ5rh1dLPvXxL3UyxQ/+b6raTtvbTNqXy8hHTF1Pfl8Pgmu2
	E+gi/zsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pseAq-00CKGD-2F;
	Sat, 29 Apr 2023 06:35:12 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pseAm-00CKER-29;
	Sat, 29 Apr 2023 06:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682750108; x=1714286108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9QMrfHmB3IlGnj2ZKNRmcbudyqMRVvUMmyJ4H/dCOm0=;
  b=NHSZwgSkc62Moo/kQIdkURGVNUhjUaWZ4hp9U3pH1ghUPC8ZA07zH2wb
   /hfAr2I59nqbKuzXi0VnVZw2oWqMH2vYGUd/ig73LBmpdE1sFuxOYCBWD
   /ZQFcUYXIFQLw/7oaqU98LyWtLaUdoPxfApyYrxXYx9fs9lgFXBx04a/N
   roCfvYVuwOXBtCOt2LiMhDC+Txeu342vD4+lktgNa2XTm/HgxIymPOYJd
   ycJZYlT3yZ8nVpg2f9dwrHWLSRYpvirM1ico8gPV1AxBVJjFDfAp58syI
   lMCj090duoH+3y0vNLAraK51jRKgxoFiSFRQHjp1jf+9GZ0DA/bMjtHyD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="328254576"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="328254576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 23:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="1024923249"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="1024923249"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2023 23:34:56 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pseAZ-0000xX-1N;
	Sat, 29 Apr 2023 06:34:55 +0000
Date: Sat, 29 Apr 2023 14:34:39 +0800
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
Subject: Re: [PATCH v2 4/7] virt: geniezone: Add vcpu support
Message-ID: <202304291412.EiKEO9uy-lkp@intel.com>
References: <20230428103622.18291-5-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428103622.18291-5-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_233508_720589_82D5C15C 
X-CRM114-Status: GOOD (  13.39  )
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
patch link:    https://lore.kernel.org/r/20230428103622.18291-5-yi-de.wu%40mediatek.com
patch subject: [PATCH v2 4/7] virt: geniezone: Add vcpu support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304291412.EiKEO9uy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d4ced06ba2f149b099e9bf745a0e451c43e9d823
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
        git checkout d4ced06ba2f149b099e9bf745a0e451c43e9d823
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291412.EiKEO9uy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_vcpu.c:145:6: warning: no previous prototype for 'gzvm_destroy_vcpu' [-Wmissing-prototypes]
     145 | void gzvm_destroy_vcpu(struct gzvm_vcpu *vcpu)
         |      ^~~~~~~~~~~~~~~~~


vim +/gzvm_destroy_vcpu +145 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_vcpu.c

   143	
   144	/* caller must hold the vm lock */
 > 145	void gzvm_destroy_vcpu(struct gzvm_vcpu *vcpu)
   146	{
   147		if (!vcpu)
   148			return;
   149	
   150		gzvm_arch_destroy_vcpu(vcpu->gzvm->vm_id, vcpu->vcpuid);
   151		/* clean guest's data */
   152		memset(vcpu->run, 0, GZVM_VCPU_RUN_MAP_SIZE);
   153		free_pages_exact(vcpu->run, GZVM_VCPU_RUN_MAP_SIZE);
   154		kfree(vcpu);
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

