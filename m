Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D4DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjEcV0697vI0ZrU5WWsaHps1mR4XP3J6pjksXAlbgQI=; b=h0ogKDwlMFKNPGpjPLfP2JrGac
	913ibP9VUAOpNYWrmmfU9uZha90D/JO/uoQ+YhptdjlmfyXXCM1tupSmPPDycFRhr7rOxkFkwI8pp
	s4+KPx1C/JDSt0HEQ/lg8hOAYNKeD+BYuNiH1aLHmXea6bkt+Sd45P3hZvlZPSyonnUU7tEpkHh3+
	YjBQNbVQWYzrxB3n8EmvHzC205Uy/yvRnRHOlCWhzSTciA1uuGBINIq3ZXC+cBw74YZtBO9Zw3bsI
	zN2JeRUMIuX1ow4BWLVvpzqr2zo/6T11qoXDY4ad4X1WAB6Hw68rqZE+b2OSwp1fV4jupO1Z8/i76
	BfXGY9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pehSo-00DRlM-2Q;
	Tue, 21 Mar 2023 19:16:06 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pehSk-00DRjV-1H;
	Tue, 21 Mar 2023 19:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679426162; x=1710962162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IqD4xidHyUJU/zSXxeaPq4TjqmZevMWxlbR1cEzIV9M=;
  b=XbdB27hIJSwj5yq8IybAy8wc64llM2sy1OcNZiSmufdKZoIvrxvbf1pX
   Ox4xwhaC5c5H63dFdueBuRvbOa/UGN6lTKjjLbM+8HeNG4YrSp1RVDFjX
   xEpqgDV2pC90JgA6h0m+dHyNSCJAKrvv70rHm9bMYlsaYBXMv9LBxfbP8
   t7iq52AJYocvUnwBmhjy/0Nwpi3cWC9XhW9knm1aqMyy7PGO7Taa7iqGc
   0Cq9dkkdp/j08bS9CMuQkQ3KeYY8Y/yJwpwn+OMfaGH8aVkx0H/M2wYz5
   szTxcsYBBf9Wciw9iz8ijWDxIECvG/IotZirBqrJv52294K4CcIgywkGV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340577089"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="340577089"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 12:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631716433"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="631716433"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Mar 2023 12:15:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pehSY-000CKu-1m;
	Tue, 21 Mar 2023 19:15:50 +0000
Date: Wed, 22 Mar 2023 03:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
	shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2
 queue buffer storage
Message-ID: <202303220301.fby6vJcX-lkp@intel.com>
References: <20230321102855.346732-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321102855.346732-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_121602_474578_61978FC9 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Benjamin,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230321102855.346732-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2 queue buffer storage
config: hexagon-randconfig-r015-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220301.fby6vJcX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aab64e29070dfec3a043b5020399f79554d6cae4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
        git checkout aab64e29070dfec3a043b5020399f79554d6cae4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220301.fby6vJcX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:19:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:19:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:19:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/common/videobuf2/videobuf2-core.c:37:1: error: incompatible pointer types returning 'size_t *' (aka 'unsigned int *') from a function with result type 'unsigned long *' [-Werror,-Wincompatible-pointer-types]
   module_param(max_vb_buffer_per_queue, ulong, 0644);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:127:2: note: expanded from macro 'module_param'
           module_param_named(name, name, type, perm)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:150:2: note: expanded from macro 'module_param_named'
           param_check_##type(name, &(value));                                \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:65:1: note: expanded from here
   param_check_ulong
   ^
   include/linux/moduleparam.h:446:36: note: expanded from macro 'param_check_ulong'
   #define param_check_ulong(name, p) __param_check(name, p, unsigned long)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:409:67: note: expanded from macro '__param_check'
           static inline type __always_unused *__check_##name(void) { return(p); }
                                                                            ^~~
   6 warnings and 1 error generated.


vim +37 drivers/media/common/videobuf2/videobuf2-core.c

    36	
  > 37	module_param(max_vb_buffer_per_queue, ulong, 0644);
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

