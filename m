Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CBFEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdIHbNM1Yj3ksyRpU74ZC5bUNtcb2E/U9dR4f6zROzg=; b=ZfqMrLvv/DMppm9VH090oY+gqo
	6WZlFDiXH+in/QAvGWPvw8qTV0uMYzkhtGlA1zUVKbtD2P1z9mHBWjN+F/2AF33920WmzEKk25Vje
	/kTQaW+fg92QIFMRNBSabFd0eVUCs7h2rsYCmjNgHxM0xiEB8z5Z3xJVc9IuDXTTcjUoF6wjabTan
	3tVoucQyBoDsaKZtAZIw868cnT+Vh1sQ/TE7AxdGAtYKFC4lch70BeoIcUZx1uilw5dxhjSWXlSnY
	lzjCQZE+W+IpAlmaP/BTxf3YomZAo6ew9yoxT6gB6bTAHdfNnho+Mq1/dXvWU21uOKdePuF4UKXOn
	L2WpEfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERlw-00FHBG-2M;
	Wed, 28 Jun 2023 09:47:36 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERlt-00FHAO-0L;
	Wed, 28 Jun 2023 09:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687945653; x=1719481653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0rxMvXN9/9rNCH+4gQCmn1WFc0BxwRhyzO2KvFRuxfY=;
  b=NUxv3ustaObJnlyXWJH8FcPitD2TQPu8OQSFytHfV1BRVzVHEUyVL2YY
   AJ+gmxzcVOpfardhZ088K5yU2i79v17zFmTjW1g3FDpFBPu82ieObZhAz
   JVkb4wYyumFzLFk7To3DePrX/ih9DBkvH88omx4qELdx7b2byPYjbDVPy
   LIKlQGsbHHW3MgcB00RvbIKlIH9YqtN+QX1d2IcgEE26MkOejHjJS71o/
   NO8LrZySqaL0DI+Xedt4nWEuM2LYHWv7OfesiEaX37CqU/DhzjtO6bs6l
   HpgFufuXCaa/UbcojJ2rW2+dEhMZBus0UtNtqqCM19bhSDA4LpacP/5in
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="342137876"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="342137876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 02:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="667040646"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="667040646"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 02:47:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qERlm-000DAP-0p;
	Wed, 28 Jun 2023 09:47:26 +0000
Date: Wed, 28 Jun 2023 17:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 5/7] media: mediatek: vcodec: Read HW active status
 from syscon
Message-ID: <202306281746.a2zk4ETu-lkp@intel.com>
References: <20230627214615.1503901-6-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627214615.1503901-6-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_024733_192879_CF403B94 
X-CRM114-Status: GOOD (  13.54  )
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

Hi Nícolas,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on robh/for-next]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/N-colas-F-R-A-Prado/media-dt-bindings-mediatek-vcodec-Allow-single-clock-for-mt8183/20230628-054734
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230627214615.1503901-6-nfraprado%40collabora.com
patch subject: [PATCH v4 5/7] media: mediatek: vcodec: Read HW active status from syscon
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230628/202306281746.a2zk4ETu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281746.a2zk4ETu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281746.a2zk4ETu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: In function 'mtk_vcodec_is_hw_active':
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:52:17: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      52 |         return !FIELD_GET(VDEC_HW_ACTIVE_MASK, cg_status);
         |                 ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +52 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c

    42	
    43	static bool mtk_vcodec_is_hw_active(struct mtk_vcodec_dev *dev)
    44	{
    45		u32 cg_status;
    46	
    47		if (dev->vdecsys_regmap)
    48			return !regmap_test_bits(dev->vdecsys_regmap, VDEC_HW_ACTIVE_ADDR,
    49						 VDEC_HW_ACTIVE_MASK);
    50	
    51		cg_status = readl(dev->reg_base[VDEC_SYS] + VDEC_HW_ACTIVE_ADDR);
  > 52		return !FIELD_GET(VDEC_HW_ACTIVE_MASK, cg_status);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

