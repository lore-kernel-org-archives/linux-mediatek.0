Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A9FC0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDs9dtNwVIFMbEBHBv0X/uudXfMp69i9nlIn9ZujUZ4=; b=R1fv9WmAguIjTyjOxClvLhzDu8
	s1rLHmi12JJ/YcANC+4RTabyCaW8v1DHHznQo3QjBWNCwugPX3ySeMyblJ/59PdJo5usu8X5MUcZ7
	F+kkuZzvw4N5ThwNVtIgRMr6YaE91gWLjnq3VJiwKhbXJZMcx2OGqRA2OoCdjliY+929shUWgwB/J
	ZA17ad4dT8RVS2ZNQIuYrsnaABGDerBXsyOpl+oI/FhYZbHiDCx0G5OhGQVHXlAAIww1emaNa62EU
	d/3vo9v3nh6peKHO4+mmWtNdXqnC/VwI5l5pbYDntl/iXzmFWmYMxFR/M9JlZpJiW35/3NJFM7HHv
	xtfn5imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPldP-007rOI-0w;
	Sat, 29 Jul 2023 15:13:35 +0000
Received: from [134.134.136.24] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPldL-007rN8-12;
	Sat, 29 Jul 2023 15:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690643611; x=1722179611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qYNctRq7UP223cDLMDHpgil/19stlw90kyEgzmhtG2A=;
  b=CBCG6nHO519nznfDFTFMIxPgYncwFJ6EPoUclwPq/EIVAp52+dB/3z97
   I6RmOhZxE0xSFtU9leTf5BEY6UfcH4UUZ+b/z0GWM9nVBIxy4L9aS8y3k
   HwcbtBEkig/aLwL30j8yJ8zRNUZS4s5fCOBTAkamzAH4hQRvz4XWdYpnq
   +FZrQpoup7d8wY/f0wtZzEsATTRe0EyP2XF1W60wqrC6T9uOr57BdAxRX
   Wq8e2zod61fZtFYrOWtap23lrFCOysTsmzketBLUL28NQmm8sk6YKRBSe
   +Ex5mySIwWT2LE7smfX6kmh59ipcSvKDMvz2SDNDxZxr1kqLUMtERs66d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="371468534"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="371468534"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 08:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="727758995"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="727758995"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2023 08:13:20 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPld9-00046l-0a;
	Sat, 29 Jul 2023 15:13:19 +0000
Date: Sat, 29 Jul 2023 23:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: support per-flow
 accounting on MT7988
Message-ID: <202307292316.uxGTiSPC-lkp@intel.com>
References: <801c89963e95e5ce8f1ab7dbda894dd9da0125cc.1690638748.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <801c89963e95e5ce8f1ab7dbda894dd9da0125cc.1690638748.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_081331_438369_D64DE76D 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-support-per-flow-accounting-on-MT7988/20230729-215634
base:   net-next/main
patch link:    https://lore.kernel.org/r/801c89963e95e5ce8f1ab7dbda894dd9da0125cc.1690638748.git.daniel%40makrotopia.org
patch subject: [PATCH net-next] net: ethernet: mtk_eth_soc: support per-flow accounting on MT7988
config: hexagon-randconfig-r023-20230729 (https://download.01.org/0day-ci/archive/20230729/202307292316.uxGTiSPC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307292316.uxGTiSPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307292316.uxGTiSPC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_ppe.c:5:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/mediatek/mtk_ppe.c:5:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/mediatek/mtk_ppe.c:5:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/ethernet/mediatek/mtk_ppe.c:112:3: error: use of undeclared identifier 'bytes_cnt_low'; did you mean 'byte_cnt_low'?
     112 |                 bytes_cnt_low = cnt_r0;
         |                 ^~~~~~~~~~~~~
         |                 byte_cnt_low
   drivers/net/ethernet/mediatek/mtk_ppe.c:95:6: note: 'byte_cnt_low' declared here
      95 |         u32 byte_cnt_low, byte_cnt_high, pkt_cnt_low, pkt_cnt_high;
         |             ^
>> drivers/net/ethernet/mediatek/mtk_ppe.c:113:3: error: use of undeclared identifier 'bytes_cnt_high'; did you mean 'byte_cnt_high'?
     113 |                 bytes_cnt_high = cnt_r1;
         |                 ^~~~~~~~~~~~~~
         |                 byte_cnt_high
   drivers/net/ethernet/mediatek/mtk_ppe.c:95:20: note: 'byte_cnt_high' declared here
      95 |         u32 byte_cnt_low, byte_cnt_high, pkt_cnt_low, pkt_cnt_high;
         |                           ^
   6 warnings and 2 errors generated.


vim +112 drivers/net/ethernet/mediatek/mtk_ppe.c

    92	
    93	static int mtk_mib_entry_read(struct mtk_ppe *ppe, u16 index, u64 *bytes, u64 *packets)
    94	{
    95		u32 byte_cnt_low, byte_cnt_high, pkt_cnt_low, pkt_cnt_high;
    96		u32 val, cnt_r0, cnt_r1, cnt_r2;
    97		int ret;
    98	
    99		val = FIELD_PREP(MTK_PPE_MIB_SER_CR_ADDR, index) | MTK_PPE_MIB_SER_CR_ST;
   100		ppe_w32(ppe, MTK_PPE_MIB_SER_CR, val);
   101	
   102		ret = mtk_ppe_mib_wait_busy(ppe);
   103		if (ret)
   104			return ret;
   105	
   106		cnt_r0 = readl(ppe->base + MTK_PPE_MIB_SER_R0);
   107		cnt_r1 = readl(ppe->base + MTK_PPE_MIB_SER_R1);
   108		cnt_r2 = readl(ppe->base + MTK_PPE_MIB_SER_R2);
   109	
   110		if (mtk_is_netsys_v3_or_greater(ppe->eth)) {
   111			/* 64 bit for each counter */
 > 112			bytes_cnt_low = cnt_r0;
 > 113			bytes_cnt_high = cnt_r1;
   114			pkt_cnt_low = cnt_r2;
   115			pkt_cnt_high = readl(ppe->base + MTK_PPE_MIB_SER_R3);
   116		} else {
   117			/* 48 bit for each counter */
   118			byte_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R0_BYTE_CNT_LOW, cnt_r0);
   119			byte_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R1_BYTE_CNT_HIGH, cnt_r1);
   120			pkt_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R1_PKT_CNT_LOW, cnt_r1);
   121			pkt_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH, cnt_r2);
   122		}
   123	
   124		*bytes = ((u64)byte_cnt_high << 32) | byte_cnt_low;
   125		*packets = (pkt_cnt_high << 16) | pkt_cnt_low;
   126	
   127		return 0;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

