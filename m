Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81CDC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:28:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0C7613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0C7613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTKGqSi6ajmnus60EZd6cpwKybY4xM93dRXVU4Ua6Es=; b=CzoqXWsQenRF+0
	03oRiplmcKfuSpMCWkOZv1AexMEq2i07LupARrwNxaAUoZa/WUktMlUCDs3uETc2LzaQlaCzSvJIV
	2pX6/dyz+VlJrpyHlPC4c+Jqu5jL06/tcZDEw1oi9M1wC/JWTKLnVrzk2XQBaIqCXS9Ze7XScuYBj
	CWq5w35EcD1mJ2xrkbDIvkf03NhJ2TFF2HimQzjhnHkqfytDwMg+XgzqF6RoX2xVKXYPW2B0tlFQY
	FM1eHiO5iFf3Vb1Sx5NJaWT32mTEbj9sGsKI5Lq5JGUHOqasA/MNlMzlxvhvqJQvIzeDo+Ef6U0pp
	uk39Sov3w62lWXoxP8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3d3y-00DNFf-6i; Wed, 14 Jul 2021 11:28:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3d3k-00DNDD-21; Wed, 14 Jul 2021 11:28:14 +0000
X-UUID: 51f8e9dbae38482ea351a4f1ddd72715-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a4Si3eZ7fDNKZHOBuXgUAIl76gjFv4ziTHlX+W08HKg=; 
 b=pasU36FHLKLvv1QNHstw7hQnet2OSlCIeszA4kimqdNUEslKN4SKACXpKyo1UGeUPuDC8qw5dyyG7SjNA6DGtHJ0MtQOXEx/tgeyapsaG1xHpPiI6J1NlTyCKLNwFj370ySWJNowxG27zcDyAaa0nSJJ+HSb3oXVInNt9lBKn08=;
X-UUID: 51f8e9dbae38482ea351a4f1ddd72715-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 416233044; Wed, 14 Jul 2021 04:28:09 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:18:07 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:18:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:18:03 +0800
Message-ID: <1626261483.14352.15.camel@mhfsdcap03>
Subject: Re: [PATCH v6 00/11] Clean up "mediatek,larb"
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Evan Green <evgreen@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, "Will
 Deacon" <will.deacon@arm.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Eizan
 Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>
Date: Wed, 14 Jul 2021 19:18:03 +0800
In-Reply-To: <672ef386-aa95-da45-0f17-acb398a1f6e0@collabora.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <672ef386-aa95-da45-0f17-acb398a1f6e0@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 66096B7167E68897C718A8E5F5E93D30A09BFA4E16795181519114E5CFBA39B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_042812_151470_A23356B3 
X-CRM114-Status: GOOD (  35.78  )
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

On Wed, 2021-07-14 at 10:56 +0200, Dafna Hirschfeld wrote:
> Hi
> 
> Thanks for the patchset.
> 
> I tested it on mt8173 (elm) with chromeos userspace.
> Before that patchset, the test:
> 
> tast -verbose run -build=false 10.42.0.175 video.DecodeAccel.h264
> 
> sometimes passed and sometimes failed with 'context deadline exceeded'.
> With this patchset it seems that the test always passes so I added tested-by:
> 
> Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Thanks very much for your quick review and testing:)

> 
> Thanks,
> Dafna
> 
> 
> 
> 
> On 14.07.21 04:56, Yong Wu wrote:
> > MediaTek IOMMU block diagram always like below:
> > 
> >          M4U
> >           |
> >      smi-common
> >           |
> >    -------------
> >    |         |  ...
> >    |         |
> > larb1     larb2
> >    |         |
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
> > About the MM dt-binding/dtsi patches, I guess they should go together, thus
> > I don't split them for each a MM module and each a SoC.
> > 
> > Base on v5.14-rc1, and a jpeg[1] and mdp[2] patchset.
> > 
> > [1] https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/
> > [2] https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
> > 
> > Change notes:
> > v6: 1) rebase on v5.14-rc1.
> >      2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
> >      3) Remove the patches about using pm_runtime_resume_and_get since they have
> >         already been merged by other patches.
> > 
> > v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
> >      1) Base v5.12-rc2.
> >      2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
> >      independent patch.
> > 
> > v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/
> >      base on v5.7-rc1.
> >    1) Move drm PM patch before smi patchs.
> >    2) Change builtin_platform_driver to module_platform_driver since we may need
> >       build as module.
> >    3) Rebase many patchset as above.
> > 
> > v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
> >      1) rebase on v5.3-rc1 and the latest mt8183 patchset.
> >      2) Use device_is_bound to check whether the driver is ready from Matthias.
> >      3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
> >     reason in the commit message[3/14].
> >      4) Add a display patch[12/14] into this series. otherwise it may affect
> >     display HW fastlogo even though it don't happen in mt8183.
> >     
> > v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
> >     1) rebase on v5.2-rc1.
> >     2) Move adding device_link between the consumer and smi-larb into
> > iommu_add_device from Robin.
> >     3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
> >     4) Remove the shutdown callback in iommu.
> > 
> > v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/
> > 
> > Yong Wu (10):
> >    dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
> >    iommu/mediatek: Add probe_defer for smi-larb
> >    iommu/mediatek: Add device_link between the consumer and the larb
> >      devices
> >    media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
> >    media: mtk-mdp: Get rid of mtk_smi_larb_get/put
> >    drm/mediatek: Get rid of mtk_smi_larb_get/put
> >    media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
> >    memory: mtk-smi: Get rid of mtk_smi_larb_get/put
> >    arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
> >    arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes
> > 
> > Yongqiang Niu (1):
> >    drm/mediatek: Add pm runtime support for ovl and rdma
> > 
> >   .../display/mediatek/mediatek,disp.txt        |  9 ----
> >   .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
> >   .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
> >   .../bindings/media/mediatek-mdp.txt           |  8 ----
> >   .../bindings/media/mediatek-vcodec.txt        |  4 --
> >   arch/arm/boot/dts/mt2701.dtsi                 |  2 -
> >   arch/arm/boot/dts/mt7623n.dtsi                |  5 --
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
> >   drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
> >   drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 19 ++++----
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
> >   drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
> >   drivers/iommu/mtk_iommu_v1.c                  | 22 ++++++++-
> >   .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +-----------------
> >   .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
> >   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
> >   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
> >   drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> >   .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++----------------
> >   drivers/memory/mtk-smi.c                      | 14 ------
> >   include/soc/mediatek/smi.h                    | 20 --------
> >   28 files changed, 85 insertions(+), 323 deletions(-)
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
