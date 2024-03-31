Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28476CD128A
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Mar 2024 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ3yJwHMfBnZoBY+hJs5NCv8NXB+NJqLb9UQknvIU4A=; b=Dz1IUG0sz9lK9QWwE+kvRKeUub
	YYzp8q47AlFGd3JeWg7qKU+ub2Vg5QYSzwDHVXZ20yiP+cBTK0YljJIhW5R+Hb4b6NvRo0w6VamWk
	eoRxJhAMCu6g8AKJaDJ46odYeSOdwtcI+WSBQJRG8uJLBQw6FY20/Y9fawImqHVEJ/lUYOU1L2GPC
	6ZReI5BDKLFY0treiyR16l6A6ZJfo70XT4D1TiZ92pnqSCv/BGeY4dQjylQ1ja3VyQYExFHx+P89Q
	+kAwPcWLnJudBPKMCz+IyLDmYaiiIkugmXS0zUle4iaRenhDSyZMQU13tgulj+pCmFnob5OoF/bWW
	OZwaAijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqwhj-00000005ZuU-0AZI;
	Sun, 31 Mar 2024 15:02:39 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqwhf-00000005Ztc-0dhc;
	Sun, 31 Mar 2024 15:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711897355; x=1743433355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVuVh2OqrH74gF1FKTiMNhGw2N4I9suhNWP0z/DShdc=;
  b=BnP8EbRSCRzfxOPqVw1Ae9SZ/eLlLjxz9K4rEKtnCCZU+38vzVPF+Z8b
   090qFGqDCqNiGHZzGFodDNTy0OqgiKE+CMIUPj/6scBZBTuFWi0vDdc1M
   /VFQ92Eoiii8YxQGOtp6NzNAkf5smzw0r8dUAmGTjNgdpaLFZHX1QkBPO
   h8KRdwZ4KqeVBns6fFCuYV7m+o56zQfvFSAbrJkBS+3w9TPe/4NZsMY94
   vITY/oZBg00p5n3n7GQtdvBwWGAnEg2Y86Rw8PSquzDkeP0B9jVLrCCVd
   TGcb54DNRWuWe0gxuNYMMhSp32yboomZaj0xKEqDFPznw4ZDA6OOk5bNy
   Q==;
X-CSE-ConnectionGUID: 0jfBY4U3TcWIQJZR29FQlg==
X-CSE-MsgGUID: M2TMrU8xSbiwvwnOv/rWgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="17594438"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17594438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 08:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17548115"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2024 08:02:29 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqwhX-0001CS-1p;
	Sun, 31 Mar 2024 15:02:27 +0000
Date: Sun, 31 Mar 2024 23:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	fan.chen@mediatek.com, xiufeng.li@mediatek.com,
	yu-chang.lee@mediatek.com
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
Message-ID: <202403312222.fjYPC06h-lkp@intel.com>
References: <20240327055732.28198-3-yu-chang.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327055732.28198-3-yu-chang.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_080235_275360_62A935B2 
X-CRM114-Status: GOOD (  14.50  )
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

Hi yu-chang.lee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yu-chang-lee/pmdomain-mediatek-add-smi_larb_reset-function-when-power-on/20240327-140007
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240327055732.28198-3-yu-chang.lee%40mediatek.com
patch subject: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240331/202403312222.fjYPC06h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403312222.fjYPC06h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:128:6: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:129:9: [warning] wrong indentation: expected 7 but found 8 (indentation)
--
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:128:6: did not find expected key
>> Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml:
   while parsing a block mapping
     in "<unicode string>", line 64, column 5
   did not find expected key
     in "<unicode string>", line 128, column 6
--
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml: ignoring, error parsing file

