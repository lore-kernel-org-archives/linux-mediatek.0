Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA8CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNxCmBx4fjesS26T4nVlp/+DmeSOs2k5r0/57naEFGQ=; b=b0R6JcF0WszwIfdVjzkbaVYdxO
	JXBlTHJpFjxazpSW6gwSUZ4gC3Jmu/Fcm7uXpctsd/z4X1++SjkdYPMv+GLu03eOZsQNQJh25Kpnm
	wBQuJwG5+qebqGauf/7oYHJa4udhgTCNG6woxrTND7BgCNLe5dItgJuwiJjzofDGzl08JIcv11xPw
	TZ7YvEKAfgxIeF9HH3Xf6GPmpNnBHmlDzAxb1/O8lVTP52Wf2aDrfRZma43wFYTnai+P0z7Ch/jYb
	TEKVXG1wYS1cA0uDcLSN+/OKmKjx9b31peNFzoxKfA4Ac7PCzAnM4nwY3OBWAJDKbnu0a7DdhF11g
	2TEIQhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUf-00000004N2e-3ich;
	Sat, 23 Aug 2025 08:20:57 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZMZ-00000003Vud-3f1v
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 21:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755898316; x=1787434316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OZDL56ts6cpMtHv06rx//Jcb9k8kAprl1hOGapCSJ0Y=;
  b=XPG8AdwY2qpt6JSo+u5AD5GWNGyz71Mmvtb4GLgadAWKk8+GMkpWnlkA
   +3A0No6IK7mo1sENy3fI9lzKajRiVyd2uRcTvGAeB5W1Nflj4ue496Jwm
   YcE+0ce6AoSkOk1o+O7mYr4kp/j4aBfQfsly6sbggtaKFkR+80bzzaL0v
   iwUCQUnvAyM3GNBotV8qL+OFtKXCxIuFd22yxPaahQ2LyalqBUxuG1Vtp
   IltKIzI+niwh1yDEvMb+7rWpR3r0xpICiN5ncbPeiRH1bIfuU84ECv6LS
   26jrWc7tIQ3p0iqBMnbXaRbcsKkDoby5pZOBOUgH6t9SMAVqFEWSsNWWi
   Q==;
X-CSE-ConnectionGUID: haUZaQBrTJmL24e9In3/rA==
X-CSE-MsgGUID: YHyZmK2AQIuKVkgDI5txKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="45784569"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45784569"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 14:31:52 -0700
X-CSE-ConnectionGUID: JxdUFZ2jTJWTdC23usu6cA==
X-CSE-MsgGUID: yb+VR08XSSGzNFcTO+jxnA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 14:31:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upZM0-000LqR-01;
	Fri, 22 Aug 2025 21:31:27 +0000
Date: Sat, 23 Aug 2025 05:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: common: Switch to
 for_each_available_child_of_node_scoped()
Message-ID: <202508230528.DeD3hVns-lkp@intel.com>
References: <20250822062738.2632746-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822062738.2632746-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_143155_951125_31AFCCA0 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/ASoC-mediatek-common-Switch-to-for_each_available_child_of_node_scoped/20250822-142918
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250822062738.2632746-1-wenst%40chromium.org
patch subject: [PATCH] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
config: x86_64-buildonly-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230528.DeD3hVns-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230528.DeD3hVns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230528.DeD3hVns-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/common/mtk-soundcard-driver.c: In function 'parse_dai_link_info':
>> sound/soc/mediatek/common/mtk-soundcard-driver.c:92:29: warning: unused variable 'sub_node' [-Wunused-variable]
      92 |         struct device_node *sub_node;
         |                             ^~~~~~~~


vim +/sub_node +92 sound/soc/mediatek/common/mtk-soundcard-driver.c

c0e7390e6d3f42b Trevor Wu    2023-05-26   88  
4302187d955f166 Trevor Wu    2023-01-16   89  int parse_dai_link_info(struct snd_soc_card *card)
4302187d955f166 Trevor Wu    2023-01-16   90  {
4302187d955f166 Trevor Wu    2023-01-16   91  	struct device *dev = card->dev;
4302187d955f166 Trevor Wu    2023-01-16  @92  	struct device_node *sub_node;
4302187d955f166 Trevor Wu    2023-01-16   93  	struct snd_soc_dai_link *dai_link;
4302187d955f166 Trevor Wu    2023-01-16   94  	const char *dai_link_name;
4302187d955f166 Trevor Wu    2023-01-16   95  	int ret, i;
4302187d955f166 Trevor Wu    2023-01-16   96  
4302187d955f166 Trevor Wu    2023-01-16   97  	/* Loop over all the dai link sub nodes */
bd1311e421261f6 Chen-Yu Tsai 2025-08-22   98  	for_each_available_child_of_node_scoped(dev->of_node, sub_node) {
4302187d955f166 Trevor Wu    2023-01-16   99  		if (of_property_read_string(sub_node, "link-name",
bd1311e421261f6 Chen-Yu Tsai 2025-08-22  100  					    &dai_link_name))
4302187d955f166 Trevor Wu    2023-01-16  101  			return -EINVAL;
4302187d955f166 Trevor Wu    2023-01-16  102  
4302187d955f166 Trevor Wu    2023-01-16  103  		for_each_card_prelinks(card, i, dai_link) {
4302187d955f166 Trevor Wu    2023-01-16  104  			if (!strcmp(dai_link_name, dai_link->name))
4302187d955f166 Trevor Wu    2023-01-16  105  				break;
4302187d955f166 Trevor Wu    2023-01-16  106  		}
4302187d955f166 Trevor Wu    2023-01-16  107  
bd1311e421261f6 Chen-Yu Tsai 2025-08-22  108  		if (i >= card->num_links)
4302187d955f166 Trevor Wu    2023-01-16  109  			return -EINVAL;
4302187d955f166 Trevor Wu    2023-01-16  110  
4302187d955f166 Trevor Wu    2023-01-16  111  		ret = set_card_codec_info(card, sub_node, dai_link);
bd1311e421261f6 Chen-Yu Tsai 2025-08-22  112  		if (ret < 0)
4302187d955f166 Trevor Wu    2023-01-16  113  			return ret;
c0e7390e6d3f42b Trevor Wu    2023-05-26  114  
c0e7390e6d3f42b Trevor Wu    2023-05-26  115  		ret = set_dailink_daifmt(card, sub_node, dai_link);
bd1311e421261f6 Chen-Yu Tsai 2025-08-22  116  		if (ret < 0)
c0e7390e6d3f42b Trevor Wu    2023-05-26  117  			return ret;
c0e7390e6d3f42b Trevor Wu    2023-05-26  118  	}
4302187d955f166 Trevor Wu    2023-01-16  119  
4302187d955f166 Trevor Wu    2023-01-16  120  	return 0;
4302187d955f166 Trevor Wu    2023-01-16  121  }
4302187d955f166 Trevor Wu    2023-01-16  122  EXPORT_SYMBOL_GPL(parse_dai_link_info);
4302187d955f166 Trevor Wu    2023-01-16  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

