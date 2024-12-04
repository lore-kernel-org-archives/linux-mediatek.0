Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B0EE7716E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Utwk63J/JAAft+jjkAFOI11XjIWN4zZIg9xhLy/xq/U=; b=CwDZf5G4i0XOvzHEQBBjT6fTiD
	9QWDN9O6m27LP5bR7d4V7X9i6OPUUrEZVwFWPq7Wg2OVeN77cCzdxenXr0QFuZ0R13u0Pa7+NSdlN
	on0Cl+UdFy3N4/VEAR+BVthAt303fdYbJ3oiw4UlGFi2ijlprAfdC4JBGz/l4NukOYbs/46d/AkBM
	S6pj1kqnAVz+p7SEc/yUnFMrp5eMfR80wIXNdkRYmxzZH6oeJq4bp8rWMncjQrwtsJBRBPTSZIKmq
	sDSdz4KcYZphStZhpURm0Xj42UzDkzc8jOVtNFOCuqCZ57zIk5w10nugALsBoaO8ETBK/4gdamIaq
	8JlgEY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpBC-0000000CeSq-2Wpl;
	Wed, 04 Dec 2024 13:12:34 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpAB-0000000CeHq-2ICj;
	Wed, 04 Dec 2024 13:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733317892; x=1764853892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ofio2GaUo3BYECCkWzkKf022v7VX6gRxDeQfk5OMne8=;
  b=bjFzKhgPzR6qXxNrrvy5/TSnSTb7lwk8bDqsOqhP2kuunr1O9DDg/Hle
   wIU7LGQdiZyUlNUSbVDFE4AZFANRkYHQXjHygUWYmDMgqq74d5nJD2QlJ
   udBPqErCY+tAi4YbOyO59O08FcrBraDyMROtk06PC26i5Ij8rfoh0WFAR
   PNj8TYtp73gq+2cSQljbfbvHK4iOx/0JMp2i12fJn02gl674vpiNYwQ2k
   ZbUaG39zt27A6U7j3mMv/HD4c1tY6iLLADXVpKHhPDMx6WIRRwGfgJe9K
   P0OBuHmEF8N+JStWY0Ho/UcnK5Swqd6c6H1rNbYYsn0WxgHJHeZiD5C7O
   Q==;
X-CSE-ConnectionGUID: YViO3teZSFqRhBJBFW+Qeg==
X-CSE-MsgGUID: g+Q+sSYySRGWcnrZHzIpMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33500202"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33500202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 05:11:30 -0800
X-CSE-ConnectionGUID: aE1QXvDHTzaDeAjFKwnf3Q==
X-CSE-MsgGUID: Ku4mZbNeSTCHzf9fcgKFhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93610487"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Dec 2024 05:11:27 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIpA4-00032x-2h;
	Wed, 04 Dec 2024 13:11:24 +0000
Date: Wed, 4 Dec 2024 21:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Shao <fshao@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH] drm/mediatek: dp: Support flexible length of DP
 calibration data
Message-ID: <202412042020.FZmfgvza-lkp@intel.com>
References: <20241204053634.1365491-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204053634.1365491-1-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_051131_626506_5BCB6461 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc1 next-20241203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fei-Shao/drm-mediatek-dp-Support-flexible-length-of-DP-calibration-data/20241204-133854
base:   linus/master
patch link:    https://lore.kernel.org/r/20241204053634.1365491-1-fshao%40chromium.org
patch subject: [PATCH] drm/mediatek: dp: Support flexible length of DP calibration data
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20241204/202412042020.FZmfgvza-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042020.FZmfgvza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042020.FZmfgvza-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/display/drm_dp_aux_bus.h:13,
                    from drivers/gpu/drm/mediatek/mtk_dp.c:7:
   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_get_calibration_data':
>> drivers/gpu/drm/mediatek/mtk_dp.c:1181:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1181 |                                  "Out-of-bound efuse data access, fmt idx = %d, buf len = %lu\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1180:25: note: in expansion of macro 'dev_warn'
    1180 |                         dev_warn(mtk_dp->dev,
         |                         ^~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1181:93: note: format string is defined here
    1181 |                                  "Out-of-bound efuse data access, fmt idx = %d, buf len = %lu\n",
         |                                                                                           ~~^
         |                                                                                             |
         |                                                                                             long unsigned int
         |                                                                                           %u


vim +1181 drivers/gpu/drm/mediatek/mtk_dp.c

  1148	
  1149	static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
  1150	{
  1151		const struct mtk_dp_efuse_fmt *fmt;
  1152		struct device *dev = mtk_dp->dev;
  1153		struct nvmem_cell *cell;
  1154		u32 *cal_data = mtk_dp->cal_data;
  1155		u32 *buf;
  1156		int i;
  1157		size_t len;
  1158	
  1159		cell = nvmem_cell_get(dev, "dp_calibration_data");
  1160		if (IS_ERR(cell)) {
  1161			dev_warn(dev, "Failed to get nvmem cell dp_calibration_data\n");
  1162			goto use_default_val;
  1163		}
  1164	
  1165		buf = (u32 *)nvmem_cell_read(cell, &len);
  1166		nvmem_cell_put(cell);
  1167	
  1168		if (IS_ERR(buf)) {
  1169			dev_warn(dev, "Failed to read nvmem_cell_read\n");
  1170			goto use_default_val;
  1171		}
  1172	
  1173		/* The cell length is in bytes. Convert it to be compatible with u32 buffer. */
  1174		len /= sizeof(u32);
  1175	
  1176		for (i = 0; i < MTK_DP_CAL_MAX; i++) {
  1177			fmt = &mtk_dp->data->efuse_fmt[i];
  1178	
  1179			if (fmt->idx >= len) {
  1180				dev_warn(mtk_dp->dev,
> 1181					 "Out-of-bound efuse data access, fmt idx = %d, buf len = %lu\n",
  1182					 fmt->idx, len);
  1183				kfree(buf);
  1184				goto use_default_val;
  1185			}
  1186	
  1187			cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
  1188	
  1189			if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
  1190				dev_warn(mtk_dp->dev, "Invalid efuse data, idx = %d\n", i);
  1191				kfree(buf);
  1192				goto use_default_val;
  1193			}
  1194		}
  1195		kfree(buf);
  1196	
  1197		return;
  1198	
  1199	use_default_val:
  1200		dev_warn(mtk_dp->dev, "Use default calibration data\n");
  1201		for (i = 0; i < MTK_DP_CAL_MAX; i++)
  1202			cal_data[i] = mtk_dp->data->efuse_fmt[i].default_val;
  1203	}
  1204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

