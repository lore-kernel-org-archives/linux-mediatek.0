Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3639FC83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 05:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6StP7OoaYj8mPuIfW/ckumbwEVmBD31pusQWpAtSjQ=; b=ikQpIgznJCEYnGCuSwm3J7jzBU
	TSFjM7qRQo6svCd33jWcFG1O7Etq8sdVKpXl6vyv5TbH2pP2+voZzoUPQq3PxIPmJwjc71olbsn7X
	wXlCPLNzwU7eRtJMlS4o9Z4Fs7YmOKJwhhMLiC8XL8VvQTBYRRX1K54IDZlgqEMqDNcPJVe7S2f79
	Z0JGlw6oZDH3a4Urw25H/XUlAVLEeCPyuYXFe7ReQYCIQPvHoZsnA3YmBr/mAkw1oFUOgbxz2IOUW
	kyzlTRoX1WOaRiqlDCFgbjds+oIdVFjHskvbRMqLsGxfkZGOgjlbaQruiP37e7weamjRjhM8h9BXw
	pVoHQPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGyy-00000009DR5-36s8;
	Thu, 17 Jul 2025 05:16:36 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGyv-00000009DQM-40G0
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 05:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752729394; x=1784265394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lv7U8dJEOwHVATq46bvmtfFh8J3c2guGmNeJbxSnI40=;
  b=X61X28QW3M+0xuCP8Y2PkKN41Rd1FqiRtCr0FAtesM6aU9vIWA37N+Xa
   UuR3I9VZ1WOnRVR5iuBQCR7dRx2RFjHxay/gFPGkB8k0V1KEHwgAkktqP
   Q1CKzS/RbTnqqzqD8lQpFyOpDmqDj+moh9l9jIBCZph4NKvgeYoql0s+y
   +mY2Kz6QhXeHrs3WOHtUruuIxp2nePDYcm/d6ZfhBlwswleshtzQl2Yoi
   RsCPdOfCpIvDZfo86QPWqPyAiEgMsHqEv16yxZhD4pjBf7WF8dfz5zjFo
   LzAOmSrUPieTp9NP/OQwnByORFJRvV4ax8hZWHUteb3FQXTng1UNgLe7J
   g==;
X-CSE-ConnectionGUID: vnTLTutcRyy7+I387DiG4g==
X-CSE-MsgGUID: nCh0yMZPSP+TYKD+tCAt8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65558157"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="65558157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 22:16:30 -0700
X-CSE-ConnectionGUID: cEF91deRRVyaIRX8O+/L8g==
X-CSE-MsgGUID: Qmubu0ZqR+CL04dr+z7KAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="161986912"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jul 2025 22:16:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucGyl-000DAb-2o;
	Thu, 17 Jul 2025 05:16:23 +0000
Date: Thu, 17 Jul 2025 13:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, yi-fan.peng@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com,
	tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
	naomi.chu@mediatek.com, ed.tsai@mediatek.com
Subject: Re: [PATCH v1 08/10] ufs: host: mediatek: Add clock scaling query
 function
Message-ID: <202507171210.1ZvrCG7u-lkp@intel.com>
References: <20250716062830.3712487-9-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716062830.3712487-9-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_221634_035385_59A0EC89 
X-CRM114-Status: GOOD (  10.98  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.16-rc6 next-20250716]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/peter-wang-mediatek-com/ufs-host-mediatek-Change-return-type-to-bool/20250716-184239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250716062830.3712487-9-peter.wang%40mediatek.com
patch subject: [PATCH v1 08/10] ufs: host: mediatek: Add clock scaling query function
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171210.1ZvrCG7u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171210.1ZvrCG7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171210.1ZvrCG7u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_init_clocks':
>> drivers/ufs/host/ufs-mediatek.c:941:29: warning: unused variable 'mclk' [-Wunused-variable]
     941 |         struct ufs_mtk_clk *mclk = &host->mclk;
         |                             ^~~~


vim +/mclk +941 drivers/ufs/host/ufs-mediatek.c

2c89e41326b16e drivers/scsi/ufs/ufs-mediatek.c Stanley Chu 2021-05-31  931  
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  932  /**
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  933   * ufs_mtk_init_clocks - Init mtk driver private clocks
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  934   *
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  935   * @hba: per adapter instance
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  936   */
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  937  static void ufs_mtk_init_clocks(struct ufs_hba *hba)
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  938  {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  939  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  940  	struct list_head *head = &hba->clk_list_head;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03 @941  	struct ufs_mtk_clk *mclk = &host->mclk;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  942  	struct ufs_clk_info *clki, *clki_tmp;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  943  
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  944  	/*
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  945  	 * Find private clocks and store them in struct ufs_mtk_clk.
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  946  	 * Remove "ufs_sel_min_src" and "ufs_sel_min_src" from list to avoid
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  947  	 * being switched on/off in clock gating.
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  948  	 */
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  949  	list_for_each_entry_safe(clki, clki_tmp, head, list) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  950  		if (!strcmp(clki->name, "ufs_sel")) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  951  			host->mclk.ufs_sel_clki = clki;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  952  		} else if (!strcmp(clki->name, "ufs_sel_max_src")) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  953  			host->mclk.ufs_sel_max_clki = clki;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  954  			clk_disable_unprepare(clki->clk);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  955  			list_del(&clki->list);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  956  		} else if (!strcmp(clki->name, "ufs_sel_min_src")) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  957  			host->mclk.ufs_sel_min_clki = clki;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  958  			clk_disable_unprepare(clki->clk);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  959  			list_del(&clki->list);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  960  		}
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  961  	}
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  962  
37e94f8b8c2c07 drivers/ufs/host/ufs-mediatek.c Peter Wang  2025-07-16  963  	if (!ufs_mtk_is_clk_scale_ready(hba)) {
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  964  		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  965  		dev_info(hba->dev,
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  966  			 "%s: Clk-scaling not ready. Feature disabled.",
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  967  			 __func__);
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  968  	}
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  969  }
b7dbc686f60b28 drivers/ufs/host/ufs-mediatek.c Po-Wen Kao  2022-08-03  970  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

