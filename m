Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D154FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRX3modhZzddJ3x4ad0CNl/Nh7spAOjd+TFz/FdhIjU=; b=WoeBAy50a/X2bSAbGhbqhMoEQR
	GSOu5dDptaPeuTnqPD00y5FkmDOgSYGrkbiE58EVZVHnhO6wBx57PZ13Ro6NMqUsJJv9dPshPkAr4
	VOGluGqNtdoDN0lIWoFXLN1BC7HEykXgwZaCxYkYrtyF5i3rdl64ELr1tHgWFaPiQ8q3Rb5XuXCJ7
	Ku5K9sRz3/20m9MBq5NIMPTUZcPvdllUavzsOLL8Xmf4RmysAKsu7GP6sV1vNn/F4c75G/fRq0msR
	HthFvi3mLQ9fIxM7whIXO0gF7fuu0dCR79RTG/xoHtDF93MqodPw3Z/WxMKOe7kYITuXoC9PuMUy1
	O6q6hoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93uw-009r5B-Ca; Wed, 06 Jul 2022 12:14:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93uj-009qy2-Fv; Wed, 06 Jul 2022 12:13:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 074D8660199B;
	Wed,  6 Jul 2022 13:13:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657109627;
	bh=2t6an7ht5+yC7+PkXcKGyRHYvhD0KwqrgG+sCGpknV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I7+pJxvj8QKrPt8AqHOdoMj/JaWxoFIsBuu34K1/BPeWknPODXtmKVCf0/fFutsn5
	 +CND8+23+VmYTE15beI3VZ/Y4GBp2YjFPEdQI32d+2DcGak2oGSr2wI6r3DbHpqjhG
	 5Q3budolLZYAIiT663I+VPqnA2vtKSXDNxgqHamjouwLLTyr8Gtfmv592KNWkna+Cj
	 giA6RjDeX1YIH2l97eiJrOdnrot+QKDJOFv5AYRLB1odmVkdBC0rAfK2M77QJCo6hf
	 h+gscEkJCL6+hXqmC1HXaI+JP0GXkczmF0MGd2HX2MFGLSFqi5gNtOOFs097nBxLzr
	 FgNj3gcjln8Mw==
Message-ID: <4e55465d-ccf1-56b0-dfa4-84832edfa937@collabora.com>
Date: Wed, 6 Jul 2022 14:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND] Input: mtk-pmic-keys - Add support for MT6331
 PMIC keys
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, dmitry.torokhov@gmail.com
Cc: kbuild-all@lists.01.org, matthias.bgg@gmail.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
 <202207061915.tYTQKEhu-lkp@intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202207061915.tYTQKEhu-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_051353_806455_90056934 
X-CRM114-Status: GOOD (  15.78  )
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

Il 06/07/22 13:44, kernel test robot ha scritto:
> Hi AngeloGioacchino,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on dtor-input/next]
> [also build test ERROR on linus/master v5.19-rc5 next-20220705]


This patch compiles fine on next-20220706.


> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/Input-mtk-pmic-keys-Add-support-for-MT6331-PMIC-keys/20220706-181323
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> config: arc-randconfig-r043-20220703 (https://download.01.org/0day-ci/archive/20220706/202207061915.tYTQKEhu-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/5e286347fa7c13c4674f97ed475e4f42a49ce5b4
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/Input-mtk-pmic-keys-Add-support-for-MT6331-PMIC-keys/20220706-181323
>          git checkout 5e286347fa7c13c4674f97ed475e4f42a49ce5b4
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/input/keyboard/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/input/keyboard/mtk-pmic-keys.c:12:10: fatal error: linux/mfd/mt6331/registers.h: No such file or directory
>        12 | #include <linux/mfd/mt6331/registers.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     compilation terminated.
> 
> 
> vim +12 drivers/input/keyboard/mtk-pmic-keys.c
> 
>    > 12	#include <linux/mfd/mt6331/registers.h>
>      13	#include <linux/mfd/mt6358/registers.h>
>      14	#include <linux/mfd/mt6397/core.h>
>      15	#include <linux/mfd/mt6397/registers.h>
>      16	#include <linux/module.h>
>      17	#include <linux/of_device.h>
>      18	#include <linux/of.h>
>      19	#include <linux/platform_device.h>
>      20	#include <linux/regmap.h>
>      21	
> 


