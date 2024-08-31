Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B0FCA100B
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 05:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFhxGhg/Ze4Do/hk3u2SKicqwpKQg8xPIdsSJh1gZsY=; b=TcV/Z+SiKBtKTdoSNN87Viyw49
	eY9577eUWMmEtwCmO39BnsHoztSSoBCfieG8BYOSJEN2cIy/HpDTBfjO659nbB4z+7sluhiIqyZtT
	nFZlFxSrHZf7eS0+gh4aDsoIXQ2vXYO7xgB9tBrPp5jmbaHASu+vMP1Z2PL4ruNfF0u0n7yg1FDd8
	0CY3TDKFYW1mnyKuKURb4QI6aJ1yQAm+onHxyLOao1fDmDEWVqEaF1pysJQB+YTlb3yKj70bZhpYq
	k+IMQQpfs8toCLaj6OXwHDipDRRgt+Dkaa47Toq5kZoPxCfQZM51KxN9Wmz+jlzUqk4iuUjcWM81C
	ym6gO0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skH2e-00000008eK7-17f7;
	Sat, 31 Aug 2024 05:52:56 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skH1j-00000008eAE-1zYZ;
	Sat, 31 Aug 2024 05:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725083520; x=1756619520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPZnJLAmb2ixn8ewvoBsQp1uqRI1JfKOKD/pMy6DPEs=;
  b=ltFzOllhecsYA04eChLU015W5MkEcknRL9UASWNhRL3dzQm89ayJoAAC
   opjHiJeB3TwMkHOaUeYDRNxvggVkj7a3acZmxNbm5y9JlTvMWohZcYKpm
   hNqEIRkmauU9HrGNPPWr702DfroK9fULJD7y4rB2oshclOffWdNzUQxZY
   DYIRORmxuj5l31hKl8FGNsr/GS8r0HDR4zAF4hy8SobuWv+osdKeKuq0z
   AzkEkYcBwRNwUeW5/QZo+DO7/zKorTseSjN9TSwr/XFlmbwFM5ZqmrLNv
   gqve+pV8qSJfyDc/pZ4iYxOvSJPoZY9VNWDJZmlb2U+dxQi1N8J9bCXko
   g==;
X-CSE-ConnectionGUID: H03v2jvZR/a8lu9U33OFRA==
X-CSE-MsgGUID: NExNlhweSy+RILhJOvfR7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="26641539"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="26641539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 22:51:55 -0700
X-CSE-ConnectionGUID: Lmh+3MbJTRatYH3r/JoKcg==
X-CSE-MsgGUID: rVRYx+vlQuis3rwFQlpgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="68996526"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Aug 2024 22:51:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skH1V-0002NU-2w;
	Sat, 31 Aug 2024 05:51:45 +0000
Date: Sat, 31 Aug 2024 13:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Flora Fu <flora.fu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: mt6323: Convert to DT
 schema
Message-ID: <202408311355.zKsAfb64-lkp@intel.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_225159_584792_74B9972C 
X-CRM114-Status: GOOD (  13.74  )
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

Hi Macpaul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on lee-mfd/for-mfd-next robh/for-next lee-mfd/for-mfd-fixes linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Macpaul-Lin/dt-bindings-mfd-mediatek-mt6397-Convert-to-DT-schema-format/20240830-191309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240830110732.30080-1-macpaul.lin%40mediatek.com
patch subject: [PATCH v2 1/7] regulator: dt-bindings: mt6323: Convert to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311355.zKsAfb64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311355.zKsAfb64-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml references a file that doesn't exist: Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