vim +128 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml

     8	
     9	maintainers:
    10	  - MandyJH Liu <mandyjh.liu@mediatek.com>
    11	  - Matthias Brugger <mbrugger@suse.com>
    12	
    13	description: |
    14	  Mediatek processors include support for multiple power domains which can be
    15	  powered up/down by software based on different application scenes to save power.
    16	
    17	  IP cores belonging to a power domain should contain a 'power-domains'
    18	  property that is a phandle for SCPSYS node representing the domain.
    19	
    20	properties:
    21	  $nodename:
    22	    pattern: '^power-controller(@[0-9a-f]+)?$'
    23	
    24	  compatible:
    25	    enum:
    26	      - mediatek,mt6795-power-controller
    27	      - mediatek,mt8167-power-controller
    28	      - mediatek,mt8173-power-controller
    29	      - mediatek,mt8183-power-controller
    30	      - mediatek,mt8186-power-controller
    31	      - mediatek,mt8188-power-controller
    32	      - mediatek,mt8192-power-controller
    33	      - mediatek,mt8195-power-controller
    34	      - mediatek,mt8365-power-controller
    35	
    36	  '#power-domain-cells':
    37	    const: 1
    38	
    39	  '#address-cells':
    40	    const: 1
    41	
    42	  '#size-cells':
    43	    const: 0
    44	
    45	patternProperties:
    46	  "^power-domain@[0-9a-f]+$":
    47	    $ref: "#/$defs/power-domain-node"
    48	    patternProperties:
    49	      "^power-domain@[0-9a-f]+$":
    50	        $ref: "#/$defs/power-domain-node"
    51	        patternProperties:
    52	          "^power-domain@[0-9a-f]+$":
    53	            $ref: "#/$defs/power-domain-node"
    54	            patternProperties:
    55	              "^power-domain@[0-9a-f]+$":
    56	                $ref: "#/$defs/power-domain-node"
    57	                unevaluatedProperties: false
    58	            unevaluatedProperties: false
    59	        unevaluatedProperties: false
    60	    unevaluatedProperties: false
    61	
    62	$defs:
    63	  power-domain-node:
    64	    type: object
    65	    description: |
    66	      Represents the power domains within the power controller node as documented
    67	      in Documentation/devicetree/bindings/power/power-domain.yaml.
    68	
    69	    properties:
    70	
    71	      '#power-domain-cells':
    72	        description:
    73	          Must be 0 for nodes representing a single PM domain and 1 for nodes
    74	          providing multiple PM domains.
    75	
    76	      '#address-cells':
    77	        const: 1
    78	
    79	      '#size-cells':
    80	        const: 0
    81	
    82	      reg:
    83	        description: |
    84	          Power domain index. Valid values are defined in:
    85	              "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
    86	              "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
    87	              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
    88	              "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
    89	              "include/dt-bindings/power/mediatek,mt8188-power.h" - for MT8188 type power domain.
    90	              "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
    91	              "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
    92	              "include/dt-bindings/power/mediatek,mt8365-power.h" - for MT8365 type power domain.
    93	        maxItems: 1
    94	
    95	      clocks:
    96	        description: |
    97	          A number of phandles to clocks that need to be enabled during domain
    98	          power-up sequencing.
    99	
   100	      clock-names:
   101	        description: |
   102	          List of names of clocks, in order to match the power-up sequencing
   103	          for each power domain we need to group the clocks by name. BASIC
   104	          clocks need to be enabled before enabling the corresponding power
   105	          domain, and should not have a '-' in their name (i.e mm, mfg, venc).
   106	          SUSBYS clocks need to be enabled before releasing the bus protection,
   107	          and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
   108	
   109	          In order to follow properly the power-up sequencing, the clocks must
   110	          be specified by order, adding first the BASIC clocks followed by the
   111	          SUSBSYS clocks.
   112	
   113	      domain-supply:
   114	        description: domain regulator supply.
   115	
   116	      mediatek,infracfg:
   117	        $ref: /schemas/types.yaml#/definitions/phandle
   118	        description: phandle to the device containing the INFRACFG register range.
   119	
   120	      mediatek,infracfg-nao:
   121	        $ref: /schemas/types.yaml#/definitions/phandle
   122	        description: phandle to the device containing the INFRACFG-NAO register range.
   123	
   124	      mediatek,smi:
   125	        $ref: /schemas/types.yaml#/definitions/phandle
   126	        description: phandle to the device containing the SMI register range.
   127	
 > 128	     mediatek,larb:
 > 129	        $ref: /schemas/types.yaml#/definitions/phandle
   130	        description: phandle to the device containing the LARB register range.
   131	
   132	    required:
   133	      - reg
   134	
   135	required:
   136	  - compatible
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

