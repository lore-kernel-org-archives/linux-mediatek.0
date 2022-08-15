Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51637C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oVsLLs6Bg4oTydvl/icM72CiYInRV1zOsDw1/gzWl8=; b=O7L6SRucZkyAOZ4uCBY4b00xPQ
	019RbtKTnSzQ45IEJ48dBRvwb1iSlbDyXuNhirD/UVp0GR3TkUt02RnzihA/avyKBPFIQ+VOmgkHK
	+eZ4JKRr3Hqls3cIwvHLj/O/2OHEnrJzSWP9xT4ZqxGNL1//Oz73XfvTlIl7Ylw2WzxB60FSodrVH
	/0pCIenlE/KKZ5jH4xrPNWjNUGF9xcA41lPM1y78w1YBFRUWcS6sKEj4caztE3PFJugBbp1pqJt2D
	2rJkDifdyqhbmV3AUbzVnIJz+cLSrxwAW5l1mew8ADQAc2s+4s5UvQku/iFLHq5gROZOTa4pEDLnX
	P4UJmoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNTi3-00C2kL-PM; Mon, 15 Aug 2022 06:36:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNThb-00C2X6-Jn; Mon, 15 Aug 2022 06:35:59 +0000
X-UUID: f767395cd6154d0f8e26f2aef3da0670-20220814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0oVsLLs6Bg4oTydvl/icM72CiYInRV1zOsDw1/gzWl8=;
	b=b1TZF60fI73azApmuMiKOOHfNOLdUDNdOqpXBwGYvj8oSvonTK6SyWY9AUxU2vJCfv9PFqwfPkVI62AniEd9F/LWj2zwTVUhbbJH7sWtBjrQ8hzoDNfYUPAv1Il+CaSf+uPG5529F7yd+7Z1WWapFC9MpjzdonK8bLnlSKYCnfs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:a06f7b86-73c8-4451-934e-2aa4cd834910,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:0ff6d2ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f767395cd6154d0f8e26f2aef3da0670-20220814
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1532883790; Sun, 14 Aug 2022 23:35:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 15 Aug 2022 14:34:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 15 Aug 2022 14:34:57 +0800
Message-ID: <f5a27f00c89cadfb4fd2347f35a9504f964a4205.camel@mediatek.com>
Subject: Re: [PATCH v25 0/7] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 15 Aug 2022 14:34:57 +0800
In-Reply-To: <20220804072827.22383-1-nancy.lin@mediatek.com>
References: <20220804072827.22383-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_233556_962178_FA1DB559 
X-CRM114-Status: GOOD (  30.81  )
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

