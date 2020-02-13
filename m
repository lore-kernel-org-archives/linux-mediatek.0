Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE23C352A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 02:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C509F2168B
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 02:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lz40yVWR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="leVPUigm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C509F2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pb9LWEaOT/oQrYwVJqWVbNL1IfY/acXSLjj4eZDUpw=; b=Lz40yVWRl+uOPU
	0VtyaMaxiitax0jpKwaNZ3B8pnHsGrVpY44LXHcc6QwbATE4jdnaZE+WK91TsfEnK/2PXjfJBH6yy
	K5R8zrWnJ2UD7g2De1nqcO+E5xx7saWvjkIiyGJfpARWIyACha2b3+2X5ubqIvxwjvRvebeLW4WeL
	Lxad1R2khlGQyTnQvUFWbWfzRaK0a8mJVqsYxdqRe9NmkT7jlCRyOrbo1pS25heAu5aV9aPjfj6QE
	0LEObw5L55aaPWshDHrjmUckesU5ZTtotoFvsreTw9voPUs1enKFWZB8JZ+8+zOqDN/0ahgYepTDu
	V0TCjJogJteNsqRg/HoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j24hZ-0000oI-0t; Thu, 13 Feb 2020 02:58:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j24hV-0000nk-AG; Thu, 13 Feb 2020 02:58:03 +0000
X-UUID: 13af140b57d840df9bb3842d44eede74-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0HPDjdt74T111dUFssEsZJlHvxvLqFiiV5OgaDl5UMI=; 
 b=leVPUigmIgi+5lYDpuX29RQSRcbEv8Hm0/47jlB8vwQJ0pTQDGP3gf+0/gGpu4/f8CfzzrdOkesbjHHCf1ijfEGpQhbqPyP9ltKQ6inV2tBm1eGIw6fEZ9Hbsd1Hr/087GcW7Nl/uIu9k3rMFELZYqayoY0VEkIDzyV2Es+EyXY=;
X-UUID: 13af140b57d840df9bb3842d44eede74-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 614904420; Wed, 12 Feb 2020 18:57:56 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 18:58:05 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 10:56:49 +0800
Message-ID: <1581562673.24120.3.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 00/12] arm/arm64: mediatek: Fix mmsys device
 probing
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Thu, 13 Feb 2020 10:57:53 +0800
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_185801_364956_26B9B309 
X-CRM114-Status: GOOD (  22.21  )
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
Cc: mark.rutland@arm.com, sean.wang@kernel.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:


Would you work on this series in a short time? Some Yongqiang's patches
[1] also modify mmsys driver, and now it depend on your patch to prevent
conflicts. If you would not work on this series in a short time, I would
like to apply Yongqiang's patch without this series.

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=223221

Regards,
CK

On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> [reseding due to wrong mail of Stephen]
> 
> This is version five of the series. It's a long time this wasn't worked on, so
> as a reminder, version four can be found here:
> https://patchwork.kernel.org/cover/10686247/
> 
> The biggest changes this new version does, is to implement the clock probing
> through a platform driver. The corresponding platform device get's created in
> the DRM driver. I converted all the clock drivers to platform drivers and tested
> the approach on the Acer Chromebook R13 (mt8173 based).
> Apart from that I reordered the patches so that the DT bindings update are the first
> patches.
> 
> Changes since v5:
> - re-arrange the patch order
> - generate platform_device for mmsys clock driver inside the DRM driver
> - fix DTS binding accordingly
> - switch all mmsys clock driver to platform probing
> - fix mt8173 platform driver remove function
> - fix probe defer path in HDMI driver
> - fix probe defer path in mtk_mdp_comp
> - fix identation of error messages
> 
> Changes since v4:
> - fix missing regmap accessors in drm diver (patch 1)
> - omit probe deffered warning on all drivers (patch 5)
> - update drm and clk bindings (patch 6 and 7)
> - put mmsys clock part in dts child node of mmsys. Only done
> for HW where no dts backport compatible breakage is expected 
> (either DRM driver not yet implemented or no HW available to
> the public) (patch 9 to 12)
> 
> Changes since v3:
> - use platform device to probe clock driver
> - add Acked-by CK Hu for the probe deferred patch
> 
> Changes since v2:
> - fix kconfig typo (shame on me)
> - delete __initconst from mm_clocks as converted to a platform driver
>   
> Changes since v1:
> - add binding documentation
> - ddp: use regmap_update_bits
> - ddp: ignore EPROBE_DEFER on clock probing
> - mfd: delete mmsys_private
> - add Reviewed-by and Acked-by tags
>  
> MMSYS in Mediatek SoCs has some registers to control clock gates (which is 
> used in the clk driver) and some registers to set the routing and enable
> the differnet blocks of the display subsystem.
> 
> Up to now both drivers, clock and drm are probed with the same device tree
> compatible. But only the first driver get probed, which in effect breaks
> graphics on mt8173 and mt2701.
> 
> This patch uses a platform device registration in the DRM driver, which
> will trigger the probe of the corresponding clock driver. It was tested on the
> bananapi-r2 and the Acer R13 Chromebook.
> 
> 
> Matthias Brugger (12):
>   dt-bindings: display: mediatek: Add mmsys binding description
>   dt-bindings: mediatek: Add compatible for mt7623
>   drm/mediatek: Use regmap for register access
>   drm: mediatek: Omit warning on probe defers
>   media: mtk-mdp: Check return value of of_clk_get
>   clk: mediatek: mt2701: switch mmsys to platform device probing
>   clk: mediatek: mt2712e: switch to platform device probing
>   clk: mediatek: mt6779: switch mmsys to platform device probing
>   clk: mediatek: mt6797: switch to platform device probing
>   clk: mediatek: mt8183: switch mmsys to platform device probing
>   clk: mediatek: mt8173: switch mmsys to platform device probing
>   drm/mediatek: Add support for mmsys through a pdev
> 
>  .../display/mediatek/mediatek,disp.txt        | 30 ++++++-----
>  drivers/clk/mediatek/clk-mt2701-mm.c          | 41 +++++++++-----
>  drivers/clk/mediatek/clk-mt2712-mm.c          | 39 +++++++++-----
>  drivers/clk/mediatek/clk-mt6779-mm.c          | 41 +++++++++-----
>  drivers/clk/mediatek/clk-mt6797-mm.c          | 43 ++++++++++-----
>  drivers/clk/mediatek/clk-mt8173.c             | 51 +++++++++++++++---
>  drivers/clk/mediatek/clk-mt8183-mm.c          | 39 +++++++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |  5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            | 12 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 54 +++++++++----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 35 +++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  4 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  8 ++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  6 +++
>  19 files changed, 295 insertions(+), 135 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
