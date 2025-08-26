Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543BAC8303F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRsAtwsynj4bwQxFU1Sv98ztyYKIueHeSlIFYiuDoLM=; b=VOzXSd3IRsWSa0nomuhuLDM23f
	EzH2mdCv7kl7MwmvAPexiQrfuyxcmTqt1fjvoO1razblUJiOPnVDGWDXkuoqb6V/uqbDn5vr8V0hV
	pLB1rUKV9gs5yO4pzzNAfbvIv8qrjJ5Wtx/igDB4g6yU8zswuj65cCK9Dx+D0i4ulUA27PWFVdqIV
	/M5GQCncRUqetbJeIOAL7C7M1fH5Pn46tYXQ6cBTE8Nzv16dfqzGu/FyRBejAzzy2WBKFbULhTU3w
	w698aMHu3LtD6Tb/7HTpojUD3/CibtP5E35XNgrYWG0Sge8fGNQ98wtk+J9cyzESiCwZDW1x4CwzA
	LUXv2UWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjlO-0000000AOIA-3n4D;
	Tue, 26 Aug 2025 02:50:22 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjil-0000000AO0E-2QrY;
	Tue, 26 Aug 2025 02:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756176459; x=1787712459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wm/2S21Pg6Nmoyskp843r48HknqB72yRjYDtSbAC9eI=;
  b=LjbGjDUqt2vaVD2V7Ok4h/uK2qaDZc7urERADfrPXGlACG9t0RtqOXqu
   UvqaJr0RpaL4xgk/aox78GMtadydhgNffx4EpmdOLhxRGBMNHg0nUuKyV
   3420/akuZby9KIwEeta//Upu8W2HndvtbeY+wfepOa/OjHHfEuUCvzlMU
   xHq1FBwlcMYlnoh1NsWE3DwkxRT1gDv3MnxXvUvboNrzSIFxhT2vu+QeR
   5KX7R07xzJScgyeWNXrr2uCCna+UwxMhdcZ78TGdS/Do786Ep9GTQrzxw
   aPM3ZxiFlK1Zs02LyRvCMxTiRxnKgMkU/BJNARa5pBQLEIEOyxes6rVNp
   Q==;
X-CSE-ConnectionGUID: oJeaQtnzRLWx5izaQ7pvWQ==
X-CSE-MsgGUID: zaBLKdVjQ8KxClARoTVRPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58467745"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58467745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 19:47:37 -0700
X-CSE-ConnectionGUID: olyZ81apQuaoegO1K0ddNw==
X-CSE-MsgGUID: gZmNKNo5SPmhtImu+Ik1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173760513"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Aug 2025 19:47:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqjic-000OB9-1g;
	Tue, 26 Aug 2025 02:47:30 +0000
Date: Tue, 26 Aug 2025 10:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Darren.Ye" <darren.ye@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH v7 09/10] ASoC: mediatek: mt8196: add machine driver with
 nau8825
Message-ID: <202508261004.7adPXk4m-lkp@intel.com>
References: <20250822125301.12333-10-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822125301.12333-10-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_194739_661824_51EAE977 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Darren.Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.17-rc3 next-20250825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250822-210108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250822125301.12333-10-darren.ye%40mediatek.com
patch subject: [PATCH v7 09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
config: arm64-randconfig-r131-20250826 (https://download.01.org/0day-ci/archive/20250826/202508261004.7adPXk4m-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508261004.7adPXk4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261004.7adPXk4m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8196/mt8196-nau8825.c:183:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int to @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:183:33: sparse:     expected unsigned int to
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:183:33: sparse:     got restricted snd_pcm_format_t [usertype]

vim +183 sound/soc/mediatek/mt8196/mt8196-nau8825.c

   175	
   176	static int mt8196_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
   177					  struct snd_pcm_hw_params *params)
   178	{
   179		dev_info(rtd->dev, "fix format to 32bit\n");
   180	
   181		/* fix BE i2s format to 32bit, clean param mask first */
   182		snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 > 183				     0, SNDRV_PCM_FORMAT_LAST);
   184	
   185		params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
   186		return 0;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

