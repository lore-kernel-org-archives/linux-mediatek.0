Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EB2C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 01:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWqozarj/sCzkdKK6ASaeKQPY4tX+dk8b7erFNjyHQg=; b=sEbmpvi3YSiC132lV0byewPRwT
	n9HxCMfbWc0Sd8fvgg40kQ6n4jV0E9I6H6z3a92d/UsbIEqOQbBlTCFGKjAnJsfJCqGIM696Suyoy
	m4dFW691Fn0/8A+fTB/x5acZZkYD5oZeLoB09UZNgO7euDER2LmGEXSi7Us2oG5hUQxRYXeEyv91w
	Q0YMzIiKW3ArWZ1uZvqN9vyKOyA5JuJkeMC+0mgaJpvOFDTmJ9YEthVqiQmz78iABk3KyAN6c/rYD
	e7AnM4iGnCNe/+gcYnH6BKkOvOAyCHlauJTGtB1QjRGBUkB6M1oSFyXBNMlrNcfIeyhqbkc8uy0c8
	VSWYxNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHCmo-0000000AgnB-1VdV;
	Wed, 12 Jun 2024 01:28:26 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHCml-0000000Agmi-2wnv;
	Wed, 12 Jun 2024 01:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718155704; x=1749691704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yxlnGeFBeZpOu9F46jpspVd+qUy3HO7R8cCMNex2xY=;
  b=CX/P1WYHRYta28eZP3U41KblIKmzwUJFkasmtL8KQSA6tBSr46egzqRL
   oMyUfgLwBYmVud1KDbkPMt8HS0vkukNhHvShFhy1abKGXos929+RJtyKl
   it6dJO1PvCSvZUA+RT0Xb046/La5u/7UCt+gPnrULFjNEBbH9Yv+sKCsC
   ZDZEsm5JI5CKsbvEylI70oLAbfBmDUvPT1Lx4Ik15yIIaFGlqd+9kxc3M
   c84fC9AF4cJqwAKAWVVwcDB9UphThAWVdMGKcyBFncgq07OoAXMlCseC3
   5ogolI00LNZgNs4D1nvinaYMMb8g1P+z3/EFhMvgx/GH27APgMK2w9q4L
   w==;
X-CSE-ConnectionGUID: u51CeZ50QSyjelBOjdSHxg==
X-CSE-MsgGUID: aElR7nNMTDylU85ptJnGqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26307487"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="26307487"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 18:28:22 -0700
X-CSE-ConnectionGUID: fVlgSjgFSjaCyzUxBhze6A==
X-CSE-MsgGUID: XnTGlzf6RJuHrUVzF6vsdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44532709"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2024 18:28:16 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHCmb-00014Z-30;
	Wed, 12 Jun 2024 01:28:13 +0000
Date: Wed, 12 Jun 2024 09:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
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
Message-ID: <202406120934.xJkzoJYC-lkp@intel.com>
References: <20240611082831.477566-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611082831.477566-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_182823_879064_9244B0CD 
X-CRM114-Status: GOOD (  13.46  )
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406120934.xJkzoJYC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120934.xJkzoJYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120934.xJkzoJYC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dpi.c:21:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dpi.c:711:17: error: use of undeclared identifier 'dsi'; did you mean 'dpi'?
     711 |                 ret = PTR_ERR(dsi->next_bridge);
         |                               ^~~
         |                               dpi
   drivers/gpu/drm/mediatek/mtk_dpi.c:706:18: note: 'dpi' declared here
     706 |         struct mtk_dpi *dpi = bridge_to_dpi(bridge);
         |                         ^
   5 warnings and 1 error generated.


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

