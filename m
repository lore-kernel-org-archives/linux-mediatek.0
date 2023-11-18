Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ECBC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mpiRk0hqonbJP/EF4rra61GK0dhUE8tYR3c/qT4TLE=; b=tjRZ+z2ZR4wUNBeyeoz6mY4MF6
	s2FP2I88ufX8jLWVabrA0K8BXHiljx5dCEPLk9/jm+MqbaG16EO6KgL7hAaXXmpC0sXV4PESvUgqc
	NJVgBYYDSsByCuDe/A4Kz+Zoj6NEaGDvGH/2/5rYqfvpl5fLcrWbKRYvS5N4ghwv6GY4Ayc0b5tBH
	b6oJtTYwu5kztIOgwQ2YjftIlkwdWaWyDO//ZrBpHRMzqkHpmy0N4rQsQfFQG30ZuYifv1KoNAroD
	8OsyT2a6n24iM3Lv5+1KsBFyRbzUh2TALI1g7f0cyObJp+Q/ZjAXZU5lnt0+5V1N1quZxFIfKYdYI
	IKyqykUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Lc0-008Zh6-0L;
	Sat, 18 Nov 2023 13:43:52 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4Lbv-008ZgP-2x;
	Sat, 18 Nov 2023 13:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700315027; x=1731851027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/M5S0nC2Rw3WJg/Loza0Avq02rrTZUsNGGN6T9wjHo=;
  b=lxaoD4l1bgGSrb3XOkunyZva+dw/84XUOw3zbC25zrWxYbjU3KImzUfe
   ib9z99MgOTwLKkkbCk68ATuNi2vtFZc8Qf1kjyA/ijSaa0Dxd4Y10/e4+
   DOMmcFHTPwVXogAlNwNAqh6nzAlRvOnqYTQMJsnl/mO2qPeiPLmER+e3q
   vBENhMB3bT5/7v5LPv+zjTCF7m5Wv+9mkvL89jola+XASYyFxwA7ATbSK
   VJVH4/1y41A+XvfD0+6CwKhmz9fgvm4TZxGWm3Y+s8hQ0cgu5Is798AkU
   aDqxrj4FyOCvXlaA1WR1MrZSVWi9rgZ8OfqUF521YljDWlqq0AieOLzro
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371604285"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="371604285"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 05:43:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759414040"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="759414040"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Nov 2023 05:43:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Lbk-0003x2-1d;
	Sat, 18 Nov 2023 13:43:36 +0000
Date: Sat, 18 Nov 2023 21:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>,
	Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v7 09/16] virt: geniezone: Add irqfd support
Message-ID: <202311182112.B1KM0yj9-lkp@intel.com>
References: <20231116152756.4250-10-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116152756.4250-10-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_054347_989288_CB3A5895 
X-CRM114-Status: GOOD (  16.35  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc1 next-20231117]
[cannot apply to arm64/for-next/core robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20231116-233442
base:   linus/master
patch link:    https://lore.kernel.org/r/20231116152756.4250-10-yi-de.wu%40mediatek.com
patch subject: [PATCH v7 09/16] virt: geniezone: Add irqfd support
config: arm64-randconfig-r081-20231118 (https://download.01.org/0day-ci/archive/20231118/202311182112.B1KM0yj9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311182112.B1KM0yj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182112.B1KM0yj9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c: In function 'gzvm_irqfd_assign':
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:185:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     185 |         eventfd = eventfd_ctx_fileget(f.file);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   eventfd_ctx_fdget
>> arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c:185:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     185 |         eventfd = eventfd_ctx_fileget(f.file);
         |                 ^
   cc1: some warnings being treated as errors


vim +185 arch/arm64/geniezone/../../../drivers/virt/geniezone/gzvm_irqfd.c

   160	
   161	static int gzvm_irqfd_assign(struct gzvm *gzvm, struct gzvm_irqfd *args)
   162	{
   163		struct gzvm_kernel_irqfd *irqfd, *tmp;
   164		struct fd f;
   165		struct eventfd_ctx *eventfd = NULL;
   166		int ret;
   167		int idx;
   168	
   169		irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL_ACCOUNT);
   170		if (!irqfd)
   171			return -ENOMEM;
   172	
   173		irqfd->gzvm = gzvm;
   174		irqfd->gsi = args->gsi;
   175	
   176		INIT_LIST_HEAD(&irqfd->list);
   177		INIT_WORK(&irqfd->shutdown, irqfd_shutdown);
   178	
   179		f = fdget(args->fd);
   180		if (!f.file) {
   181			ret = -EBADF;
   182			goto out;
   183		}
   184	
 > 185		eventfd = eventfd_ctx_fileget(f.file);
   186		if (IS_ERR(eventfd)) {
   187			ret = PTR_ERR(eventfd);
   188			goto fail;
   189		}
   190	
   191		irqfd->eventfd = eventfd;
   192	
   193		/*
   194		 * Install our own custom wake-up handling so we are notified via
   195		 * a callback whenever someone signals the underlying eventfd
   196		 */
   197		init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
   198		init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
   199	
   200		spin_lock_irq(&gzvm->irqfds.lock);
   201	
   202		ret = 0;
   203		list_for_each_entry(tmp, &gzvm->irqfds.items, list) {
   204			if (irqfd->eventfd != tmp->eventfd)
   205				continue;
   206			/* This fd is used for another irq already. */
   207			pr_err("already used: gsi=%d fd=%d\n", args->gsi, args->fd);
   208			ret = -EBUSY;
   209			spin_unlock_irq(&gzvm->irqfds.lock);
   210			goto fail;
   211		}
   212	
   213		idx = srcu_read_lock(&gzvm->irq_srcu);
   214	
   215		list_add_tail(&irqfd->list, &gzvm->irqfds.items);
   216	
   217		spin_unlock_irq(&gzvm->irqfds.lock);
   218	
   219		vfs_poll(f.file, &irqfd->pt);
   220	
   221		srcu_read_unlock(&gzvm->irq_srcu, idx);
   222	
   223		/*
   224		 * do not drop the file until the irqfd is fully initialized, otherwise
   225		 * we might race against the EPOLLHUP
   226		 */
   227		fdput(f);
   228		return 0;
   229	
   230	fail:
   231		if (eventfd && !IS_ERR(eventfd))
   232			eventfd_ctx_put(eventfd);
   233	
   234		fdput(f);
   235	
   236	out:
   237		kfree(irqfd);
   238		return ret;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

