Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38253C52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qn5R7R/5DAvKLAw2TnycJumWP9iYXcHPAOCq+jjadpQ=; b=WJRVxfK5iXCGlZ1Q1g7JvI4uqE
	ZIc6lDTpxD8q7EYqgpsH/Nd7t4lIKFxVTu14SgGNUEsDwNDoQ5l00MB4VBKmka2QFWPmPMjZMxbrw
	778YeclHF2LFcdonXU+bTljTgNarfc+0NpygfKl7UmAR/b/drMBNLt/goC2ajSHg0owAiD3MIxm5a
	ZiguFPS3k1HdJgerXPhyGppw5y4k2H4l3INtQrhKxexi3RWbrNcVOlsqS2+9IZiN6RfO0wAOjoE3x
	PrPLdR9e9hc+nwAAG5ha7+r3RfjXT7BWQX+X+dcPtYYs/q1JcVzdQCKikDhWay8srEU/QMZMoSbyt
	/Rdc5S2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdyb8-00000004vwm-08mZ;
	Tue, 13 Aug 2024 20:58:30 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdyaU-00000004vpZ-0ZvA;
	Tue, 13 Aug 2024 20:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723582670; x=1755118670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FQT+KebYObSkEnpMhMAsJ6OvS03Y+3o431aCHS4Aaec=;
  b=m6DVfQfp6YLJMLzCKkzOV2cSJVNaXu3y4Hw0FIwfjvxjk7bQxQtty5zd
   +5RVr8h2OFurLSgYAmRa/PNPSQCqejhlNDI0t6i8pIfCSAw5e2OZeN0/X
   KK+m0l4uiUhkP1J+jbRVpsP0dJ99eJ/NjJxlXMn3zatJrE7Bpr+Uo66sM
   NklGuFMOrcYDVBFJ13XcNW/329/9jushCmpbPTFy2Pq3ZtoDiP+VUKxsl
   kEW2CA+QfyWrBgDeS/tgZ6bWl66BO2KlkDtoy7HIGaYKpVQn058QyjN0K
   gu05zz2Dbu8mqGTFVS4wvQLps8+hOPysq367abxTKaUR1bcZUsRkzjCZi
   g==;
X-CSE-ConnectionGUID: mEiyxDtZTV+wy98ldvCLUA==
X-CSE-MsgGUID: TAVzhH/CQ/GNTw/oFolpwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21639492"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21639492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 13:57:45 -0700
X-CSE-ConnectionGUID: 1JjFaYRYRUqKD464Ry3nEg==
X-CSE-MsgGUID: iN+E3gbFRW+hzbH402Lbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58891446"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2024 13:57:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdyaG-0000iy-2c;
	Tue, 13 Aug 2024 20:57:36 +0000
Date: Wed, 14 Aug 2024 04:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, eladwf@gmail.com,
	daniel@makrotopia.org, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
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
Message-ID: <202408140408.smKpJgMF-lkp@intel.com>
References: <20240812152126.14598-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812152126.14598-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_135750_255667_974BBF3C 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240814/202408140408.smKpJgMF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140408.smKpJgMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140408.smKpJgMF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1768:14: error: expected expression
    1768 |                 free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
         |                            ^
   1 error generated.


vim +1768 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  1759	
  1760	static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
  1761	{
  1762		if (ring->page_pool)
  1763			page_pool_put_full_page(ring->page_pool,
  1764						virt_to_head_page(data), napi);
  1765		else if (ring->frag_size <= PAGE_SIZE)
  1766			skb_free_frag(data);
  1767		else
> 1768			free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
  1769	}
  1770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

