Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A576FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Sep 2022 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8wnT4KZzC1FUHvprcPokckU0wAG+bUHylAPxNhUTH0=; b=UQEl4Fp/MwVcLMcSKjPNc4sbkH
	JAPkhfPcYu4gx1Jlf6eLZvBTZSXvDJ66C+II5n+yTk3dJgdiSJXEm5J69/iN4w2MTZUEQPleZfkSd
	CPSTnXFS+dxqHNFFVL6HPzEXp5N1D7cep3XadbLN/ugsJpHJ4q9KgU2j/TQU3bErlGympCMtjLBXp
	xGg6HYR1V0y9hnCxxCvHYOTPgt/rPG9z1K4Gwd0DXfkYVZ9GAAvkgkZTEcOBO29KN6TE768XI36a3
	xBr6iYlw2w53z9QNcfPB5tSpF38seGOTJCThamDiQ6Ellf7q2W+AR5yy2eDghX7s3CKPRMVTgQRRi
	F6ZTB1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZY1S-0069OG-Ta; Sat, 17 Sep 2022 13:38:18 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZY1H-0069Iu-Hh; Sat, 17 Sep 2022 13:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663421887; x=1694957887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tIryiFgQl9COzjEcEkX38EUN2UYw3EZiOxUHcq8DolY=;
  b=Fq4v4h8F7iV7QGI3T7EOLUogsd5qv3QVHqvBRu+Xn4G1bHieAUid1wiX
   1Yzc9Zs4lOwJrE2PRfNyqDat7gkEydKgdXtC+MHD20psT42FCTc+kuqJz
   4/0W5ACj0kkkUzaGbeQf40hGI0EYdo/39n/AY3hs1WWQ6GI2wD9gPi/tX
   nxyzcLynrMsKeaA2eEgtw+NFuQ6XLaxUNp0dFLHubLk+wJEBfYmYu5+B1
   6bUwPbfZ/i2AgXc5TnnTFHN6/JHXv+FLejVKBTSPNswg2XnmzBcGj1VbW
   XqsvB+L5LVGUAGI8dtBaNa9o3P4JCvqQ/2S4VJQhL2mWn8u49V9VU+o8S
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="360892622"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="360892622"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 06:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="760343021"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2022 06:37:58 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZY18-0000Ml-08;
	Sat, 17 Sep 2022 13:37:58 +0000
Date: Sat, 17 Sep 2022 21:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Yongqiang Niu <yongqiang.niu@mediatek.corp-partner.google.com>,
	Allen-kh Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: fix gce timeout issue
Message-ID: <202209172147.lNB8ZX1j-lkp@intel.com>
References: <20220917090940.10088-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917090940.10088-1-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_063807_652799_068BA68D 
X-CRM114-Status: GOOD (  13.80  )
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
config: arm-randconfig-r033-20220916 (https://download.01.org/0day-ci/archive/20220917/202209172147.lNB8ZX1j-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/044a12235901d40a3442fa5ab0c4b3233f370e22
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yongqiang-Niu/mailbox-mtk-cmdq-fix-gce-timeout-issue/20220917-171148
        git checkout 044a12235901d40a3442fa5ab0c4b3233f370e22
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.c:713:3: error: field designator 'sw_ddr_en' does not refer to any field in type 'const struct gce_plat'
           .sw_ddr_en = true,
            ^
   1 error generated.


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

