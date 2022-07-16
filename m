Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D67C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKYcakxHgF4ZGmOKgugkyiCgJHd0xKgjxghPQSaiVeM=; b=rCWf1COAiyvMV9l/JuSFyxmp78
	HIXassHhYsWAj4NBosog4oF61fIxbBJp1wXJpqnkNiAX4WfGnnIbqk47XmPTs+hoZtOi1UbM5bhG/
	M6Oj/uTleM+GjXyqxuoqSj56PX85syEltSOpHEmNHoUP15mskq7mYSLvznI3zjlaE2CM25HIkHdsY
	0DV6l4ipJn554mjt5MtuUc0oaJpaeUSzJpU1FOubQtS4WVwUl7o+l1bBPo3DCJDR7uLdxKE2yA1qF
	fd4i3xxECbOCzsn6U7Lap7ab5YuJrnmPCraXamqm5finRum/o3jxUww1eoNDq+S6f2BCvaNJQ1hnz
	XcRYZn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCpLm-000jQK-4z; Sat, 16 Jul 2022 21:29:22 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCpLY-000jMF-KA; Sat, 16 Jul 2022 21:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658006948; x=1689542948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NgZ4seBUGAZrP1z2/pQzfp6BeM2VbnyWXo2RxyFi9hk=;
  b=KfW6N3lsH52yERIYnuQziW8gvy/DWbteLDHvwnQSRIzMICgI1oOaaFwR
   cZP/rkicaDkMlFTSdiUzOvFCbKyeUKGcCMKdg8zQwa38+flH7Zi3c1JYk
   XQJdIWz48So82pBl3Y1BygLZtHh6A9PXGPTaeorB2MK1aEBqANwhmKQ5i
   3dzpBN4+9IObcUQ91WfwRV4P8obSmhrorKGG+bXP3mPKiIOqH2S35ERdj
   fy/YfIYu6El92VS9uGHQEIIGwukmTGVTd+olr6moqANA8gdiESGkFs1/1
   pdoqet1z/7v0x7WptuPBcHvWWwVfOQ4qUab1WYVhmW3gNV3YdsLB2aY9E
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="372319053"
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="372319053"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 14:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="654782025"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jul 2022 14:28:42 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCpL3-0002AS-92;
	Sat, 16 Jul 2022 21:28:37 +0000
Date: Sun, 17 Jul 2022 05:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	angelogioacchino.delregno@collabora.com,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: kbuild-all@lists.01.org, linux-media@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Irui Wang <irui.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/5] media: mediatek: vcodec: Add encoder driver support
 for 34-bit iova
Message-ID: <202207170508.vBteKVVR-lkp@intel.com>
References: <20220716093808.29894-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220716093808.29894-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_142908_715310_63A64F88 
X-CRM114-Status: GOOD (  13.97  )
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

Hi Irui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Irui-Wang/support-mt8188-h264-encoder/20220716-235804
base:   git://linuxtv.org/media_tree.git master
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220717/202207170508.vBteKVVR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cfa5713276c701af0193ab5371d6678515cea42f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Irui-Wang/support-mt8188-h264-encoder/20220716-235804
        git checkout cfa5713276c701af0193ab5371d6678515cea42f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/platform/mediatek/vcodec/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:194: warning: expecting prototype for struct venc_h264_vsi_64. Prototype was for struct venc_h264_vsi_34 instead


vim +194 drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c

   184	
   185	/**
   186	 * struct venc_h264_vsi_64 - Structure for VPU driver control and info share
   187	 *                           Used for 64 bit iova sharing
   188	 * @config: h264 encoder configuration
   189	 * @work_bufs: working buffer information in VPU side
   190	 */
   191	struct venc_h264_vsi_34 {
   192		struct venc_h264_vpu_config_ext config;
   193		struct venc_h264_vpu_buf_34 work_bufs[VENC_H264_VPU_WORK_BUF_MAX];
 > 194	};
   195	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