On Thu, 2022-08-04 at 15:28 +0800, Nancy.Lin wrote:
> The hardware path of vdosys1 with DPTx output need to go through by
> several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add DRM and these modules support by the patches below:
> 
> Changes in v25:
> - rebase to next-20220803
> 
> Changes in v24:
> - fix ovl_adaptor binding issue (mtk_disp_ovl_adaptor.c)
>   - Since ovl_adaptor is an aggregated component, it should be
> bounded after
>     all its child components are bounded.
> - rebase to next-20220708
> 
> Changes in v23:
> - separate[7] mmsys/mutex and drm patches into two series
> 
> Changes in v22:
> - rebase to next-20220525
> - rebase to vdosys0 series v22
> - separate dts to a new patch
> 
> Changes in v21:
> - fix reviewer comment
>   - fix rdma and ethdr binding doc and dts
> 
> Changes in v20:
> - fix reviewer comment
>   - update mmsys update bit api name
>   - add mtk_mmsys_update_bits error message if lose gce property
>   - list all mt8195 vdosys1 reset bits
> 
> Changes in v19:
> - fix reviewer comment
>   - separate mt8195 mmsys component to a new patch
>   - separate mt8195 vdo0 and vdo1 routing table
>   - separate mmsys_write_reg api to a new patch and simplify write
> reg code
>   - separate mmsys 64 bit reset to a new patch
>   - separate mtk-mutex dp_intf1 component to a new patch
> 
> Changes in v18:
> - fix reviewer comment
>   - fix rdma binding doc
>   - fix ethdr binding doc
>   - refine mmsys config cmdq support
>   - refine merge reset control flow, get reset control in probe
> function
>   - add ethdr reset control error handling and remove dbg log
> - rebase to vdosys0 series v20 (ref [5])
> 
> Changes in v17:
> - fix reviewer comment in v16
>   - separate ovl adaptor comp in mtk-mmsys and mtk-mutex
>   - separate mmsys config API
>   - move mdp_rdma binding yaml
> - fix ovl adaptor pm runtime get sync timing issue
> - rebase to vdosys0 series v19 (ref [5])
> - rebase to [7] for modify vblank register change
> 
> Changes in v16:
> - fix reviewer comment in v 15
>   - fix mtk_drm_ddp_comp.c alignment
>   - fix vdosys0 mmsys num before adding vdosys1 patch
> 
> Changes in v15:
> - fix ethdr uppercase hex number in dts
> 
> Changes in v14:
> - remove MTK_MMSYS 64 bit dependency
> - add ethdr.yaml back and fix dt_schema check fail
> 
> Resend v13
> - add related maintainer in maillist
> 
> Changes in v13:
> - fix reviewer comment in v12
>   - fix rdma dt-binding format
>   - fix dts node naming
> - fix 32 bit build error
>   - modify 64bit dependency for mtk-mmsys
> - rebase to vdosys0 series v16. (ref [5])
> 
> Changes in v12:
> - fix reviewer comment in v11
>   - modify mbox index
>   - refine dma dev for ovl_adaptor sub driver
> 
> Changes in v11:
> - remove ethdr vblank spin lock
> - refine ovl_adaptor print message
> 
> Changes in v10:
> - refine ethdr reset control using
> devm_reset_control_array_get_optional_exclusive
> - fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue
> 
> Changes in v9:
> - rebase on kernel-5.16-rc1
> - rebase on vdosys0 series v13. (ref [5])
> - fix ovl_adaptor sub driver is brought up unintentionally
> - fix clang build test fail- duplicate ethdr/mdp_rdma
> init_module/cleanup_module symbol issue 
> 
> Changes in v8:
> - separate merge async reset to new patch.
> - separate drm ovl_adaptor sub driver to new patch.
> - fix reviewer comment in v7.
> 
> Changes in v7:
> - rebase on vdosys0 series v12 (ref[5])
> - add dma description in ethdr binding document.
> - refine vdosys1 bit definition of mmsys routing table.
> - separate merge modification into 3 pathces.
> - separate mutex modification into 2 patches.
> - add plane color coding for mdp_rdma csc.
> - move mdp_rdma pm control to ovl_adaptor.
> - fix reviewer comment in v6.
> 
> Changes in v6:
> - rebase on kernel-5.15-rc1.
> - change mbox label to gce0 for dts node of vdosys1.
> - modify mmsys reset num for mt8195.
> - rebase on vdosys0 series v10. (ref [5])
> - use drm to bring up ovl_adaptor driver.
> - move drm iommu/mutex check from kms init to drm bind.
> - modify rdma binding doc location.
> (Documentation/devicetree/bindings/arm/)
> - modify for reviewer's comment in v5.
> 
> Changes in v5:
> - add mmsys reset controller reference.
> 
> Changes in v4:
> - use merge common driver for merge1~4.
> - refine ovl_adaptor rdma driver.
> - use ovl_adaptor ddp_comp function instead of ethdr.
> - modify for reviewer's comment in v3.
> 
> Changes in v3:
> - modify for reviewer's comment in v2.
> - add vdosys1 2 pixels align limit.
> - add mixer odd offset support.
> 
> Changes in v2:
> - Merge PSEUDO_OVL and ETHDR into one DRM component.
> - Add mmsys config API for vdosys1 hardware setting.
> - Add mmsys reset control using linux reset framework.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> 
> This series are based on the following patch:
> [1] arm64: dts: Add mediatek SoC mt8195 and evaluation board
>     20220112114724.1953-4-tinghan.shen@mediatek.com
> [2] arm64: dts: mt8195: add IOMMU and smi nodes
>     20210615173233.26682-15-tinghan.shen@mediatek.com
> [3] [v2] arm64: dts: mt8195: add display node for vdosys0
>     20220225021535.2655-1-jason-jh.lin@mediatek.com
> [4] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>     20220407075726.17771-2-yong.wu@mediatek.com
> [5] Add MediaTek SoC DRM (vdosys1) support for mt8195
>     20220526110233.20080-1-nancy.lin@mediatek.com
> 
> Nancy.Lin (7):
>   dt-bindings: mediatek: add ethdr definition for mt8195
>   drm/mediatek: add ETHDR support for MT8195
>   drm/mediatek: add ovl_adaptor support for MT8195
>   drm/mediatek: add dma dev get function
>   drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
>   drm/mediatek: add drm ovl_adaptor sub driver for MT8195
>   drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
> 
>  .../display/mediatek/mediatek,ethdr.yaml      | 188 +++++++
>  drivers/gpu/drm/mediatek/Makefile             |   2 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  26 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 528
> ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  96 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 129 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  58 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 359 ++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  24 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          | 370 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  26 +
>  12 files changed, 1615 insertions(+), 197 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yam
> l
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h

Hello all,

Because Kernel 6.0-rc1 is released, I re-test this series.
I use dp series [1] to test this mmsys series because this series is
used to control external display.

In my test, I can do modtest of these mode for DP and it passed.
Whole series again for 6.0-rc1:
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

  #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
flags: phsync, pvsync; type: preferred, driver
  #1 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352
flags: phsync, pvsync; type: driver
  #2 1920x1080 50.00 1920 2448 2492 2640 1080 1084 1089 1125 148500
flags: phsync, pvsync; type: driver
  #3 1680x1050 59.95 1680 1784 1960 2240 1050 1053 1059 1089 146250
flags: nhsync, pvsync; type: driver
  #4 1600x900 60.00 1600 1624 1704 1800 900 901 904 1000 108000 flags:
phsync, pvsync; type: driver
  #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000
flags: phsync, pvsync; type: driver
  #6 1280x800 59.81 1280 1352 1480 1680 800 803 809 831 83500 flags:
nhsync, pvsync; type: driver
  #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags:
phsync, pvsync; type: driver
  #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags:
phsync, pvsync; type: driver
  #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags:
phsync, pvsync; type: driver
  #10 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags:
nhsync, nvsync; type: driver
  #11 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags:
phsync, pvsync; type: driver
  #12 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags:
nhsync, nvsync; type: driver
  #13 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags:
nhsync, nvsync; type: driver
  #14 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags:
nhsync, nvsync; type: driver
  #15 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags:
nhsync, nvsync; type: driver
  #16 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags:
nhsync, nvsync; type: driver

[1]:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=665597

BRs,
Bo-Chen


