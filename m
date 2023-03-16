Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0465FC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 18:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDoaO+OFxN85W/TE5cu9j23QyVfUFO0PBq80v+z2nvw=; b=GOEr5blK4zbHjW0sMaycLvCaab
	z04xqzSDzbsCWSH6EPJrfKj0NEJ3COUSypNdqU9KIv2pwhsBnsxZhDfqgSTyJhtp+P3Z9osWlg4N9
	0UpZr8GkLmaumjVN8TvohNZs/AhGqj4CafNZ6PPfAZO/RLq8s2CydjdwRxWaJMOjqG7kl55KUkg46
	8ZxQc+/+TP2ObL+Y2cDofloX7MR6e98x0S9BvH0KmT0dkAtCciOdlF++q0QIcIpAPMEKjd+BkoZaa
	cmsPTbt2NDWL+hpiI6eHpDX338FyzIVvQo8vmCBSSIRH2u1OG1J45x/KVwYKK/O/t+1pFlpj6fVtg
	qVVS8hgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcrwg-00HCWF-0N;
	Thu, 16 Mar 2023 18:03:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcrwc-00HCVU-0K;
	Thu, 16 Mar 2023 18:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678989798; x=1710525798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t3Z0AZq8QfGR1uNwW45+qvzjp/J3+V0/B7NRGW+sJ0k=;
  b=RmkgzMecwAtwW/90DX/b2Bhmy+5aj3NAqt2g0E7QfxFZkvQVDY9UC6dW
   aUl/kHWIPS5HIXRDFDkYjHzYgtlIrzSwrwdWMIVH1BjLol2ro985CAy3s
   hUmBNi8VQThsW7T4zVnOSgifyfDcUufAaM5wNSTV8KJ710CTgk4Tsihj5
   h55Fsroo93uMjgPFoSfcyCpKNhSTXcDRYcXZqsdLeZNS+sKQUJ6giBxA0
   9TOKuulVik14VHmpEpb6nPwDbgIwVunKvAXRr6LIbv4vJP0ozEzkHfWnk
   DPaqL03hhlYz4cuvUmGdWph3JmbzsEV4A7Os9CCilu/Hch7m4je5BFTg5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="321927621"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321927621"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 11:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925851460"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925851460"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 11:02:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcrvx-0008fe-17;
	Thu, 16 Mar 2023 18:02:37 +0000
Date: Fri, 17 Mar 2023 02:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] thermal/drivers/mediatek/lvts_thermal: Register
 thermal zones as hwmon sensors
Message-ID: <202303170104.d4JG4Rmo-lkp@intel.com>
References: <20230315034449.2604197-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315034449.2604197-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_110318_188849_D5CC1D60 
X-CRM114-Status: GOOD (  22.12  )
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

I love your patch! Yet something to improve:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/thermal-drivers-mediatek-lvts_thermal-Register-thermal-zones-as-hwmon-sensors/20230315-114601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20230315034449.2604197-1-wenst%40chromium.org
patch subject: [PATCH RESEND] thermal/drivers/mediatek/lvts_thermal: Register thermal zones as hwmon sensors
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303170104.d4JG4Rmo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f9bbeb9645230bb309c589d8bea6bf066628b44
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chen-Yu-Tsai/thermal-drivers-mediatek-lvts_thermal-Register-thermal-zones-as-hwmon-sensors/20230315-114601
        git checkout 1f9bbeb9645230bb309c589d8bea6bf066628b44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/misc/ drivers/net/mdio/ drivers/pci/controller/ drivers/rtc/ drivers/thermal/mediatek/ drivers/tty/serial/ drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170104.d4JG4Rmo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/mediatek/lvts_thermal.c: In function 'lvts_ctrl_start':
>> drivers/thermal/mediatek/lvts_thermal.c:997:55: error: 'chip' undeclared (first use in this function)
     997 |                 if (devm_thermal_add_hwmon_sysfs(dev, chip->tz_dev))
         |                                                       ^~~~
   drivers/thermal/mediatek/lvts_thermal.c:997:55: note: each undeclared identifier is reported only once for each function it appears in


vim +/chip +997 drivers/thermal/mediatek/lvts_thermal.c

   971	
   972	static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
   973	{
   974		struct lvts_sensor *lvts_sensors = lvts_ctrl->sensors;
   975		struct thermal_zone_device *tz;
   976		u32 sensor_map = 0;
   977		int i;
   978	
   979		for (i = 0; i < lvts_ctrl->num_lvts_sensor; i++) {
   980	
   981			int dt_id = lvts_sensors[i].dt_id;
   982	
   983			tz = devm_thermal_of_zone_register(dev, dt_id, &lvts_sensors[i],
   984							   &lvts_ops);
   985			if (IS_ERR(tz)) {
   986				/*
   987				 * This thermal zone is not described in the
   988				 * device tree. It is not an error from the
   989				 * thermal OF code POV, we just continue.
   990				 */
   991				if (PTR_ERR(tz) == -ENODEV)
   992					continue;
   993	
   994				return PTR_ERR(tz);
   995			}
   996	
 > 997			if (devm_thermal_add_hwmon_sysfs(dev, chip->tz_dev))
   998				dev_warn(dev, "zone %d: Failed to add hwmon sysfs attributes\n", dt_id);
   999	
  1000			/*
  1001			 * The thermal zone pointer will be needed in the
  1002			 * interrupt handler, we store it in the sensor
  1003			 * structure. The thermal domain structure will be
  1004			 * passed to the interrupt handler private data as the
  1005			 * interrupt is shared for all the controller
  1006			 * belonging to the thermal domain.
  1007			 */
  1008			lvts_sensors[i].tz = tz;
  1009	
  1010			/*
  1011			 * This sensor was correctly associated with a thermal
  1012			 * zone, let's set the corresponding bit in the sensor
  1013			 * map, so we can enable the temperature monitoring in
  1014			 * the hardware thermal controller.
  1015			 */
  1016			sensor_map |= BIT(i);
  1017		}
  1018	
  1019		/*
  1020		 * Bits:
  1021		 *      9: Single point access flow
  1022		 *    0-3: Enable sensing point 0-3
  1023		 *
  1024		 * The initialization of the thermal zones give us
  1025		 * which sensor point to enable. If any thermal zone
  1026		 * was not described in the device tree, it won't be
  1027		 * enabled here in the sensor map.
  1028		 */
  1029		writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
  1030	
  1031		return 0;
  1032	}
  1033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

