Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB54CA100B
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc7QG9lQ1s5OX6gDIck2KDicZ8ytCJvpOGVewu/6c/4=; b=l4YtJ7wVEmdOAewmOXS7BNZQMP
	D1+Vu8WFIWTjIKAim02gtJvVU6BiRuVzaJ/Chop70tMLXfJrWl9jkwjICuJc7onK4NgKniqD5XkIw
	PlwhFvSkWUfBytEkIGQW11pa35OjjBL9Nb1XOAkkfQ39Wx5hDzVhvpvl782z5ROPxutslOHWROdbm
	8z0ZwOr48qRLeu7d9LfBj1zYQ9+h5EWE5ui3aMGM9+FvZ3DmUk0lnvUT/5OdxVRtcKsbKgYGcWamy
	fmk8/fiSMgHKuGzjQfbgr/FbDcWkNjE+Sdc+VWPjWDmnrRcWK8nPGoilT9AXgaHccOQ7ftOqcKbZT
	DwySDnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skIBJ-00000008nYA-1DCn;
	Sat, 31 Aug 2024 07:05:57 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skIAP-00000008nHr-0YsL;
	Sat, 31 Aug 2024 07:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725087901; x=1756623901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2MIvjife9TxEOVM4N//TXAhsxKXULju5kqrwtaSFDZI=;
  b=ctVo7WALw7n6aZ1ZavbGdoC2D60O5A4crmHaaEzAHdGGaVzuJBThTJbu
   4DSpapnlOneTt+/tBIL+vGY5WJyKaBNF+iG4ff7Rg379RohvOiD7T/Dv5
   zEmFBBXgtC0OUNiqv0qW+m9TKKUgFE8QI1bSXftCQWEQgdybsMeVMpeyN
   1QlMRO102KN+geAq49tEvhFwd1NaMJGqkj9gdUz0K6m4gmTYJRQ5YLp7M
   Xvx70gyANmvbkrg/W/QmVwoGwbBc3DkfGZMhPLlfb3btUhN+kbJpLgDAx
   bU3WOjbPAYYKlFzcyY2bLltahHbKw4n4agQmo0/boJQIxG5lmEInuBq2I
   A==;
X-CSE-ConnectionGUID: bzToTiJ+TfSfx3g3/jHyWw==
X-CSE-MsgGUID: SC3kjgEETCG1ItcTKVMzUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35142360"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="35142360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 00:04:56 -0700
X-CSE-ConnectionGUID: pBaWsdrATdClvQIISpIntA==
X-CSE-MsgGUID: PGOW7AjMQ2qLPMI3JEsoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64160004"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2024 00:04:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skIAC-0002Ps-0A;
	Sat, 31 Aug 2024 07:04:48 +0000
Date: Sat, 31 Aug 2024 15:04:06 +0800
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
Subject: Re: [PATCH v2 2/7] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <202408311453.Ui9YGyJc-lkp@intel.com>
References: <20240830110732.30080-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830110732.30080-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_000501_253642_91D53361 
X-CRM114-Status: GOOD (  13.87  )
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
patch link:    https://lore.kernel.org/r/20240830110732.30080-2-macpaul.lin%40mediatek.com
patch subject: [PATCH v2 2/7] dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311453.Ui9YGyJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311453.Ui9YGyJc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mt6397.txt
   Warning: Documentation/devicetree/bindings/leds/leds-mt6323.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mt6397.txt
   Warning: Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml references a file that doesn't exist: Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

