Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D863CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49bZFTD7HN10f3KLsDtmrKq6ue5ExL0gn0J1APhtpWU=; b=zxSrntifUr8BS4Nt9UCi3DNCo5
	pjqXLBsd60KlhzpDzIO31pRukcVUMT05deZOk574jjCZXlLvITYXuJ0tKwutueib2foh/49u8D5so
	0uUENgUgvqfs1zOdDUm+FDd/Aag/SgLRwivPmIlpKu+9I7c9aTGXGcQa9Nwm5fupFbtv0qWD02HLs
	iR5FmHvWeoQtmuvUJPwDWYdKGGv4pN6R5NEnX+AxvzuCly2+becIYS7q+Ee7hdVNcU947dMDIlnMJ
	pwwOLGfJmZY78o69sUKpIJ22yKm/2Xwx+8/VYR4/YqnHBAJlWZLl1ZhcooM0v+/uaKMOi6Vdp+AHf
	GIIgRbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1styOV-00000009eBG-2r0u;
	Thu, 26 Sep 2024 23:59:35 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1styMt-00000009e1u-11LD;
	Thu, 26 Sep 2024 23:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727395075; x=1758931075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FVXTk+PNxmIc7tbjypwiWusNwsBd6vOgIY/+i7i7gu0=;
  b=lmSnHIeNPLhY0H70lyBh//Z7eGNQfvJtGfs89RyMAW4ecV+Y1AjubQSA
   c5qiSQc9ybW3M/QLO2dXFC2mGi4D1t2KDp92A9SPmNRuodrM+FkDQyPuQ
   161PbvM4CRMIA0vHTur4Iv+VKZxS3pxYQXGVSVqgSl7yFzhiU/vBrbpiQ
   yb0I9IFbavFgIYB+y8BUY/NRYR5hWiMKkn18Y6QhMjzWvRGtbnmyWYY0C
   Qo3PRRPJInFSWf/qbACdsudF+LqUxBhJn1Wi8VL/ewORAOeTFrJ4AMW4B
   zWqeXZ4bx8WPrc/HSbbSEs1IWPh1ooRfG+lhMBBhwJXogcFeRtYCHAA8a
   g==;
X-CSE-ConnectionGUID: 5oFMqY6nRT2w7gc1VCkrMw==
X-CSE-MsgGUID: kQwVI1HOQs20kQhbaYCfnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37092394"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="37092394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 16:57:51 -0700
X-CSE-ConnectionGUID: 2iM7RUfkTJSqozK86RpSyQ==
X-CSE-MsgGUID: dlxGB7OjSmyM18+yFzfp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="77166783"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Sep 2024 16:57:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1styMk-000LJL-2X;
	Thu, 26 Sep 2024 23:57:46 +0000
Date: Fri, 27 Sep 2024 07:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chaotian.jing@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, ulf.hansson@linaro.org,
	matthias.bgg@gmail.com, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] mmc: mtk-sd: Implement Host Software Queue for eMMC and
 SD Card
Message-ID: <202409270757.fiwHeAaN-lkp@intel.com>
References: <20240925113949.149655-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925113949.149655-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_165755_409965_B7073D45 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/mmc-mtk-sd-Implement-Host-Software-Queue-for-eMMC-and-SD-Card/20240925-200025
base:   linus/master
patch link:    https://lore.kernel.org/r/20240925113949.149655-1-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH] mmc: mtk-sd: Implement Host Software Queue for eMMC and SD Card
config: arm-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270757.fiwHeAaN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270757.fiwHeAaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270757.fiwHeAaN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mmc_hsq_init" [drivers/mmc/host/mtk-sd.ko] undefined!
>> ERROR: modpost: "mmc_hsq_suspend" [drivers/mmc/host/mtk-sd.ko] undefined!
>> ERROR: modpost: "mmc_hsq_resume" [drivers/mmc/host/mtk-sd.ko] undefined!
>> ERROR: modpost: "mmc_hsq_finalize_request" [drivers/mmc/host/mtk-sd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

