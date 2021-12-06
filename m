Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD44BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OYRPc+POt6bMIjdhCmEgTgz1r9UNtnJffXANHHw9U8=; b=mISPl2A3PtiziE
	aQoH/nfMYNj3zTRNpu+8sVSRlINsv2LSeg9SVFPs9XpygNimrB+G3P8TBsFdT8s89IavKCvGSgcGB
	Vtmel+5bYL4em0EWWc7cQhF1tZOka4sxELg4fuHbyMGSlYoMMFCUZja5nCBmT4Rc3FgZlNOa4KanX
	kZrbivaBMA2MH45SPme3K9OzKV3xKmQqdmKfG77MF04S0U3QpiWuhVdQlA0gXKegFuUasIDjz+/pk
	7DYJ5EgSwbWmT+9z1QkTYK+OumASWz9IstRVrd9ZrqDU12OvggkNQtd7xh7GXuXw1J39B+vZoUUXu
	PGqiufkHEANbdOZIP6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muDiV-003v2S-Mu; Mon, 06 Dec 2021 13:07:39 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muDiD-003uuA-Qy
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 13:07:25 +0000
Received: by mail-io1-xd2a.google.com with SMTP id x10so12769401ioj.9
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Dec 2021 05:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qLqL6TExfilJQa816YeOozRIvZOpLAU1niZeo6h9s4=;
 b=RqbFbzidRsMZ6ISGBUafhletbxbU5A6KbKIV4Y/dzS/Kp12avFv0vyUFV2afbxunuQ
 P7/0Ze7JjtFyfNEaj9hAf30/T2LBcEqwRBs4w8zkaMUf2Jy5kA+TR17u0L36kCsrSQPU
 bhXkw09ylw46GaFzvDkZ3IRwn3prdmgWjpcrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qLqL6TExfilJQa816YeOozRIvZOpLAU1niZeo6h9s4=;
 b=5EG5bfwlaYZ9BHgNjhagFASGrvdgQAwRAwBIPKa9HBQnxnnP7jbKIdTiGja7kctwNj
 COq5U43FHJ5PRBl6199E1iE0ZVMyUsE0UvG29cijuyCcA7oA6lenUJytnkV9PlIEzTyp
 uWlCYeOfFm+2+MR1tkp8Xj14A/rCpvPFYGOdVTzQ2WNpYhY0CcQY4W+ZWDi0gJJ9KB+c
 cm1tru72/VU//C8bRznHAeGKGiY3JWKbg6d3jxTw7seJClMn9VR5Clcjr3eL771q/6jj
 aDV8YJzX15E+B7VSeLfGfsM2imn88ZQijGwQLxl4NlHQ6fKzTFuTajF5uTDQDs6nE6qE
 uanA==
X-Gm-Message-State: AOAM53114kzwMXbTlKmL6nAECM/dRIELbvxobDG6nKeRxO3ugpH6ZBPt
 oJNMtY92CNFJH2OgNOzm20z4D7YW6WrE4NNrL/VCWA==
X-Google-Smtp-Source: ABdhPJy085ORsitV4ZaNdB4Xow1WGBaA/RrivGlO/iRgMUsG0n9UtP5kWQuGtKWiXbbvXUuCUCWpEf8sSiE1MbF1mpM=
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr31883395iow.55.1638796038291; 
 Mon, 06 Dec 2021 05:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <6d4056d6-21ac-c230-ac7f-a45eb3d3dcfa@xs4all.nl>
In-Reply-To: <6d4056d6-21ac-c230-ac7f-a45eb3d3dcfa@xs4all.nl>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Dec 2021 21:06:52 +0800
Message-ID: <CAJMQK-iD_BCzkThV0gyHCY_YL+OwgJ6D0tHMx8Fk=m=8t-E7UA@mail.gmail.com>
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_050721_892363_4D568499 
X-CRM114-Status: GOOD (  39.38  )
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Yong Wu <yong.wu@mediatek.com>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 6, 2021 at 8:23 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Yong Wu,
>
> On 12/11/2021 11:54, Yong Wu wrote:
> > MediaTek IOMMU block diagram always like below:
> >
> >         M4U
> >          |
> >     smi-common
> >          |
> >   -------------
> >   |         |  ...
> >   |         |
> > larb1     larb2
> >   |         |
> > vdec       venc
> >
> > All the consumer connect with smi-larb, then connect with smi-common.
> >
> > When the consumer works, it should enable the smi-larb's power which also
> > need enable the smi-common's power firstly.
> >
> > Thus, Firstly, use the device link connect the consumer and the
> > smi-larbs. then add device link between the smi-larb and smi-common.
> >
> > After adding the device_link, then "mediatek,larb" property can be removed.
> > the iommu consumer don't need call the mtk_smi_larb_get/put to enable
> > the power and clock of smi-larb and smi-common.
> >
> > Base on a jpeg dt-bing patchset[1] that already got the necessary R-b.
> >
> > This patchset cross several tree, From [2], the media tree should be a good choice.
> >
> > [1] https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/
>
> Please resend this patch series converting the jpeg bindings to yaml, and this time
> CC the linux-media mailinglist. Because that was omitted, it never appeared in the
> media patchwork system, and so this was never merged. Since this patch series depends on
> this series, this needs to be merged first.

