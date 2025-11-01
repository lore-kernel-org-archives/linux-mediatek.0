Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E729CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Nov 2025 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVN6fGxDXbMJtLzmKlcnQcqI5FHFftdSNN3GDRZHUuQ=; b=Cwf6Dz+8NbJHiBdzezw4G/OzaS
	IsTx4IwfoADA8XYl/RYrgbuVLfzV2zbTruZBCO/rko78tli/0nOIh2doEWYj2qiwLgjUehSsMFQp7
	Ay2raEOvlNUnxElvqzPn2wnVideJax4XSayV86cMsg5/4f+rS5VIZcKFdz1Bdq6YECFxzsOyoIgwb
	1Zqi4KsyzEj1sDaiyQTaNetjmDd7VWhYu10QfND9Q7wegM1vnyziiSvIejvFDtayc+ihrTzXb3g3C
	ILxVBQBxvftZB2GYshxy9IW0GG4SkuqeN9e6X5tKlFIkOdxfa9GX2vtRVitXNHoPX8AtHwMyMW+sb
	vhCGscVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9nB-00000007Id1-3szJ;
	Sat, 01 Nov 2025 11:29:10 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9n8-00000007IcF-3jX4;
	Sat, 01 Nov 2025 11:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761996547; x=1793532547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sF26sQtYAQFqKSwZpyXYz3QW+Hf+GiF9jFBa1Emk2c8=;
  b=aEpGnhbQNpReaOHj1jjb7FkrBPDCRljpfDdleFtW30XDtsXrNBqb3YNc
   d4WKWWcTdXs+pIo29I+TssPl1xvHumNiIwbPxPcjYYVErKzE1CFhMj4eh
   P4wG2SQ8AHR9TXZ89lT3FmqcJTRqj7nBY+zbJfZ9oO4oPImdBEC9PWEaZ
   Yl3PB+x5DkNIulXQ/Y5VmeUoMTriXrxTM2fOIzr+yHH+WKSLDlpDZXOnS
   IbG8E9kc12bWnmFyNumBSx4wk0qpyS4ZGWsHmeRzz7PKLcTClydVsHHcJ
   gj6B9nEvg1qNaJjsAdt1iv8BrZXVQ8tm5uIhSitiLpBBwxyLzGw4w4BoR
   w==;
X-CSE-ConnectionGUID: ly8JvsOTTGCBmsQuYw7TKw==
X-CSE-MsgGUID: oRczHMZIRbSGqaPKa+XzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64062128"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64062128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:29:03 -0700
X-CSE-ConnectionGUID: fCbaBgp4R9Cg2C2C3uNafw==
X-CSE-MsgGUID: fbz26zFYROKDX/eUs4VjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186400275"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 04:28:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9mw-000OBo-38;
	Sat, 01 Nov 2025 11:28:54 +0000
Date: Sat, 1 Nov 2025 19:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for
 subsys ID compatibility
Message-ID: <202511011936.zWnbnVXF-lkp@intel.com>
References: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_042906_938615_9595006F 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, oe-kbuild-all@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, Chen-yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jason-JH,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/soc-mediatek-Use-pkt_write-function-pointer-for-subsys-ID-compatibility/20251101-000555
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251031160309.1654761-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
config: xtensa-randconfig-r064-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011936.zWnbnVXF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011936.zWnbnVXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011936.zWnbnVXF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/mediatek/mtk-mmsys.c: In function 'mtk_mmsys_update_bits':
>> drivers/soc/mediatek/mtk-mmsys.c:170:25: error: 'struct cmdq_client_reg' has no member named 'pkt_write_mask'
      ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
                            ^
>> drivers/soc/mediatek/mtk-mmsys.c:172:29: error: 'struct cmdq_client_reg' has no member named 'pa_base'
                mmsys->cmdq_base.pa_base,
                                ^
--
   drivers/soc/mediatek/mtk-mutex.c: In function 'mtk_mutex_enable_by_cmdq':
>> drivers/soc/mediatek/mtk-mutex.c:1002:15: error: 'struct cmdq_client_reg' has no member named 'pkt_write'
     mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
                  ^


vim +170 drivers/soc/mediatek/mtk-mmsys.c

   162	
   163	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   164					  struct cmdq_pkt *cmdq_pkt)
   165	{
   166		int ret;
   167		u32 tmp;
   168	
   169		if (mmsys->cmdq_base.size && cmdq_pkt) {
 > 170			ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
   171							      mmsys->cmdq_base.subsys,
 > 172							      mmsys->cmdq_base.pa_base,
   173							      mmsys->cmdq_base.offset + offset,
   174							      val, mask);
   175			if (ret)
   176				pr_debug("CMDQ unavailable: using CPU write\n");
   177			else
   178				return;
   179		}
   180		tmp = readl_relaxed(mmsys->regs + offset);
   181		tmp = (tmp & ~mask) | (val & mask);
   182		writel_relaxed(tmp, mmsys->regs + offset);
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

