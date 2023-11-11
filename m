Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF25C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 23:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE31/f94lAa9BeiZcowlLqPL7NBQm38pk8tU8F3caVM=; b=utedlg5qzOdW1lxfNTnBHoOcvc
	BZ7Ijwi5HeNQ5gZuBVxtk/+z0ECNfPokMdAzboHnEYc7Cul0BwdBP4LraD6oHGejE5golsSZImMmz
	eFIpKzU/dGV8Ie65s2HTuL7Z8cUBOa/BlsQhQCIZUQA+dmQ2dZsocmzbow93d4Bwkc9pAWifPrv3J
	nL3n4S8PzRsIAlCFP7BB3K9FYEYQrii9ZnVsOF9Rtu56UktTDPLT9/3uymy8rEUlj4n2mYutAV0Fj
	5SQK7azUkbryV28ihwr3/Z4xPKFcZN26q1skHpzDWGw9s6AUExEC8qUSNs2kccmBVdV1wYfhe8OIj
	tJQJL5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1xOy-00BTWD-1Z;
	Sat, 11 Nov 2023 23:28:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1xOv-00BTVc-2G;
	Sat, 11 Nov 2023 23:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699745309; x=1731281309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yLMN9BN0x0GJyChe1fur9BIfuNV27m8XBnDpqqzLe8E=;
  b=IPXlis9M7szAT4zS7rIE/41vZW3iQNRrFz4jvVZb6g6vG0tjR4Vg4vy7
   Uv/RiPbGDSjrcFTRkKBNYPwswoSqPavxX6WkkjyMqP2/4Iyw6/4UtifHW
   2XDsg3ib3r3HB6PMFVtzgMTVM4ozqG0GIDPqggEXfubSSwgjW6GUkrki7
   A/I+MCGdGzR15VNIQxyI7r6YyO7Yt0O9HdaJtjrcnMhrXEAKicEtfGoBn
   NidZvUxWBS+efqXDH+PJQAhpHWxhzZz90p0rkh6LZ2Jf859hh5oHHVxmz
   qNClGEB65CRyufLMEPfZa4oGy6sXQ/SvMH3UUxML8Kw3oh1B5q+SmsaEG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3316449"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="3316449"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 15:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="764026399"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="764026399"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 15:28:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1xOf-000AoU-1f;
	Sat, 11 Nov 2023 23:28:13 +0000
Date: Sun, 12 Nov 2023 07:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	John Stultz <jstultz@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Yong Wu <yong.wu@mediatek.com>, jianjiao.zeng@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
	linux-mediatek@lists.infradead.org,
	Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory
 service call
Message-ID: <202311120707.FDrzrRME-lkp@intel.com>
References: <20231111111559.8218-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111111559.8218-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_152829_789281_9A2F9620 
X-CRM114-Status: GOOD (  13.71  )
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

Hi Yong,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on robh/for-next drm-tip/drm-tip linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yong-Wu/dma-buf-heaps-Initialize-a-secure-heap/20231111-192115
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231111111559.8218-5-yong.wu%40mediatek.com
patch subject: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory service call
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120707.FDrzrRME-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120707.FDrzrRME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120707.FDrzrRME-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `tee_client_open_session'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_session_init':
   secure_heap.c:(.text.secure_heap_tee_session_init+0xd0): undefined reference to `tee_client_open_context'
   powerpc64-linux-ld: secure_heap.c:(.text.secure_heap_tee_session_init+0x2b4): undefined reference to `tee_client_open_session'
   powerpc64-linux-ld: secure_heap.c:(.text.secure_heap_tee_session_init+0x458): undefined reference to `tee_client_close_context'
   powerpc64-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_service_call.constprop.0':
>> secure_heap.c:(.text.secure_heap_tee_service_call.constprop.0+0xbc): undefined reference to `tee_client_invoke_func'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

