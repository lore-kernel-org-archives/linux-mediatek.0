Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DAFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 04:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNj5XFIxqPjNmmf4K6YcYs69qXvUy24AVHEK7o+lXos=; b=rI0U6Zsrtk9PoW
	i4zk5N9l5FekEA5vNBd3BMxJWRk8EYDMo2gl9HSskbUKbE0zDCKqiWpwtwdQDt06dr9cLGo01Mlz0
	wE1mO/BvXlT/A0laONrSMHuJnTNqHBBv3jwfHRBcqMtYx6L/E049QaWNSXlMtY6/831X3OXTtrS7w
	z6xvwdVVMJw+edtPPygpUNch2se00AJmt5xcvWU2AWtK0LONoda7+rxvJzH5qVjx/DvUXfZZ9KpSf
	u7xK0eX9nm+P2Sk6WfI4CsAH7q43B0cFE2L4VH0ENHWspe3g9zIomwlawSDhqK4T3sh/y+ux8yBqV
	+en70F/9u2wvj/2nae6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPd2O-005B1t-3Z; Thu, 03 Mar 2022 04:26:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPd28-005AzW-EO; Thu, 03 Mar 2022 04:25:49 +0000
X-UUID: 89548d6786f84010bd8ae16d90650c44-20220302
X-UUID: 89548d6786f84010bd8ae16d90650c44-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 429987662; Wed, 02 Mar 2022 21:25:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 20:25:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 12:25:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 12:25:22 +0800
Message-ID: <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
Subject: Re: [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Thu, 3 Mar 2022 12:25:22 +0800
In-Reply-To: <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_202544_533522_4679E689 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, nancy.lin@mediatek.com,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

Thanks for the reviews.

On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
> On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
> jason-jh.lin@mediatek.com> wrote:
> > 

[snip]

> > jason-jh.lin (12):
> >   dt-bindings: arm: mediatek: mmsys: add power and gce properties
> >   dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> >   dt-bindings: display: mediatek: disp: split each block to
> > individual
> >     yaml
> >   dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC
> > binding
> >   dt-bindings: display: mediatek: merge: add additional prop for
> > mt8195
> >   dt-bindings: display: mediatek: add mt8195 SoC binding for
> > vdosys0
> >   dt-bindings: arm: mediatek: move out common module from display
> > folder
> >   soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
> >   soc: mediatek: add mtk-mutex support for mt8195 vdosys0
> >   drm/mediatek: add DSC support for mediatek-drm
> >   drm/mediatek: add MERGE support for mediatek-drm
> >   drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
> > 
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
> >  .../display/mediatek/mediatek,disp.txt        | 219 --------------
> > --
> >  .../display/mediatek/mediatek,dither.yaml     |  76 ++++++
> >  .../display/mediatek/mediatek,dsc.yaml        |  71 +++++
> >  .../display/mediatek/mediatek,gamma.yaml      |  77 ++++++
> >  .../display/mediatek/mediatek,merge.yaml      | 106 ++++++++
> >  .../display/mediatek/mediatek,od.yaml         |  53 ++++
> >  .../display/mediatek/mediatek,ovl-2l.yaml     |  88 +++++++
> >  .../display/mediatek/mediatek,ovl.yaml        | 103 ++++++++
> >  .../display/mediatek/mediatek,postmask.yaml   |  69 +++++
> >  .../display/mediatek/mediatek,rdma.yaml       | 117 +++++++++
> >  .../display/mediatek/mediatek,split.yaml      |  58 +++++
> >  .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
> >  .../bindings/soc/mediatek/mediatek,aal.yaml   |  72 +++++
> >  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  46 +++-
> >  .../bindings/soc/mediatek/mediatek,color.yaml |  81 ++++++
> >  .../bindings/soc/mediatek/mediatek,mutex.yaml |  77 ++++++
> >  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  47 +++-
> >  drivers/gpu/drm/mediatek/Makefile             |   1 +
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 246
> > ++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 ++-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
> >  drivers/soc/mediatek/mt8195-mmsys.h           | 130 +++++++++
> >  drivers/soc/mediatek/mtk-mmsys.c              |  11 +
> >  drivers/soc/mediatek/mtk-mutex.c              | 103 +++++++-
> >  include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
> >  30 files changed, 1832 insertions(+), 233 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx
> > t
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> > yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam
> > l
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> > aml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y
> > aml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> > 2l.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> > l
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> > k.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> > ml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,split.y
> > aml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.ya
> > ml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
> >  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> Looks like this is in linux-next and now:
> 
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,aal.examp
> le.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,aal.examp
> le.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.exam
> ple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.exam
> ple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dither.ex
> ample.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dither.ex
> ample.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.
> example.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.
> example.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.exam
> ple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.exam
> ple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.exam
> ple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.exam
> ple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,od.exampl
> e.dts:24.30-31
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,od.exampl
> e.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,color.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,color.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
> mple.dts:35.50-51
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,split.exa
> mple.dts:24.35-36
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,split.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,merge.exa
> mple.dts:27.35-36
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,merge.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.exa
> mple.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.exa
> mple.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.examp
> le.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.examp
> le.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.example.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.example.dt.yaml]
> Error 1
> Error:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.examp
> le.dts:27.27-28
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.examp
> le.dt.yaml]
> Error 1
> 
> Please fix 'make dt_binding_check'.
> 
> Rob
-- 

I'll fix it at the next version.

Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
