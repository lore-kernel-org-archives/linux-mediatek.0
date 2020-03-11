Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DA4C18E5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362892146E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fsMDZMwt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LAUn4Uh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362892146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBnB4HbKAjAAoE8WTTmsdgMK8CRLx2MLBWtBTmNRZfo=; b=fsMDZMwtf+PVcb
	FeZXGu1G6byHx6Vrsd+yfoFx0w6GH2/2Ff6J3Zk5CJZu7mES4kIC5j5QPQGA877mWZacs3qTtQv4R
	m8WROFAPk/pJ2o7rdkrQ6Li/T3ZZoY+GMy8Q0ouWtuseeF+W1NVHyASBHuPov9qPPjbCnt8LeDl4b
	Gk/LvSQFzj6jVZPw4OmWDQTO5NBJ1qTCTwhiaPfvoTbIDTVTvn+Cns7/ZXZmB3yGU2zeehdxZk/7F
	A8hlogUo/Xb8xcBky5d91wUOflNJY5NmQyo2LkfR9xGUJRGAQHq/KhLB4DnhiGNW8cii1r+iN2+pL
	ogBQt07l4nfztIR45o4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC0zy-0001x5-0J; Wed, 11 Mar 2020 13:02:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC0zo-0001ot-Tj; Wed, 11 Mar 2020 13:02:02 +0000
X-UUID: 61252333c95a46239ac37484f25935c7-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/WVVWBfJZWBTP9PrYKh6PTL6LhgD9CaRZwh9r2ttw8o=; 
 b=LAUn4Uh0H7o734PI0POzqTK1uQVf3TQw8nSTUHtesGLayffLGGeQ8boo7bFuQpBGgCdCx1Kye+ClPbLwUC2qlJ2893ij//baGLSmFsN/vTsS/gNq4hTsL3qvBjU7+nZUUBwd04zMwcrpiLFEZsY/+x9doSoHYE/6TnneP6LyQ4s=;
X-UUID: 61252333c95a46239ac37484f25935c7-20200311
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1499125; Wed, 11 Mar 2020 05:01:49 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 06:02:19 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:01:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:00:54 +0800
Message-ID: <1583931705.29614.3.camel@mtksdaap41>
Subject: Re: [PATCH v11 0/5] arm/arm64: mediatek: Fix mt8173 mmsys device
 probing
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Wed, 11 Mar 2020 21:01:45 +0800
In-Reply-To: <20200311115614.1425528-1-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D0C530029DFB3D1C48B2A2ED83E49AE8D5F42442F09CD39392B33A38427356E82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_060200_969411_99E36C8E 
X-CRM114-Status: GOOD (  24.20  )
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 wens@csie.org, linux-arm-kernel@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 p.zabel@pengutronix.de, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

I'm confused this is v11 or v12.
For v12, you've lost some 'Acked-by' and 'Reviewed-by' tag.

Regards,
CK

