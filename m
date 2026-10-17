Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63F2CCF2C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2026 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zuwZjSXG/LiZw7lEaTIiZq18hmY1aQIoiJes4iXPBI=; b=foEkuQaez0iofazIxugdE6fllc
	A3qDpkM/l9TD986jIN4CsbfzaURgd4erMwH2TYufDcdPsCifeeVhXNcFqgNB/6SxGtB/5dwnKbi2a
	ZHVf9GQKrzTYlWSVDChDvnnDV1kHYtKk+L9MM8m43+s85HpBxq8caqOZgRS8ztxnnZoCZ7Wl3LeGY
	B1I5i/AI/Ezlg16yuLVaEBEiOA+B6EJaq/kcG0Cj+ULcW2v7+TqAwFiyazVkJ98HfzYAdRbYDd0dQ
	SAGkw+vEBkHkrVns397bAWxG+jW1jvmO6PDxGAl5wmZbls3UQjc3QA4mTCrljJtFmoX1BdjNCkIni
	N4uBYy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5Ky-00000004p6a-2Ozq;
	Sat, 17 Oct 2026 14:24:40 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5Ku-00000004p5u-31ym;
	Sat, 17 Oct 2026 14:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792247077; x=1823783077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QbHfjeIGKiQU338q0g8Oeylgixw3zvUk+tNkDLgIDxc=;
  b=AbPIZaLYS6jNuT8zSgDtNqDpMZRokBBKDK5YuTFDJUo5sE+/qYjDB0jk
   lSYQHY5VOshyXJDmL9JgRB1NX4GamQIqQth3yIfRSEhi78tOZDlmnA7Bj
   A7bgGfgP0awapfkpZwSDD7Kkt16tM9gCACMdo2ofcGNRFQw2cKTYB+dbo
   BI9K/9vy3GQRaFf0dMfQNdaEPnrGcxCbhkI57y5AuD5HFmutWPwGXw3bV
   76+dTelMFSE/uu9g2Zw4CA8zWBfBgJ7YJbo1ovvv1GTa2JhOLRJTNlcHH
   xq+xVCSTG+qKeWOX5lajrFDaJqN3D9KbEhi6TYzJecaurohI+8QfgW0IE
   w==;
X-CSE-ConnectionGUID: dchz8LlxSO61AKBvTgGI8w==
X-CSE-MsgGUID: r27xaSBgSsSF16aFBYgQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="906141"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="906141"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 07:24:35 -0700
X-CSE-ConnectionGUID: HOZEW8DFQk2gJA2zyd7wTA==
X-CSE-MsgGUID: haglIp14ROaLRtm+xsBwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3935055"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 17 Oct 2026 07:24:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI5Km-00000000JPy-32zq;
	Sat, 17 Oct 2026 14:24:28 +0000
Date: Sat, 17 Oct 2026 22:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <202610172234.PyocmhiR-lkp@intel.com>
References: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_072436_777081_29EFB026 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0fcb05b72344f40806cbe810de8872f1698bf053]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-connector-Add-DP-AltMode-VDO-definitions/20261014-233149
base:   0fcb05b72344f40806cbe810de8872f1698bf053
patch link:    https://lore.kernel.org/r/20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3%40collabora.com
patch subject: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
config: arm64-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261017/202610172234.PyocmhiR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172234.PyocmhiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172234.PyocmhiR-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:600.25-45 Unexpected 'USB_DISPLAYPORT_SVID'
>> FATAL ERROR: Syntax error parsing input tree
--
   Lexical error: arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:530.24-44 Unexpected 'USB_DISPLAYPORT_SVID'
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

