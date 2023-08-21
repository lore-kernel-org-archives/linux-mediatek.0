Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE72EE49A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=docrX8HdFhSgfNNBLnkj/gMpXj1KOy1HLVwJO8i6/30=; b=tYn4itS3DYVIpabSBwLNZcA+Rx
	X6wh0X+EU+uqLOOGF8oG+D2d27q/ivKrCF/aKOk5MY8Ss3vRsGlHijpXiLqgNVVG7HLsf4HFUHnzM
	XfzhUtw0+V1HdLTjaxLg8EtPaciEg11EuT9NLSNhtK/mhSpfSERYzWvPTKQDUrWuBuJZfYDkVhnD6
	rcQ0CxvBvxo+1gO3JnVnmw2qHbxQZC8O0TEVPFuHrXiQxn86KLSkC0t3WhuN9EpP/6hAsfnfshXUh
	f6OHo2m6Zhk8Hwy8gEqoBURujJk0b1TZk8UTLVQGgwT/q5r+lFE9DewigdcWa7d6rySPFugUUAC7p
	Nyprd8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY9nW-00EXEU-1I;
	Mon, 21 Aug 2023 18:38:42 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY9nS-00EXDz-2c;
	Mon, 21 Aug 2023 18:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692643118; x=1724179118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wld6UNWWckrcMq4kcCWkjtCXxw/5IjJuPmlfVgjAk5g=;
  b=BvU2JDeU6oiJWbTXD55i/nI5S8su/EkvcMYVYcA61yPSnjiTUmbH8aVm
   fE2kqt81d4ETxlRFaJdyokTRESpvYviW5jvuKV6ypn2xrxOeLlgvmVFpA
   TdKb90NvvtTzv2y7ClJXkokd4y2Wa7a5sKSVDuQT8evEkjFFoJR3u/OGt
   qm4Crx6GKsqkhcXpSfulOSEx7XklJ8rj7HLjYiJjfBNH2CuuF8v8N6c4F
   RB2s1sspZoqV7uLV/38FifL+uM6erpPMaIsNbpbpWaMahz6gVD6OUghsl
   acFC+I+7hqkNlpMKAWNURt2SePPPTuLbpbdK86N3Zdi09IHXsc/ORNwDe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358657247"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="358657247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 11:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909801641"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="909801641"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 11:38:31 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY9nH-0000nd-0k;
	Mon, 21 Aug 2023 18:38:27 +0000
Date: Tue, 22 Aug 2023 02:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
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
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: add reset bits for MT7988
Message-ID: <202308220205.gbt5lcAY-lkp@intel.com>
References: <b983a3adf5184a30e4ce620fbbf028c9c76648ae.1692382239.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b983a3adf5184a30e4ce620fbbf028c9c76648ae.1692382239.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_113838_923651_23FAAB22 
X-CRM114-Status: GOOD (  18.14  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-next/master]
[cannot apply to net/main linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-add-reset-bits-for-MT7988/20230821-102205
base:   linux-next/master
patch link:    https://lore.kernel.org/r/b983a3adf5184a30e4ce620fbbf028c9c76648ae.1692382239.git.daniel%40makrotopia.org
patch subject: [PATCH net] net: ethernet: mtk_eth_soc: add reset bits for MT7988
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230822/202308220205.gbt5lcAY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220205.gbt5lcAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220205.gbt5lcAY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:31:
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_hw_reset':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3625:50: error: 'MTK_RSTCTRL_PPE2' undeclared (first use in this function); did you mean 'MTK_RSTCTRL_PPE1'?
    3625 |                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1022:53: note: in definition of macro 'MTK_HAS_CAPS'
    1022 | #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) == (_x))
         |                                                     ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3625:50: note: each undeclared identifier is reported only once for each function it appears in
    3625 |                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1022:53: note: in definition of macro 'MTK_HAS_CAPS'
    1022 | #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) == (_x))
         |                                                     ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_hw_warm_reset':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3673:50: error: 'MTK_RSTCTRL_PPE2' undeclared (first use in this function); did you mean 'MTK_RSTCTRL_PPE1'?
    3673 |                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1022:53: note: in definition of macro 'MTK_HAS_CAPS'
    1022 | #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) == (_x))
         |                                                     ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_prepare_for_reset':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4042:50: error: 'MTK_RSTCTRL_PPE2' undeclared (first use in this function); did you mean 'MTK_RSTCTRL_PPE1'?
    4042 |                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1022:53: note: in definition of macro 'MTK_HAS_CAPS'
    1022 | #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) == (_x))
         |                                                     ^~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_pending_work':
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:4113:50: error: 'MTK_RSTCTRL_PPE2' undeclared (first use in this function); did you mean 'MTK_RSTCTRL_PPE1'?
    4113 |                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1022:53: note: in definition of macro 'MTK_HAS_CAPS'
    1022 | #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) == (_x))
         |                                                     ^~


vim +3625 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  3611	
  3612	static void mtk_hw_reset(struct mtk_eth *eth)
  3613	{
  3614		u32 val;
  3615	
  3616		if (mtk_is_netsys_v2_or_greater(eth))
  3617			regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN, 0);
  3618	
  3619		if (mtk_is_netsys_v3_or_greater(eth)) {
  3620			val = RSTCTRL_PPE0_V3;
  3621	
  3622			if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
  3623				val |= RSTCTRL_PPE1_V3;
  3624	
> 3625			if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
  3626				val |= RSTCTRL_PPE2;
  3627	
  3628			val |= RSTCTRL_WDMA0 | RSTCTRL_WDMA1 | RSTCTRL_WDMA2;
  3629		} else if (mtk_is_netsys_v2_or_greater(eth)) {
  3630			val = RSTCTRL_PPE0_V2;
  3631	
  3632			if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
  3633				val |= RSTCTRL_PPE1;
  3634		} else {
  3635			val = RSTCTRL_PPE0;
  3636		}
  3637	
  3638		ethsys_reset(eth, RSTCTRL_ETH | RSTCTRL_FE | val);
  3639	
  3640		if (mtk_is_netsys_v3_or_greater(eth))
  3641			regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN,
  3642				     0x6f8ff);
  3643		else if (mtk_is_netsys_v2_or_greater(eth))
  3644			regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN,
  3645				     0x3ffffff);
  3646	}
  3647	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

