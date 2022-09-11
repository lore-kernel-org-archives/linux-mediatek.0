Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E92ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BKWIiFw7MdBokD9IKpJuQvp8vq1F/y/4T6QIHiJf1s=; b=G7RpfCKmajSBUJscHfh4QY/RY8
	BQgJSxSs/ZhTjsZjeKfzBjHn0ie07WgEQTtDz6/59CeWI0VqxDbLTeRq+k/NeZIDxNZJ/wCapmQaI
	PkKM3aIwxR1HxM6RiEN24ihSH5nWkaF515VtHhwyeXEJAWuif82Te3sLpef/+HyJIhLax4RjuFr2f
	cIbJwPhWktclD9yeRXb9/DD8sk4+3k27mG3WIngCKy3aqdqM3rSGQBPhtQP0e6KohxYkGUBy7+Pwc
	z5c6nbWVzuXne3QyHLV4EcQXnLkVUfUvfj9bPRj82RwGdsJGoRrWQYQRXEDYZ7VNG2v0UeN4fgxpV
	BVsW9EzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXUDc-004Z0Q-55; Sun, 11 Sep 2022 21:10:20 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXUDZ-004YyV-06; Sun, 11 Sep 2022 21:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662930616; x=1694466616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RG8YfmgizY8f30fuvwod0ufH2YNJPSaaJvaqBsrhjZk=;
  b=mifNm0RqvlOEhib5dLnOFosdWbFinUGCyK37UmKeWJtC3H5fmByrM2Xd
   nrUcrkOCJj2vJ9WW6BYVsdg4IdhqAepk91wDv3ukTMEOm32pyWmoYM+1I
   QxzJGTZxg4LYMzmk+yMF41NIuF06uGCB3DAAT2VPw43N+eGqdAdrLcOIS
   5hajjxLdNvt+uKQFhOerTj/7HZiH7VDEAshOzzTrxwIdPUZPc9MPITea7
   6cAETRDYjDVt4fN2TbsXys0wnM0FX1XDo7J4QpbIf6upDxHt9UXK8CdRU
   LiM0u20Z2fGTFtU48ez1rfpIlK7yCAip4oMteXZ0AJ61joAX/ObB7x5qY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="384048369"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; 
   d="scan'208";a="384048369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2022 14:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; 
   d="scan'208";a="649045973"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Sep 2022 14:10:09 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXUDQ-0001pv-1l;
	Sun, 11 Sep 2022 21:10:08 +0000
Date: Mon, 12 Sep 2022 05:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kbuild-all@lists.01.org, devicetree@vger.kernel.org,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/9] drm/mediatek: Add gamma support different
 lut_size for other SoC
Message-ID: <202209120412.a3tFZuO9-lkp@intel.com>
References: <20220911153734.24243-5-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911153734.24243-5-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_141017_161179_A973366A 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Jason-JH.Lin",

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220909]
[also build test WARNING on v6.0-rc4]
[cannot apply to drm-misc/drm-misc-next robh/for-next drm/drm-next linus/master v6.0-rc4 v6.0-rc3 v6.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/Add-gamma-lut-support-for-mt8195/20220911-233949
base:    9a82ccda91ed2b40619cb3c10d446ae1f97bab6e
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220912/202209120412.a3tFZuO9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d5b909c49fd62f1e6055fd3d077b9c5fae53e00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jason-JH-Lin/Add-gamma-lut-support-for-mt8195/20220911-233949
        git checkout 1d5b909c49fd62f1e6055fd3d077b9c5fae53e00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:59:14: warning: no previous prototype for 'mtk_gamma_get_size' [-Wmissing-prototypes]
      59 | unsigned int mtk_gamma_get_size(struct device *dev)
         |              ^~~~~~~~~~~~~~~~~~


vim +/mtk_gamma_get_size +59 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

    58	
  > 59	unsigned int mtk_gamma_get_size(struct device *dev)
    60	{
    61		struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
    62		unsigned int lut_size = LUT_SIZE_DEFAULT;
    63	
    64		if (gamma && gamma->data)
    65			lut_size = gamma->data->lut_size;
    66	
    67		return lut_size;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

