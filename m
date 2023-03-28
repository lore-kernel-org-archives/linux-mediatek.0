Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A2AC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUf3jiNZbjdn5aJIG691ZB+GARAf73K/pek6NDFu4ns=; b=yq5s5ENg3pZ3rkNcxB817M5F0l
	CB8o5MuHi20hlh+ukJB05pdjNG9fxqMd4aE3G6hxyXJhbVwYPVYOgxk97MCtH/EG+twNxD4+jmr+y
	o94Pjmxj1yeLvCyhyBpl/67qjK8atbvulQNkUjHbGpcr08UMS7yPGeyrbguZwc29pbTfCBr3xngx1
	rMlP1hLT3eSeUFafGGdpmC8ntV5Fz3ODxXiQwsa+of/DPbsPxnaY//dzRcaD3rtAeLclz39iT5UQA
	1cmzIXU06/ZlQgUQVoEIaJuW5iRC9ymMy3m+9YfzcgOzfYiNZgA8XFkdLdb6Mtme5INHgEkYjt/g4
	/YUoDthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9OM-00Ea3o-3A;
	Tue, 28 Mar 2023 13:29:38 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph9OJ-00Ea1l-1K;
	Tue, 28 Mar 2023 13:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680010175; x=1711546175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tQTkT+hUldu+rXz3mb+LVVHL+mcEWhZt7e4D4RyAuNs=;
  b=ghNgRi3y+nzGO6HEV55GzawZcIWN/nLeAh3s8b7MNZJD6Z+de6ovK6x4
   hRSncoyY4dhv5Rsao3vJzhtpKZYrUHyflZTKXSltdepWYI+j7ITZ244XY
   7E815DUOM0K3Rdq6WwEB114D8lgejpA1jgRbF7//6AasWh2pwz0XOkFBq
   Z02PI5vHlPTIOJtYwjlVvnwjeZAo+lBtCK9toVBz6+d36985g7cpwYK6U
   xSWHt+lji0kGw7Dm4+cWg1zM9Dx7nbhG9uH1yN0vB7r0oJ/Mjcl32o6LR
   1MH/K23AqrQIHhe2KiHjrkQWgUiTEnBTNwZKoIfWypnUm1qt39ErTGOPT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="403174811"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="403174811"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 06:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794803518"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="794803518"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2023 06:29:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph9No-000IYf-2B;
	Tue, 28 Mar 2023 13:29:04 +0000
Date: Tue, 28 Mar 2023 21:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix potential array
 out-of-bounds in decoder queue_setup
Message-ID: <202303282152.CXxK3RNH-lkp@intel.com>
References: <20230328100951.536955-1-harperchen1110@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328100951.536955-1-harperchen1110@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_062935_558220_4107C765 
X-CRM114-Status: GOOD (  16.17  )
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

Hi Wei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Chen/media-mediatek-vcodec-Fix-potential-array-out-of-bounds-in-decoder-queue_setup/20230328-181142
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230328100951.536955-1-harperchen1110%40gmail.com
patch subject: [PATCH] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230328/202303282152.CXxK3RNH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/caa43627286fb5f3b0b3af7e01e1baeca5c5f9cc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wei-Chen/media-mediatek-vcodec-Fix-potential-array-out-of-bounds-in-decoder-queue_setup/20230328-181142
        git checkout caa43627286fb5f3b0b3af7e01e1baeca5c5f9cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282152.CXxK3RNH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c: In function 'vb2ops_vdec_queue_setup':
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c:756:20: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     756 |                 if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
         |                    ^


vim +/else +756 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c

   739	
   740	int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
   741				    unsigned int *nplanes, unsigned int sizes[],
   742				    struct device *alloc_devs[])
   743	{
   744		struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vq);
   745		struct mtk_q_data *q_data;
   746		unsigned int i;
   747	
   748		q_data = mtk_vdec_get_q_data(ctx, vq->type);
   749	
   750		if (q_data == NULL) {
   751			mtk_v4l2_err("vq->type=%d err\n", vq->type);
   752			return -EINVAL;
   753		}
   754	
   755		if (*nplanes) {
 > 756			if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
   757				if (*nplanes != q_data->fmt->num_planes)
   758					return -EINVAL;
   759			else
   760				if (*nplanes != 1)
   761					return -EINVAL;
   762	
   763			for (i = 0; i < *nplanes; i++) {
   764				if (sizes[i] < q_data->sizeimage[i])
   765					return -EINVAL;
   766			}
   767		} else {
   768			if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
   769				*nplanes = q_data->fmt->num_planes;
   770			else
   771				*nplanes = 1;
   772	
   773			for (i = 0; i < *nplanes; i++)
   774				sizes[i] = q_data->sizeimage[i];
   775		}
   776	
   777		mtk_v4l2_debug(1,
   778				"[%d]\t type = %d, get %d plane(s), %d buffer(s) of size 0x%x 0x%x ",
   779				ctx->id, vq->type, *nplanes, *nbuffers,
   780				sizes[0], sizes[1]);
   781	
   782		return 0;
   783	}
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

