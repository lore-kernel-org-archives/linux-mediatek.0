Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F575C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 06:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FA5gGoE6m2zHqpqLxszaTgZhhIn2Danvn09tcwAY+cE=; b=kyGP9SCqGzvrvl
	VliAG+AP4WX4lpQWw3dXk34nqbtohZM5BncvwG2UTp4LnTuz8H+/yIeuM228mymRuOtqmVMgnGtM5
	IIE/cvZZVwW5ocdRWF3PcsaCuAx6D/AE2deMyeWRtMCBvORhwKjTI2zP3/Jl9dBOKhyj0JqOUko2w
	KNPru5+bIGuuRq6eeWyUXKid29B5FJ4rL2NnMyMEg4O43IN/fPZf5Me/nFtO93gJ5SXQMewyfHBFF
	eLaDfTi6LzujaOczWhlCM+jlmN3Sfuw2gAycQMTI6EWLqoGuzn1qpLuAhpsbCWkojOdnoK+JO1iTS
	H7ldc/sRXfwcBP4YMgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni9af-003bWE-MJ; Sat, 23 Apr 2022 06:49:57 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni9aa-003bVP-D6; Sat, 23 Apr 2022 06:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650696592; x=1682232592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/TgZTP8Sb4P0FH9slFXu/lphspGv+TGMH48WzenOT9M=;
 b=CgLv0cNokeVuUc3sPD/1E8DHwcNLhxdF2M9XMrt7IVRTWO2dfb+Nmmjz
 jv/wumVJ8SHweS0qUGLrlzCcGONGTySvXdvDCr+4pH4ynzSsJg1sX1tNy
 hURvwnyHX+hWdV+kSr3hBpixlKTLx4x6trrvW6X8fGImBI0RpXoCkclHf
 O/UyiiRBtVzEPhyq5eO2jAaergFn3ylNyLITwvwsqDe5p95V4AWScoLuz
 xS1HAcxD0X2BRt6ufjIfONpMeLLW1WyXwYLC191hiRcxQMR3aIOgsXJY4
 nRdeOJu90R44M0s8Zmqd4wrIF0m5mMik3oD/Klqy69EBMztsRv249KDyv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351307418"
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; d="scan'208";a="351307418"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 23:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,283,1643702400"; d="scan'208";a="627297258"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2022 23:49:48 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ni9aW-000B6g-75;
 Sat, 23 Apr 2022 06:49:48 +0000
Date: Sat, 23 Apr 2022 14:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Miles Chen <miles.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-media@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/mediatek: fix NULL pointer dereference when
 printing dev_name
Message-ID: <202204231446.IYKdZ674-lkp@intel.com>
References: <20220422223549.4173-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422223549.4173-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_234952_498638_BDA5276A 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Miles,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on joro-iommu/next]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miles-Chen/iommu-mediatek-fix-NULL-pointer-dereference-when-printing-dev_name/20220423-070605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
config: hexagon-randconfig-r041-20220422 (https://download.01.org/0day-ci/archive/20220423/202204231446.IYKdZ674-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/85771767e503ca60069fe4e6ec2ddb80c7f9bafa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miles-Chen/iommu-mediatek-fix-NULL-pointer-dereference-when-printing-dev_name/20220423-070605
        git checkout 85771767e503ca60069fe4e6ec2ddb80c7f9bafa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/mtk_iommu.c:605:6: warning: variable 'larbdev' is uninitialized when used here [-Wuninitialized]
           if (larbdev) {
               ^~~~~~~
   drivers/iommu/mtk_iommu.c:597:24: note: initialize the variable 'larbdev' to silence this warning
           struct device *larbdev;
                                 ^
                                  = NULL
   1 warning generated.


vim +/larbdev +605 drivers/iommu/mtk_iommu.c

   592	
   593	static void mtk_iommu_release_device(struct device *dev)
   594	{
   595		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
   596		struct mtk_iommu_data *data;
   597		struct device *larbdev;
   598		unsigned int larbid;
   599	
   600		if (!fwspec || fwspec->ops != &mtk_iommu_ops)
   601			return;
   602	
   603		data = dev_iommu_priv_get(dev);
   604		larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
 > 605		if (larbdev) {
   606			larbdev = data->larb_imu[larbid].dev;
   607			device_link_remove(dev, larbdev);
   608		}
   609	
   610		iommu_fwspec_free(dev);
   611	}
   612	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
