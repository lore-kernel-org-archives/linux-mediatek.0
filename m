Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6C606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 00:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H5YqtLoX;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVa5B6Fk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U2B/uabe/QmuXvbvHoYk8ZWVeldXL8jP6hg7gbVv3cw=; b=H5YqtLoXeYwuDZjeGqR2ATrQkE
	qjI3cet9U93f8eYToej149ZWZh7kbRyMhKDUayWQvfI/l+z80TYJRJ4QxyTjIovkraz258JbIx8uy
	7GAvsFjpNqeHzXBIuzz1Z8TroPN06eNPZe845SRjEYQDEbLdHRJ//Smqi2rssAt/JEx8267WwEHSr
	kdP/qQaoBHm0G6cVuRjSXX5BEIUOnZDp5ubz8oFGU1/DHR7pveO/uY53RSaFeQ/laa7tsnW7l9mWU
	B2KJO5mtKXLIhDakNPyRuUPAP3rXZml5ZN/gzOWE57rw+eXGskMCGkFvs4WVlXZr1P2xetIvJQ1eu
	h+a8oOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT75l-00000004FJm-2dJ0;
	Tue, 17 Nov 2026 00:30:33 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT75h-00000004FJJ-201N;
	Tue, 17 Nov 2026 00:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794875430; x=1826411430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gVBDSdO3QnCkbysAcQxx5Ix2FP39pCUquIV8ycUM/c=;
  b=bVa5B6FkZc3FATLee3gi6j+7zpToy7+A0TfEO9buYzgkHE7tC68MsftA
   B/Jnp/ELJmlc3Ol8mj23D+WiGSDHGirFbwPeI5SZec8xWRlFc3oSzBvbq
   iOsJfasWqIKu/tCfArKBkCEnF/VmgGz9wOaN6qXWO3fQEcMiuvM3S3qZo
   dq1fXZUgDEjmqz2FROuK7Rn6h6bz8zwOQfzDgHVGcZ7+pcG9zOCc2TAP5
   yRWtzq6pE43mG2ibcdSRHaJn8VwRrM4jCjPEon9RG2d4frmWtnggPdJqO
   vUE0hZ5uWnnI9sNfnmgPMfwz/00MGYAJCOJHWb183Lt++/n3FWHrNvdf3
   Q==;
X-CSE-ConnectionGUID: yT63m84BR2WPfu4ajj9n/g==
X-CSE-MsgGUID: S1Q2F6/TT3KYgYJ9lNXG8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3648161"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3648161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 16:30:28 -0800
X-CSE-ConnectionGUID: VAgfbtYiRm+5yRsw4auy4A==
X-CSE-MsgGUID: fNNJQyq1Ri65VGTx7OzBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9479561"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2026 16:30:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT75X-000000019f5-0w2K;
	Tue, 17 Nov 2026 00:30:19 +0000
Date: Tue, 17 Nov 2026 08:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
	daniel@makrotopia.org, linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com, Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [net-next v5 3/7] net: dsa: mediatek: add support for
 passthrough mode
Message-ID: <202611170845.l4X9RRsI-lkp@intel.com>
References: <20261116183332.168858-4-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116183332.168858-4-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163029_931862_076D588C 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/net-dsa-mt7530-get-ctrl-phy-addr-using-a-function/20261116-183326
base:   7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
patch link:    https://lore.kernel.org/r/20261116183332.168858-4-cjd%40cjdns.fr
patch subject: [net-next v5 3/7] net: dsa: mediatek: add support for passthrough mode
config: arm-randconfig-1003-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170845.l4X9RRsI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170845.l4X9RRsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170845.l4X9RRsI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mt7530.c:1410 function parameter 'dp' not described in 'mt753x_upstream_port_index'
>> Warning: drivers/net/dsa/mt7530.c:1410 function parameter 'dp' not described in 'mt753x_upstream_port_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

