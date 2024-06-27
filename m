Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EECC3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMkxoLc1aSqbhPiXoGqqRV9YQkxxBDLdzv5oSMIGv8o=; b=jRgZ1aR8vDL8VKaXRaFWQDyLT6
	dWCpGME6daFXnMuna0fTyLT9D/B80SrrXZdidj75jVaNZZFTN79seD4KJsUxRT9Dy2+VdztiTlccM
	TSrNsTakjtqxPrVKv9FzIvJQYtMuYDpUqN8OHYLXR3dCGvCD477GGLUavHuSLh+dOnDQZOl0MgXYR
	2xsmeiwh3IEx15y1LKYyv6TOdOIcHQsI22zACfIYQBjCFF9mc0YE5a7m9QrNzWcwrtZD3jWqc7mZl
	R2DuuKULGvGP33NJWErhB5UUzt4DqehN3n5kGkgSakxlJI3S5iZ3NSNz5YZnL1NGTKtVnXZDoXzWc
	7ejy1fSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtoH-0000000BNtZ-1ZE6;
	Thu, 27 Jun 2024 18:25:29 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMto6-0000000BNoI-0Ird;
	Thu, 27 Jun 2024 18:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719512718; x=1751048718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hkbH3h5i6uGsXa8uzjWtbfxWSJess7YTCGvakbQvPXY=;
  b=lFU8II/xSunAAy1OHa/W80Ve9O7bz+BK7qcjSzH/7UNK1nurkCTDu0Zq
   FmLKp4tBm4KwjxtOH7OK0Hfzr6uzqhTBbXfuHmUDWGsE7+/vE+X3xSEdb
   kSsbJcEijbXzklINkMJrTiR9MqOQ+4hsmA3FaCygllmfTpsAuYHHZD78n
   T+W5r5f2Nj4D8yvNCWHIlm1bvIKnll1E8rNwx44tT6yu/NBU9fdXc4PzN
   vI9+sL4CRPk14qhD6VZFFxUu+dRWIrSlZkJPdfU30EQQNKp+jN+Nj/pI5
   pnBT8vnHMey3W4AKUbUJ6EE2DZjoOPuUZtqwBjZfrvZHcRMB7nNWiUOPk
   A==;
X-CSE-ConnectionGUID: 4hk7ehvpSFK2bhYXEFz70w==
X-CSE-MsgGUID: 6Lqwf+MWQwaKSSEOVtlWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16345770"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16345770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 11:25:17 -0700
X-CSE-ConnectionGUID: Ee3EDbM+Tpuq9RV7L2Kj0w==
X-CSE-MsgGUID: DPfCvDUHTxeU4kbEH+bqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="48808509"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2024 11:25:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMtny-000GQC-3D;
	Thu, 27 Jun 2024 18:25:11 +0000
Date: Fri, 28 Jun 2024 02:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] dt-bindings: net: Define properties at top-level
Message-ID: <202406280202.IRKWOMQk-lkp@intel.com>
References: <20240625215442.190557-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625215442.190557-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_112518_201626_F565156D 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-net-Define-properties-at-top-level/20240626-091748
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240625215442.190557-2-robh%40kernel.org
patch subject: [PATCH net-next] dt-bindings: net: Define properties at top-level
config: arc-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280202.IRKWOMQk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280202.IRKWOMQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280202.IRKWOMQk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axs101.dtb: axs10x_mb: connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb: sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
   arch/arc/boot/dts/axs101.dtb: i2cclk: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arc/boot/dts/axs101.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
>> arch/arc/boot/dts/axs101.dtb: ethernet@18000: snps,pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@20000: $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@20000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@21000: $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@21000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@22000: $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
--
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: /cpu_card/pct: failed to match any schema with compatible: ['snps,archs-pct']
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/axs103.dtb: ethernet@18000: snps,pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@60000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/axs103.dtb: mmc@15000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/axs103.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
   arch/arc/boot/dts/axs103.dtb: i2cclk: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
--
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/pct: failed to match any schema with compatible: ['snps,archs-pct']
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: ethernet@18000: snps,pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@60000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: mmc@15000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: i2cclk: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
--
   arch/arc/boot/dts/hsdk.dtb: soc: gpu-core-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc: mmcclk-biu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc: gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: /soc/reset-controller@8a0: failed to match any schema with compatible: ['snps,hsdk-reset']
   arch/arc/boot/dts/hsdk.dtb: /soc/core-clk@0: failed to match any schema with compatible: ['snps,hsdk-core-pll-clock']
   arch/arc/boot/dts/hsdk.dtb: serial@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/hsdk.dtb: ethernet@8000: snps,pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@60000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/hsdk.dtb: mmc@a000: Unevaluated properties are not allowed ('dma-coherent', 'num-slots' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/hsdk.dtb: /soc/gpio@14b0: failed to match any schema with compatible: ['snps,creg-gpio-hsdk']
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#
--
   arch/arc/boot/dts/vdk_hs38.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000: $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
   arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk: $nodename:0: 'axs10x_mb_vdk' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/vdk_hs38.dtb: ethernet@18000: snps,pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@20000: $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@20000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000: $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@22000: $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
--
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpu_card/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000: $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk: $nodename:0: 'axs10x_mb_vdk' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: ethernet@18000: snps,pbl: False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000: $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000: $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@22000: $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

