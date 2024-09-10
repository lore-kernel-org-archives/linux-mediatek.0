Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC262EDE996
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 01:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyTeB9eYeGPJCJxeYluKCGD/SQWIB4sWRHSqRv6Twa0=; b=yXwvHxxsN9AONVonmqBYCT4gUs
	rCEoX6BWpvwnx1LXrod5aFnk0gDiwAylYDjezDD/7p9DwYppIhv9vTEfpGmd7WAybbELqk+Rknq+6
	M2Xld0iWSgcQSVfsTRrWHuvn2tYCJvv/EST26QiKONusAMl0k5gfjBpwltu9qaSW3OYb7ZBCVZQMb
	GPEd6Ywg5uBZyUIlhI5NeLnrPB/eGeE0vt4/BC9U9kPOKSRREqL8NY3HLQLpsWPY2sz6Tz2y8gzSH
	OG9GzTbca+r5C4hl60WQHj4XxWzBMk4mv0bd/pdB44ISVi+j/Z4BMXT2vnnQsBwgGe4q/HKibHRLa
	tIoEwH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snpnH-00000003nu7-3ggw;
	Tue, 10 Sep 2024 01:35:47 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snpm8-00000003nbk-1R15
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 01:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725932076; x=1757468076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1rVwTMNq7di54sGOAsuF2je2ceVH7dA0EPFlPu/fPU=;
  b=hdSH6ZKGJuK1mX4H68WGyP8n1vhTEpOZPaF9GRbfdFXt76wRfrWOi4z3
   /ltnJZTFMCUVeLd6daHVpKGT3hxlp9picA9AmxOVCZwwhN+k2fLY38Uja
   F1AUIb0rmQR0v1s6t/dn+ePbetGAu+I+meXP+1bEbT0T3HFJgjYiuNxhq
   SbKUsF2Srlf7g3DrD7+xGQ65w+0U3c6c8MMBca3d5GzrPgidSH/mzCtqg
   kD960CaiNtHni94gdWGg2jxG1+VPAkdlpWRuj3OvOqVpQamC2dFhozw7K
   VIVdspnDl+dMRRT//yy1qFIzSTqMp15hkGAja+OK5FRzKgMOhLxPQZ9t2
   w==;
X-CSE-ConnectionGUID: W1Fy+BUmR72gMpMsF3ilUA==
X-CSE-MsgGUID: s0FPVPq2SlmTJkmGhyebhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24767194"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24767194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:34:31 -0700
X-CSE-ConnectionGUID: YJEpADTRS9exfSCUvCWxzA==
X-CSE-MsgGUID: JSwMfiM8Qe2M1xL8UpcOYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="71828488"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Sep 2024 18:34:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snplv-000FSW-0o;
	Tue, 10 Sep 2024 01:34:23 +0000
Date: Tue, 10 Sep 2024 09:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, avri.altman@wdc.com,
	alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, powen.kao@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com,
	tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
	naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org,
	quic_nguyenb@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ufs: core: requeue aborted request
Message-ID: <202409100826.Iql38Ss9-lkp@intel.com>
References: <20240909082100.24019-3-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909082100.24019-3-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_183436_475606_B9C54345 
X-CRM114-Status: GOOD (  11.01  )
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
[also build test WARNING on mkp-scsi/for-next linus/master v6.11-rc7 next-20240909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/peter-wang-mediatek-com/ufs-core-fix-the-issue-of-ICU-failure/20240909-163021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240909082100.24019-3-peter.wang%40mediatek.com
patch subject: [PATCH v3 2/2] ufs: core: requeue aborted request
config: i386-buildonly-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409100826.Iql38Ss9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100826.Iql38Ss9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100826.Iql38Ss9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/core/ufshcd.c: In function 'ufshcd_abort_one':
>> drivers/ufs/core/ufshcd.c:6491:28: warning: unused variable 'lrbp' [-Wunused-variable]
    6491 |         struct ufshcd_lrb *lrbp = &hba->lrb[tag];
         |                            ^~~~


vim +/lrbp +6491 drivers/ufs/core/ufshcd.c

2355b66ed20ce4 drivers/scsi/ufs/ufshcd.c Can Guo         2020-08-24  6482  
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6483  static bool ufshcd_abort_one(struct request *rq, void *priv)
b817e6ffbad7a1 drivers/ufs/core/ufshcd.c Bart Van Assche 2022-10-31  6484  {
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6485  	int *ret = priv;
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6486  	u32 tag = rq->tag;
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6487  	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6488  	struct scsi_device *sdev = cmd->device;
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6489  	struct Scsi_Host *shost = sdev->host;
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6490  	struct ufs_hba *hba = shost_priv(shost);
93e6c0e19d5bb1 drivers/ufs/core/ufshcd.c Peter Wang      2023-11-15 @6491  	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
ab248643d3d68b drivers/ufs/core/ufshcd.c Bao D. Nguyen   2023-05-29  6492  
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6493  	*ret = ufshcd_try_to_abort_task(hba, tag);
ab248643d3d68b drivers/ufs/core/ufshcd.c Bao D. Nguyen   2023-05-29  6494  	dev_err(hba->dev, "Aborting tag %d / CDB %#02x %s\n", tag,
ab248643d3d68b drivers/ufs/core/ufshcd.c Bao D. Nguyen   2023-05-29  6495  		hba->lrb[tag].cmd ? hba->lrb[tag].cmd->cmnd[0] : -1,
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6496  		*ret ? "failed" : "succeeded");
93e6c0e19d5bb1 drivers/ufs/core/ufshcd.c Peter Wang      2023-11-15  6497  
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6498  	return *ret == 0;
ab248643d3d68b drivers/ufs/core/ufshcd.c Bao D. Nguyen   2023-05-29  6499  }
f9c028e7415a5b drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  6500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

