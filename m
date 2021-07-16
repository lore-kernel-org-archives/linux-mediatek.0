Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0306C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6734B613F3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6734B613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Cc:To:In-Reply-To:
	References:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF7bivUS7sKDdyq/TUdbSD+WwLoxdQ0N4Ea9qkS4C98=; b=kR+nWBnfjj33U3KLZ5bKa8zIb3
	/lG94CZanivp7SOGVtPet+1jdEF9PKu3HMK2Gs2b3IlADOJBz2z2io9SxX6qmSNQ6NQULhkruEEod
	GeC06cxTtg7NBn55hnYuLFUKtuPvEKIfKeW4+ae3Ce2KYYLC5tdAMfIY1G3iu79o9Dyd0HkrK5mh5
	xCAtH7hPMLDvRtv0q4cs9AOgNw3ApPF8JPF5D4AAY9wFj75GPr2g1nK5qa4aCVa3MGK9M5caBI4xY
	BznNLRdOwZcTnmmjffNecGas77sv002V7UYryqi6BZYlLfN68D21Hhr+wXDQV6IKsPgTxYX9dih0L
	85tHYbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Jj6-003sww-Qr; Fri, 16 Jul 2021 09:01:44 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Jj3-003swa-MD
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 09:01:43 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="208886063"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="208886063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 02:01:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495985905"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.28.42])
 ([10.255.28.42])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 02:01:38 -0700
Subject: Re: [PATCH v2 6/7] soc: mediatek: mmsys: Add reset controller support
References: <202107150857.sniQJ86e-lkp@intel.com>
In-Reply-To: <202107150857.sniQJ86e-lkp@intel.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>,
 kbuild-all@lists.01.org
From: kernel test robot <rong.a.chen@intel.com>
X-Forwarded-Message-Id: <202107150857.sniQJ86e-lkp@intel.com>
Message-ID: <baf4a35e-8025-460c-85b6-214ad23d7b89@intel.com>
Date: Fri, 16 Jul 2021 17:01:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_020141_797172_205A46F9 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi Enric,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on pza/reset/next linux/master linus/master 
v5.14-rc1 next-20210714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url: 
https://github.com/0day-ci/linux/commits/Enric-Balletbo-i-Serra/Add-support-to-the-mmsys-driver-to-be-a-reset-controller/20210714-181318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git 
for-next
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/soc/mediatek/mtk-mmsys.c:104:6: warning: Unused variable: i [unusedVariable]
     int i;
         ^

vim +104 drivers/soc/mediatek/mtk-mmsys.c

2c758e301ed95a Enric Balletbo i Serra 2020-03-25   97  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14   98  static int 
mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14   99  				  bool assert)
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  100  {
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  101  	struct mtk_mmsys 
*mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  102  	unsigned long flags;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  103  	u32 reg;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14 @104  	int i;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  105  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14  106  	spin_lock_irqsave(&mmsys->lock, 
flags);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  107  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14  108  	reg = readl_relaxed(mmsys->regs 
+ MMSYS_SW0_RST_B);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  109  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14  110  	if (assert)
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  111  		reg &= ~BIT(id);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  112  	else
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  113  		reg |= BIT(id);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  114  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14  115  	writel_relaxed(reg, mmsys->regs 
+ MMSYS_SW0_RST_B);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  116  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14  117 
spin_unlock_irqrestore(&mmsys->lock, flags);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  118  08a3068f9490f0 
Enric Balletbo i Serra 2021-07-14  119  	return 0;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  120  }
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  121
---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
