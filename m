Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E35FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2XjVG6ySHVgMjmM4Xm0BMtxbtj/sVav5rfca/D19wE=; b=2573bOs72jUolsck9vNZV9Udzn
	ls2wx773C0oGe9owpUauiGoypPVOOidjV1d0x6oRMZ0TCVrO2XwlYRig2q41dpHoXmfP0gS9sC02H
	bEkZNn5JvQZJ0W7P1XP2StEQiQ2Qkum6t3vD5LGHPxrM/Mv9bDtrDB7neFP0sLS7DkdKrMXiSyAbB
	P46Obn0JjHIxRXopaB3xQ9ofOSiOHadYK8zrbSge/uNSlA9h0KuQvQaQxV/ejcAvSIcKxI8Mt0PFj
	MVFa41ePJ9Um3ucF+8/DK61M+VQRMkZOnZr0CTo4CbL3ZJMhhzDk/FymmFcXbR66E1vrXK+sqK+Lv
	PmK/DXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXex-0013CJ-V7; Fri, 23 Sep 2022 01:39:20 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXcf-0012Px-QO; Fri, 23 Sep 2022 01:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663897017; x=1695433017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WZdTk9T1PthgIdg0kjCHkHEqJf2vaI7cgaqZMy5Jl2E=;
  b=ONl3zFP6U8MDl0kHCSzZCtzabdszkohEHCieAVWwt6em4PsmFafHnqe9
   sy1e2b7SIpAuuHweabvXMVnv1x/+lQJZtm4n1KGLS2if9BLmEiG6E1AYp
   WlswvAxN0hFGlHxLHBp7Lxb3iUt9nmDCpQYhz9ZcNU76EcCMVSBRVEEvJ
   c7dYEBdd5LwgbdFmVl5gkcgBrWOogPze6IdmWtvWs2Zu5ym9xfNjA9c0k
   fhGgqBm+DkewwP7s1NbH7xvKYZa6hS5SYx9eL67/ajnHDMnP7b8pU7Nh1
   hgZ+zOO5Kx0gOIfjJAZLTsrXR6MIbcI50MEZhiSj7a0lyVb2f8oUQLuGt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="299205319"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="299205319"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 18:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="688545613"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2022 18:36:51 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obXcY-00059w-2U;
	Fri, 23 Sep 2022 01:36:50 +0000
Date: Fri, 23 Sep 2022 09:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, sboyd@kernel.org,
	mturquette@baylibre.com, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	runyang.chen@mediatek.com, miles.chen@mediatek.com,
	wenst@chromium.org, angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH] reset: mediatek: Move mediatek system clock reset to
 reset folder
Message-ID: <202209230910.DSbTCgBL-lkp@intel.com>
References: <20220922141107.10203-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922141107.10203-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_183657_923352_3EFFC604 
X-CRM114-Status: GOOD (  15.49  )
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

Hi Bo-Chen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.0-rc6]
[also build test WARNING on linus/master]
[cannot apply to clk/clk-next pza/reset/next mbgg-mediatek/for-next next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Chen-Chen/reset-mediatek-Move-mediatek-system-clock-reset-to-reset-folder/20220922-221303
base:    521a547ced6477c54b4b0cc206000406c221b4d6
config: s390-randconfig-r044-20220922 (https://download.01.org/0day-ci/archive/20220923/202209230910.DSbTCgBL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/69ce72445492a02115b1e7c7527a8a107f48aab8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bo-Chen-Chen/reset-mediatek-Move-mediatek-system-clock-reset-to-reset-folder/20220922-221303
        git checkout 69ce72445492a02115b1e7c7527a8a107f48aab8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/reset/reset-mediatek-sysclk.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/reset/reset-mediatek-sysclk.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/reset/reset-mediatek-sysclk.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/reset/reset-mediatek-sysclk.c:539:5: warning: no previous prototype for function 'mtk_reset_init_with_node' [-Wmissing-prototypes]
   int mtk_reset_init_with_node(struct device_node *np, const char *name)
       ^
   drivers/reset/reset-mediatek-sysclk.c:539:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mtk_reset_init_with_node(struct device_node *np, const char *name)
   ^
   static 
>> drivers/reset/reset-mediatek-sysclk.c:550:6: warning: no previous prototype for function 'mtk_rst_remove_with_node' [-Wmissing-prototypes]
   void mtk_rst_remove_with_node(struct device_node *np, const char *name)
        ^
   drivers/reset/reset-mediatek-sysclk.c:550:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mtk_rst_remove_with_node(struct device_node *np, const char *name)
   ^
   static 
   14 warnings generated.


vim +/mtk_reset_init_with_node +539 drivers/reset/reset-mediatek-sysclk.c

   538	
 > 539	int mtk_reset_init_with_node(struct device_node *np, const char *name)
   540	{
   541		struct mtk_clk_rst_data *data = find_rst_data(name);
   542	
   543		if (!np || !data)
   544			return -EINVAL;
   545	
   546		return register_rst_ctrl_with_node(np, data);
   547	}
   548	EXPORT_SYMBOL_GPL(mtk_reset_init_with_node);
   549	
 > 550	void mtk_rst_remove_with_node(struct device_node *np, const char *name)
   551	{
   552		struct mtk_clk_rst_data *data = find_rst_data(name);
   553	
   554		if (!np || !data)
   555			return;
   556	
   557		reset_controller_unregister(&data->rcdev);
   558	}
   559	EXPORT_SYMBOL_GPL(mtk_rst_remove_with_node);
   560	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

