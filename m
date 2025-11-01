Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D0CCFA02
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Nov 2025 16:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuGjjjSjK8IaKx5rRtQgI8Ir6Gzcng8H/sLW7BrpgEw=; b=DgIu6hzr4ub9mWf+ki3uQZapYD
	P/FvQfMFKa2lkaIOdhJ0xAb5GTpPdmTMUuNowyvmhW4vTg/pRid4bH2kLMxLpEUf0DVglVstGy6LU
	FQa5Z31EQDLI/b1Fw5+EFJSr0iGH1/e6c+EgNhOmrXGEsbsJ6xArEW0CkYxSiReB8eBX7fbXwyd5+
	PWhTe6P6zonjhK/IgSKP1tFyLUBTISH5EeywTPRXMr+WXKX2TW7Y26MPdnoDvGfUvBjD/w11iBF7A
	xW20FpGQRgVRCSa9Ay/6wy3Ez+yzxCgzByB+F3QPEgp+DOUpvWpQ47GQ8KjiwR43Lvnr3JEYp06AJ
	p7LQTwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFERH-00000007vor-0CHN;
	Sat, 01 Nov 2025 16:26:51 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFERE-00000007voR-0YtB
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Nov 2025 16:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762014408; x=1793550408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LbTS5vdDEMlW/mplJsre4KeS5Vs1/FS7/QL071Ph3tQ=;
  b=P7KidnX8VlYbIGf9P7CEuFLq8lE+W2Ccm5rHGVS4BWXhMvZG10YyDtKU
   8faeqHgdMS28Hh19I3D1yyGa2ERZJuWkXDnFuursbUHeA7cdiAHupEFBU
   GEzj+h2ckTxVKBo4HlJIXwhulRYB8tvQU36FEbhcaJ9KbRYQAbYGnEIiJ
   ueEdpLZJ0IqQXprLyybS9ucjIFX14f3gln6plBpmo3H6zusHc37uQtjZs
   HtC2ygwu6Y95aFL7RPuxuNdG+9HfS4Nv99X/CpaLs+PaMwFI6IaFBJQiR
   VBIzWq9WCroEYMKFQisDqa584fztKJzj6OAf5B4tT9A/D84TC5HxUSVzk
   w==;
X-CSE-ConnectionGUID: dP2f3Pm9S86R8bH4Njpo8w==
X-CSE-MsgGUID: JTab+W3/SWOwGAOSJyXsRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74757330"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="74757330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 09:26:48 -0700
X-CSE-ConnectionGUID: jgtXkozeSnyPeHK3bz/SEA==
X-CSE-MsgGUID: chY1btWiTxGTiqzguQB6sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186440363"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 09:26:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFER8-000OT6-2N;
	Sat, 01 Nov 2025 16:26:42 +0000
Date: Sun, 2 Nov 2025 00:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big
 Endian
Message-ID: <202511020028.smeiQhNk-lkp@intel.com>
References: <20251027171759.1484844-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027171759.1484844-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_092648_184332_AF7A9AA9 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/wifi-mt76-mmio_-read-write-_copy-byte-swap-when-on-Big-Endian/20251028-012349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20251027171759.1484844-1-cjd%40cjdns.fr
patch subject: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
config: loongarch-randconfig-r111-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020028.smeiQhNk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020028.smeiQhNk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020028.smeiQhNk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse: sparse: cast from restricted __le32
>> drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse:     expected unsigned int [usertype] value
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse:     got restricted __le32 [usertype]
   drivers/net/wireless/mediatek/mt76/mmio.c:63:23: sparse: sparse: cast to restricted __le32

vim +41 drivers/net/wireless/mediatek/mt76/mmio.c

    32	
    33	static void mt76_mmio_write_copy_portable(void __iomem *dst,
    34						  const u8 *src, int len)
    35	{
    36		__le32 val;
    37		int i = 0;
    38	
    39		for (i = 0; i < ALIGN(len, 4); i += 4) {
    40			memcpy(&val, src + i, sizeof(val));
  > 41			writel(cpu_to_le32(val), dst + i);
    42		}
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

