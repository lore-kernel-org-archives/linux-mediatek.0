Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D10E77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 05:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfaBJKC3JtPS4WoGZmxSWxpcL+JIM1S+SudEDgnQLQY=; b=nqfAh/E995uLxKDrAb5YOqQPXn
	btyATv+NPffd0O1XrI29U6fG/OMmVXDrHxrwERhf+aMOis1VoLG6Dvl2IVSZ3AYa1QWsSnMvlGtNg
	TA0xvbSwIZUZeuQzq1+PJc3ntDnY2axmceSJGbzE+7BKCT0t6/CPrWu4ySoK97FmQQCll3Xr6xMdm
	qcqBtwLcyyebJqYX9/GpAXYTYHmFFTHnTUiuF+bEA3ubtbL5QYnY3kHtMVV2c5EZReKRPbkva0ikM
	AMN1MFoPpBuFAgzFsD5UU3dRVW2PR0tUDkg5wlyAwcTqLgAFbP0CJ3x8ZQ3s2r67IjHojZ0VctunD
	n47MpB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVOLZ-00000007AJ1-2TDS;
	Wed, 08 Jan 2025 05:11:13 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVOKL-00000007ADe-1GT6;
	Wed, 08 Jan 2025 05:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736312997; x=1767848997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ii0v9G2O/Sgddpd5WwL725dEVh2c4NbCrDvHOB1LtgI=;
  b=bnvPVu5lEzSwpOqS10J2TiKpD9oX5NVn1mksHSa82cnGAvI1Ac7+7lRQ
   gMm5vremMKR9TOadzEQ0orZfX+qVRsRcGUT0kVLeTxvdouxT34XHP3aLM
   4+dRBZ+1qcj4QOWErHNewIJpylH+S8LTfmIhjKq0dKHke6gHBlnl9y3ui
   AmbGHeOrR7UmsK/muRavIqY4aNHt/x1pO7cjcO7ef+o1fbWDMQ2BMuS9s
   ttYcz/aDKi+qpJwCv7F/MyXXTE9AhkP+Dgq8xBkoCqFxfPqH26019SUxx
   9InJXGdFrc/Jbc31oYA2V2GRJl5cAPZe6EmlWfyzRHCF5ZYm8PBCGI05s
   Q==;
X-CSE-ConnectionGUID: jX58GF8YTomGZSS/7IZHVQ==
X-CSE-MsgGUID: g0e30C7YQJO8L7SfpaDwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40469245"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="40469245"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 21:09:49 -0800
X-CSE-ConnectionGUID: vx9g9AvbQVWLcojtSVYr2Q==
X-CSE-MsgGUID: qyolrQBbSMWp3rcHNGmDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103198374"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 21:09:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVOK8-000Fe3-0o;
	Wed, 08 Jan 2025 05:09:44 +0000
Date: Wed, 8 Jan 2025 13:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Message-ID: <202501081205.3pBFrmYH-lkp@intel.com>
References: <20250105142645.20128-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105142645.20128-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_210957_350983_1A2BBCB5 
X-CRM114-Status: GOOD (  11.17  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/cpufreq-airoha-Add-EN7581-CPUFreq-SMCCC-driver/20250105-223027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250105142645.20128-1-ansuelsmth%40gmail.com
patch subject: [PATCH v9 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
config: arm-randconfig-r063-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081205.3pBFrmYH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081205.3pBFrmYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081205.3pBFrmYH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arm_smccc_1_1_get_conduit" [drivers/pmdomain/mediatek/airoha-cpu-pmdomain.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

