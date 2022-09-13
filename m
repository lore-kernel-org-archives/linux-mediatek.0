Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1FBC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVPX2Ck+VGKYvVaqCDeyOSwdX2dhR9jiSYCSBZkuzyo=; b=Kfo2mmTpPmTnHY/A9LmT0txO3j
	bNxv9aHxuCXk2jxp9hEhs659t5m2W9QZ7qx5bR1icN6Ca06dXfiV37c1dafsn8pS3LjSpbdKOs2fW
	i3XLy4tXsVY/6AKpkDG8k/Ey1zwYWhs67jkwB0fzNml03uc7ZzkBiJRdNjvf6t7fFQNu8Kr5L/i8H
	7wxQ/hbSbBbIWGGYasw0kJimUaTuqdufhij9Yct7WyvFfMwUGIl9GPhx5ONoEO1qPQEP3iF10Ulj9
	EuIMCoiXBUaj5hGh7NHCm4OrlBaq4DrQEHY3ETSmhyvOyw/QrG7OHgVgHfrntyyJM478SWefLUM+n
	NfMyj3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3bQ-0072og-Ps; Tue, 13 Sep 2022 10:57:17 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3bM-0072YX-Pm
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 10:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663066632; x=1694602632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjp/S/AcGVNBiOd4qsqoHOGHjb2vjSK71vPXyphH3wA=;
  b=EZuaSK3P363xCa0SqMCLNSHLcUg+jVnybRFjfkqINUhvTystYDoEYO7Q
   uRODbO/9FEn2YPsBSLwhVMW8T+iKL8KYibAe8jsX+IgGkHXw0NDXSCNL7
   rxtjKHoH5wh/LUutbMs3nENbfPHttjztLhxCXCRE+kiR/x/T6Z6Lnu/MW
   XBTWLJJF94goTr0b+IUn15Hc9supb1g6j+Qkg/HfYx7/lhK9PdfP94G4g
   Znn74rFki3zSXe5LD2mmts9SAuz/1W7l+SNweFsnDldD1w2CSIBvPvw0G
   Vy8IyUGSOvggALW/Sec+FBgTPG+u9zur/yjNKbjpz0nlSXhATxcRj+H4n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="359832107"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="359832107"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 03:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="742124384"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2022 03:57:01 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oY3bB-0003WB-0K;
	Tue, 13 Sep 2022 10:57:01 +0000
Date: Tue, 13 Sep 2022 18:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: kbuild-all@lists.01.org, sean.wang@mediatek.com,
	Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
	Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
	ted.huang@mediatek.com, Stella.Chang@mediatek.com,
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
	frankgor@google.com, abhishekpandit@google.com,
	michaelfsun@google.com, abhishekpandit@chromium.org,
	mcchou@chromium.org, shawnku@google.com,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jing Cai <jing.cai@mediatek.com>
Subject: Re: [PATCH 4/4] Bluetooth: btusb: mediatek: add MediaTek devcoredump
 support
Message-ID: <202209131812.1EOjfRYn-lkp@intel.com>
References: <540fc6d93481e72e18b51f82f022ab34d57d5caa.1663020936.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <540fc6d93481e72e18b51f82f022ab34d57d5caa.1663020936.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_035712_956854_3DD71DAB 
X-CRM114-Status: GOOD (  11.41  )
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

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master linus/master v6.0-rc5 next-20220912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sean-wang-mediatek-com/Bluetooth-btusb-mediatek-use-readx_poll_timeout-instead-of-open-coding/20220913-062200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
config: m68k-randconfig-r033-20220911 (https://download.01.org/0day-ci/archive/20220913/202209131812.1EOjfRYn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d478461e2fd5fdd8d505c00c7864a421170a54bb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review sean-wang-mediatek-com/Bluetooth-btusb-mediatek-use-readx_poll_timeout-instead-of-open-coding/20220913-062200
        git checkout d478461e2fd5fdd8d505c00c7864a421170a54bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
>> drivers/bluetooth/btmtk.h:172:6: warning: no previous prototype for 'btmtk_register_coredump' [-Wmissing-prototypes]
     172 | void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/btmtk_register_coredump +172 drivers/bluetooth/btmtk.h

   171	
 > 172	void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
   173				     u32 fw_version)
   174	{
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

