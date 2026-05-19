Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EAACD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 04:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=; b=GnSnRS1AfonwwoANc5uCRcOqBx
	gZfN8FscWdaPSPz+vj78MnilgphihmOzn9bm9gI5uHTh4bEbKZcUFKJg/8YyiF/PslqlTfftJC9Qy
	dBZ6IWMpFBD7mZeOGNZq/5+rqlKDDrGMr6IKpmUAn7cDNnxxxfCTQ1m4796gTYlyb3G2K7dj5GQjZ
	8I7zcVcX200itH88p5btFG6TPnSB+2z1yA01jRqKlp8C0z0rIbJ51WOztDyxJ5T8quBtHQbETAEXy
	PVbqjzHB3nCQvOrfpYAqElLTh0GlKPLYK8FMYzn6t0vvJI+yixTpywxzbG31291PSXdhpI5GB/xR9
	Eg3UOCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBqk-000000004tt-1XYI;
	Tue, 19 May 2026 04:14:34 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBqh-000000004sx-42zz
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 04:14:33 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-651d6347a69so4649013d50.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 21:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779164071; cv=none;
        d=google.com; s=arc-20240605;
        b=FmGEiFzoEY684ReC6YH3eaFfwPJs7c0OG5r0H+WqhwvaZYYMqi6TGWTLzpatSJ/gre
         Kx/6UcbF2QaBwCTdNUXtSS/0SuaXxyGoHvt+McXSCQEAqumwyzVHDiLyCBCZwtz2kUYT
         Ah1CdSOm+yPuDE+oymliwa3cFhZezAy5UK8ypmAdTbyXIcuQZnMc7Dn5c2aAKwuVyEj+
         6+Od0V8iKgDNsRXl0PzL0ajsAF37zfb2pkjwudpEyjsSrmbrlWZdIvv7QL9HPO96HG45
         LsiNxeMEl+koL0caS0JxxZpvqAdLGkpYF34bQ+1I3zK+ivTftrfLLtKNdJrdJoYu9s+B
         89Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        fh=NccWK3iX63DOEu00JcpzYY9mhWH/Z9zRlLrR/xqdRR4=;
        b=Sgn6vT8eEEFZLRVLMdgQn8f1zhig3d9XeBtwi9CSBgZD3UQiPTUg1WjkDikJ6Ky/It
         yH9SQ8mdeJKz+w4mbzapxBCbvZHIPCRWs6/L1ylf2oF7etqt+7isl1MQHsbre79Udgnf
         6UIWHDlmz0gKQlv6T0Aq9NFsxcUPMomacW1urQ42CRz9RDpgGa14pcz6CvK3Y+fVU+8C
         gzVZreQTNLVgVQtBxdnJ35qL8skTNMBLv4eix21EOwMqIjsjp79zqJLXTrPjobZ01u3t
         kmKJi2ky/5gghWIl6ahH2XNj4SbmmUoKKNSytislOKkkscO9WSFvzTMjx+V37+daXJal
         DQJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779164071; x=1779768871; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=bklqKjZJTJGeIKG4coSorCVA8TEZAfd9QaU+idJ2MGtNfFN+8+AvUmO05snSO/PR/i
         ht0UmdB+52k3zp3/wSnfyETv2F3AhvkT+0pucLoViJidmPgnl1H+FM3xluaJJhQ7VQq7
         DJYP7EbbztgOt/hC3gRh29/Dv3gNyHJF0wQmgtgFEf9PRNoA5Je9zVXiQ3LTgzBiFKbZ
         4tSA2UrD59VyiEC/u04c6xsOdu/9vu76eYYIiYBcd3uhsSg7/J8/Az92/rUMj1lDtIG1
         /wkAlgeL22I3L0T7s0Fa9O7Pj8RMBb+JzrMawQoHPi9Zl6OjFaKUxZMWTeZxEFFrpa0R
         pG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779164071; x=1779768871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3Cc6m38oPvcGuBp5AJqGBI+Tkcix4npCtWvX6h14ng=;
        b=dJpnBPC0fj0diO6EO/VXpN2LyLRwdPaXntewEIjUoqd6T3PcaSt0LPGm0DkS4uz1Mx
         TJNmTdg+dw1VQZfO1l6ABrMXPXXzXkFjviFsjeVv/zTC2Us66Vy+9PBcv+5VFNGqZb9Y
         tVXqLiY43PqaImQqqP7jJjJPvlcUetOb2BsD3kxnsjB2h9fo79hGzicEx4DWH5kSgBEf
         WLvwD+ZkXWFIdJXkaqFd20wPiR2p4sWDHTM6tRtm3dqTIyejDummt0ElYgvATM07FtAE
         uM0VMJ+IKcBm3cfJajuUG6qLP2AF4LhUxorZNSlHLXnnxiG1I7tb34MDWqSC0BwvOy+h
         8eoA==