Hi Hans,

I've resent a v6 and cc linux-media:
https://patchwork.linuxtv.org/project/linux-media/patch/20211206130425.184420-1-hsinyi@chromium.org/

thanks

>
> Bindings for media drivers must be CC-ed to linux-media, since we maintain those.
>
> Regards,
>
>         Hans
>
> > [2] https://lore.kernel.org/linux-mediatek/e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com/
> >
> > Change notes:
> > v9: 1) Add return -ENODEV when the dev is null.
> >     2) Add more strict about the case that a iommu consume device use the ports in
> >     different larbs. Don't allow this case.
> >     3) Remove two codec interface: mtk_vcodec_release_enc/dec_pm since it only has one
> >     line now.
> >
> > v8: https://lore.kernel.org/linux-mediatek/20210929013719.25120-1-yong.wu@mediatek.com/
> >     1) Rebase on v5.15-rc1.
> >     2) Don't rebase the below mdp patchset that may still need more discuss.
> >     https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
> >     3) Add Frank's Tested-by. Remove Dafna's Tested-by as he requested.
> >
> > v7: https://lore.kernel.org/linux-mediatek/20210730025238.22456-1-yong.wu@mediatek.com/
> >     1) Fix a arm32 boot fail issue. reported from Frank.
> >     2) Add a return fail in the mtk drm. suggested by Dafna.
> >
> > v6: https://lore.kernel.org/linux-mediatek/20210714025626.5528-1-yong.wu@mediatek.com/
> >     1) rebase on v5.14-rc1.
> >     2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
> >     3) Remove the patches about using pm_runtime_resume_and_get since they have
> >        already been merged by other patches.
> >
> > v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
> >     1) Base v5.12-rc2.
> >     2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
> >     independent patch.
> >
> > v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/
> >     base on v5.7-rc1.
> >   1) Move drm PM patch before smi patchs.
> >   2) Change builtin_platform_driver to module_platform_driver since we may need
> >      build as module.
> >   3) Rebase many patchset as above.
> >
> > v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
> >     1) rebase on v5.3-rc1 and the latest mt8183 patchset.
> >     2) Use device_is_bound to check whether the driver is ready from Matthias.
> >     3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
> >    reason in the commit message[3/14].
> >     4) Add a display patch[12/14] into this series. otherwise it may affect
> >    display HW fastlogo even though it don't happen in mt8183.
> >
> > v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
> >    1) rebase on v5.2-rc1.
> >    2) Move adding device_link between the consumer and smi-larb into
> > iommu_add_device from Robin.
> >    3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
> >    4) Remove the shutdown callback in iommu.
> >
> > v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/
> >
> > Yong Wu (14):
> >   dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
> >   iommu/mediatek-v1: Free the existed fwspec if the master dev already
> >     has
> >   iommu/mediatek: Return ENODEV if the device is NULL
> >   iommu/mediatek: Add probe_defer for smi-larb
> >   iommu/mediatek: Add device_link between the consumer and the larb
> >     devices
> >   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
> >   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
> >   drm/mediatek: Get rid of mtk_smi_larb_get/put
> >   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
> >   media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
> >   media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
> >   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
> >   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
> >   arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes
> >
> > Yongqiang Niu (1):
> >   drm/mediatek: Add pm runtime support for ovl and rdma
> >
> >  .../display/mediatek/mediatek,disp.txt        |  9 ----
> >  .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
> >  .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
> >  .../bindings/media/mediatek-mdp.txt           |  8 ---
> >  .../bindings/media/mediatek-vcodec.txt        |  4 --
> >  arch/arm/boot/dts/mt2701.dtsi                 |  2 -
> >  arch/arm/boot/dts/mt7623n.dtsi                |  5 --
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ------
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  8 ++-
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +------------
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
> >  drivers/iommu/mtk_iommu.c                     | 34 ++++++++++++
> >  drivers/iommu/mtk_iommu_v1.c                  | 42 ++++++++++++++-
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +---------------
> >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 --------------
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  8 +--
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 46 +++-------------
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  3 +-
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  6 +--
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 52 +++----------------
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  3 +-
> >  drivers/memory/mtk-smi.c                      | 14 -----
> >  include/soc/mediatek/smi.h                    | 20 -------
> >  32 files changed, 125 insertions(+), 339 deletions(-)
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
