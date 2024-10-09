Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F2CF0440
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 05:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2K3/P7sXRMZ8A/imSUgMLca5ZlpQ3qy5L2ViIr3ff+k=; b=tWXX4Oo1VdxYLBV+1z+SKfhCxE
	c6Nz0U2EHULBxURJkRUDhxkB0bJ8IX4FTLB0qeqauIKjWfiUEGpeVqgLZO9/RfKk63h48ilhmZTk1
	jLVgceUGmXs7M85fIqRkq31ERmUcjb9d/iOr1hEj8cwSS/WzDR2nvAtWUhMXkUJcRYYNd8heul7P2
	oSlioXu9TS6DC4xyCRsqOBxlaHRkSlhJGr1GIRuN4bapTEe12YlHDrhTz17+N72Z+6Qz035EalEka
	Inxx5Yo+L8YnisFj3e5ZcFTXY1g+9QFSo1yAHY3te48fOF4XL6dZoE3wrn+KAj+v/XXxjqYVjHnll
	Vh7YACCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syOyV-00000007vmL-3iLj;
	Wed, 09 Oct 2024 05:11:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syOx4-00000007vck-2rck;
	Wed, 09 Oct 2024 05:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728450574; x=1759986574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/lG6d/2yiL1coqVhRfclbMCgDsoHozt5HlulUhP8jQ=;
  b=EsAtnqdJZOpbcmn2NmCpel5SrEGvkJMZMa+m/pCeSiRkDmvpco/c5nZ6
   R1BXTJpJd/OUP2myrNDL+Q3Y2htPOsgPK0xacyOd8tE/b6lLQNnP7oV+R
   dy6vShjcSn+mI63n9Ir+bcrcj6a2KtmNiVK4Ithn+jqZ3+XPkPZYpGOnE
   tcnesuMTRYGY7E3yWGkZUuRqT4sviDD4CqIl136S4US0atIcT+MygJ2m6
   Wwuh9A31RKGtuClT3qMG6VBvd9QmO3Gz8sOAX2e+BIOmgrVGzthJzHtDu
   AUk5aYtJ6YpfZBUTw8v16DjAiDag3xJlPjMSRtlZsSjE1PZ5jJp1KkX74
   Q==;
X-CSE-ConnectionGUID: +ZI6o6uoRZCGbNbQndZthQ==
X-CSE-MsgGUID: Jktr8kx/RpSAlw9Pmek19A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31425386"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31425386"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:09:32 -0700
X-CSE-ConnectionGUID: HgE7S8OtTvum40XWD/P7BQ==
X-CSE-MsgGUID: YcVLafYwToq0mu9eCJWT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="75995876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2024 22:09:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syOww-0008lM-0w;
	Wed, 09 Oct 2024 05:09:26 +0000
Date: Wed, 9 Oct 2024 13:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: ed.tsai@mediatek.com, peter.wang@mediatek.com,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	chun-hung.wu@mediatek.com, Ed Tsai <ed.tsai@mediatek.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: configure individual LU queue
 flags
Message-ID: <202410091257.SE04cckD-lkp@intel.com>
References: <20241008065950.23431-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008065950.23431-1-ed.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_220934_792871_46882295 
X-CRM114-Status: GOOD (  11.80  )
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

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ed-tsai-mediatek-com/scsi-ufs-ufs-mediatek-configure-individual-LU-queue-flags/20241008-153700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20241008065950.23431-1-ed.tsai%40mediatek.com
patch subject: [PATCH] scsi: ufs: ufs-mediatek: configure individual LU queue flags
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241009/202410091257.SE04cckD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091257.SE04cckD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091257.SE04cckD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_config_scsi_dev':
>> drivers/ufs/host/ufs-mediatek.c:1789:65: error: 'struct scsi_device' has no member named 'reqeust_queue'; did you mean 'request_queue'?
    1789 |                 blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
         |                                                                 ^~~~~~~~~~~~~
         |                                                                 request_queue

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1789 drivers/ufs/host/ufs-mediatek.c

  1782	
  1783	static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
  1784	{
  1785		struct ufs_hba *hba = shost_priv(sdev->host);
  1786	
  1787		dev_dbg(hba->dev, "lu %llu scsi device configured", sdev->lun);
  1788		if (sdev->lun == 2)
> 1789			blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
  1790	}
  1791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

