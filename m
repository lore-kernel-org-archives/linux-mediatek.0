Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5E2EE0214
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRsbDsXePsoQQJ+XMYLFIpI3LqHI7/+/zULvoVgZ12A=; b=DmkOzlvfsis7vhorQdSKT1j0km
	sUFAlXAViAwlPNKvF1oKPhqYDLD/6FTUnIAuMA2fxc+/N3SNG29Y6i54nD2ZAKCgI/IAyGmL3ZT6x
	jYgC2l8kvHoeBXyuvLSMnf4rShzQcIiTkH806mcNqCm6FE6BuI6drXn8ypyo2aUj3K8nRkW2Eg/Gf
	yuUQjQU7246iYlycnMjMgBDBjvbZL2sf3cF8qxei+6RYr2kbyl9azSH2eEKG7A6ftpiWDgMFg2njV
	XQ8eL6Lq9clmP7Jhst0RSwLpjGjxdAsm9pHySAUlkHSZeUeohigA6xVneFxJuuBJ4eflNiyUpzt57
	rYabdWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIPC-00000008ZwG-2DRR;
	Wed, 11 Sep 2024 08:08:50 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIO7-00000008ZeO-2HiP;
	Wed, 11 Sep 2024 08:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726042064; x=1757578064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKZEIu89oRth7yodb/7PPbffl+lMha21+1Do9ttFjVI=;
  b=YVJeeQTG5cciGWe2NJQkxl02CpwzbzvEL5nNYXLw9fqSxnnrLiEX1uTc
   5xIEaEzce6F+pLbUlvWArrdS6udu+Zq2kDX1kV6kpYX914ZD1uOzDtBn+
   neDahxaUatvRMNci6R4Ma8bHtH3HZImrSP3sMzKKjPvDB5pFzrMHRMo/H
   lJG9qCCmrwOyxD6V3r2KSp3zNex5N4eZ3bEga5OBsjB52A0Mm/tyxWaNG
   cg8jHUJvLSx0nau0CcOcNUSfhMRhKPkFGiIslwDYA32vs00aD5z1wqWaV
   tUTrNzMa8LHqI8Q1N5FjlzuasDaEbKh580me63lhNk2tSiMIsXQPEFDOA
   w==;
X-CSE-ConnectionGUID: xsKu7Ww7TACQggzRQnRhVw==
X-CSE-MsgGUID: 4l6nOMAQQDqO0/vNqq9GiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24321862"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24321862"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:07:42 -0700
X-CSE-ConnectionGUID: KEWhRgfHSIS3VTcnfiBibQ==
X-CSE-MsgGUID: BUYId16kREuvLRI0XGNutQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67127393"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 01:07:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soIO0-0003DY-2v;
	Wed, 11 Sep 2024 08:07:36 +0000
Date: Wed, 11 Sep 2024 16:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: Re: [PATCH] arm64: dts: mt8183: Add encoder node
Message-ID: <202409111520.z5LrGscP-lkp@intel.com>
References: <20240910-venc-v1-1-d17dfd931dc8@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-venc-v1-1-d17dfd931dc8@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_010743_623566_4E733D15 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Hsin-Te,

kernel test robot noticed the following build errors:

[auto build test ERROR on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Hsin-Te-Yuan/arm64-dts-mt8183-Add-encoder-node/20240910-142236
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240910-venc-v1-1-d17dfd931dc8%40chromium.org
patch subject: [PATCH] arm64: dts: mt8183: Add encoder node
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240911/202409111520.z5LrGscP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111520.z5LrGscP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111520.z5LrGscP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8183.dtsi:1971.4-5 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

