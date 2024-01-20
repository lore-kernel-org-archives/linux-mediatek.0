Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6122EC47258
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jan 2024 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyHXq4T/iKOToOQ1jgeXWLrSeUyO6WHtRaWHgVk6JtY=; b=ezi2lVzNygHFohRiJgzPzFIgP1
	SpSK2t12D7K4VKSWUk/7TMHkIVyuajMTMGeDzORfqLCAoSiOe36zuic+6m5+P3T/qmYK/KUgi5qWm
	qNXmv+QXvOjvBe9X1Sp1CUXI+car0ftDgJo5N+9K7N0XZNiJcMy+kZD3y7woGHrO/bvwyiQkAUpEL
	cz0IVcQkb1S38+aQeYBTBv7kb7KfI/kjgu0ZjRa7jlmdcq8qVf6Fr1kVDRz6WSOwI1KmWpjJateW0
	aRRC9XiTB59sbPKJbAUecP/sAe17fMjY4is0NR0/7Fv/DrcIfWVLvIFcMFa4VIillo0lxlnk048J+
	slbo25wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR94q-007ePc-0g;
	Sat, 20 Jan 2024 10:59:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR94j-007eOT-2f;
	Sat, 20 Jan 2024 10:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705748386; x=1737284386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ilz1xWtpSY/qvW9bs/VOcsKSKWgmpOf2n2Djbw5kftI=;
  b=jSCyue48/AVIfygcNUdjWioi8GCb2iHeSzA7RwbMvK89qPOdKXEW26+3
   KdogwC370Il0a4mWW+zmFt5fQuBVgeO/F0ptg5uH0OAQGdgZuRDJC4fRS
   BBYUclDifS2a5WPNN9BHhexqDdCC0YtK2ipUJFXl+V9cPFwBaKCKzsXY3
   5+xXvU/ksPH19Hsx/xXWK78HrzR+qJ59RgRVi7t2oQZlRrBPVpcsVHbyK
   H0Bu5Cm4zpVbtwvjYK3DvosHe4q0Rkk9NVrRjBYFNWS5u6eZPdSD5IJIB
   knDfKnE7DlJHEyXqRzKSj+CXdikehfFa1tECE5KEhZkwxCoqDb9Svub6n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14281724"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="14281724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 02:59:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904388816"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="904388816"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2024 02:59:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR94Y-00051W-1d;
	Sat, 20 Jan 2024 10:59:34 +0000
Date: Sat, 20 Jan 2024 18:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	andersson@kernel.org, nathan@kernel.org, luca.weiss@fairphone.com,
	tianping.fang@mediatek.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] usb: typec: mux: Add ITE IT5205 Alternate Mode
 Passive MUX driver
Message-ID: <202401201835.bmry790M-lkp@intel.com>
References: <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_025945_931562_2D3D279F 
X-CRM114-Status: GOOD (  14.02  )
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

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next westeri-thunderbolt/next linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-usb-Introduce-ITE-IT5205-Alt-Mode-Passive-MUX/20240119-210119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240119125812.239197-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 2/2] usb: typec: mux: Add ITE IT5205 Alternate Mode Passive MUX driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401201835.bmry790M-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201835.bmry790M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201835.bmry790M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/usb/typec/mux/it5205.c:12:
>> drivers/usb/typec/mux/it5205.c:278:25: error: 'it5205_match_table' undeclared here (not in a function); did you mean 'it5205_of_table'?
     278 | MODULE_DEVICE_TABLE(of, it5205_match_table);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__it5205_match_table_device_table' aliased to undefined symbol 'it5205_match_table'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/usb/typec/mux/it5205.c:278:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     278 | MODULE_DEVICE_TABLE(of, it5205_match_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +278 drivers/usb/typec/mux/it5205.c

   273	
   274	static const struct of_device_id it5205_of_table[] = {
   275		{ .compatible = "ite,it5205" },
   276		{ /* sentinel */ }
   277	};
 > 278	MODULE_DEVICE_TABLE(of, it5205_match_table);
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

