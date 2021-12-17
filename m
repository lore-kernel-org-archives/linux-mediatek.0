Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 01:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fVvelWpRXgAKKT37D1YCxxdJbaVyeKQidgB+ybYBZsM=; b=MXMfWnI4HuQid4
	RFICO8WnleHSGcBRs1j3CSj9N3Mn9O6CuMvdzhmgQqnW7i/Ckw4bfBmX0/BnHQTddtB8WzHencbvJ
	1SEX89oc0Y3+H65lIBxeGsqyxlTEqb3mepD8sTA/Zs3U5uGB4YdKaR0f6ZvDLH+5WmT9tmQpf+sxL
	z4t7urMsScdkURVa6b3DL24MfZgBRy961KVw8oicfKchM9fwGM88KRapxf7ZssyMT+qocnvyKI9nu
	qN/JRbEFQ0x8m2/ZUvUGJx3HS+8pIHD64l7DbKex6tWMA6XknomZvOyC4BYn3oiWVfg5STw/ESaCB
	4ankObkvyOf/+tWMRjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my2UF-008HLh-94; Fri, 17 Dec 2021 01:56:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my2TL-008Gk1-0g; Fri, 17 Dec 2021 01:55:50 +0000
X-UUID: c1b402e0e89c446b9d0037f7b7766e73-20211216
X-UUID: c1b402e0e89c446b9d0037f7b7766e73-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 60877984; Thu, 16 Dec 2021 18:55:41 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 17:55:40 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Dec 2021 09:55:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Dec 2021 09:55:29 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v17,
 00/19] Support multi hardware decode using of_platform_populate
Date: Fri, 17 Dec 2021 09:55:11 +0800
Message-ID: <20211217015530.23720-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_175547_127203_7C232F8A 
X-CRM114-Status: GOOD (  26.25  )
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

This series adds support for multi hardware decode into mtk-vcodec, by first adding use
of_platform_populate to manage each hardware information: interrupt, clock, register
bases and power. Secondly add core work queue to deal with core hardware message,
at the same time, add msg queue for different hardware share messages. Lastly, the
architecture of different specs are not the same, using specs type to separate them.

This series has been tested with both MT8183 and MT8173. Decoding was working for both chips.

Patches 1~3 rewrite get register bases and power on/off interface.
Patches 4 export decoder pm interfaces.
Patches 5 add to support 8192.
Patch 6 support multi hardware.
Patch 7 separate video encoder and decoder document
Patch 8-17 add interfaces to support core hardware.
Patch 18-19 remove mtk_vcodec_release_dec/enc_pm interfaces.
---
changes compared with v16:
- fix build warning for patch 13.

changes compared with v15:
- add Reviewed-by for patch 10.

changes compared with v14:
- rebase to latest media stage.

changes compared with v13:
- change some function position in case of ko dependency for patch 15.
- add reviewed-by for patch 06/13/15.

changes compared with v12:
- fix comments from rob for patch 15.
- fix comments from steve for 06 and 13.

changes compared with v11:
- fix comments from AngeloGioacchino for patch 09~11/19.
- fix comments from steve for patch 03/19.

changes compared with v10:
- fix comments from tzung-bi for patch 06/19.
- add more detail information for hardware block diagram 15/19

changes compared with v9:
- need not to build ko, just export pm interfaces for patch 04/19.
- fix comments for patch 06/19

changes compared with v8:
- add new patch 18~19 to remove mtk_vcodec_release_de/enc_pm interfaces.
- fix spelling mistakes for patch 17/19
- fix yaml comments for patch 15/19

Changes compared with v7:
- add new patch 4 to build decoder pm file as module
- add new patch 5 to support 8192
- fix comments for patch 6/17
- change some logic for using work queue instead of create thread for core hardware decode for patch 10/17
- using work queue for hardware decode instead of create thread for patch 13/17
- add returen value for patch 14/17
- fix yaml check fail 15/17