On Wed, 2020-03-11 at 12:56 +0100, Enric Balletbo i Serra wrote:
> Dear all,
> 
> These patches are intended to solve an old standing issue on some
> Mediatek devices (mt8173, mt2701 and mt2712 are affected by this issue).
> 
> Up to now both drivers, clock and drm are probed with the same device tree
> compatible. But only the first driver gets probed, which in effect breaks
> graphics on those devices.
> 
> The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
> control clock gates (which is used in the clk driver) and some registers
> to set the routing and enable the differnet blocks of the display
> and MDP (Media Data Path) subsystem. On this series the clk driver is
> not a pure clock controller but a system controller that can provide
> access to the shared registers between the different drivers that need
> it (mediatek-drm and mediatek-mdp). Hence the MMSYS clk driver was moved
> to drivers/soc/mediatek and is the entry point (parent) which will trigger
> the probe of the corresponding mediatek-drm driver.
> 
> **IMPORTANT** This series only fixes the issue on mt8173 to make it
> simple and as is the only platform I can test. Similar changes should be
> applied for mt2701 and mt2712 to have display working.
> 
> These patches apply on top of linux-next.
> 
> For reference, here are the links to the old discussions:
> * v10: https://patchwork.kernel.org/project/linux-mediatek/list/?series=248505
> * v9: https://patchwork.kernel.org/project/linux-clk/list/?series=247591
> * v8: https://patchwork.kernel.org/project/linux-mediatek/list/?series=244891
> * v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
> * v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
> * v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
> * v4:
>   * https://patchwork.kernel.org/patch/10530871/
>   * https://patchwork.kernel.org/patch/10530883/
>   * https://patchwork.kernel.org/patch/10530885/
>   * https://patchwork.kernel.org/patch/10530911/
>   * https://patchwork.kernel.org/patch/10530913/
> * v3:
>   * https://patchwork.kernel.org/patch/10367857/
>   * https://patchwork.kernel.org/patch/10367861/
>   * https://patchwork.kernel.org/patch/10367877/
>   * https://patchwork.kernel.org/patch/10367875/
>   * https://patchwork.kernel.org/patch/10367885/
>   * https://patchwork.kernel.org/patch/10367883/
>   * https://patchwork.kernel.org/patch/10367889/
>   * https://patchwork.kernel.org/patch/10367907/
>   * https://patchwork.kernel.org/patch/10367909/
>   * https://patchwork.kernel.org/patch/10367905/
> * v2: No relevant discussion, see v3
> * v1:
>   * https://patchwork.kernel.org/patch/10016497/
>   * https://patchwork.kernel.org/patch/10016499/
>   * https://patchwork.kernel.org/patch/10016505/
>   * https://patchwork.kernel.org/patch/10016507/
> 
> Best regards,
>  Enric
> 
> Changes in v11:
> - Leave the clocks part in drivers/clk (clk-mt8173-mm)
> - Instantiate the clock driver from the mtk-mmsys driver.
> - Add default config option to not break anything.
> - Removed the Reviewed-by CK tag as changed the organization.
> 
> Changes in v10:
> - Update the binding documentation for the mmsys system controller.
> - Renamed to be generic mtk-mmsys
> - Add driver data support to be able to support diferent SoCs
> - Select CONFIG_MTK_MMSYS (CK)
> - Pass device pointer of mmsys device instead of config regs (CK)
> - Match driver data to get display routing.
> 
> Changes in v9:
> - Move mmsys to drivers/soc/mediatek (CK)
> - Introduced a new patch to move routing control into mmsys driver.
> - Removed the patch to use regmap as is not needed anymore.
> - Do not move the display routing from the drm driver (CK)
> 
> Changes in v8:
> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> - New patch introduced in this series.
> 
> Changes in v7:
> - Free clk_data->clks as well
> - Get rid of private data structure
> 
> Enric Balletbo i Serra (3):
>   dt-bindings: mediatek: Update mmsys binding to reflect it is a system
>     controller
>   soc / drm: mediatek: Move routing control to mmsys device
>   soc / drm: mediatek: Fix mediatek-drm device probing
> 
> Matthias Brugger (2):
>   drm/mediatek: Omit warning on probe defers
>   clk / soc: mediatek: Move mt8173 MMSYS to platform driver
> 
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  |   7 +-
>  drivers/clk/mediatek/Kconfig                  |   7 +
>  drivers/clk/mediatek/Makefile                 |   1 +
>  drivers/clk/mediatek/clk-mt8173-mm.c          | 146 ++++++++
>  drivers/clk/mediatek/clk-mt8173.c             | 104 ------
>  drivers/gpu/drm/mediatek/Kconfig              |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  12 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  19 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 259 +-------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  45 +--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
>  drivers/soc/mediatek/Kconfig                  |   8 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/mtk-mmsys.c              | 335 ++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h        |  20 ++
>  21 files changed, 590 insertions(+), 411 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
