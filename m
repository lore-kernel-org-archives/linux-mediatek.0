Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1261EC83F03
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL97RMe6eyV+6K7rfwk1iJvJt4TkmDT01pzFQN6vH2Q=; b=Nq2rf8JbtZHgnm0Drerbk7aI9v
	msUWVas9o+dpYARCxs+EyBDSuiPfzPAQCoJ8lTa15MZTsXhDrOEENbynmyw6BVZt/lANbBYo+FToV
	UhU7LYfewLsCiH9f3Bcl/ct9FU80i+SHQKUWaI9ez//kcWeYY6/Rui8874+e9ZuVLUZPimLcKC9C7
	tjDAS7yjPaREDQ669cMyGCJugD3UEj7ekR6oMzQxf9yLWI87WCqjaSiVe9bZnghDbf9NC5e93xt3Z
	5orCDULn03s1dHmmj7m0ODnzb1l834Ql+h4T0fu79yM6w9vFKW2tISzmV4vhDhuZhEcWm/6WQBHjG
	lut4TVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFf-00000009g4M-05u9;
	Wed, 09 Jul 2025 19:14:43 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXow-00000009KZS-1pVd
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 16:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752079138; x=1783615138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sscLlVLSTqX6Ja4Jl6uAsGtdoJXwQqGex1/xNaJecj8=;
  b=llJQwhgND1Oz7b+vNgn1jcy9EaZ3h87aKSRGWNdQ4T8g4RltI0OKgNEA
   1+QIacU3UkqC6/pUZ5fJuXxuo5TzxXfFSQL4eZFOE8a6JAlL1kHKXLFUn
   A9CP1giZ2jKtXipx296dKDrm7cFMCd35dSvqzqnSKzBmAeIGrtjRoHN56
   hhsvKC088DhmkRnqxtFY997QO0WceSVrz668sgmC1ZIyVFhpI/N19sCYj
   WQU28fVDmN9dmB/IpTMs4kpySHRJSHCzPuONYNlvQ9Uqp7RYXIbS5AkLU
   8VWDkYu6QshxOQcIj5a3F2iuqHXLXoXPUJtYqqna31tMo/xR4B3yYyVBW
   g==;
X-CSE-ConnectionGUID: aT7wrpSeSLmtnosX36pZNQ==
X-CSE-MsgGUID: oPyUDkTVQAuIQLrydupdog==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54441012"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54441012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:38:54 -0700
X-CSE-ConnectionGUID: j9qyy7HuTXKiHRMwQfnudw==
X-CSE-MsgGUID: FFKNPH+ST/Wz/xZfw4p7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155236464"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2025 09:38:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZXon-0003lT-13;
	Wed, 09 Jul 2025 16:38:49 +0000
Date: Thu, 10 Jul 2025 00:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guoqing Jiang <guoqing.jiang@canonical.com>, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	angelogioacchino.delregno@collabora.com, amergnat@baylibre.com
Cc: oe-kbuild-all@lists.linux.dev, zoran.zhan@mediatek.com,
	guoqing.jiang@canonical.com, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8365-dai-i2s: pass correct size to
 mt8365_dai_set_priv
Message-ID: <202507100010.qEVMavru-lkp@intel.com>
References: <20250709053900.55171-1-guoqing.jiang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709053900.55171-1-guoqing.jiang@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_093858_515130_A5A3B057 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Guoqing,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.16-rc5 next-20250709]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoqing-Jiang/ASoC-mediatek-mt8365-dai-i2s-pass-correct-size-to-mt8365_dai_set_priv/20250709-134028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250709053900.55171-1-guoqing.jiang%40canonical.com
patch subject: [PATCH] ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv
config: csky-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100010.qEVMavru-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100010.qEVMavru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100010.qEVMavru-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c: In function 'mt8365_dai_i2s_set_priv':
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:819:43: error: invalid operands to binary & (have 'unsigned int' and 'struct mtk_afe_i2s_priv')
     819 |                                           &mt8365_i2s_priv[i]);
         |                                           ^~~~~~~~~~~~~~~~~~~
         |                                                           |
         |                                                           struct mtk_afe_i2s_priv
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:817:23: error: too few arguments to function 'mt8365_dai_set_priv'; expected 4, have 3
     817 |                 ret = mt8365_dai_set_priv(afe, mt8365_i2s_priv[i].id,
         |                       ^~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:14:
   sound/soc/mediatek/mt8365/mt8365-afe-common.h:428:5: note: declared here
     428 | int mt8365_dai_set_priv(struct mtk_base_afe *afe,
         |     ^~~~~~~~~~~~~~~~~~~


vim +819 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c

402bbb13a195ca Alexandre Mergnat 2024-07-22  811  
402bbb13a195ca Alexandre Mergnat 2024-07-22  812  static int mt8365_dai_i2s_set_priv(struct mtk_base_afe *afe)
402bbb13a195ca Alexandre Mergnat 2024-07-22  813  {
402bbb13a195ca Alexandre Mergnat 2024-07-22  814  	int i, ret;
402bbb13a195ca Alexandre Mergnat 2024-07-22  815  
402bbb13a195ca Alexandre Mergnat 2024-07-22  816  	for (i = 0; i < DAI_I2S_NUM; i++) {
402bbb13a195ca Alexandre Mergnat 2024-07-22 @817  		ret = mt8365_dai_set_priv(afe, mt8365_i2s_priv[i].id,
08cb0e42ff0631 Guoqing Jiang     2025-07-09  818  					  sizeof(mt8365_i2s_priv[i])
402bbb13a195ca Alexandre Mergnat 2024-07-22 @819  					  &mt8365_i2s_priv[i]);
402bbb13a195ca Alexandre Mergnat 2024-07-22  820  		if (ret)
402bbb13a195ca Alexandre Mergnat 2024-07-22  821  			return ret;
402bbb13a195ca Alexandre Mergnat 2024-07-22  822  	}
402bbb13a195ca Alexandre Mergnat 2024-07-22  823  	return 0;
402bbb13a195ca Alexandre Mergnat 2024-07-22  824  }
402bbb13a195ca Alexandre Mergnat 2024-07-22  825  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

