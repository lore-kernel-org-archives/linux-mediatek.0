Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E74C52D73
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOPv+SCLxJAFXVGSHG/CCekpFZIt+uTGeWFDZdU6gCE=; b=dzvjt+Zqn9mIBF429bLrN6eCv8
	B56ZRp0cYaDXj9xcK+L2HpS75w0hJBuYN+qcaIBqb/8/0CuN1eetDFF35JavMHRlL3YJyaDFwfPLJ
	bAXU/IwdjX6B+ek9BWIURdoBrXh8d7WNHHxpu8YJLvLg0PCc/eUekhqj8jpuD2TH/DAPFzpWcheCx
	LXjlQdaJ7Dys7IdHr2TyMlEwQ0hqFh8Z9INwm/dPJifKoIaYFYOxqIDKqSw3mN4Aw+UqpEqZ85oL5
	DJsflbHGmQCO7OfqkPk6D5Vs3vl9HCvXMxqfbRIQelVoslcGyRiHUy71T2TEweW7WnNVypESAO79I
	ZVsRjPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scCFY-00000009gf0-3yd0;
	Thu, 08 Aug 2024 23:08:52 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scCFV-00000009gda-1ZDV;
	Thu, 08 Aug 2024 23:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723158530; x=1754694530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T7KdUeo7zRdu2V4NwX3BnZOQDuovZf6qEZiSGn3VOz8=;
  b=TEx6SiZhlW/400qx+Uuuhse/ilhhaToV/ofdXxjcq68bzapkbIjv5LUq
   /dp+koFWVr51WyFtTQ5aO+5AKoMVZQluGPwHChYmXIx7mjTDbrpKZudKB
   ZcHz2BtVm9YbRyX0MFvNeW2NMP73MXw0B+pOiS3ENP0YJtmq0LkLceain
   v97vvidhw2JRCPzELX9RR4elEg/bs2jbMj7WMEnsM62xPug6p7qczJGH4
   6A6ueld4b/r3rNgbtC2C1aHmg8nfoi6PMG82GtnEmozIfF2BVTIwmg9hu
   sqgiwa/refQ5EUzoirB0vhN0yTcQMiuMQANUuj8pDBNaZgqWOPKtZ/3Cw
   w==;
X-CSE-ConnectionGUID: hYuptwBTTFaQoxITJU9FTQ==
X-CSE-MsgGUID: u/i0OSFUQ8OvBVCPeuBdtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20977167"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="20977167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 16:08:46 -0700
X-CSE-ConnectionGUID: yiARJAgUSQ6iMi70uo66VQ==
X-CSE-MsgGUID: X00cbstkRRO3ElG4P2oYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62015850"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Aug 2024 16:08:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scCFK-0006bW-1v;
	Thu, 08 Aug 2024 23:08:38 +0000
Date: Fri, 9 Aug 2024 07:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjian Song <jinjian.song@fibocom.com>,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	corbet@lwn.net, linux-mediatek@lists.infradead.org,
	danielwinkler@google.com, korneld@google.com,
	Jinjian Song <jinjian.song@fibocom.com>
Subject: Re: [net-next v1] net: wwan: t7xx: PCIe reset rescan
Message-ID: <202408090610.w01C56AC-lkp@intel.com>
References: <20240808111801.8514-1-jinjian.song@fibocom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808111801.8514-1-jinjian.song@fibocom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_160849_448037_EA7FAEE6 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Jinjian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjian-Song/net-wwan-t7xx-PCIe-reset-rescan/20240808-192313
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240808111801.8514-1-jinjian.song%40fibocom.com
patch subject: [net-next v1] net: wwan: t7xx: PCIe reset rescan
config: i386-buildonly-randconfig-004-20240809 (https://download.01.org/0day-ci/archive/20240809/202408090610.w01C56AC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090610.w01C56AC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090610.w01C56AC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wwan/t7xx/t7xx_modem_ops.c:204:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     204 |         } else if (type == PLDR) {
         |                    ^~~~~~~~~~~~
   drivers/net/wwan/t7xx/t7xx_modem_ops.c:215:9: note: uninitialized use occurs here
     215 |         return ret;
         |                ^~~
   drivers/net/wwan/t7xx/t7xx_modem_ops.c:204:9: note: remove the 'if' if its condition is always true
     204 |         } else if (type == PLDR) {
         |                ^~~~~~~~~~~~~~~~~
     205 |                 ret = t7xx_acpi_reset(t7xx_dev, "MRST._RST");
     206 |         } else if (type == FASTBOOT) {
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     207 |                 t7xx_host_event_notify(t7xx_dev, FASTBOOT_DL_NOTIFY);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     208 |                 t7xx_mhccif_h2d_swint_trigger(t7xx_dev, H2D_CH_DEVICE_RESET);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     209 |                 msleep(FASTBOOT_RESET_DELAY_MS);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     210 |         }
         |         ~
   drivers/net/wwan/t7xx/t7xx_modem_ops.c:196:9: note: initialize the variable 'ret' to silence this warning
     196 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +204 drivers/net/wwan/t7xx/t7xx_modem_ops.c

   193	
   194	int t7xx_reset_device(struct t7xx_pci_dev *t7xx_dev, enum reset_type type)
   195	{
   196		int ret;
   197	
   198		pci_save_state(t7xx_dev->pdev);
   199		t7xx_pci_reprobe_early(t7xx_dev);
   200		t7xx_mode_update(t7xx_dev, T7XX_RESET);
   201	
   202		if (type == FLDR) {
   203			ret = t7xx_acpi_reset(t7xx_dev, "_RST");
 > 204		} else if (type == PLDR) {
   205			ret = t7xx_acpi_reset(t7xx_dev, "MRST._RST");
   206		} else if (type == FASTBOOT) {
   207			t7xx_host_event_notify(t7xx_dev, FASTBOOT_DL_NOTIFY);
   208			t7xx_mhccif_h2d_swint_trigger(t7xx_dev, H2D_CH_DEVICE_RESET);
   209			msleep(FASTBOOT_RESET_DELAY_MS);
   210		}
   211	
   212		pci_restore_state(t7xx_dev->pdev);
   213		t7xx_pci_reprobe(t7xx_dev, true);
   214	
   215		return ret;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

