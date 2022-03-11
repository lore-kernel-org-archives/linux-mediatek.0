Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gX4HKTpNOB0gwgsTL/JUFBgKTSeQ40HRtqW4KHOfuns=; b=msre0uhs407SMC
	KZS4srqJdut9bEzae9j8Sf/iFgLT5R+ac8Z5x1+26Cg5ta6hhfblqPO7+cGH9RPn++czbuWxtYWUI
	v4K07srwDJt/ECSnd2ArZC7Z8hBXCgdqMXkOgAf013l/c18BIOyKuaGKUWsxa7CkB6CnK+e/OyFNN
	cLx/7J6W9r2kD4UyuQJGa7hsyHbrLNzYX+gGhrjzL/e8FPTGS5RG1eEJWPMr+3coRwsVJCwjxtQDG
	VLC5fHgnOYWMNibxYpd7aUB0uES37zpKI8I3ESDRVNKeT/8ndq/PGVDAtLAh1czSu+naH9a2VUAFk
	yj6PB4fiTCKILNDJlccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSibo-00HPgn-Ej; Fri, 11 Mar 2022 16:59:20 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSibH-00HPTY-DS; Fri, 11 Mar 2022 16:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647017927; x=1678553927;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8tt9qgzw4Kq/v31eFaRN55hhJVALG1NfF2eNwvPj8zw=;
 b=kIrquQB8h9w5zEglyRcRYFnMQBGT09p1lfmSgThDJHePXFvw8+dGAEOq
 6+ruIOdq+DVnpz4owU3uQphmBvWQk0/49naY7w5zVVGdQ/i6Vm8kUqZGx
 maQc8E/opbeDKkqpHPqVfhqrjUUpbKE2Kwjdw2CBcNvr8O/RFVsLJy4iV
 hSZips3CWz+fdKZa98askRbj7EjNrLyiITXnrFGMaSfZXlzQl7SJjmAJB
 c73+BQj23DTZQyav/qdX8CIFtwq3kFiz7CZYF3StEJfMIKMaG8nsPm+Sw
 HviUytvnkjDULpGOgzBnpejmke+CtCdUqckgv/vwg0vEPFqfnP4YGzqnX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255796960"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="255796960"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 08:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="555375546"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 11 Mar 2022 08:58:37 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSib6-0006nH-EB; Fri, 11 Mar 2022 16:58:36 +0000
Date: Sat, 12 Mar 2022 00:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kbuild-all@lists.01.org, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
Message-ID: <202203120056.qtDEVoye-lkp@intel.com>
References: <20220311123056.32689-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311123056.32689-1-tinghan.shen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_085847_529388_AE4F7BA9 
X-CRM114-Status: GOOD (  17.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tinghan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tinghan-Shen/remoteproc-mediatek-fix-side-effect-of-mt8195-sram-power-on/20220311-203255
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
config: parisc-randconfig-r031-20220310 (https://download.01.org/0day-ci/archive/20220312/202203120056.qtDEVoye-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6d56ab3bae4e0d5e07d295169602883ba7d7de08
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tinghan-Shen/remoteproc-mediatek-fix-side-effect-of-mt8195-sram-power-on/20220311-203255
        git checkout 6d56ab3bae4e0d5e07d295169602883ba7d7de08
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/remoteproc/mtk_scp.c: In function 'mt8195_scp_before_load':
>> drivers/remoteproc/mtk_scp.c:418:27: error: 'MT8195_L1TCM_SRAM_PDN_RESERVED_BITS' undeclared (first use in this function); did you mean 'MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS'?
     418 |                           MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS
   drivers/remoteproc/mtk_scp.c:418:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/remoteproc/mtk_scp.c: In function 'mt8195_scp_stop':
   drivers/remoteproc/mtk_scp.c:592:28: error: 'MT8195_L1TCM_SRAM_PDN_RESERVED_BITS' undeclared (first use in this function); did you mean 'MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS'?
     592 |                            MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                            MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS


vim +418 drivers/remoteproc/mtk_scp.c

   405	
   406	static int mt8195_scp_before_load(struct mtk_scp *scp)
   407	{
   408		/* clear SPM interrupt, SCP2SPM_IPC_CLR */
   409		writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
   410	
   411		writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
   412	
   413		/* enable SRAM clock */
   414		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
   415		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
   416		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
   417		scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
 > 418				  MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
   419		scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
   420	
   421		/* enable MPU for all memory regions */
   422		writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
   423	
   424		return 0;
   425	}
   426	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
