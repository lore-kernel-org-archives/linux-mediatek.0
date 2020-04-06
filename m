Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975DBC2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 07:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65FC220719
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 07:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SNHdarc7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bX8Cj6PI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FC220719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqmjqoVm9gZhwkGhVeUlxwjy9BN5tO+HQs9qpFfzJOg=; b=SNHdarc71VZG34
	q7KO7XXmB+UmrQFawdaJj24FFXAzg72qYMC34zQiLlus6yJH/pfa8Ai8PajbtiK1rXQ0VIyOX7Z3q
	jBtfCyL+ZJyp8ZqWoHvWu2rT8UB0++aYW/TBks2ik86DQaoKXRDKYmjdeYQ2RobG6HGg1Tm9dRWJW
	6X+lXabn1jh2y54CiCXuwsEH25EAm325h5OVG4iHQj4GISxOMyOtwztUz38vq1ANIbY0WMGG/SwfI
	9wGYgs+Xt+U0bCHoiiP/g49EG1EHk465C3TxjJEGVMNLABLw//kbhFB81FNNEVzJv7ftSAls7fDgj
	ASUxymE4Wksf1JOI4VHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLM18-0000sL-Qq; Mon, 06 Apr 2020 07:17:58 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLM15-0000rt-Nd
 for linux-mediatek@lists.infradead.org; Mon, 06 Apr 2020 07:17:57 +0000
Received: by mail-io1-xd41.google.com with SMTP id u2so1189416iop.10
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Apr 2020 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Db2gy0KwxZU6sZXsS+kywahq01i5euHIqRm2wacWELU=;
 b=bX8Cj6PIjykCfub7TcZYiQOt5ySTtCwdZUbZ633ovn2CvaO5FXWlClGVfqUjQOMlj4
 J+vh7kwySoGNg8ndT3TbkaSRCDeNtJYuK72xM+V8Nywkf+zjJnOENhFbtKuhtKYqGnzk
 Y4eDL7B4vptrlD4wfMFW+tkqcu0SUO7x4fYZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Db2gy0KwxZU6sZXsS+kywahq01i5euHIqRm2wacWELU=;
 b=dHhmDTjHaUjfFdZUNZcI5fO2N+JPeHrnlpM16m0WTVbAiPKYx2zfOXSIS5Ev7jgIoX
 KlCpz3ab0w5RQXYZs5jqsafeyBasOMFssQi7H6AyptJ+7kp8O8HAI3xtgrV6vOPVAo02
 ZjWS1de7A6eMOeDmTK/v6ZYDdMekb3upYi4ft1S43kyicZsAARIZQrs1phR7GrLMOjA3
 wI8x77ikWRCt0sFgdhVKTFDOBj6Kqa9prSENo5nN08cfkIS15khGMi1xsCLJ+foNde/G
 ROI37kOQf9RMO6lfULz8rXi513b9wZOw65xvTd6poHLWwT+04v3cfCRtUb9nY5CevXNg
 JbLg==
X-Gm-Message-State: AGi0Pua60ZS0PWiVS+8qAV5p5n/4BKqCRDYhtp3j9BoEADuw59UzzgGd
 DSgPvVp9AEyOcb7j+viB9yXUm0KyNB9sB5+pB6PPng==
X-Google-Smtp-Source: APiQypLuUn0LSyK8CCfaiS+KVBTl8I/x4LHlAvyF6y60LcZDxFlbQ4ZBQoOkRGvl73rolvlaiznrylL0WtJiMWVcamk=
X-Received: by 2002:a5d:944c:: with SMTP id x12mr18334175ior.100.1586157474266; 
 Mon, 06 Apr 2020 00:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200406051131.225748-1-hsinyi@chromium.org>
 <202004061558.qA9rRKbq%lkp@intel.com>
