Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C57EC8748
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKDEA1Pg2HKfwQxmFwd9ymYRUMLbQQ72/nOsxIyNxLA=; b=zwv+ByCxy8QQlrpZNrX491VNM4
	ryvPxygIODG2xH1FHASkVQC9Ge85VSKBUDhxokWAqMU6WTj0QfmbbhfjyLhCdEsgDPe2aw85wWIer
	JiEf41pyojp5/dZrTZK2OKF+8qWasbuRGZyswXZq1IJJBhNDhjyUvE/2buwle3CfoJ1FHnr9uSAgM
	WD/PkEn1MKyw3SM3q4WcrfV1L4bz1oinCE7HmJaNpumfo7R5OaqTaltRZ4bWBCTy2mxNZBrwBFZWW
	g2qPdfRPC/v5ZK+cxAgQDkQ/y/FFMlzu7FknkVvfm9SGsc0G6Y7x3aVCrMg+4wfpxpiaw06cYlTtB
	Bc5MAjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeIH7-00CQZE-1S;
	Thu, 07 Sep 2023 16:54:37 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeIH4-00CQY8-09;
	Thu, 07 Sep 2023 16:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694105673; x=1725641673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+iwrlHM9sEqkTS/xqbLYSOyW5pmPupLwx5GnE3Vj2HE=;
  b=PvtweRgSR+Pdkuox3FF37i6RXsrFx3JbycS3RZvSpX5MOG/cltrpRbsN
   uXde34DsbFB7Nxz6Bfnn36byfoyrB4uMk1DHp7/+lFcTGp3zOotxyP+kB
   /RRmWqCyLZAJDHQhD7KV1yVISsW27D2+0nXtHA51yhsdBTlICmhBAUvns
   XbfeQ66zO5nRRBpA5DALAnaWveayXcfr/tm24Kfoul/i1DM6PyHfbHJ8s
   BsgNhkZ9xjoUGWtapaIGx0uORddEDLDPFoyV9muh+uoRu4U3JbGkcbeCi
   qg5R3cyj7BdrFfsDAsvSwdTWq3oa8O4dZu+ZHZIGi0LMrBaVbhiVJRtEg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463794481"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="463794481"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 09:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="691862512"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="691862512"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2023 09:54:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIGk-0001P0-2T;
	Thu, 07 Sep 2023 16:54:14 +0000
Date: Fri, 8 Sep 2023 00:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Dan Carpenter <error27@gmail.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix uninitialized
 variable
Message-ID: <202309080027.e4rJ0o2x-lkp@intel.com>
References: <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_095434_094349_023809B6 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-fix-uninitialized-variable/20230907-234141
base:   net/main
patch link:    https://lore.kernel.org/r/51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel%40makrotopia.org
patch subject: [PATCH net] net: ethernet: mtk_eth_soc: fix uninitialized variable
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080027.e4rJ0o2x-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080027.e4rJ0o2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080027.e4rJ0o2x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/of.h:14,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.c:9:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_poll_rx':
>> include/linux/stddef.h:8:14: warning: initialization of 'dma_addr_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2008:31: note: in expansion of macro 'NULL'
    2008 |         dma_addr_t dma_addr = NULL;
         |                               ^~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

