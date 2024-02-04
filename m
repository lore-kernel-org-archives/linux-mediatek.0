Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8532DC4828F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU6vtcfFzZ/B4nNoVmF1PV9lrYv6/YSabj6kRMyrKbw=; b=CAb9aXPiDEI4XTRTupH8Tt+C0S
	Zf1lfmWHTAZ7eA9zfYrXQf7KShylzTIAl/Uuxz3OMMiAHPSZoTw+EVskrt+Pe9nSCvBX8o8mdmnWJ
	Q52V6MuQfzelxBsqVM1XwsD8oxW3zzTPQaQy3h1l8W/Mzkxpik+Og6Km3QRuLr5D/epH5Cs4gOGLJ
	oqT3Wu9E5QsojluDP4BCw6SJkChp3jJaKwzXPrHS4ozMQh1KuemxVeR3ybVh9k25mBI+s7qPeiqIe
	WacZQMvw8j3NvlNZcEyP+aXJs/87Q+0HlCQeRXbHkmwnLufiG6f3P6HYgGJnZBXlykdYLB6/2oshc
	QxugW1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWYrZ-00000000UxV-36HD;
	Sun, 04 Feb 2024 09:32:33 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWYrW-00000000UwE-3M9Z;
	Sun, 04 Feb 2024 09:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707039151; x=1738575151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4HfFIjzTJXK5+dvzfP1F90fWe6JyO8lLx8Fekvj1EY4=;
  b=T7Rr/dJxoxentm4WhreyhcYId1RR8GP8FCbj9EdiuVju3sE+j6Kp6vou
   lWTq2Qp6LmkXJKhclgZF7457qMykQph2od537nXohtZhcWk+2E44I0P3N
   nhAb29Q+53wRaJyxEPJuudlNrEFTJFaiVe06opDHqlR+eibjBLyPjyLrJ
   41ucpUOS0Xg0v/TYLwnHugAFqMmgDYc5s8LsC3LRSI5uA29iIf1wmFuD+
   95Ab5i8gKrG1rBpmoOQawEOA8lytE0fWL5k8W8LfkL9yWOnyuUpa9Tiph
   ZrEMrjJVvDKjcEhU6KQCCburmBd5hS6OWKUtsn1/ruKWJsaPZSmAmdvrM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="10970040"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="10970040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 01:32:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="469101"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Feb 2024 01:32:20 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWYrJ-0006Cm-0X;
	Sun, 04 Feb 2024 09:32:17 +0000
Date: Sun, 4 Feb 2024 17:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	wenst@chromium.org, hsinyi@chromium.org, nfraprado@collabora.com,
	macpaul.lin@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	stephen@radxa.com, tom@radxa.com
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce the MT8395 Radxa
 NIO 12L board
Message-ID: <202402041754.SHJCpnEP-lkp@intel.com>
References: <20240202114821.79227-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202114821.79227-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_013230_911340_6CA5E686 
X-CRM114-Status: GOOD (  10.68  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-arm64-mediatek-Add-MT8395-Radxa-NIO-12L-board-compatible/20240202-195207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240202114821.79227-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 2/2] arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240204/202402041754.SHJCpnEP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041754.SHJCpnEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041754.SHJCpnEP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts:791.1-8 Label or path ssusb0 not found
>> Error: arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts:804.1-8 Label or path ssusb2 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

