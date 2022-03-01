Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A51C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3pFM88yCE3BZwfDFIw2gJSfp4QK66/LSMlFCVwzsl0=; b=xI53CFF8aYk45h
	9JWlWqrkgXsElGFFRLASx0PLAdPM0NiGfGlj/i3XUBUqYbf01QswqpGPQlgVZiqWV5WtmF6xONpLW
	OWprZ/IDZ9dCqq/Tj8OgTILxbw3ctByFdXObu9zsDL9guNbgUzJjNVvyubWEOFknrIjb14yEMUyNX
	RI6lRojpvLitrVrEruxx02BqTEARTwTXvCPCdZGBe25J6Qej23+fkbCE5MbJWPrEhRrkMNw200OWw
	BWgUQwkEtLBPOFzhH07NcGDq+8QfbJGf/J1B92LzdGoed5A27dXTeOQou6g9W9oziXPzSHXQb+6c6
	cW35eUrC9ji4i3/f7MtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9LQ-000VNx-2O; Tue, 01 Mar 2022 20:43:40 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9LE-000VKu-Bf; Tue, 01 Mar 2022 20:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646167408; x=1677703408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j8hCtzK8/yGigjiI1ZMUVHJkmYhuD4SpFKIZnvhuUqs=;
 b=NxCNVtkUIa3tp9nMMhnNY9rAm9BJz8GkOiniZp8u5rRWCq1RqCgVYRTn
 4ak08Y2GCg85RGffd0sHU5j5lRlKMHIn7ubEcP6Iau4adLGNzHdim8oqO
 7McpgX762OSGGybzUJp6kJY0usF0TBGCG7mYVTrSj1ZENlhePVgOoVrEW
 YCrJeHJHxEIop78MgdRuI/HpDKnELTMZEZz+HpGXq88n11nIk2rQRoZTl
 xk/LM/gRw5opd2Ksx6JMgi5CFpYfSU18cRSff1BTx/S9oDaoGFXWV8Mn6
 OHDkITdmOkKz4HF20Vt6fVoNrRP7B4GNSHN24idsWqI8mza37woWVr3co A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236746229"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="236746229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 12:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="641414066"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 01 Mar 2022 12:43:24 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nP9L9-0000zh-Bc; Tue, 01 Mar 2022 20:43:23 +0000
Date: Wed, 2 Mar 2022 04:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
Cc: kbuild-all@lists.01.org, perex@perex.cz, matthias.bgg@gmail.com,
 trevor.wu@mediatek.com, tzungbi@google.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: bt-sco: fix bt-sco-pcm-wb dai widget don't connect
 to the endpoint
Message-ID: <202203020422.oME8VbcM-lkp@intel.com>
References: <20220301171137.27442-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220301171137.27442-1-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_124328_488667_E9593D38 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jiaxin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.17-rc6 next-20220301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiaxin-Yu/ASoC-bt-sco-fix-bt-sco-pcm-wb-dai-widget-don-t-connect-to-the-endpoint/20220302-011344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm-randconfig-r014-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020422.oME8VbcM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/de4d22036c32b5b4be162ace0b3ce74c193c43c0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiaxin-Yu/ASoC-bt-sco-fix-bt-sco-pcm-wb-dai-widget-don-t-connect-to-the-endpoint/20220302-011344
        git checkout de4d22036c32b5b4be162ace0b3ce74c193c43c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/codecs/bt-sco.c:26:1: error: expected identifier or '(' before '}' token
      26 | };
         | ^


vim +26 sound/soc/codecs/bt-sco.c

5195ca4902fe0b Mark Brown 2013-08-19  21  
5195ca4902fe0b Mark Brown 2013-08-19  22  static const struct snd_soc_dapm_route bt_sco_routes[] = {
de4d22036c32b5 Jiaxin Yu  2022-03-02  23  	{ "BT_SCO_TX", NULL, "RX" },
de4d22036c32b5 Jiaxin Yu  2022-03-02  24  	{ "TX", NULL, "BT_SCO_RX" },
de4d22036c32b5 Jiaxin Yu  2022-03-02  25  };
5195ca4902fe0b Mark Brown 2013-08-19 @26  };
5195ca4902fe0b Mark Brown 2013-08-19  27  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
