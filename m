Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BA1C28B28
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Mar 2025 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/E2EMOQVZnwI+K3ur/QtYh2u8G3zbMy02Kb2mykmDM=; b=XZamB/L0PH+rSOQBGbedYUKIBY
	JW6nsceNTOCJkcBxzorMKQMdxQKpBp7Puf3kzRpfrTrqlKqaz3ysVcK8u817W3zVVDnpduyQSWylT
	hrAuJfYnFSt7nC7Nb8vYZ+ITNcUFxlow/mQ6iIpEMCV239DESIMeitm7DzUfNTiDS+UzwvjU3t/J1
	nYJ7DMt29Kh3dtcg89bXOtTadk8bDFIG7Vcf+lHD1M1GUw6hy3CV0enQMvPUsU2PPCiGT2qEEDarq
	lyNDwTOwIP+m6keYQqBmQsEBUOx4XG5rjwL8mOzQ/4i4pHdxjQ1wNsNQSEXTsiYYXH0nGUiAsEHt/
	N3bYXSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMKJ-000000013uG-1EbW;
	Sun, 09 Mar 2025 19:28:43 +0000
Received: from [192.198.163.17] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trMIf-000000013kw-0vnf;
	Sun, 09 Mar 2025 19:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741548421; x=1773084421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dk3dyE0dtJPnVxAV4n6omrRWpps5/OsjqC9n7SUzIAY=;
  b=Y5g5uFA0rtnnLWUDHwmhQK/H4YRh2Nbo4VdPkQBO/3bc4fAqfV3FAsxN
   8Nmjb4bBApa8iVAyCMNX4TOY+tY8sGt/yWj7aHWKy6Y+lYI57WBYjalDN
   9qbPZXdoY+bw2BlWewkhvKXP0ZGEPye8PGAOdybRdWdol6JRwXF7lSK5+
   ncLRBERRPEfywSHQn/UmQaP/MI1d91V+ESPkPswBP4qUQdVUFKL5EjZ5p
   WgsZs9rZPBc7Tp93wgpJ7waSzG+Kw7PPZHc2n85GUL5u87Qb3+Uu/1Yst
   8n4zSHnKJC8dJHwDqsUswm0X6fyapC0lvjukOkSBcBqAIzOi8NtqFsmym
   g==;
X-CSE-ConnectionGUID: 9x1NlWf1ToyV6kP/YdJClw==
X-CSE-MsgGUID: Ng3PMeivQZWnygXykchUqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42414973"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42414973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 12:26:56 -0700
X-CSE-ConnectionGUID: UsC/pV4tTLOMuh37iVyUtw==
X-CSE-MsgGUID: 5kmuBSalTDaAtTsev3gd4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="120288769"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2025 12:26:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trMIT-0003PE-1U;
	Sun, 09 Mar 2025 19:26:49 +0000
Date: Mon, 10 Mar 2025 03:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [net-next PATCH v12 05/13] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Message-ID: <202503100331.nksmBPCd-lkp@intel.com>
References: <20250309172717.9067-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_122701_304987_BC668B27 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-nvmem-Document-support-for-Airoha-AN8855-Switch-EFUSE/20250310-013306
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250309172717.9067-6-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v12 05/13] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
reproduce: (https://download.01.org/0day-ci/archive/20250310/202503100331.nksmBPCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100331.nksmBPCd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

