Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB34C27C65
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt5cbaCurQ7xkhNlNuC5xt2DbMOYsRdYU7XLQNIISW8=; b=SIYvpDQh7UAd8I596IhaAPBUdZ
	qm0+7eM0PoFzVAU0/LHId9n0Ble0NIk0WSVHagEwxyKXa8rvU7kgRHjTQjxMwUAbRJ2kowjmQQIsf
	cFpoZQYNvwrp7dvpJBCpIPBmIWq+T1CTxC8grs+nisP0I473skswRyTt7UxbgVXE87HNDiGcq5U3c
	iFiFvL0s2IqsedxHbGIpVEqDtGiybt/j1tOt6UWWOBiBpOzG15r91AuQTqSzka0M6orrcQ11e+ISn
	qsjOcCzQdjrNzPMJNRasLaxgGEs79IrpH64nzgeyOqv1O9S3pEDv/1EJ7YC3myggshkQ4n5bWhFnh
	wFcYgPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7H1-0000000A1xS-1LkE;
	Tue, 11 Jun 2024 19:35:15 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7Gy-0000000A1wY-1kJO;
	Tue, 11 Jun 2024 19:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718134513; x=1749670513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=susaUDi/yz7Enip+SPo9XpTzH+CVEJDN9NuS79DVHfM=;
  b=JQ/1W1pDqfWHEJqgkMN9/BYXdOaKEOznizsPIBY0tpvmXpPN8yGN3K0J
   PDt3vRS7/e+NWspVGBXpZ2G9x2n2xb5IbhdlYLWcidU9HWw89/djdPOUl
   h5TouJdksfCVvx9cPVQxXBMWtZGrvQrG01svjoBoYOT6yAXyrT4hj5gcK
   RanhJ/bryL/Ncm12gR9Bd9WN3fZJbDngLYysNtXtm37g0nQT/CAC7JINd
   EoL7mLAOiL8Yqvn5NR4qrFWPfb3M/4D5wk4qVy/9yk2LSRhfo9j+UWp5Q
   GbG1lsqCCS2/AxnlPPA64Q9QlWGmo14U4kOHZODM7YPBtb1YZ3jUmA1Xq
   A==;
X-CSE-ConnectionGUID: +lmYbv8pQu6O7xBbVE4qFw==
X-CSE-MsgGUID: 5NBUQB8gTJqhtKsN+A3Thg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14997334"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14997334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 12:35:09 -0700
X-CSE-ConnectionGUID: XSryMGTlSDq3RqP+GGoarw==
X-CSE-MsgGUID: hKbXWze/Q4GB6LbrnaPW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="40007035"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2024 12:35:03 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH7Gm-0000qE-1S;
	Tue, 11 Jun 2024 19:35:00 +0000
Date: Wed, 12 Jun 2024 03:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com,
	yu-chang.lee@mediatek.com, ck.hu@mediatek.com,
	jitao.shi@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com, sui.jinfeng@linux.dev, michael@walle.cc,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v6 3/3] drm/mediatek: Implement OF graphs support for
 display paths
Message-ID: <202406120316.VAGmVBWN-lkp@intel.com>
References: <20240611082831.477566-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611082831.477566-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_123512_660617_06E43301 
X-CRM114-Status: GOOD (  15.28  )
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
[also build test ERROR on linus/master v6.10-rc3 next-20240611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-Add-OF-graph-support-for-board-path/20240611-163327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240611082831.477566-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v6 3/3] drm/mediatek: Implement OF graphs support for display paths
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120316.VAGmVBWN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120316.VAGmVBWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120316.VAGmVBWN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dpi.c: In function 'mtk_dpi_bridge_attach':
>> drivers/gpu/drm/mediatek/mtk_dpi.c:711:31: error: 'dsi' undeclared (first use in this function); did you mean 'dpi'?
     711 |                 ret = PTR_ERR(dsi->next_bridge);
         |                               ^~~
         |                               dpi
   drivers/gpu/drm/mediatek/mtk_dpi.c:711:31: note: each undeclared identifier is reported only once for each function it appears in


vim +711 drivers/gpu/drm/mediatek/mtk_dpi.c

   702	
   703	static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
   704					 enum drm_bridge_attach_flags flags)
   705	{
   706		struct mtk_dpi *dpi = bridge_to_dpi(bridge);
   707		int ret;
   708	
   709		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
   710		if (IS_ERR(dpi->next_bridge)) {
 > 711			ret = PTR_ERR(dsi->next_bridge);
   712			if (ret == -EPROBE_DEFER)
   713				return ret;
   714	
   715			/* Old devicetree has only one endpoint */
   716			dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
   717			if (IS_ERR(dpi->next_bridge))
   718				return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
   719						     "Failed to get bridge\n");
   720		}
   721	
   722		return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
   723					 &dpi->bridge, flags);
   724	}
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

