Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1666DC47258
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jan 2024 04:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypfJmtkprT3ahLhk509fiLk8YbgAKdubzWgYgut60iA=; b=ys3F7luKAi/r1FXo7PEvjHxboK
	1LmtqkDl9SPveEjUyG9rjSgxiN7EpihjearXY5DeHQ+40muVJ9VZDGSUhy4izv9LJCoqCi95wB+Ig
	FRJTNggp42rk0fR3crPGMPm5TVuZ5CEL3XqJqFilNFutEgJt96MMNPx+RF+6SdJcexkiVZeggn/t/
	hfG7WrMkSFXi4C+PZGFAMLIGiP/kxFHXFv1tywqaQ5cuiF0LGOS2atb4CbooTg5XENspijC4J1Ch9
	jd4JWD6Jz9GxOqWDGIA3a0pixzuRywSs5zI6Dd5cUI/DkmzfreL6LGvWJ8zeG+oZH1z2jHgOg5H+2
	MZ7LXFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR3MR-007Dat-37;
	Sat, 20 Jan 2024 04:53:39 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR3MO-007DaG-0T;
	Sat, 20 Jan 2024 04:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705726416; x=1737262416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ORrLc+xjKGUPxA9uxulNGeyU1mju4Nwt8QJoJJN3VpY=;
  b=iH7DVHvwN2+IRvXQP1Sx0o8lYD5sHYfETRJVw0NWPqrSd9xywwjZcif1
   wKpCaDvZTeWey+wDubOni9SjMqfwSZ0chwlMit5+Ta4dDrORWp6rVohH9
   95dAAc1cmgHkbK9Z4Itm5Qavkp1hZWwH/RCEgvBzTS3W+8qSvIE/fGE7L
   3/W6arVPmBFKCAnO0E+YdszHuqoqIYDazBJ3663hvKLdUfdXea2/ZIZ52
   c+jN39yQilOGA7aT+xD6k9b7/Gb0xcbfmJmgVIlyKrUpw7kR9TONV/g1j
   7CflPvwpzysjHWvuu2/Pb6AutE/fAuXf6/xCn75JGlLGFLuwsceDXn+Zu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="821000"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="821000"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928558440"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="928558440"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2024 20:53:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR3MC-0004lG-2d;
	Sat, 20 Jan 2024 04:53:24 +0000
Date: Sat, 20 Jan 2024 12:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
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
Message-ID: <202401201228.eFyUxBzW-lkp@intel.com>
References: <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_205336_293637_99BCD0B9 
X-CRM114-Status: GOOD (  13.95  )
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401201228.eFyUxBzW-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201228.eFyUxBzW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201228.eFyUxBzW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/mux/it5205.c:278:25: error: use of undeclared identifier 'it5205_match_table'; did you mean 'it5205_of_table'?
     278 | MODULE_DEVICE_TABLE(of, it5205_match_table);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         it5205_of_table
   include/linux/module.h:244:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^
   drivers/usb/typec/mux/it5205.c:274:34: note: 'it5205_of_table' declared here
     274 | static const struct of_device_id it5205_of_table[] = {
         |                                  ^
   1 error generated.


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

