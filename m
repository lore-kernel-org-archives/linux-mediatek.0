Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA7606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 00:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NfD8dFtB;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnhL69s7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/GDwq/ARKQHedSeMJd3kkgCUMh1hNKmb8oWM7xOMd/4=; b=NfD8dFtBWiKq3JUhUwv/Fh7Zf3
	zyLkng91I7SkHjx3944H3MZdoBUQxFy81JeF1NoTLFF7IzAmWe43kYyPs9DyNIVkmwoY/cQ4T7+QN
	b6FLvMvXnnGA8mxVPSOfRp1Y0W57AEafEsnpkPs75F4jS5z8uwTUSvtwRtpGWGIkuxVNJzoxX/UPq
	2fDZPyDf7Afu4rmabhvplPWstlJU1pKS/JLMfe+708G5UZPkn3IdE3Ees76eLjJaExB3lbjmUzYcz
	/zB2cw/WUkvGoHZviJZB6oOq87LO6CGVOL/1uY+vBDX0+jdNnwkMJIndOzg+/K8QKTDuc95uyUKNJ
	cNof12Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfRz-0000000BNru-2p0r;
	Fri, 13 Nov 2026 00:47:31 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfRw-0000000BNr2-355E
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 00:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794530848; x=1826066848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z2IIwLMBfb76IqEwt1TzObfTQGpxfBAvFBFzFSSzjXI=;
  b=cnhL69s7Zbn7oK+Z0ATIuqse//rZDH1odrPPGNp/hMdQcn1EFm0v7sPZ
   UOrMqP+dwuNKDuiKh/vemRjIUz98aQmY6z4hm4mXeVVaAbd1xEB7RTh9R
   4bg82ZeJHBkuvstLa9R2eJBh1ISnW8RroCogwRMuBJPPsZX08LsZfczJW
   5shKwk9EbZnpAb7Oy5d20iRl84kVu9VQeMDzPY3BJ1AmoM288/cWS2Jvx
   PsDvGTHtCOEbxbCwWpwglpoHWvVaEY+DN7aLfqb+BI31plOz4BeAPXd5n
   8ujIs871dx8NLDidhh2RdM8kZeMqTtGxNYYd0XXcxzpJNw/aYuqjmYJEA
   Q==;
X-CSE-ConnectionGUID: g2LzzZLGQgWd7yMjyIgTbA==
X-CSE-MsgGUID: BH4dlKgHStCb8bX6F4yZUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3188956"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3188956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:47:27 -0800
X-CSE-ConnectionGUID: /KYf7x+XTue4LhuUKbZVNw==
X-CSE-MsgGUID: RP7q2otqRQ28Cu+T+vh9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8686108"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2026 16:47:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRfRq-000000012G9-00H0;
	Fri, 13 Nov 2026 00:47:22 +0000
Date: Fri, 13 Nov 2026 08:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Shih <michael.shih@mediatek.com>, nbd@nbd.name,
	lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kun.wu@mediatek.com,
	deren.wu@mediatek.com, sean.wang@mediatek.com,
	quan.zhou@mediatek.com, ryder.lee@mediatek.com,
	leon.yen@mediatek.com, litien.chang@mediatek.com,
	jb.tsai@mediatek.com, eason.Lai@mediatek.com,
	Michael Shih <michael.shih@mediatek.com>
Subject: Re: [PATCH v5 1/2] wifi: mt76: mt7928: Add debugfs for stats to
 provide debug purpose
Message-ID: <202611130804.q5nHCDSw-lkp@intel.com>
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112075558.1813785-2-michael.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_164728_810338_6BEC3709 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Shih/wifi-mt76-mt7928-Add-debugfs-for-stats-to-provide-debug-purpose/20261112-155556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261112075558.1813785-2-michael.shih%40mediatek.com
patch subject: [PATCH v5 1/2] wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130804.q5nHCDSw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130804.q5nHCDSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130804.q5nHCDSw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/net/wireless/mediatek/mt76/mt7925/mt7925-common.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

