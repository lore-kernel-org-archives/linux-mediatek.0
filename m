Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E39C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtoLeLnw76+1H9iYMXYf8yZpKErngBMqOf8KE3iIxek=; b=bDEsyVEBEtYilb
	F7zZ6xLTj+9yVYHbzSyWb8Lt37YPC+hW8LpYjG2jZbZbbVG0qAcEaOnyoSzvC/Q5BmW2QugM02PxL
	L3FBN18why06BcANP1URH0oNOlda2RCz/egK/1Jz3cIx3kGI8iMq6NnK1MXb74Kr5dap1g50pDmFD
	/x36AUVWxs3eDtm0x90UdrhxTrbF6VJ62ljrsg2puXUMLIybum5bTsQE4M1A1dM28+KLAjx/va6vj
	shM3CEqgSPH1RcoFvuVoVhTAaD0PWspYElZF9mrx3WVBEbIoNWHThzYIGLuKqO+p9pjVQx04QI10G
	igiRmskDg244qChaW4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwl9O-009dSm-G6; Mon, 13 Dec 2021 13:13:54 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwl9L-009dRi-Kl
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 13:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639401231; x=1670937231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fDvQIWLWTaRgRRLXSmGWq+oFnO4IwlflBxoU/HMSINU=;
 b=GhtSY4XiJiXJMdF8SeDueNfONlunzhbrA0lfqGZStzcUnL+ap2dARWFU
 00INLatFl35LykpaBX7BlgDXaLCN4QEVmU9fPvq3b7ss+L9X3l4PLe41I
 yZ0GXDnb7N9ghI6C2/IVXqMZ7zBMddEirmmMdoB4feoO4jPEeOBA6EW5L
 R9qIJbz8e/bMgN+zrZAaC/LUQ2gmYEZLkMbzp6m9fASE6MRO+hUCEpIyW
 AcvkXYSKGD6pGuE1RBTVU34vjfx2qE7YZTof6RUL9LNpp+FzviRhXorIg
 6gVInebVw42LC1B2IuZ7RKSkPrqXZHEfQnuXTsowsESqZu1TJ9Q8k259q w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="225587830"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="225587830"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 05:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="582910182"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2021 05:13:46 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwl9F-0006gS-Tj; Mon, 13 Dec 2021 13:13:45 +0000
Date: Mon, 13 Dec 2021 21:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: kbuild-all@lists.01.org, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Money Wang <Money.Wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 MeiChia Chiu <meichia.chiu@mediatek.com>
Subject: Re: [PATCH v3] mt76: mt7915: add mu-mimo and ofdma debugfs knobs
Message-ID: <202112132138.0tsPYnSZ-lkp@intel.com>
References: <20211213060309.28323-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213060309.28323-1-MeiChia.Chiu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_051351_756048_3F17D5B2 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi MeiChia,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvalo-wireless-drivers-next/master]
[also build test ERROR on kvalo-wireless-drivers/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/MeiChia-Chiu/mt76-mt7915-add-mu-mimo-and-ofdma-debugfs-knobs/20211213-140356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20211213/202112132138.0tsPYnSZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/91cb277e37dbed42e6b6aee256694204ba8d9a7f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review MeiChia-Chiu/mt76-mt7915-add-mu-mimo-and-ofdma-debugfs-knobs/20211213-140356
        git checkout 91cb277e37dbed42e6b6aee256694204ba8d9a7f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/pci/controller/pcie-mt7621.o
>> ERROR: modpost: "__udivdi3" [drivers/net/wireless/mediatek/mt76/mt7915/mt7915e.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/net/wireless/mediatek/mt76/mt7915/mt7915e.ko] undefined!
ERROR: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.ko] undefined!
ERROR: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
