Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88952C5472C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pnxcr1RctVyekh7fp6Zs7PBfow/ZAKboL2Wz6q4mWTQ=; b=0hzL4q7I7HJI3/NFhPvdRj1JSl
	H6ci26qAepP+kEZwlrB7VDOFC6GGtiE3GFUMOFU/QafDBWODYM0XqGesgKhqQOsBU+a41u5Zg6rdc
	gdlkTs/fLRupY8cs7BVEodY5JEGlLR6wIvhfo2vEVPDuG5Q+sBdVAy9Syh7mAxIFmLjGUk6Ir8yOE
	/QN/76yL/RaqrsJPUy6HzzOKlEnqTbA74lXXPYJPXtxjuzWwLgJZ79KGsWS1Lm0CBoSktDbV4HbMg
	x63vFPptkbhGqsKFuarEQq1PS0MxitiZwJ96vpNvO+W1GIFHCtacKgUAaha7JdCpAWFYSM1btb4pF
	WS//fMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYXc-00000007FyD-475z;
	Mon, 26 Aug 2024 12:09:48 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYVG-00000007F8Q-3U13;
	Mon, 26 Aug 2024 12:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724674043; x=1756210043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mwEtZJB0/hwPWU7zAWoSj7zbloELyiZsdOdbKj+WPu4=;
  b=bJR3I5f6xPJdnmg/h0Cmn6OcRy76leF5L7XfgOiXOxViQKU8h7TSY4o4
   pQRYDydZ53xH4w9rb6vJPQIK7J04xtVgWps/3AMe0PNQ3tXm7PwGMW5jA
   gLVIhoMzhdJaePKJwxr6fDIPQFSlEZ6Bq4KSzPAhnvmQBaoGgNjenC31z
   +ZWFkj/ChZGaibrD45edphLu5HbdtYhIypijVGmiKI3iBbqR3Hsy+fE79
   MzE7RdBReJCAEzMxRHf9/P48iNkUH+rRnO3MYpkJUYtc5OfLhqEMci5m0
   zRVAJOLumuKGhAzh4aA3H3Bru593OY11OpWjfYbyfAQqUW/2RYuZD52wg
   w==;
X-CSE-ConnectionGUID: Lo4b/MbBS56f/Ll4840dKQ==
X-CSE-MsgGUID: xQNcXnxER4iDmkZbSnLcsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33754867"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33754867"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:07:05 -0700
X-CSE-ConnectionGUID: ckZdX9P5RgCXpckOG7uxZg==
X-CSE-MsgGUID: O99tV9lITNWVQNIBeo6yJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="63010403"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Aug 2024 05:07:01 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siYUs-000H11-0v;
	Mon, 26 Aug 2024 12:06:58 +0000
Date: Mon, 26 Aug 2024 20:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <202408261940.R6VmGtGO-lkp@intel.com>
References: <20240822092006.3134096-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_050722_910196_3B1A0107 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on robh/for-next wsa/i2c/for-next linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240826-105737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240822092006.3134096-3-wenst%40chromium.org
patch subject: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup code to of_regulator.c
config: i386-randconfig-005-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261940.R6VmGtGO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261940.R6VmGtGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261940.R6VmGtGO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/helpers.c:17:
   drivers/regulator/internal.h: In function 'of_regulator_dev_lookup':
>> drivers/regulator/internal.h:87:16: warning: returning 'int' from a function with return type 'struct regulator_dev *' makes pointer from integer without a cast [-Wint-conversion]
      87 |         return -ENODEV;
         |                ^


vim +87 drivers/regulator/internal.h

    82	
    83	#else
    84	static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
    85								    const char *supply)
    86	{
  > 87		return -ENODEV;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

