Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4401EC4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3XzbpyFPELl81pXSaeXty0t+oxz+oy2WG2wuI8AK3I=; b=dhdo0UmjjqYNRR0s6+A3HPS/sK
	CeLN8Ux6LDUux/Lfy9qBM4NtjcP9NxLXp/VqFAteNmNTagwjXeTbpXd60dD26zQaHSBETBFM7zfeP
	+TcwsJKF/iwB8NP4mm0QJ4IrePQ+V/4R5M4fvwjDSGDRrXQvO0TeAdFeJsAbudp41gnNV/si/aUEj
	C+nTn+Ah3ti3i0vFZ0eAvyH/INv2z9wtfo7kg+875tqa20RBP5guPIEQh+btathYR8qXWpkKLIRdP
	f7onDvyRV/T/UQcrebS/9f+vHshaG3GR202F6YCVqmtrdEaGJQzbV25LV57031zHfRZ+cD+hx3FpN
	HboP8Ofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvh0-0000000C4tK-1YVb;
	Fri, 02 Feb 2024 15:43:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvgx-0000000C4qy-1sdR;
	Fri, 02 Feb 2024 15:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F3XzbpyFPELl81pXSaeXty0t+oxz+oy2WG2wuI8AK3I=; b=W4mpdviIpt/6cqbVdjx2cVn+01
	5LSSrB2Ff8FiFlFRmZFI7uFAG/o2+7o5FZ7HweP9BSUmh2AacoBsGE6af9+Lu0ncZ8g2gg8cOYZwY
	XEnRX7+8qNxciM0Oacc9QVTtRQwOJ/YhJJdi4AJ0GDP/AiKe7HGNG/Pl1LtU0M7nlNivJGkRwyU9M
	dHEUqTD/dr8BqJdEfMJT9XDn+MiwRs9KFpPZhpM9s956cp+2Y/m3cUT5j4w1Ts912oJkKLkHzv4Gt
	KG1HOq7R4QQquWqxS6vxRVYA64rGUwXPJRdFWAXPfLlb5QSWoRYR+izqFsDW9YGduJasb2L/pB5BX
	WejZAN+A==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvgs-0000000A4DE-0vk8;
	Fri, 02 Feb 2024 15:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706888575; x=1738424575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i+fwGDOYXUBBa/SmGUmEeeSRO1FqOePL0sfvubTwHA0=;
  b=jWt3bGRuAYcvD0MNg0aXRyQ3zgKM6ZxIrKo8I9NUjYobwmCTEqAXYIII
   98kSqdlK2fjMXuN5xu5Vg8lwMDQFOF8BxifV3j1wac+oZeeLDvvSQwrmJ
   5nsocLrSjpJsdysD5GYnHtCUMGcYi8sadchck2e58Xc3pLFE6VafWU16L
   2nS/DWiOGWfQc4xKRSfcP5VW+gNdYd8qolK5mN16SVPBGEqXjDMKat6rY
   wFRlsl2npC7Qb8VDJW02rQdF7+Pkr9/mZ1L0FLYN+n2OcP2KZSxUfkFuB
   +tEzbpiBD5WXIHUOaJi8GHkpV4eA8gyozmQZXftPZcOKiFcSf11i7sxyK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11543303"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="11543303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 07:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4719672"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2024 07:42:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVvgd-0003zm-1G;
	Fri, 02 Feb 2024 15:42:39 +0000
Date: Fri, 2 Feb 2024 23:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>, Sebastian Reichel <sre@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH 06/18] power: reset: brcm-kona-reset: Use
 devm_register_sys_off_handler(RESTART)
Message-ID: <202402022349.daHRuWLB-lkp@intel.com>
References: <20240201180102.70395-7-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201180102.70395-7-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_154255_854393_73292D04 
X-CRM114-Status: GOOD (  13.65  )
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

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on mani-mhi/mhi-next soc/for-next linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/power-reset-atc260x-poweroff-Use-devm_register_sys_off_handler-RESTART/20240202-020809
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20240201180102.70395-7-afd%40ti.com
patch subject: [PATCH 06/18] power: reset: brcm-kona-reset: Use devm_register_sys_off_handler(RESTART)
config: arm-randconfig-r121-20240202 (https://download.01.org/0day-ci/archive/20240202/202402022349.daHRuWLB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240202/202402022349.daHRuWLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022349.daHRuWLB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/reset/brcm-kona-reset.c:18:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *kona_reset_base @@     got void *cb_data @@
   drivers/power/reset/brcm-kona-reset.c:18:45: sparse:     expected void [noderef] __iomem *kona_reset_base
   drivers/power/reset/brcm-kona-reset.c:18:45: sparse:     got void *cb_data
>> drivers/power/reset/brcm-kona-reset.c:43:46: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *cb_data @@     got void [noderef] __iomem *[assigned] kona_reset_base @@
   drivers/power/reset/brcm-kona-reset.c:43:46: sparse:     expected void *cb_data
   drivers/power/reset/brcm-kona-reset.c:43:46: sparse:     got void [noderef] __iomem *[assigned] kona_reset_base

vim +18 drivers/power/reset/brcm-kona-reset.c

    15	
    16	static int kona_reset_handler(struct sys_off_data *data)
    17	{
  > 18		void __iomem *kona_reset_base = data->cb_data;
    19	
    20		/*
    21		 * A soft reset is triggered by writing a 0 to bit 0 of the soft reset
    22		 * register. To write to that register we must first write the password
    23		 * and the enable bit in the write access enable register.
    24		 */
    25		writel((RSTMGR_WR_PASSWORD << RSTMGR_WR_PASSWORD_SHIFT) |
    26			RSTMGR_WR_ACCESS_ENABLE,
    27			kona_reset_base + RSTMGR_REG_WR_ACCESS_OFFSET);
    28		writel(0, kona_reset_base + RSTMGR_REG_CHIP_SOFT_RST_OFFSET);
    29	
    30		return NOTIFY_DONE;
    31	}
    32	
    33	static int kona_reset_probe(struct platform_device *pdev)
    34	{
    35		void __iomem *kona_reset_base;
    36	
    37		kona_reset_base = devm_platform_ioremap_resource(pdev, 0);
    38		if (IS_ERR(kona_reset_base))
    39			return PTR_ERR(kona_reset_base);
    40	
    41		return devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
    42						     128, kona_reset_handler,
  > 43						     kona_reset_base);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

