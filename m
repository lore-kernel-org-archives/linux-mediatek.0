Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B12CF3973
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 22:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHEKOv3MIocoTUMnORt7sp8KTK6x01wurBSzxadG76E=; b=bM2GIh+GAVlLwNuT+FVuK8z8VT
	nsLkf81+DFYQWjr4ryIYEpsYceccYowsw6dOEsvorxTTiek/NhU39vH/NKQFHnqepUEzwrjWs8lWS
	URmq46/QV9aLHw3V+McbWEKgksMaGMoE1PXvoz0d6YnhbIhMCIqVYhvehtAqNpWBe+sgTePZ2J0wg
	L0M6vU0/g15CtBKBJTKDIHT1UdU8/OVnJ25B8X4cN5cxfJtz8n4Sfn/wtgTBLvxqSc167uf3CMUVY
	Naf/+CBk1qZ26c1I7bkLAdAc6b/ZvPd4sH2CeSjTfLNjRGVCNpHlDEhFNk+PMzhbL9mHQhar6qmev
	T2p2FcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srPsP-0000000B7Zt-3aro;
	Thu, 19 Sep 2024 22:43:53 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srPsN-0000000B7ZP-279F;
	Thu, 19 Sep 2024 22:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726785831; x=1758321831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fhu7YT+CCTUlhDgFevdRmHSSmqXS6RBEGTbuJJwSf0w=;
  b=Ozoi3BV4mARwKMvkp4Z1Mv06x09aQ5JJ517U+HBjLvF/Ya8H1gNqIdAm
   x5ZZIg6bLDabzFeoHDdFNusfJ8D5R5T98NIoXo05jFDzv2fz1yVMqceuE
   EdjQWA5S8qEe7sAK0Lq+4FTbolfcz+QuQHG6XHkExT3ZEi1GacQYSzn0a
   bcHY7434qzd5YwFcaop+EcXKtOw/dcmUNaeZ808TGOU9OEtG4ecDXAV1b
   /5RhV9AitbwhcAzY1KeejKC1DBgkV1LqD8gYOvWchhDVaRylL7diCgCwL
   qN6mX12Q2ObvscF0mlvqyprHffnrZaZX7Hzf4eyfVGbs+tnUbzV/4kOFW
   A==;
X-CSE-ConnectionGUID: Mh86PyeMSyOlHIBzL1cx/g==
X-CSE-MsgGUID: 21MmVVIpTrKKK/CZQhsb6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="48310046"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="48310046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 15:43:48 -0700
X-CSE-ConnectionGUID: pfgdMEkRRHWQFN7rXW35lA==
X-CSE-MsgGUID: BMmpoMYiSsq7itvgF/dNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70335641"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2024 15:43:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srPsG-000DlX-2c;
	Thu, 19 Sep 2024 22:43:44 +0000
Date: Fri, 20 Sep 2024 06:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction
 init to declaration
Message-ID: <202409200659.IVYRJ33l-lkp@intel.com>
References: <20240918100620.103536-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918100620.103536-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_154351_618170_9D77C489 
X-CRM114-Status: GOOD (  11.61  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on soc/for-next linus/master v6.11 next-20240919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/soc-mediatek-mtk-cmdq-Move-mask-build-and-append-to-function/20240918-180757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240918100620.103536-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
config: parisc-randconfig-r123-20240920 (https://download.01.org/0day-ci/archive/20240920/202409200659.IVYRJ33l-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409200659.IVYRJ33l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409200659.IVYRJ33l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/mtk-cmdq-helper.c:240:18: sparse: sparse: Initializer entry defined twice
   drivers/soc/mediatek/mtk-cmdq-helper.c:244:18: sparse:   also defined here

vim +240 drivers/soc/mediatek/mtk-cmdq-helper.c

   234	
   235	int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
   236			     u16 addr_low, u16 src_reg_idx)
   237	{
   238		struct cmdq_instruction inst = {
   239			.op = CMDQ_CODE_WRITE_S,
 > 240			.mask = 0,
   241			.src_t = CMDQ_REG_TYPE,
   242			.sop = high_addr_reg_idx,
   243			.offset = addr_low,
   244			.src_reg = src_reg_idx
   245		};
   246		return cmdq_pkt_append_command(pkt, inst);
   247	}
   248	EXPORT_SYMBOL(cmdq_pkt_write_s);
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

