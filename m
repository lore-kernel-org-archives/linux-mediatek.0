Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44B6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAVMApH3ONRcASjrW0QXDGxEg5lV8ddvpeG5uc6nFMU=; b=PQoTJXUH1q7QK9WvTVDsqf5U7n
	7VoNsPhSBkWRdD5BjpssmifCF9VUqDzai/U7jF0DEBu/ZHO28NEGU4YnkjGkrEY8SvEcaEonRvSJQ
	OMFb+mcFKDaeheay0mN652+F1tYG6Yr6Lp9rjPsSuYsd61EYJ6TsbSeOBjP4JfixvKjO/xGjVPSDb
	A404gWddf5ai3LZ8XzWybEX8Kb3oTUGN+sMaNSLvhwfQZCY84zFdPWdE0Tit1xr5t0XSGbRvWzvMK
	rin2ebDhOZ4JUw6KMvl+4bqACoJm3uAZ+1q7IMz+RVJTKkwvpjlvyue6Cu2k941yOb5+HHzcPR2rJ
	Miq/BgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqCe-0010YD-1W;
	Thu, 14 Dec 2023 18:12:56 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqCZ-0010X3-2w;
	Thu, 14 Dec 2023 18:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702577571; x=1734113571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SdUzfDoQ+S/OJZsOm8JVIWfF0SsNDzHb/b9ovKtFcXk=;
  b=if2crJ2Mj5Zv9aOE/SYwUcsmMO7pK7OYIQ2+pZ69O3MtkSD4BgGqMk3d
   bLG4eaLCfft7raMWMq7Lu7B+4nw5YhLEW8zesVPEAJxD2chkdPlJKXT5g
   FZRBG8TNqeqxLzCegJo9s+lf3lqjOpOwo7S91GYVxT+HIQVcaAtIhR4Iz
   fOMb/x00wh/3nYD+12L3VAmb5JBhI5UcF6XHWtmnwAix/JbVkGO6ghV6r
   wBj/Fr8YBT0zAHAqG/RfKS4vY1rFA1HZ/sazrCxY7YTitCHPuPdTeOq3N
   iqdwaAi0T/5Jalmtrs69wIKZzVvdkNbCz+fJ7zYe/vrb9X1mp/NsxYyoG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="481356451"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="481356451"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918135596"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="918135596"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Dec 2023 10:09:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDq8j-000MSG-37;
	Thu, 14 Dec 2023 18:09:03 +0000
Date: Fri, 15 Dec 2023 02:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix a short packet issue of gen1
 isoc-in transfer
Message-ID: <202312150146.ffBFCrhf-lkp@intel.com>
References: <20231213063543.12435-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213063543.12435-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_101252_001132_5EDC7CF0 
X-CRM114-Status: GOOD (  13.14  )
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

Hi Chunfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next krzk/for-next linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunfeng-Yun/usb-xhci-mtk-fix-a-short-packet-issue-of-gen1-isoc-in-transfer/20231213-143959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231213063543.12435-2-chunfeng.yun%40mediatek.com
patch subject: [PATCH 2/3] usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231215/202312150146.ffBFCrhf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150146.ffBFCrhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150146.ffBFCrhf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/xhci-mtk.c: In function 'xhci_mtk_rxfifo_depth_set':
>> drivers/usb/host/xhci-mtk.c:184:26: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     184 |                 value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK, 2);
         |                          ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +184 drivers/usb/host/xhci-mtk.c

   170	
   171	/*
   172	 * workaround: usb3.2 gen1 isoc rx hw issue
   173	 * host send out unexpected ACK afer device fininsh a burst transfer with
   174	 * a short packet.
   175	 */
   176	static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
   177	{
   178		struct usb_hcd *hcd = mtk->hcd;
   179		u32 value;
   180	
   181		if (mtk->rxfifo_depth_quirk) {
   182			value = readl(hcd->regs + HSCH_CFG1);
   183			value &= ~SCH3_RXFIFO_DEPTH_MASK;
 > 184			value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK, 2);
   185			writel(value, hcd->regs + HSCH_CFG1);
   186		}
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

