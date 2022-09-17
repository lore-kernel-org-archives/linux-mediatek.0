Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31FAECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Sep 2022 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcU8aRPMMq1mmVagvwr7brY2VmlMxorAqiqHggTxOW0=; b=XpbGo7Kd5ZdKNragkJ/yonaN2H
	o7Vdax6HnMlZ/vWgFPP71B3vf9NWQuTqcAAYqdftiaUmx7/NDEebq8oww99EJ+bOMvhWD9iHR7CUu
	3pU+o9MPToKvgN0SlAVsaPd2qFpjTxwJKMqmMyhpqVm/6tB4D/826+HWYDsYjSdEez8AIz7FGtYW4
	9fR+7PNCBH60lCzGyiJLHVEusxXA85g5+5Xs/emybsk3bhKRTmrnIbGeQhuz00lVlY0NwJ5DXmChM
	F/KhZzh7r0ab0kB8/sU0r5/yhnWkl1GSASJl/p7Zvh3tfPyuMWwiFF3PWjtihqZz6vg7ZS6S0qQ6P
	Hujri8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZXYO-005zms-PU; Sat, 17 Sep 2022 13:08:16 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZXYB-005zhF-S8; Sat, 17 Sep 2022 13:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663420083; x=1694956083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4GgQvWqxbcuIDqU+vetR4DKizrn7NaA1pr/ULmoxbrA=;
  b=G3BfoeN2hkkW8hR3+L4E7242nMzdefVrfK8RHz6AHkKHcEuHBrgSxBWn
   TuIgGQhfAnAMHQWAOLs57ScrOE3/Q3b5w87/swfYMf+uM/2A30wfhk+Hd
   vTfp2LvohP7pBvglqww24jVAEP2Fe7AJow4xNWb2CWGkL47KnmpZqSpW0
   993mqBzeoywpBvDldoias4ZmvO1JCF8MgDTU7JcDgRLEywYbZTu/HGccO
   Kgr37fpCZJX6PgvtYFaMqqkxVsyd9MLnBa5o1IHvAiGEK3WuyLEFDfi/d
   RsQcnuMrWxM4jxZ3ChEhKUOtPFZ5q8Z/nf3iY55RVx+oVPys1wsm1wab4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="297879373"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="297879373"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 06:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="946681063"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2022 06:07:57 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZXY5-0000LR-0t;
	Sat, 17 Sep 2022 13:07:57 +0000
Date: Sat, 17 Sep 2022 21:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: kbuild-all@lists.01.org, Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>,
	Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: fix gce timeout issue
Message-ID: <202209172020.fo64pfnn-lkp@intel.com>
References: <20220917090940.10088-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917090940.10088-1-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_060803_977308_046ECA66 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Yongqiang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on fujitsu-integration/mailbox-for-next]
[also build test ERROR on soc/for-next linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongqiang-Niu/mailbox-mtk-cmdq-fix-gce-timeout-issue/20220917-171148
base:   https://git.linaro.org/landing-teams/working/fujitsu/integration.git mailbox-for-next
config: openrisc-randconfig-r023-20220916 (https://download.01.org/0day-ci/archive/20220917/202209172020.fo64pfnn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/044a12235901d40a3442fa5ab0c4b3233f370e22
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yongqiang-Niu/mailbox-mtk-cmdq-fix-gce-timeout-issue/20220917-171148
        git checkout 044a12235901d40a3442fa5ab0c4b3233f370e22
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.c:713:10: error: 'const struct gce_plat' has no member named 'sw_ddr_en'
     713 |         .sw_ddr_en = true,
         |          ^~~~~~~~~
   drivers/mailbox/mtk-cmdq-mailbox.c:714:20: warning: initialized field overwritten [-Woverride-init]
     714 |         .gce_num = 1
         |                    ^
   drivers/mailbox/mtk-cmdq-mailbox.c:714:20: note: (near initialization for 'gce_plat_v7.gce_num')


vim +713 drivers/mailbox/mtk-cmdq-mailbox.c

   708	
   709	static const struct gce_plat gce_plat_v7 = {
   710		.thread_nr = 24,
   711		.shift = 3,
   712		.control_by_sw = true,
 > 713		.sw_ddr_en = true,
   714		.gce_num = 1
   715	};
   716	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

