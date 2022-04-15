Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E866FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6TddHnnCoucX2+MYigLZeyUMVyoVp+LljXXlme18bs=; b=yXBWf9DzGeQ2Rf
	g8aioqojojkYoWadzKealPu3nvrCej653TMJoZlEIg/SxU9ho4RKNBpGL1RrzheJcgoaM/LNq/Mla
	egg/6QPJAh3s6+VAye1rkzQtFSo8Ac1fNY3lAbsaaNp8MwrBFQjp6vPiyJQZk+kiU+YQpppEMOPHt
	5fqByHuJc8n1L8Km5ybSoxmZjNqQkF1h8aCPkUST5NLVS4LAJUiBUmR8KERZg4cgNO7Mv6goLlxmS
	FPxk/2/8Kbk8KlGaWe6ICULARp7ysZTgQHQLO5E/BMx3AXdbZPb+q0Awd7rFnPuMWCW+CJzXSGlcO
	erYncqn6NYOPnjo8xVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFcC-0093PQ-8v; Fri, 15 Apr 2022 06:39:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFRG-008zUK-Uf; Fri, 15 Apr 2022 06:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=J2J9oeKzAxQyH0WKEio0HwZ1qMqT2kMCTdg8oJov24g=; b=rRKghdACwfeFA2q0moKDGfIKzS
 gKsDUAOUfGlPJFeLVSZaYJrrCaijY5WsHy6posm4LkxMX4N/H+aFuvOSdEP/WcYMrO9O8KWMO04Xx
 p4hqC3ghc9oEN4B2ZbMxWcc2nc6/yxFWLXXVnGmGfKHnVKubCaSifLU7LzRaauvErpyJK5GIkfnme
 fKsfe1cApFB9TAIEzDCP0NpiEsHNqCq1sXPMz/DPaho3gC3HuZKEaBgnWCZTw60H580MdnJv8zLlH
 8FLrfnny3sTPOlcbKKmCo7nIdwIBjzCEr6zh7FqEqJVdrjcj8X/3p9MLq5FSr0KO+VK/Z2BC4XGeL
 iyW6vKbg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFRB-005IPe-Lv; Fri, 15 Apr 2022 06:28:13 +0000
X-UUID: 2e28907866a04355a0faac071bc8a912-20220414
X-UUID: 2e28907866a04355a0faac071bc8a912-20220414
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1307666240; Thu, 14 Apr 2022 23:27:55 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 23:27:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 14:27:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 14:27:44 +0800
Message-ID: <48380a5b06ce48c4538e6c89bc6399ba1f425718.camel@mediatek.com>
Subject: Re: [PATCH v18 07/10] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <moudy.ho@mediatek.com>,
 <kbuild-all@lists.01.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David Airlie" <airlied@linux.ie>, <singo.chang@mediatek.com>,
 <llvm@lists.linux.dev>, <roy-cw.yeh@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, <nancy.lin@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Fri, 15 Apr 2022 14:27:44 +0800
In-Reply-To: <202204142333.qXgcGMI1-lkp@intel.com>
References: <20220412103114.19922-8-jason-jh.lin@mediatek.com>
 <202204142333.qXgcGMI1-lkp@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_072810_417332_26F8FEF3 
X-CRM114-Status: GOOD (  21.98  )
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

Hi "kernel test robot",

Thanks for the reviews.

On Thu, 2022-04-14 at 23:31 +0800, kernel test robot wrote:
> Hi "jason-jh.lin",
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on drm/drm-next]
> [also build test WARNING on robh/for-next krzk/for-next linus/master
> v5.18-rc2 next-20220414]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> 
https://urldefense.com/v3/__https://git-scm.com/docs/git-format-patch__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaGS9DHJM$
>  ]
> 
> url:    
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaP5NY9rw$
>  
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: arm64-buildonly-randconfig-r001-20220413 (
> https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20220414/202204142333.qXgcGMI1-lkp@intel.com/config__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaMatHhNq$
>  )
> compiler: clang version 15.0.0 (
> https://urldefense.com/v3/__https://github.com/llvm/llvm-project__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaED4pz5K$
> $  6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
> reproduce (this is a W=1 build):
>         wget 
> https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaGF0WqUy$
>   -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commit/7c175317aa80bbc885609a730214448147a46b47__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaN_w7rr0$
>  
>         git remote add linux-review 
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux__;!!CTRNKA9wMg0ARbw!1fp3H7fjidBzBzfT64rjyCv4-HN-czQi_52IEZTo18hsph4srdLAEfrGamKBaMen_Lno$
>  
>         git fetch --no-tags linux-review jason-jh-lin/Add-Mediatek-
> Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
>         git checkout 7c175317aa80bbc885609a730214448147a46b47
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/mediatek/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/mediatek/mtk_drm_drv.c:707:15: warning: cast to
> smaller integer type 'enum mtk_ddp_comp_type' from 'const void *' [-
> Wvoid-pointer-to-enum-cast]
>                    comp_type = (enum mtk_ddp_comp_type)of_id->data;
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I can't reproduce this build warning in my platform, but I'd found the 
same warning fixed patch: 20210928154620.11181-4-cgzones@googlemail.com

It should not be fixed at this series. So I'll fixed this warning in
another fixed patch.

> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:203:42: warning: unused
> > > variable 'mt2701_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt2701_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:218:42: warning: unused
> > > variable 'mt7623_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt7623_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:234:42: warning: unused
> > > variable 'mt2712_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt2712_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:246:42: warning: unused
> > > variable 'mt8167_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8167_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:260:42: warning: unused
> > > variable 'mt8173_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8173_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:274:42: warning: unused
> > > variable 'mt8183_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8183_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:288:42: warning: unused
> > > variable 'mt8192_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8192_mmsys_match_data =
> {
>                                             ^
> > > drivers/gpu/drm/mediatek/mtk_drm_drv.c:305:42: warning: unused
> > > variable 'mt8195_mmsys_match_data' [-Wunused-const-variable]
> 
>    static const struct mtk_mmsys_match_data mt8195_mmsys_match_data =
> {

Oh, I forgot to replace the driver_data to match_data in mtk_drm_of_ids
table. I'll fix them at the next version.

Regards,
Jason-JH.Lin



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