In-Reply-To: <202004061558.qA9rRKbq%lkp@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Apr 2020 15:17:28 +0800
Message-ID: <CAJMQK-ibjjMx0oNN1M8bg9+MxocdJP4zfcSojWQZJsGvnRh-7g@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: fix device passed to cmdq
To: kbuild test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_001755_795421_4D624E9C 
X-CRM114-Status: GOOD (  15.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 kbuild-all@lists.01.org, Philipp Zabel <p.zabel@pengutronix.de>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, "linux-arm-kernel@lists.infradead.org,
 CK Hu" <ck.hu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch depends on
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
branch v5.6-next/soc

On Mon, Apr 6, 2020 at 3:12 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on clk/clk-next]
> [cannot apply to arm-soc/for-next xlnx/master linus/master v5.6 next-20200405]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Hsin-Yi-Wang/drm-mediatek-fix-device-passed-to-cmdq/20200406-132804
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: arm64-randconfig-a001-20200406 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.3.0 make.cross ARCH=arm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c: In function 'mtk_drm_crtc_create':
> >> drivers/gpu/drm/mediatek/mtk_drm_crtc.c:824:29: error: 'struct mtk_drm_crtc' has no member named 'mmsys_dev'
>      824 |    cmdq_mbox_create(mtk_crtc->mmsys_dev,
>          |                             ^~
>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c:832:43: error: 'struct mtk_drm_crtc' has no member named 'mmsys_dev'
>      832 |  ret = of_property_read_u32_index(mtk_crtc->mmsys_dev->of_node,
>          |                                           ^~
>
> vim +824 drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>
>    724
>    725  int mtk_drm_crtc_create(struct drm_device *drm_dev,
>    726                          const enum mtk_ddp_comp_id *path, unsigned int path_len)
>    727  {
>    728          struct mtk_drm_private *priv = drm_dev->dev_private;
>    729          struct device *dev = drm_dev->dev;
>    730          struct mtk_drm_crtc *mtk_crtc;
>    731          unsigned int num_comp_planes = 0;
>    732          int pipe = priv->num_pipes;
>    733          int ret;
>    734          int i;
>    735          bool has_ctm = false;
>    736          uint gamma_lut_size = 0;
>    737
>    738          if (!path)
>    739                  return 0;
>    740
>    741          for (i = 0; i < path_len; i++) {
>    742                  enum mtk_ddp_comp_id comp_id = path[i];
>    743                  struct device_node *node;
>    744
>    745                  node = priv->comp_node[comp_id];
>    746                  if (!node) {
>    747                          dev_info(dev,
>    748                                   "Not creating crtc %d because component %d is disabled or missing\n",
>    749                                   pipe, comp_id);
>    750                          return 0;
>    751                  }
>    752          }
>    753
>    754          mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
>    755          if (!mtk_crtc)
>    756                  return -ENOMEM;
>    757
>    758          mtk_crtc->config_regs = priv->config_regs;
>    759          mtk_crtc->ddp_comp_nr = path_len;
>    760          mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
>    761                                                  sizeof(*mtk_crtc->ddp_comp),
>    762                                                  GFP_KERNEL);
>    763          if (!mtk_crtc->ddp_comp)
>    764                  return -ENOMEM;
>    765
>    766          mtk_crtc->mutex = mtk_disp_mutex_get(priv->mutex_dev, pipe);
>    767          if (IS_ERR(mtk_crtc->mutex)) {
>    768                  ret = PTR_ERR(mtk_crtc->mutex);
>    769                  dev_err(dev, "Failed to get mutex: %d\n", ret);
>    770                  return ret;
>    771          }
>    772
>    773          for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>    774                  enum mtk_ddp_comp_id comp_id = path[i];
>    775                  struct mtk_ddp_comp *comp;
>    776                  struct device_node *node;
>    777
>    778                  node = priv->comp_node[comp_id];
>    779                  comp = priv->ddp_comp[comp_id];
>    780                  if (!comp) {
>    781                          dev_err(dev, "Component %pOF not initialized\n", node);
>    782                          ret = -ENODEV;
>    783                          return ret;
>    784                  }
>    785
>    786                  mtk_crtc->ddp_comp[i] = comp;
>    787
>    788                  if (comp->funcs) {
>    789                          if (comp->funcs->gamma_set)
>    790                                  gamma_lut_size = MTK_LUT_SIZE;
>    791
>    792                          if (comp->funcs->ctm_set)
>    793                                  has_ctm = true;
>    794                  }
>    795          }
>    796
>    797          for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
>    798                  num_comp_planes += mtk_drm_crtc_num_comp_planes(mtk_crtc, i);
>    799
>    800          mtk_crtc->planes = devm_kcalloc(dev, num_comp_planes,
>    801                                          sizeof(struct drm_plane), GFP_KERNEL);
>    802
>    803          for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>    804                  ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
>    805                                                      pipe);
>    806                  if (ret)
>    807                          return ret;
>    808          }
>    809
>    810          ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
>    811                                  mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
>    812                                  NULL, pipe);
>    813          if (ret < 0)
>    814                  return ret;
>    815
>    816          if (gamma_lut_size)
>    817                  drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
>    818          drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
>    819          priv->num_pipes++;
>    820          mutex_init(&mtk_crtc->hw_lock);
>    821
>    822  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>    823          mtk_crtc->cmdq_client =
>  > 824                          cmdq_mbox_create(mtk_crtc->mmsys_dev,
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
