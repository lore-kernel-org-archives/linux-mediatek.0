Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8959DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzB7HxShOImmGRFkmFOmz0sDmp353lpuhFSuDtGVEiE=; b=2GMn4eigq8o8QV
	6fK863+vVvJz+42ONDbGREazt4QHS6EXQNqcgm+qUbofpG/9dyWSLUzWc9//4KZ3Bpy37TuFxvU2w
	ndyDeJlmQvWcHoSRlD4l53Xz+madnIrOKqT7d6en4BDLwRDgrut81PFIfXyJympuNorMS2+EOPOYL
	sop8CTmzDwtlY3bLBjfaoHcu3wG3f4BNcZcMckevwU71XiB59sl/I/ep0lXTvdmOaPzPczrBNptYq
	B1y9ocSdnU80RLfPWG7yFfWXlNFheaihfaN3kTUFMdcNNefrqppdRNOJIVToqxeDDaU9Uq4UYJFnk
	D2aDMUNNS41M+Mq3nL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nByJ8-003Dsy-Kf; Mon, 24 Jan 2022 12:18:50 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nByFK-003CCx-80; Mon, 24 Jan 2022 12:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643026494; x=1674562494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oSJpUR7qQooZpsgnfNqCcxKzq86iTJ3y0QT5ivH1Jg8=;
 b=IRimWTRkggKWvgAjw7XUptjT+4IxK+uYAUiOmewGk0xC2loxvKHU4yj4
 alBrJFv1s2Qpn8L5NAPCaRufolD4HlDEgEdzk4iubXMRUtBh7huxaWQu/
 FHJEIe0OAcjPUnbB16Q5TkeRhn47i1kWPM3w8qQeXfYS8o1YSTWoM8Jzw
 tVluG09G3ro/QM8izzmEwoYyv5mO55biLMrALw+dgsHxZehXNN9Ye7sxq
 FRfK/9g6OxR1ygWVWJhU5Qd2jfYZPseLUYusbS8si6bt6g+COY7QhfEgs
 Maxhfnjaq6nJNaSfPgfrf7sDl7QH1D2h71HogU8cKDuerulMZQBErOSXW g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="332385124"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="332385124"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 04:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="479052944"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 24 Jan 2022 04:14:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nByF5-000II4-3F; Mon, 24 Jan 2022 12:14:39 +0000
Date: Mon, 24 Jan 2022 20:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kbuild-all@lists.01.org, Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/31] clk: mediatek: pll: Implement error handling in
 register API
Message-ID: <202201242043.D1yrOE9S-lkp@intel.com>
References: <20220122091731.283592-26-wenst@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122091731.283592-26-wenst@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_041454_417366_FD736464 
X-CRM114-Status: GOOD (  10.13  )
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

Hi Chen-Yu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chen-Yu-Tsai/clk-mediatek-Cleanups-and-Improvements-Part-1/20220122-172158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: h8300-randconfig-c003-20220124 (https://download.01.org/0day-ci/archive/20220124/202201242043.D1yrOE9S-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-pll.c:407:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
