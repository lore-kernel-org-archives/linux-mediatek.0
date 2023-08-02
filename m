Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB1C001DE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oV8c+343/TT2vqfq6aaLIFv4uzKP54NVbj7LEuZ19WI=; b=P3d9CQe9CQRzX0xZQs0B5kZi2u
	JSz+qfY9HksM0tg0hLN/UwLZsOOmzn0+aIFz/DTWayPRV/ei3YrfkLxE9y0ClkYCHDuUbtr+3UFP0
	Ic7kVkikQL4eME5nPe7zfJu/yfOIXGfVYZpWiNxniOLIJzFQ4+z9ZgZVjjB/zUIw1oSUR1Gw7HmWF
	0fXUwGKcJrKg5W7HUW8YzBp01nj3/OKlaW/G4vxbmqvHkNICRIMSw3RSIzKTcaZgRXFDNzFZk7bH/
	fZdf/93iOXdpCM1aRfF8ARmBmr3Ls+MoCB7ZW1/JZTDOKNA2FVFFT3ZoIM2VZ6qMOgzbwQSFX3Xs/
	cETZibcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR945-004b1d-08;
	Wed, 02 Aug 2023 10:26:49 +0000
Received: from [192.55.52.88] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR942-004b10-1M
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 10:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690972006; x=1722508006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RljGlw3peibrHMvrvL9Zo+t3sqqwY5SPLptaScys/SA=;
  b=POVKVFG3IsQKjFA2J0k7ntdAmHZ3HjWA1FInc/pF3hWsfHN8CF08iqla
   2DDhk9+WS+3DwqoF9on0BKE+hVIQ/C0xV2/tWKYNFhTJWo/0TjTJcQaYf
   UpYXVqVt+yleHWpTC7qSnXkgQZHOMA3D88l4Qaj58U6m/B4SsVAdW5ZeO
   ca9M19ytVUvuASoiYok+8Nfde066gOoUm8HFuTdVKZQCKK/m2UnijYecM
   2Zvq7fvKJwqxgjA8nv6q2pXTSePZ5x0BJ9DqBwNTy7pZFo9DxCQguOG2w
   86m3pTXqOZY/Lei/O7WrE4TQA3LW6+Vw0SKEwpn78mGYPPhMEmQYleUnM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400492146"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="400492146"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 03:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="764171284"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="764171284"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2023 03:26:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR93g-00017f-1c;
	Wed, 02 Aug 2023 10:26:24 +0000
Date: Wed, 2 Aug 2023 18:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Deren Wu <deren.wu@mediatek.com>
Subject: Re: [PATCH 17/17] wifi: mt76: add mt7925 to Kconfig
Message-ID: <202308021841.dVQEY7mc-lkp@intel.com>
References: <12bafb6334728c3c12cdd8ab3e7505a963d4356d.1690864199.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12bafb6334728c3c12cdd8ab3e7505a963d4356d.1690864199.git.deren.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_032646_520043_B2548621 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Deren,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deren-Wu/wifi-mt76-mt7925-add-Kconfig/20230801-223655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/12bafb6334728c3c12cdd8ab3e7505a963d4356d.1690864199.git.deren.wu%40mediatek.com
patch subject: [PATCH 17/17] wifi: mt76: add mt7925 to Kconfig
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230802/202308021841.dVQEY7mc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021841.dVQEY7mc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021841.dVQEY7mc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt7925/mac.c:7:
>> drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h:7:10: fatal error: ../mt792x.h: No such file or directory
       7 | #include "../mt792x.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +7 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h

d5f8016ffd8fd01 Deren Wu 2023-08-01  6  
d5f8016ffd8fd01 Deren Wu 2023-08-01 @7  #include "../mt792x.h"
d5f8016ffd8fd01 Deren Wu 2023-08-01  8  #include "regs.h"
d5f8016ffd8fd01 Deren Wu 2023-08-01  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

