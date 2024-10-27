Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C63D10BFE
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Oct 2024 04:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//Mvd7NH9L+IzqCnxh1HfCMOFiebzIAUI3rqGCE5g0g=; b=k5kVv0pDdUYtNMcVGSE33I0U4n
	hypuuABm3mRnZVpoBkeaEktQ55/YEfW44a9bohDmM0MfD8Xl5+FnQ/32g2WlayFkrThw8E3YJCBqN
	Rwy9BJ/5LNL6VDplij38lZuH2ezg+u/lDJzJtstg/18GOSD/lipKrEvUex9kLjPcpeKELDYZvj9Bp
	lQfmsHTuweGa5rxDdRX8Ue3i4EeLGYWqBuK0v/aahnSOq6X46+pG/ScUi9sNoHW7vsfkeG0dXWASa
	4li2BxeqenV2UNzoEtWeOsQnfajkVz5Q8pb7feNYBKcP+13httWBMyX3HjSMYzgn0oL48fnRJx4s1
	KVvdsRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4v4E-00000007fP3-2UxL;
	Sun, 27 Oct 2024 04:39:54 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4v2c-00000007fEQ-2Vfi;
	Sun, 27 Oct 2024 04:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730003894; x=1761539894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ECxxFyhpO8qHRImcih3jeV1ktiIwqvcCsxWmhdKNxh4=;
  b=mAO4G0MnVjzfZdfl5bQQgLzBsBYYZrCyZxhSNN2hgG4e0f7UzcvhCWh6
   R7YX9WYKhzfCL2VJ9DV0Crj/Zj/K8wRurWka57eKf9qHJPMJvKRhm0VXs
   MI5yHxuP54wVhRVhmnEPuh32swlPV3F0NTIUgTrx/bjNZpdXV1YrKHvO1
   GlVErzNdjYsadNiHeR6kZ5qazGcM/+o2WJQMDxIfXu/vEynQzMmAWFv1Z
   Tn/uDBGSRCgrQJbfDqIiI/8VlLrMXzlisFPm3rU4lTd292vuhs1VZ7INE
   pcEsDUrXJxHlWDjA8wxM0+QaiWcRwUlMsZ3tsHs21g2uDixhwSmRCa6Zl
   g==;
X-CSE-ConnectionGUID: RYcDIwg9QWmVNoE4fXfiTA==
X-CSE-MsgGUID: 1h8r9PCDSAKczwDiUamRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32491950"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="32491950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:38:11 -0700
X-CSE-ConnectionGUID: TUJ2qrRORae0DfeeuQklgQ==
X-CSE-MsgGUID: 8d3gP7ykRz+5Hpbrgjsbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="112140445"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2024 21:38:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4v2U-000aMc-0Z;
	Sun, 27 Oct 2024 04:38:06 +0000
Date: Sun, 27 Oct 2024 12:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Karl.Li" <karl.li@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chungying Lu <chungying.lu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
Message-ID: <202410271207.42FIkHwC-lkp@intel.com>
References: <20241024092608.431581-4-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024092608.431581-4-karl.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_213814_677616_CC986489 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Karl.Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karl-Li/dt-bindings-mailbox-mediatek-Add-apu-mailbox-document/20241024-173032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241024092608.431581-4-karl.li%40mediatek.com
patch subject: [PATCH 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
config: nios2-randconfig-r111-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271207.42FIkHwC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410271207.42FIkHwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271207.42FIkHwC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/mtk-apu-mailbox.c:29:24: sparse: sparse: symbol 'g_mbox' was not declared. Should it be static?

vim +/g_mbox +29 drivers/mailbox/mtk-apu-mailbox.c

    28	
  > 29	struct mtk_apu_mailbox *g_mbox;
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

