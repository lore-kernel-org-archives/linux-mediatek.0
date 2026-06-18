Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A534FCD98DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 06:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGANCvU1OXQCfStbhWDRouDGSX9cfoHeD7CBHD4PWeY=; b=4OaK+6Ar8/WPQTht51uzdydpT3
	I5ZWvtXMpIyNWU9GvKSQBKIS9fZeIHjf43zZTllOlWj/R73Olo1OQShW78ujtq2f5JSeDILZhhW7O
	XYGqVtOb92s03YiUyDaaLA5HDG2I33WzOL3uhBS7R6jpkEOCcEPyj1ZRyc9bbyYW9cEI0SkZetTzV
	PXaVQyDSvADA21bJvLsKDAuA+rR/XGkhPKsbMemwSUuCD3T1+L+lFH1jzFFxjFUWT6BiZnIAIkZaM
	7j8WbFA8QhpyPSxbY+llFuEWyGSKEPm/58g1FgRvHuTAHfk4LkajBYBFZJroXOjzwakrd4H3GbzLA
	dPTE4fuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oU-00000000g2l-1l2d;
	Thu, 18 Jun 2026 06:01:18 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oQ-00000000g1d-3Liq
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 06:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781762475; x=1813298475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RAsd8khCYqSW4I+iICC+jiMD6xMyMVzESx49f2X+uMo=;
  b=CBBg+IZTAwauLkWc09ji+FG4ydjpmKtxJxX29wvBoFHZgIrqTXAvdHEq
   eEQwcMyy7zx16YB1k7ZD9pIqzxQivOwY+At1VU6og1czr+1B2UDvbrzRd
   oxHURQ5BKQyXueyK6RXozstfl7OMDF8CJyKhyFQSMo8oPxlxrYxY4YDYv
   Gp6CeGAdKDAIUR/oH4kHpKNAQmmybn+gMEZqk3J8kkeMTzg+AG2eIDQoy
   PwCe9yOPTxzwyp7yu70WD8amaOKL5a9UZDF/83uw3d+RoF2echoedis/z
   JyD6HOBgWsSv4PDH6T2uP2DUYGNLiP6EIrCt7ObdmCbRCAi7hbwd43Di6
   A==;
X-CSE-ConnectionGUID: qTGSarlWSMOAFhidGbKqiw==
X-CSE-MsgGUID: TMClat8YQPW5kF6uTNfRsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81572389"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="81572389"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:01:13 -0700
X-CSE-ConnectionGUID: 9U34h6lwQU2aVS/IHyvd2w==
X-CSE-MsgGUID: MuWYTk+9TF+BTPX/TDMaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="286389922"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2026 23:01:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5oK-00000000VHa-3FLU;
	Thu, 18 Jun 2026 06:01:08 +0000
Date: Thu, 18 Jun 2026 14:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7925: support new WoW pattern TLV
Message-ID: <202606181323.heBYmqMQ-lkp@intel.com>
References: <20260615212137.477893-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615212137.477893-1-sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_230114_878996_B95FDD3C 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v7.1 next-20260616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Wang/wifi-mt76-mt7925-support-new-WoW-pattern-TLV/20260616-052424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260615212137.477893-1-sean.wang%40kernel.org
patch subject: [PATCH] wifi: mt76: mt7925: support new WoW pattern TLV
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260618/202606181323.heBYmqMQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181323.heBYmqMQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181323.heBYmqMQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:15:13: warning: 'mt7925_mcu_wow_pattern_old_tlv' defined but not used [-Wunused-function]
      15 | static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt7925_mcu_wow_pattern_old_tlv +15 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

    14	
  > 15	static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
    16	{
    17		const char *fw_version = dev->hw->wiphy->fw_version;
    18		const char *build_date = strrchr(fw_version, '-');
    19	
    20		if (!is_mt7925(dev))
    21			return false;
    22	
    23		if (!build_date)
    24			return false;
    25	
    26		build_date++;
    27	
    28		return strncmp(build_date, MT7925_WOW_PATTERN_NEW_FW_DATE,
    29			       strlen(MT7925_WOW_PATTERN_NEW_FW_DATE)) < 0;
    30	}
    31	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

