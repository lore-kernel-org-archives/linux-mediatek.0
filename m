Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7661DC52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 19:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+MAicEDuppEKT8C20aRjXvQTCFY8F4lore/NUM53fk=; b=RGqWkmd3FnKVlx7mCqzRE9RV2s
	MNobJxrVFGR8wNXQvZubJly1RL5KQZYK6UHQ6V5z2/GYrXRNisqNdXQhxaitvUdr6+uwXs4Ag4CBw
	8W+NY5Y/ekuK0UVYB9PyHPd4vH2hez31ufZVDWP5oFJ5MJ8zEoLXuFqYuHBdV/RSZnxYxXBQXV0Rr
	/lCsMtSiuyboD5UFiy4FVeMBQWHFmLwTQ/fsXiD1MX+/cvxyA9c7SZA437GDTzIgkPrwrVIiDr4PP
	qateT2ImvYD9swkG0QTa3IyCyCYyW5I+/jTiUDYTfHwaS0Sp5+JjEoyhH9hG0J0Ugy7y1qV+vgtFR
	feb3pFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdwu7-00000004iXy-0wjW;
	Tue, 13 Aug 2024 19:09:59 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdwtU-00000004iPz-0Zfm;
	Tue, 13 Aug 2024 19:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723576161; x=1755112161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5yLTqYrEVFQBJuTrsiDLUVqVWQqyOnzlNTbvg0gBosQ=;
  b=VlwPovM7MzYGBcPE7iuE/UmZWGfBuavflDn4pu3FdC86hCUXAUJvlLvd
   kvVpftGvWWHAnJO2eJB1xS1Sbojef7Heise0KS0uGq9/paSpfStjM/GK/
   h89LeuJrWWHcndv+HkwprWLVsPuEbtDWLDkpwqPva20emnbEdTLMf2j6h
   r0iauezQ+l/J9VNnu4ESZk5R8dVDsqfUiZkBSoCV7MVVizZRZcRGSPCoh
   dtKzCehyPeprnlShEJpN10DuUQr2DBrF+OdPqBaFxfVl9La1X8sFJDLZv
   cLVdfkSd/j9TpIZB2oa+xKbRjmI6AH3MiEGF3vGGw7dCZI3xww8FlZPbA
   Q==;
X-CSE-ConnectionGUID: zJuuLAkuSgO9ZqjndVBuNg==
X-CSE-MsgGUID: wx2nlC66S1WOJNsG7/5I9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21907739"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="21907739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 12:05:41 -0700
X-CSE-ConnectionGUID: 6mYXJ2zMRLqwskgoE5g5gw==
X-CSE-MsgGUID: h8E2xQ/tSUCvLL31HYqiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="58754347"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2024 12:05:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdwpq-0000fW-1n;
	Tue, 13 Aug 2024 19:05:34 +0000
Date: Wed, 14 Aug 2024 03:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, eladwf@gmail.com, daniel@makrotopia.org,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Lin <chen45464546@163.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix memory leak in
 LRO rings release
Message-ID: <202408140256.AkgMaR7u-lkp@intel.com>
References: <20240812152126.14598-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812152126.14598-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_120920_241231_5DAF5CC6 
X-CRM114-Status: GOOD (  11.04  )
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

Hi Elad,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Yifee/net-ethernet-mtk_eth_soc-fix-memory-leak-in-LRO-rings-release/20240813-015755
base:   net/main
patch link:    https://lore.kernel.org/r/20240812152126.14598-1-eladwf%40gmail.com
patch subject: [PATCH net v2] net: ethernet: mtk_eth_soc: fix memory leak in LRO rings release
config: arm-randconfig-003-20240813 (https://download.01.org/0day-ci/archive/20240814/202408140256.AkgMaR7u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140256.AkgMaR7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140256.AkgMaR7u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_rx_put_buff':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:28: error: expected expression before 'unsigned'
    1768 |                 free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
         |                            ^~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:17: error: too few arguments to function 'free_pages'
    1768 |                 free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
         |                 ^~~~~~~~~~
   In file included from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:9:
   include/linux/gfp.h:372:13: note: declared here
     372 | extern void free_pages(unsigned long addr, unsigned int order);
         |             ^~~~~~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:42: error: expected ';' before 'data'
    1768 |                 free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
         |                                          ^~~~
         |                                          ;
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1767:9: warning: this 'else' clause does not guard... [-Wmisleading-indentation]
    1767 |         else
         |         ^~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:93: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
    1768 |                 free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
         |                                                                                             ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:93: error: expected statement before ')' token


vim +/unsigned +1768 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1759	
  1760	static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
  1761	{
  1762		if (ring->page_pool)
  1763			page_pool_put_full_page(ring->page_pool,
  1764						virt_to_head_page(data), napi);
  1765		else if (ring->frag_size <= PAGE_SIZE)
  1766			skb_free_frag(data);
> 1767		else
> 1768			free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
  1769	}
  1770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

