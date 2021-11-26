Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F074C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MsmxVMTlsf9xW3wKiQ1ntu6WLTR7zvlqX19uR1BJRek=; b=mU3vJbqkGanogt
	yLcfAViiI7eTdLnmnXLiuCXX25JGOEaXR6RCxwu0x2fr2sEzF5WhDvcqqrcA76SFwrCMnb4WvcFJu
	WbWPyYgG3Dw+SNOOtftZ7amjYYM9USSrPHPwAFfJPzkVGxC/i58phhU93bJpJyt8dGf7ZUQiSSOGY
	RgEqNz2drKo5cSFSaKLdCmYvaXX8wyeOjBZEf/GKKqRzdwqljBicudoBPRKNCDaYy6ap33xalV0Ms
	lZUX0RhzitsegJX6osWPmTxb3hxiFCGsa/UTi8V8tBS0DfxxtVs/hdcr4q87QvTrJSnIw3NgPQo7f
	lbwueyRmwadUCE2fW4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqVIV-009OYV-Ki; Fri, 26 Nov 2021 07:05:27 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqVIR-009OXB-VV
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 07:05:25 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222846072"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="222846072"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 23:05:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="475825212"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 25 Nov 2021 23:05:18 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqVIL-0007ja-LQ; Fri, 26 Nov 2021 07:05:17 +0000
Date: Fri, 26 Nov 2021 15:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: kbuild-all@lists.01.org, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 MeiChia Chiu <meichia.chiu@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: update station's airtime and gi from event
Message-ID: <202111261430.O1AAGfiL-lkp@intel.com>
References: <20211125091330.27770-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125091330.27770-1-MeiChia.Chiu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_230524_143646_AA929E06 
X-CRM114-Status: GOOD (  16.14  )
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

Hi MeiChia,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvalo-wireless-drivers-next/master]
[also build test WARNING on kvalo-wireless-drivers/master v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/MeiChia-Chiu/mt76-mt7915-update-station-s-airtime-and-gi-from-event/20211125-171608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20211126/202111261430.O1AAGfiL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/446d4941b6395463c374c2281241769ca0abaad9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review MeiChia-Chiu/mt76-mt7915-update-station-s-airtime-and-gi-from-event/20211125-171608
        git checkout 446d4941b6395463c374c2281241769ca0abaad9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt7915/main.c:9:
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.h:234:1: warning: no semicolon at end of struct or union
     234 | };
         | ^
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:7:
>> drivers/net/wireless/mediatek/mt76/mt7915/mcu.h:234:1: warning: no semicolon at end of struct or union
     234 | };
         | ^
   drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2516:5: warning: no previous prototype for 'mt7915_mcu_set_fixed_rate' [-Wmissing-prototypes]
    2516 | int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +234 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h

   217	
   218	struct mt7915_mcu_sta_stat {
   219		u8 event_id;
   220		u8 more_event;
   221		__le16 sta_num;
   222		union {
   223			struct {
   224				__le16 wlan_id;
   225				__le32 tx_time[4];
   226				__le32 rx_time[4];
   227			} airtime[0];
   228			struct {
   229				__le16 wlan_id;
   230				u8 gimode;
   231				u8 rsv;
   232			} gi[0];
   233		}
 > 234	};
   235	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
