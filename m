Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FBEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 09:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A29FD61057
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 09:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A29FD61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NADQx/mfBZz3bQqQRVF1NV9J4b2pGNKniFPkE98s0u8=; b=Ayu2zzUBDb+oXA
	uKjILPjxFUe8IdglwqA89Dkt+vtjYlkcroqxk6YiGU+uQv7/a8PUGFl8Tb5diPSiEaEy+thSpn2+o
	cL8X/9keyshE67M0+A6Dat2Fg7qOySWkomb9hRjLITNaLIfFiiPwWWFR1mxY/D8a2HhNd3OvmHsq+
	rvr3DByYZ3n+ounlIgqeiTkK1Vx/dExZk44c8tbGQVcQDSUsh/kbpb0XaRXgAIrbMYwAdHKNEjuxz
	DPslWbSmYzRsZbLwGpaak3W/puXG4ebNq5VAMK8dApAHwYovc0QqtSlDl6ldp/uUwCSKCcLvBzK5O
	WcsuxVoUSGhWAzKwpYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAUc7-00FcVz-U0; Mon, 02 Aug 2021 09:52:03 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAUbq-00FcNz-5X; Mon, 02 Aug 2021 09:51:47 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0C338379; Mon,  2 Aug 2021 11:51:43 +0200 (CEST)
Date: Mon, 2 Aug 2021 11:51:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 acourbot@chromium.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Message-ID: <YQfALZNWyw8VKODp@8bytes.org>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_025146_440564_60C750F0 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Jul 30, 2021 at 10:52:26AM +0800, Yong Wu wrote:
>  .../display/mediatek/mediatek,disp.txt        |  9 ----
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
>  .../bindings/media/mediatek-mdp.txt           |  8 ----
>  .../bindings/media/mediatek-vcodec.txt        |  4 --
>  arch/arm/boot/dts/mt2701.dtsi                 |  2 -
>  arch/arm/boot/dts/mt7623n.dtsi                |  5 --
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
>  drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
>  drivers/iommu/mtk_iommu_v1.c                  | 31 ++++++++++++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +-----------------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++----------------
>  drivers/memory/mtk-smi.c                      | 14 ------
>  include/soc/mediatek/smi.h                    | 20 --------
>  28 files changed, 92 insertions(+), 321 deletions(-)

So this is likely not going through the IOMMU tree, given Matthias has
reviewed the IOMMU changes you can add my Acked-by: Joerg Roedel <jroedel@suse.de>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
