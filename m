Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A05DC4828F
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Feb 2024 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcXXYUgVSL9kjl2XrH/4D3QOseZ7ki/ehIxouq4tLTI=; b=0Sc4+FFc+qZax0XmG6qWP3bOAG
	Z0hUVw06SxF+89NNMGR3C3ovxD3TghytI2+dgAs2HWQBRdfvkZAMsJN1uFNa/oRDu5cbOZrkjZxGc
	whISfV2vpwpsSOMba1Wum2gNF4Xiv9STy3h2bvl3OFBLg12SrtGw4sdtNd6nbUvFzAl9NF7ZSEx9B
	n2XXB2OBogSR+GX6oFipzDZFcGbfzumiLqI707xx2m3eE8K8MavBAGj4Db+AVp51GOoGKuFxRTn6j
	CuxVmTck8R2fmZWsdP+KSZ9i1aG5zKDhEm/dCElLtl1dQipS1PFqJueLMGtFakQOUCasLx6yjB+6V
	4lfXimeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW9pM-0000000FgAx-3aLk;
	Sat, 03 Feb 2024 06:48:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW7Wy-0000000F4pv-37d9;
	Sat, 03 Feb 2024 04:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GcXXYUgVSL9kjl2XrH/4D3QOseZ7ki/ehIxouq4tLTI=; b=GEeKnyQbcVPFFnDnClIqK23MJx
	dyXWsZiKEzBzHNzPYPKzupx8DlFL6jgOrbgrrIOzZWldQ2+C76Y3UCvcEEnlGcbUUS/lW+PnJlJi6
	q6kBDiOhrZjv3j634rhDyhaXqgkHpuue3ZrlthpIar8Jk6ZvFTnVoZK1PS7Mq/+81aQ6jbIanm9cD
	kVgRn7F6rLyMUE+yCWTFEgUAYkDkkUsXVHsLlkgmLgkRyM4QvzJ/x/6hTQV4oyhDw1DZhLRY2y/EW
	0hwsmjwp9Z+FUiU2qMl8IZmU7wIVlBTngkrgeagkNOFqzawKh9eTh3nTjsHkE6nMyvVlNDoDTDVmM
	BRiZvDfA==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW7Wo-0000000AYzw-38Vz;
	Sat, 03 Feb 2024 04:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706934078; x=1738470078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l8fqb95s8syuE8Cx9UHSXoTZx0Bim/EsdxuGX0FstWM=;
  b=dfEDpbfiJnqZ+bUbfsTPG5EO6yWgODe+VBDxP9XoHzGx4Z7ZFXzmpiWl
   QeIcAsjMALFsrjwzZz258MZuiur2YV6hQeXAnS26APebtFov5U1q3+/PW
   QqO5bN99i3ClM/wfmlLa7wGEW/2J37Fik1Hh6Vh/FlNVZJQoALnEfRI60
   o36iZ/+Vq02aJmh7aMei/pE7Kud4EhxiqRz+Ddq2fOU+FCZxbYKwMWBdE
   MPvVqvU4dz+pwu8931kwkJFXHt7TrVsQqidzaq0s/1GknPrJzsD0HdDeA
   xhqHgsoNB224cl+9OvQx2B+80lkxmJ9/nr2zPEiG51dR3ghe80CvUVWtf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11655562"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="11655562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 20:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="31047732"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Feb 2024 20:21:04 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW7WX-0004cQ-0G;
	Sat, 03 Feb 2024 04:21:01 +0000
Date: Sat, 3 Feb 2024 12:20:06 +0800
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
Subject: Re: [PATCH 09/18] power: reset: rmobile-reset: Use
 devm_register_sys_off_handler(RESTART)
Message-ID: <202402031246.nZHDnDnf-lkp@intel.com>
References: <20240201180102.70395-10-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201180102.70395-10-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_042120_830090_3DAA13D4 
X-CRM114-Status: GOOD (  11.81  )
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
patch link:    https://lore.kernel.org/r/20240201180102.70395-10-afd%40ti.com
patch subject: [PATCH 09/18] power: reset: rmobile-reset: Use devm_register_sys_off_handler(RESTART)
config: hexagon-randconfig-r122-20240202 (https://download.01.org/0day-ci/archive/20240203/202402031246.nZHDnDnf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402031246.nZHDnDnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031246.nZHDnDnf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/reset/rmobile-reset.c:24:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *sysc_base2 @@     got void *cb_data @@
   drivers/power/reset/rmobile-reset.c:24:40: sparse:     expected void [noderef] __iomem *sysc_base2
   drivers/power/reset/rmobile-reset.c:24:40: sparse:     got void *cb_data
>> drivers/power/reset/rmobile-reset.c:45:47: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *cb_data @@     got void [noderef] __iomem *[assigned] sysc_base2 @@
   drivers/power/reset/rmobile-reset.c:45:47: sparse:     expected void *cb_data
   drivers/power/reset/rmobile-reset.c:45:47: sparse:     got void [noderef] __iomem *[assigned] sysc_base2

vim +24 drivers/power/reset/rmobile-reset.c

    21	
    22	static int rmobile_reset_handler(struct sys_off_data *data)
    23	{
  > 24		void __iomem *sysc_base2 = data->cb_data;
    25	
    26		/* Let's assume we have acquired the HPB semaphore */
    27		writel(RESCNT2_PRES, sysc_base2 + RESCNT2);
    28	
    29		return NOTIFY_DONE;
    30	}
    31	
    32	static int rmobile_reset_probe(struct platform_device *pdev)
    33	{
    34		void __iomem *sysc_base2;
    35		int error;
    36	
    37		sysc_base2 = devm_platform_ioremap_resource(pdev, 0);
    38		if (IS_ERR(sysc_base2))
    39			return PTR_ERR(sysc_base2);
    40	
    41		error = devm_register_sys_off_handler(&pdev->dev,
    42						      SYS_OFF_MODE_RESTART,
    43						      SYS_OFF_PRIO_HIGH,
    44						      rmobile_reset_handler,
  > 45						      sysc_base2);
    46		if (error) {
    47			dev_err(&pdev->dev,
    48				"cannot register restart handler (err=%d)\n", error);
    49			return error;
    50		}
    51	
    52		return 0;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

