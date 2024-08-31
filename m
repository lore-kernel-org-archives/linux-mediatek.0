Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DD8CD3423
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSElDLIbihEFTAbRBERxjMT7HZZGY2tjuXbtEHG/v70=; b=OK/BefOcwSr4tAK27uz3toDqAB
	S+tTLhXIGeRxLMQvMnzoKY9+hC91zOsXF20Mqa8ydCpeMuN5vfg5d8PA76NiMQ4LcHWCbFO3VgZTI
	eB6qiTI7X/0N8YET8zE4gyx/C/O3JlGb3B+EsbVlri//gDlq27gpO5Bh5p+Ud69oad26y3BwuCrWd
	uo7URY1Rl3HJCs9Ngd+flvlajrPRjxjvFSpBa+DyqPKokFCSHEUgJOqN9S5P4fbYqG0IbntOjR2ri
	KISS9MtyA5CqbzJPyRQ5ufPPhcWztbBTtlYJYx/74Z4IBJsj5xw9C24X3LU6HsVqlj5RoCX4y0eT1
	xgsPs4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skU6A-00000009ydr-3GAw;
	Sat, 31 Aug 2024 19:49:26 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skU67-00000009ydH-0xPR
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Aug 2024 19:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725133763; x=1756669763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TjFqpOaghVpHu0OD8TVOsUrdkEB/DlbW93skVivqlMc=;
  b=U0I4yqoWUF6LRxnc9YFEpTKManBo2nb1tYW0Twaz9Ayd1yvco+v8mq3A
   K1+mzHFw7B6EbEVuuiwVCgtoBV+uh8Qk+SklGNCyrxJW0pAO/8EHFefDq
   iWIV0delmoUTZ1lhOp82eYCWtV/8lDv89E/hefN28Xvv/yasXQv/hV2Dq
   KWos1r1dWKc25E7JdqRTOaqGg5YbzOIFeAuCqpWfc8t5f6WGNR/k2FeaF
   p8rpUCY0nt5HlE7xK5Z7iLAv6F/nh/tgSAXE3X8Wb98KcuoowJABAWb4f
   CsGwOUCyZkZLBbtXdY1auwic4hHuWvMImeT6sXmFe3WB+XlpUvQM0zwb4
   g==;
X-CSE-ConnectionGUID: fsl6Pt08TEmf09GvAUbUMA==
X-CSE-MsgGUID: vGe2hWn2TjKDlr1pYsnuQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23891613"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23891613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 12:49:22 -0700
X-CSE-ConnectionGUID: rkMK3vv3TlWSwvqmE8pJsw==
X-CSE-MsgGUID: 17sbqSKtTNqinfuAWjXqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64946347"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2024 12:49:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skU5z-00033u-0v;
	Sat, 31 Aug 2024 19:49:15 +0000
Date: Sun, 1 Sep 2024 03:49:10 +0800
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
	stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ufs: core: requeue MCQ abort request
Message-ID: <202409010304.Ivj4eQN6-lkp@intel.com>
References: <20240830074426.21968-3-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830074426.21968-3-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_124923_337350_2FA68859 
X-CRM114-Status: GOOD (  10.89  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on jejb-scsi/for-next]
[also build test ERROR on mkp-scsi/for-next linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/peter-wang-mediatek-com/ufs-core-fix-the-issue-of-ICU-failure/20240830-154808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240830074426.21968-3-peter.wang%40mediatek.com
patch subject: [PATCH v1 2/2] ufs: core: requeue MCQ abort request
config: arm64-randconfig-r132-20240831 (https://download.01.org/0day-ci/archive/20240901/202409010304.Ivj4eQN6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240901/202409010304.Ivj4eQN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010304.Ivj4eQN6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ufs/core/ufshcd.c:6505:6: error: implicit declaration of function 'is_mcq_enabled' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (is_mcq_enabled(hba) && (*ret == 0))
               ^
   1 error generated.


vim +/is_mcq_enabled +6505 drivers/ufs/core/ufshcd.c

  6488	
  6489	static bool ufshcd_abort_one(struct request *rq, void *priv)
  6490	{
  6491		int *ret = priv;
  6492		u32 tag = rq->tag;
  6493		struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
  6494		struct scsi_device *sdev = cmd->device;
  6495		struct Scsi_Host *shost = sdev->host;
  6496		struct ufs_hba *hba = shost_priv(shost);
  6497		struct ufshcd_lrb *lrbp = &hba->lrb[tag];
  6498	
  6499		*ret = ufshcd_try_to_abort_task(hba, tag);
  6500		dev_err(hba->dev, "Aborting tag %d / CDB %#02x %s\n", tag,
  6501			hba->lrb[tag].cmd ? hba->lrb[tag].cmd->cmnd[0] : -1,
  6502			*ret ? "failed" : "succeeded");
  6503	
  6504		/* Host will post to CQ with OCS_ABORTED after SQ clean up */
> 6505		if (is_mcq_enabled(hba) && (*ret == 0))
  6506			lrbp->host_initiate_abort = true;
  6507	
  6508		return *ret == 0;
  6509	}
  6510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