Changes compared with v6:
- Use of_platform_populate to manage multi hardware, not component framework for patch 4/15
- Re-write dtsi document for hardware architecture changed for patch 13/15 -The dtsi will write like below in patch 13/15:
    vcodec_dec: vcodec_dec@16000000 {
        compatible = "mediatek,mt8192-vcodec-dec";
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;
        reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
        mediatek,scp = <&scp>;
        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
        vcodec_lat {
            compatible = "mediatek,mtk-vcodec-lat";
            reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
            reg-name = "reg-misc";
            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
                 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
                 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
                 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
                 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
                 <&topckgen CLK_TOP_MAINPLL_D4>;
            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
                  "vdec-vdec", "vdec-top";
            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
        };

        vcodec_core {
            compatible = "mediatek,mtk-vcodec-core";
            reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
            reg-names = "reg-misc";
            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
                 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
                 <&vdecsys CLK_VDEC_VDEC>,
                 <&vdecsys CLK_VDEC_LAT>,
                 <&vdecsys CLK_VDEC_LARB1>,
                 <&topckgen CLK_TOP_MAINPLL_D4>;
            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
                  "vdec-vdec", "vdec-top";
            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
        };
    };

Changes compared with v5:
- Add decoder hardware block diagram for patch 13/15

Changes compared with v4:
- Fix comments for patch 4/15
  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  Fix platform_set_drvdata.
- Fix build error for patch 9/15
- Add depend patch in case of error header file for patch 13/15

Changes compared with v3:
- Fix return value for patch 1/15
- Fix comments for patch 4/15
  > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
  Add prameter in pdata, for all platform will use compoent after mt8183

  >> +     if (dev->is_comp_supported) {
  >> +             ret = mtk_vcodec_init_master(dev);
  >> +             if (ret < 0)
  >> +                     goto err_component_match;
  >> +     } else {
  >> +             platform_set_drvdata(pdev, dev);
  >> +     }
  > + Has asked the same question in [1].  Why it removes the
  > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
  Must call component_master_add_with_match after platform_set_drvdata for component architecture.
- Fix yaml files check fail for patch 5/15
- Fix yaml file check fail for patch 14/15

Changes compared with v1:
- Fix many comments for patch 3/14
- Remove unnecessary code for patch 4/14
- Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
- Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
- Using yaml format to instead of txt file for patch 12/14

Yunfei Dong (19):
  media: mtk-vcodec: Get numbers of register bases from DT
  media: mtk-vcodec: Align vcodec wake up interrupt interface
  media: mtk-vcodec: Refactor vcodec pm interface
  media: mtk-vcodec: export decoder pm functions
  media: mtk-vcodec: Support MT8192
  media: mtk-vcodec: Add to support multi hardware decode
  dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
    dt-bindings
  media: mtk-vcodec: Use pure single core for MT8183
  media: mtk-vcodec: Add irq interface for multi hardware
  media: mtk-vcodec: Add msg queue feature for lat and core architecture
  media: mtk-vcodec: Generalize power and clock on/off interfaces
  media: mtk-vcodec: Add new interface to lock different hardware
  media: mtk-vcodec: Add work queue for core hardware decode
  media: mtk-vcodec: Support 34bits dma address for vdec
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
  media: mtk-vcodec: Add core dec and dec end ipi msg
  media: mtk-vcodec: Use codec type to separate different hardware
  media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
  media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm

 .../media/mediatek,vcodec-decoder.yaml        | 176 +++++++++++
 .../media/mediatek,vcodec-encoder.yaml        | 187 ++++++++++++
 .../media/mediatek,vcodec-subdev-decoder.yaml | 265 ++++++++++++++++
 .../bindings/media/mediatek-vcodec.txt        | 131 --------
 drivers/media/platform/mtk-vcodec/Makefile    |   6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 177 ++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 201 ++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  53 ++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 104 +++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  12 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   2 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  21 ++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  73 ++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  21 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |   3 +-
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  59 +++-
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 289 ++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 143 +++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
 34 files changed, 1800 insertions(+), 294 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
