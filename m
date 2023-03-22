Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628D8C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9cJfdorQT4ZAKhTUEbAiYIOUdjz/eoig7w+VvZSStw=; b=4CijLyq8PfAZ/rNg0KNFsB9h/F
	qzTO0fJNCi3JQZnh7jqjwACw/HXQEYaHoJeU4/KsamB/wWjIpYEzKhkcdA9yuXmaLxFKyBG1jp79G
	WrmJXXRqTCLy7cvo9srfmOE0C/c7weibteA3V6cOPDdec+tCIJuQ+P1H3/VFMl49RE+P+9yLzeE+X
	lFMEI7JnFp0dpqsHuJKoNhkGS19jmzhXRvzL54dJARSaKoqisJ+iJyQWpR2D1rNHciYytIuKdE5o/
	M33MOzkGYe4zWaFhwO8/+t4glkLzSBv+vyEBfA51r/sLNGgCPdsv6fRLHhXtuFYKt9xXFuul2wQSi
	oIWDaCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1gU-00GjIa-0J;
	Wed, 22 Mar 2023 16:51:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1gO-00GjGK-05;
	Wed, 22 Mar 2023 16:51:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3766A621DD;
	Wed, 22 Mar 2023 16:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC45C433A4;
	Wed, 22 Mar 2023 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679503885;
	bh=6GNEDWgr7VVRz7NPm97DxehnVfnk+0fq8yASr93HUOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZE7hjmj2+QRS2dZjZsPm8jjIaRYkQ2pHY7E84wzEmDGUgfTQvHr3iAb2YvIRtfhf2
	 uCVnDTp9GOpyIeyysyzaiWkGNJLT4AA95TJW4fvdiIJIb8FP7yK04pODHQhqC2U4Hl
	 k9ezrKOcT5Wb/eyj62goNFkRFqIrskIHi8qbKGHc46xbMt/VJJhJMVP8WA0v9bUqAS
	 OtaSdtKd7NAMrAZLjNdNIvKG7WHlU3CJDwtOvbyB7KaRa0Psvg2WUEP4aS27fLZ/tJ
	 Jm2X8W2MN/IuuSDjqWRScWb8XY6AkTY9KY8K9fvS6zObIAeOoxQet1LuivQffQ46EM
	 bbTsOdSHwWIZw==
Received: by mail-lj1-f180.google.com with SMTP id t14so19643230ljd.5;
        Wed, 22 Mar 2023 09:51:25 -0700 (PDT)
X-Gm-Message-State: AO0yUKXYYIhHTcaKQ8pgvg/8hX5AxYfSbgFRm/PEupsujbUr3SWKB4bA
	Xsm/sMgL1OdeW6WJrs1KyCkn6BcGhyIDyjx61A==
X-Google-Smtp-Source: AK7set/Nxa14TE9o0KQWv+emcZPWRAYwWy2WPZI53bEe9owida1TfXWTT2bMHIbAdLTtnJOH/QRwHHJ+in1FHkctNRU=
X-Received: by 2002:a2e:901a:0:b0:299:aa7a:94c8 with SMTP id
 h26-20020a2e901a000000b00299aa7a94c8mr2204792ljg.10.1679503883593; Wed, 22
 Mar 2023 09:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
In-Reply-To: <20230321121859.2355-1-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Mar 2023 00:51:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-XSBDZqo5jPgq+kP3sQrGnSR9Srhq5asu0QyDOeUoSOA@mail.gmail.com>
Message-ID: <CAAOTY_-XSBDZqo5jPgq+kP3sQrGnSR9Srhq5asu0QyDOeUoSOA@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	krzysztof.kozlowski+dt@linaro.org, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, clang-built-linux@googlegroups.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_095128_139885_E29587DD 
X-CRM114-Status: GOOD (  31.31  )
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The hardware path of vdosys1 with DPTx output need to go through by sever=
al modules, such as, OVL_ADAPTOR and MERGE.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Add DRM and these modules support by the patches below:
>
> Changes in v30:
> - rebase to next-20230321
> - fix ethdr dt_binding_check message
>
> Changes in v29:
> - rebase to next-20221226
> - fix reviewer comment in v28
>   - keep original flow if comp node not found in mtk_drm_crtc_create()
>
> Changes in v28:
> - rebase to next-20221107
> - fix reviewer comment in v27
>   - extra new line at the end mtk_ethdr.h
>
> Changes in v27:
> - rebase to next-20221102
> - change mmsys compatible for mt8195 vdosys1
>   - base on jason's series[ref 1]
> - fix reviewer comment
>   - add error return code if no ovl_adaptor's comp found
>
> Changes in v26:
> - rebase to next-20220819
> - resend for patch corrupted in v25
>
> Changes in v25:
> - rebase to next-20220803
>
> Changes in v24:
> - fix ovl_adaptor binding issue (mtk_disp_ovl_adaptor.c)
>   - Since ovl_adaptor is an aggregated component, it should be bounded af=
ter
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
>   - separate mmsys_write_reg api to a new patch and simplify write reg co=
de
>   - separate mmsys 64 bit reset to a new patch
>   - separate mtk-mutex dp_intf1 component to a new patch
>
> Changes in v18:
> - fix reviewer comment
>   - fix rdma binding doc
>   - fix ethdr binding doc
>   - refine mmsys config cmdq support
>   - refine merge reset control flow, get reset control in probe function
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
> - refine ethdr reset control using devm_reset_control_array_get_optional_=
exclusive
> - fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue
>
> Changes in v9:
> - rebase on kernel-5.16-rc1
> - rebase on vdosys0 series v13. (ref [5])
> - fix ovl_adaptor sub driver is brought up unintentionally
> - fix clang build test fail- duplicate ethdr/mdp_rdma init_module/cleanup=
_module symbol issue
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
> - modify rdma binding doc location. (Documentation/devicetree/bindings/ar=
m/)
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
> [1] Change mmsys compatible for mt8195 mediatek-drm
>     20221126101220.18179-1-jason-jh.lin@mediatek.com
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
>  .../display/mediatek/mediatek,ethdr.yaml      | 182 ++++++
>  drivers/gpu/drm/mediatek/Makefile             |   2 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  26 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 533 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  85 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 129 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  58 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 366 ++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  24 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          | 370 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  25 +
>  12 files changed, 1618 insertions(+), 188 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ethdr.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
>
> --
> 2.18.0
>

