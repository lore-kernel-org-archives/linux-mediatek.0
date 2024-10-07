Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8D1CFB444
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHxkw5M0P+9/bvF/qu4yfF7J5CkP0w3gN3dg8dEP5rc=; b=M2uSunwKVY9NBAHfCzZ9miEjFS
	YXYpbnoLnCjZyJxLYHxJcrfvpUjqSJVLw2v4MttaxO4vpgfhqNtB3qqu6TW/435HSmav0XFmmIZsA
	AEHQnNpbczSHVjV8thK+xVrDKr/TtK+vSPuzSqnNI3gez3Qj4H2nTVQG/JcC2lHnVvkS/1K3zp1dh
	zhaVBpHcsfZSGTTpzaM351I0hL5OL44lDNm4oUxeLhE+nYF41hoZ2Y8rpLiotb5G9WgRPo4/nyYzw
	A2Oc8PgI9pPiQdMhxO+K7mFNudbRb5fmo1Tzc8lE0KsoWjoxdpF8PH//rS/NGHSJxTeBxzQ8+t9DJ
	+HkiiPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhRI-00000001TPX-0lB1;
	Mon, 07 Oct 2024 06:41:52 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhP8-00000001T7z-2hjA;
	Mon, 07 Oct 2024 06:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728283179; x=1759819179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J3HVUIzHysZ+CBLRfP6nsdLyZgxcaxzOvunnSv25fYU=;
  b=nEitCoZlh0gyDKZl+tIWmA2ZBJzLbQwB1bRLDgIi/O7EabIZdxQqB7Fc
   3Zd11OJbeJw0NvL9YNJ4xaw87ekDVOUQRqu0uh+EbPn3yZokrklStjYib
   uQY0zVNtEQDcANabExQCRwotlwgJ6oS6vtCPoJu6TsGnsT1V/YCYQaC0Y
   3wwU3G4dG0M9SewkAQCmlyxHXK152GG2iVDlA2cJxzxleDNKyyt06n0sl
   h3+tpSrTIKYx+WvnMt+0NuPjeWLrUXCwNSkTOPxzPgW27QY/W3gUPzaXh
   nkUqGNhWLCMy54JIhd7A2jgCWqZuCdvRNbiWpjiX28nyCYLdpqkx92oXu
   Q==;
X-CSE-ConnectionGUID: 8RS6+aa5Sy2cGmVN58lj5g==
X-CSE-MsgGUID: /DMhTvU0SAKYl62xRPTv7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38024636"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="38024636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 23:39:38 -0700
X-CSE-ConnectionGUID: 7Rdu86XgRF+3MPNbIJd2MA==
X-CSE-MsgGUID: U1TG4f4MSu2dKuZ9VW03mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80202508"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2024 23:39:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxhP1-0004gE-0m;
	Mon, 07 Oct 2024 06:39:31 +0000
Date: Mon, 7 Oct 2024 14:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH net-next 1/9] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <202410071426.fet54A5E-lkp@intel.com>
References: <20241004102413.5838-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102413.5838-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_233938_745963_7FB82736 
X-CRM114-Status: UNSURE (   9.75  )
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

Hi Sky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20241004-183507
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241004102413.5838-2-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next 1/9] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
config: i386-kismet-CONFIG_NVMEM_MTK_EFUSE-CONFIG_MEDIATEK_GE_SOC_PHY-0-0 (https://download.01.org/0day-ci/archive/20241007/202410071426.fet54A5E-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241007/202410071426.fet54A5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071426.fet54A5E-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NVMEM_MTK_EFUSE when selected by MEDIATEK_GE_SOC_PHY
   WARNING: unmet direct dependencies detected for NVMEM_MTK_EFUSE
     Depends on [n]: NVMEM [=n] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
     Selected by [y]:
     - MEDIATEK_GE_SOC_PHY [=y] && NETDEVICES [=y] && PHYLIB [=y] && (ARM64 && ARCH_MEDIATEK || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

