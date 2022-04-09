Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD56C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWMXffDP7jdE5nTEj05r12CdSSBXcFU0SXpr7xuRqAw=; b=Tf9jyCuPt//pge
	v2mc5VyqtCfanSGrte2cHXAZdeTjwROhzhpkkV/oCTtyb/jPEz2/Xzv3TLmBeR0faMLWwn/hkikcR
	Hg/I3+4IDTokaoEbC4Ucevm4LY1bFZZj6eRd49zEbXdKr9uAKzhTdsRJyhidRyu8W0j4UHX/Acu4C
	FSpl9CRasv245kfDP910WK7RjopBltvAc5uNueQVAQrR8Uzx80ZFcn6O3zJYOCI1Yqr/He2tqzT3n
	X8mkQHj/4Jnw6w00NEugSnDKjhQuPeX3mKFcwF1+xvHs2nzUes9T2rKilHIVoWgMe45K4dpVIoRtk
	Maz4WuXsGNgQKqbl4iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndB1i-003AQO-FX; Sat, 09 Apr 2022 13:21:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndB1f-003AOu-5n; Sat, 09 Apr 2022 13:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649510475; x=1681046475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vfC+nRqScmWArguoYMf/e1ASOBmxDV4xlBHdGwcPDiE=;
 b=a9XPVcVONht4wVWl7jCAmf4lfn5xW/fHV7c3iEUxznwrVTGzRjVKYPTS
 ALBqqjasgpN5u4X3pO/uVz5DhngKdIIRPVdnDDo1NPYvNLmRy23lgOQSI
 mloi40jiMLtkxllFRbIG4lhKC4vSiMznfgulQtKTM7TrZ/iCgh2TAJPTF
 cLF0oKl5zDEU6k/VcfmOM+Axi7YZZ15YZUKByYdKhfNTYZEoGAAwRaR4m
 /3mI/GXx6G0BAk8jMLrhni11wax9ueIc9Qn7/JXxUGws0K3XT+Y3At4uf
 1Cem0nNamrqF6f5EdxCKyCEIsHUkduZDqXaDPGjO9mGxI1UGa0ZVdw8Ex w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="261981490"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="261981490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2022 06:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="622153364"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 09 Apr 2022 06:21:04 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ndB1T-00002H-Ef;
 Sat, 09 Apr 2022 13:21:03 +0000
Date: Sat, 9 Apr 2022 21:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: kbuild-all@lists.01.org, linux-media@vger.kernel.org,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9, 16/17] media: mediatek: vcodec: support stateless VP9
 decoding
Message-ID: <202204092137.3RrpN4Hr-lkp@intel.com>
References: <20220408120240.29571-17-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408120240.29571-17-yunfei.dong@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_062115_254156_D3FBF443 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Yunfei,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.18-rc1 next-20220408]
[cannot apply to remoteproc/rproc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-Add-vdec-enable-disable-hardware-helpers/20220408-210244
base:   git://linuxtv.org/media_tree.git master
config: arm64-randconfig-r015-20220408 (https://download.01.org/0day-ci/archive/20220409/202204092137.3RrpN4Hr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/251c7c77f6690881357df39867a32a03eb7db3b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunfei-Dong/media-mediatek-vcodec-Add-vdec-enable-disable-hardware-helpers/20220408-210244
        git checkout 251c7c77f6690881357df39867a32a03eb7db3b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.o: in function `vdec_vp9_slice_update_prob.isra.0':
>> vdec_vp9_req_lat_if.c:(.text+0x2654): undefined reference to `v4l2_vp9_adapt_noncoef_probs'
   vdec_vp9_req_lat_if.c:(.text+0x2654): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `v4l2_vp9_adapt_noncoef_probs'
>> aarch64-linux-ld: vdec_vp9_req_lat_if.c:(.text+0x26c0): undefined reference to `v4l2_vp9_adapt_coef_probs'
   vdec_vp9_req_lat_if.c:(.text+0x26c0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `v4l2_vp9_adapt_coef_probs'
   aarch64-linux-ld: vdec_vp9_req_lat_if.c:(.text+0x26d8): undefined reference to `v4l2_vp9_adapt_coef_probs'
   vdec_vp9_req_lat_if.c:(.text+0x26d8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `v4l2_vp9_adapt_coef_probs'
   aarch64-linux-ld: vdec_vp9_req_lat_if.c:(.text+0x26f0): undefined reference to `v4l2_vp9_adapt_coef_probs'
   vdec_vp9_req_lat_if.c:(.text+0x26f0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `v4l2_vp9_adapt_coef_probs'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
