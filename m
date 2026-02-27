Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C071039893
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Feb 2026 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDzUGbfAxdOnwqOOVpzQXYg8yOzdQOfX8pU6Ts9gzec=; b=dGJweOdh1KkkE00Rv6eQqdDfx/
	G+QqhX44+/EKOEMgaYIbnuc30naXIbeHN50eekqPaG+yykcTGpWjuhFtA2K/1mEeMMBUx8mKmsPPy
	q/GZrGY816ifkBLBiHT1vt5TpKWR0i76SxRLTUrDQL9f1HJPTD1bBB5uWTZFfk3lKz5Gjk2PH1L61
	jtfNQbUiGpabdoT9WbaVu5wr8uQIChdFgzk69Zk9lmEsOxUd7DBDb08xI3R4cPyh/a0nYTfWtC0sc
	DxoVWi0SpGz/mobCaEFxsf80B7snhOvtagLftGuaQvURARFXLrLJY0u5UJQACVpPFSpv79Dr/ZTHL
	4Ul1150Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4VC-000000097Xq-1k0u;
	Fri, 27 Feb 2026 20:31:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4V8-000000097XT-2mjc
	for linux-mediatek@bombadil.infradead.org;
	Fri, 27 Feb 2026 20:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aDzUGbfAxdOnwqOOVpzQXYg8yOzdQOfX8pU6Ts9gzec=; b=oLYziKNL58tq8ph5EQrtonvkyC
	STBqxtu2UzVY8EQM7QB8yvt/B0265RmWj4A+4H477hlRXpANw10vHaC2+vW2dnGnraFlESv0W79Kg
	kAKFDJeGHO0g7HrbyeQB6HUAq/fQFpjB5iHkyIoG7INahpNcnplcXsM2ILKb/NlkmnpEkyvQEGg3K
	KotwOtCElRE3OMuznBYdrCkTPBh3KeLT8eM5xcXiIFMCct+SWamZG3lLxo5EGgIl33K9hDp79NNun
	swT4oiDs1vaZPi949b78CuYYmWyGUrKm9REzl+g8j3bwfoW0By+Q8mtEp60byx59NEO+Kv2rtCCPg
	MvEBzS2A==;
Received: from mgamail.intel.com ([198.175.65.19])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4V3-000000058om-2pNV
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Feb 2026 20:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772224309; x=1803760309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7gMMXSmdmA1tBNKDTNrc8bRUDF2VVsAI+2IBxawq7Ls=;
  b=XbBvT3cV1wSN1WEkiD/44YU86dDQg5tBTi+x118RaXn68PIg91Nov8n3
   3c6HH/3f+x4RQ+siQ+YRxW18wdCsKnwvqNiB5eHGtHpUhPs7DZX1SO//Z
   +9Zc5m7Lzbk6cLuu/fxqFj3LUgh48UvlMvbgpizesZc1k2Vhx5rzfKKd5
   5HuLwlEeYJ/QhvwqQQHyRARDGOEx3fuMCBsbg2+TDQbRaUKen3/vYoKmq
   7kw1L/tRht85vzM9jr5PBwN/RCn1XYUo9UbgAhoRqDpBCe0lwQiNr6IKH
   pgiNn2pVOoGJrDYgbsVANhzQ48h/bd7viGwRUTka8gpKGBHdkrkMkm51V
   A==;
X-CSE-ConnectionGUID: OSlOxVHNSOGpve1oATSXsg==
X-CSE-MsgGUID: PieUtacURiqduEy+5GuLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73225491"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73225491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 12:31:01 -0800
X-CSE-ConnectionGUID: HMmeM1m4RHiSOwEk0dTWQw==
X-CSE-MsgGUID: Mrhtn7flRSezBFQhe6Ft4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="240005938"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2026 12:30:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw4Te-00000000B2P-3TnR;
	Fri, 27 Feb 2026 20:30:37 +0000
Date: Sat, 28 Feb 2026 04:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Message-ID: <202602280453.4TGe7q2R-lkp@intel.com>
References: <20260226074524.3808081-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226074524.3808081-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_203150_037881_62F538C1 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus robh/for-next linus/master v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/PCI-mediatek-gen3-Clean-up-mtk_pcie_parse_port-with-dev_err_probe/20260226-155647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260226074524.3808081-6-wenst%40chromium.org
patch subject: [PATCH v2 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
config: um-randconfig-001-20260227 (https://download.01.org/0day-ci/archive/20260228/202602280453.4TGe7q2R-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280453.4TGe7q2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280453.4TGe7q2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_probe':
>> pcie-mediatek-gen3.c:(.ltext+0x7e5): undefined reference to `pci_pwrctrl_create_devices'
>> /usr/bin/ld: pcie-mediatek-gen3.c:(.ltext+0xd45): undefined reference to `pci_pwrctrl_destroy_devices'
   /usr/bin/ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_remove':
>> pcie-mediatek-gen3.c:(.ltext+0xefd): undefined reference to `pci_pwrctrl_power_off_devices'
   /usr/bin/ld: pcie-mediatek-gen3.c:(.ltext+0xff0): undefined reference to `pci_pwrctrl_destroy_devices'
   /usr/bin/ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_device_power_down':
   pcie-mediatek-gen3.c:(.ltext+0x10cb): undefined reference to `pci_pwrctrl_power_off_devices'
   /usr/bin/ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_startup_port':
>> pcie-mediatek-gen3.c:(.ltext+0x13f6): undefined reference to `pci_pwrctrl_power_on_devices'
>> /usr/bin/ld: pcie-mediatek-gen3.c:(.ltext+0x1ae1): undefined reference to `pci_pwrctrl_power_off_devices'
   /usr/bin/ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_suspend_noirq':
   pcie-mediatek-gen3.c:(.ltext+0x1d19): undefined reference to `pci_pwrctrl_power_off_devices'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