X-Forwarded-Encrypted: i=1; AFNElJ9TxgIVpu9cJr0afZWUPvFBn1wqm4Gxmxa+nAui0rwbiAQoa3RlQ84oCYcVQaT9fLoD0jzHKz2X3TeIIoeR5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC+izVcEAPdIxkaxTVAyMKwWA/Sibx1o3LAcZPie9ULXPZQJu8
	IDmloqbPMlnjg1x2g1aKniAESofjL408DxqufFytYmzGk8KqPTdk73O+eMpPAAEV7RVEaBC7Lv6
	XMDlKKXW+kxNL+X5M5vRgrr3U1Sge+W0=
X-Gm-Gg: Acq92OGiFfkmCceZW4m5s96bC8tBrVnE8t1tvMlSn7gTgUJYc1AGF1o3qNjiwJPIU5m
	ABwwaP4UEayVAY18wYmz7tvT4WPYcXa26M/6bjK1cwa01RzN+mMQemYXoNGjpmZBN39eZPxu9ne
	4bA0BGIz0YsQpIdQ0+A+zlmbGXqgKOiucoEfK3qyxChp3xoq2ooYfqgi5oeUPyw8wIOypszG2Ul
	0e+lrBFTSJZcr97xA2fpGxt6ydVeiY4bQZ5z5EA1tViN5dY7L9a0l/PIplZyDkJ5anvEn1CztSE
	J01Evs9j
X-Received: by 2002:a05:690e:438d:b0:65e:782e:9df3 with SMTP id
 956f58d0204a3-65e782ea2bcmr1341256d50.7.1779164070708; Mon, 18 May 2026
 21:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260518125500.1000083-1-lgs201920130244@gmail.com> <202605190845.KlMSPp80-lkp@intel.com>
In-Reply-To: <202605190845.KlMSPp80-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 12:14:18 +0800
X-Gm-Features: AVHnY4Km_xmIfqiLJD15ZaDQr9lLAh1Ogha024FXgf4YUM6n3JdHCvcB7t1E46k
Message-ID: <CANUHTR-J7VY4Jx7WVqEpC+Xg2cR_Rnb=gaA_xecyNO9dmFcyew@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video register failure
To: kernel test robot <lkp@intel.com>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_211432_019773_C1267506 
X-CRM114-Status: GOOD (  19.08  )
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

Thanks for the report.

On Tue, 19 May 2026 at 10:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linuxtv-media-pending/master]
> [also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
> base:   https://git.linuxtv.org/media-ci/media-pending.git master
> patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605190845.KlMSPp80-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:33: error: expected ';' after expression
>     1217 |         video_device_release(mdp->vdev)
>          |                                        ^
>          |                                        ;
>    1 error generated.
>
>
> vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
>
>   1172
>   1173  int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
>   1174  {
>   1175          struct device *dev = &mdp->pdev->dev;
>   1176          int ret;
>   1177
>   1178          mdp->variant = &mtk_mdp_default_variant;
>   1179          mdp->vdev = video_device_alloc();
>   1180          if (!mdp->vdev) {
>   1181                  dev_err(dev, "failed to allocate video device\n");
>   1182                  ret = -ENOMEM;
>   1183                  goto err_video_alloc;
>   1184          }
>   1185          mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>   1186          mdp->vdev->fops = &mtk_mdp_m2m_fops;
>   1187          mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
>   1188          mdp->vdev->release = video_device_release_empty;
>   1189          mdp->vdev->lock = &mdp->lock;
>   1190          mdp->vdev->vfl_dir = VFL_DIR_M2M;
>   1191          mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
>   1192          snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
>   1193                   MTK_MDP_MODULE_NAME);
>   1194          video_set_drvdata(mdp->vdev, mdp);
>   1195
>   1196          mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
>   1197          if (IS_ERR(mdp->m2m_dev)) {
>   1198                  dev_err(dev, "failed to initialize v4l2-m2m device\n");
>   1199                  ret = PTR_ERR(mdp->m2m_dev);
>   1200                  goto err_m2m_init;
>   1201          }
>   1202
>   1203          ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
>   1204          if (ret) {
>   1205                  dev_err(dev, "failed to register video device\n");
>   1206                  goto err_vdev_register;
>   1207          }
>   1208          mdp->vdev->release = video_device_release;
>   1209
>   1210          v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
>   1211                    mdp->vdev->num);
>   1212          return 0;
>   1213
>   1214  err_vdev_register:
>   1215          v4l2_m2m_release(mdp->m2m_dev);
>   1216  err_m2m_init:
> > 1217          video_device_release(mdp->vdev)
>   1218          mdp->vdev = NULL;
>   1219  err_video_alloc:
>   1220
>   1221          return ret;
>   1222  }
>   1223
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This build failure was caused by my oversight. I missed the semicolon after
video_device_release(mdp->vdev).

I will send a v2 to fix this issue.

Sorry for the noise.

