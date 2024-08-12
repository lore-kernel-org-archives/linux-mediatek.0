Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C478C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 04:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9J5b2BcNeGCesNN7Tm4gY7EeEkTiSkwOKc5myjsVrI=; b=rEJj1iJVzG9L/pFgufdmcH6UO6
	0jZVqN05FuXr4QVR+QnbcRMsRtJBJV0TaQ9z7dfYX7GpEBogqPReagytgwSZ45XYpQkilZXzeOz26
	PTK+lTS3+HGTuhVF63umzQDvupCDbqo40rF9CoNdWJTXS8M3Gu65b0KPZtV/3RjPiPSMOZfVHf0ei
	6Wi38AmvHCl10JOHTcxgehoCYZWNY84kIqsNNVWKTcTo3lswYbnxQuYyxYqhHytWtYGooWufz9ibe
	urxK6/hRfOHPZ3X839rkgi2ePIF55/+yr1JpZiSeZmfvNIXPP3onkcp/rWo9dyB6AvhjRpwcIcDHH
	zWtcwyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdMbc-0000000Gqhr-21QF;
	Mon, 12 Aug 2024 04:24:28 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdMaz-0000000GqZC-2GQP;
	Mon, 12 Aug 2024 04:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723436630; x=1754972630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToASbl6WYvykfcZHGtIUGtGq6btyZKGTzfSTgNkgSIE=;
  b=ZnO12FyxhPTajbMGpDV8BWcWiDwZRd0jec+qDUwBSkbZ8FAbsoVikgD1
   SVo3W8e2pzTTwlR7XRe5HGJ54hYmjbP1Lp5qHRYSsvcHzoIQ0YqFPO5g2
   erAZUIvWsR2ECNO6lfPSzIO3XYS3vFJ0q/s9GHt/G1UeD3MPIIyh0BB2j
   BS6yYOhj+1XUGGHZETZWg7iqJ0y8CdHKG/3wCuc3yqySEK/pXSkOQ5j/h
   H04JkNBrhevj1k66hkBS1YMOA3CocaspWiREDNKBXXdur8zdGlNYuVMUh
   kw9AZMO7u646mRL9Ufq7O37rYSU/FYLAIkZ+Ma0N1TB8g0ZejC2vlozxG
   Q==;
X-CSE-ConnectionGUID: DbDyizU/RfCqlFwmj82nXQ==
X-CSE-MsgGUID: jmwVCl2GT7m9/iXGrI2AMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="44047064"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="44047064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 21:23:49 -0700
X-CSE-ConnectionGUID: 8SKmKoEjQAeQS/gSImkEAg==
X-CSE-MsgGUID: 4c6qJc1OTyemFB2BBK65XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58858682"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2024 21:23:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdMas-000BNm-0m;
	Mon, 12 Aug 2024 04:23:42 +0000
Date: Mon, 12 Aug 2024 12:23:41 +0800
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
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix memory leak in LRO
 rings release
Message-ID: <202408121146.9ulfLUnP-lkp@intel.com>
References: <20240811184949.2799-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811184949.2799-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_212349_691294_03692B53 
X-CRM114-Status: GOOD (  12.66  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Yifee/net-ethernet-mtk_eth_soc-fix-memory-leak-in-LRO-rings-release/20240812-025108
base:   net/main
patch link:    https://lore.kernel.org/r/20240811184949.2799-1-eladwf%40gmail.com
patch subject: [PATCH net] net: ethernet: mtk_eth_soc: fix memory leak in LRO rings release
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240812/202408121146.9ulfLUnP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121146.9ulfLUnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408121146.9ulfLUnP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_rx_put_buff':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:28: warning: passing argument 1 of 'free_pages' makes integer from pointer without a cast [-Wint-conversion]
    1768 |                 free_pages(data, get_order(mtk_max_frag_size(ring->frag_size)));
         |                            ^~~~
         |                            |
         |                            void *
   In file included from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:9:
   include/linux/gfp.h:372:38: note: expected 'long unsigned int' but argument is of type 'void *'
     372 | extern void free_pages(unsigned long addr, unsigned int order);
         |                        ~~~~~~~~~~~~~~^~~~


vim +/free_pages +1768 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1759	
  1760	static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
  1761	{
  1762		if (ring->page_pool)
  1763			page_pool_put_full_page(ring->page_pool,
  1764						virt_to_head_page(data), napi);
  1765		else if (ring->frag_size <= PAGE_SIZE)
  1766			skb_free_frag(data);
  1767		else
> 1768			free_pages(data, get_order(mtk_max_frag_size(ring->frag_size)));
  1769	}
  1770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

