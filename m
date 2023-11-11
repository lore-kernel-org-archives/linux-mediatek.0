Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A06C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRB4s632H52KAaFOB/1QyRsaE173ahInLz/Uz1bhQM4=; b=0dQ2OLtrJcIhLZa6uMVnNQS2rH
	CDzoaPHQWZkOqCPuceaxXFqgYMEx7YKYhbr5w1JuQf3y2k9JWVD2u52UyhYfen0bzQXQ9YQ5dnQIZ
	lrU8ckowAFgXebM/CXOdJ9Yd5w/2MWW+NHHk7hruNP5CFieUNR65zDKbtly79Uv83khlRvePqXO7z
	2vyeG8iHVX69+QcWTdnPyH3ztDu6lomsw3+03O+pqXoHF2Y/x4aSex0Af4bCUViczMg3sk0pQv5AX
	U1e5S9nbuhXU98oGvrSql+oKIlXUIvneTm0+VkCf710sVMHxb8a2wHLBaoCWZUKtlKrfaZY9ZeVYT
	SJj61Oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1s2u-00BDhL-1C;
	Sat, 11 Nov 2023 17:45:24 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1s2q-00BDfO-12;
	Sat, 11 Nov 2023 17:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699724720; x=1731260720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JCkyLUFSiAGNSLRbnliFr9Cc7vWp3ub6eb46sIme+qs=;
  b=YPi4f+nNlkTZ8E86oC9Lqnlzg4h5AYto81jFCQMb5SbYnR78nWpBC1LK
   hRztfSOfSixa2AukFdB94fWd6Oh9ghA9tJTPFSLqEkyl5LCDF+cL59Bbv
   GVjlsPeOEF2WI0QCpOlR9rknX154APn/Ikn80W/rI/4DX/tMqStVXfiak
   VnuZnB2fhZ8UZX7mHFIB7p1C9BEEswQGTJeC7JYZE6DHjJZWMiOJ7GqHw
   2hfGiNjxiWXwgTxcRSpyWiCjKBSGmwJr7EUKSzzWMJN1eut6MrUvZEkhi
   4dh/TNvux+Q9hrbahG8+q9Ll56kCZq4K/y8/ApdnfQ0AWC8q6nP6NEKOR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3346739"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="3346739"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 09:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="763989254"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="763989254"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 09:45:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1s2b-000Aee-0Z;
	Sat, 11 Nov 2023 17:45:05 +0000
Date: Sun, 12 Nov 2023 01:44:23 +0800
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
Subject: Re: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee
 session
Message-ID: <202311120136.o1VqalXm-lkp@intel.com>
References: <20231111111559.8218-4-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111111559.8218-4-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_094520_665299_821B1CC7 
X-CRM114-Status: GOOD (  13.49  )
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
patch link:    https://lore.kernel.org/r/20231111111559.8218-4-yong.wu%40mediatek.com
patch subject: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311120136.o1VqalXm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120136.o1VqalXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120136.o1VqalXm-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/dma-buf/heaps/secure_heap.o: in function `secure_heap_tee_session_init':
   secure_heap.c:(.text+0x256): undefined reference to `tee_client_open_context'
>> s390-linux-ld: secure_heap.c:(.text+0x3e0): undefined reference to `tee_client_open_session'
>> s390-linux-ld: secure_heap.c:(.text+0x52a): undefined reference to `tee_client_close_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

