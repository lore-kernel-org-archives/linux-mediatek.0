Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDBDC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 14:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E5761220
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 14:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86E5761220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DHnxrUsUnUPpONJWESQLWwX1w7bs9Q7nOVPo5WnmLY=; b=JxjavNNz/Gei0U
	pAn/AgPol4OFqkFcs/Mr4QsZPMKGJ8zp/ZyE1CbMdXdLQl7RDnhbbzw90aA+YKHEKoLWifi6C8QUr
	8AOscfBzyf1iy2lS7VMHRz2+Ft6Qd7hLsbCBeCYIypHFzJB+Kc5o9fCVR9Ak8EaWoXNB0PxDdDjy9
	ZFo0LEWpbmJe6xGs6vzYof0sly/tIRewZqCaQNE3D2WcYJeZoA/cLaxEbmhAKzAY25jKX8T6Utgof
	5bRBpS4vynCc8Lc8NA2OzZSaTtXmRrsSFS2m9KVaJCRe0fhFN+8ORb+NPJKHSepLGMaKR1zuTm78H
	PIQhPnTGqUaEGxrynEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIXgB-003a7u-Qv; Tue, 24 Aug 2021 14:45:31 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIXfO-003ZtV-O7; Tue, 24 Aug 2021 14:44:47 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so46775812oti.0; 
 Tue, 24 Aug 2021 07:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aJH/4Wz71I23MU2srknICQJ9rD7Y4ljj2of9b/CEP0E=;
 b=A8kKDe7f57W2f7eBBaHBvZJnX4H5tPYH+5qN6jdps/vhmhvGENlwGqWTZyrupsLzeJ
 o+IqSp3P/R4oXSu0h5kLSTBjFNuvhgMF2z0M5c8paqbICvPiMvfW16OhJuB4TvZPs1YZ
 LAjBtN/0rmt1mh1dh0Bri/hipW/J7Ego07vqaiGusoqjnkD0nV68VFm73IVS8L7/qGlV
 +N1nhInZM+VSMJBNAuwUbZH/fMW+d49YB/zOr/WcSmcfe/jHbNVDO2Qir3ALSk7Lfg2l
 JS+KddnE8HDbb/cVf4K8rRsOyJDtWo87aqNWXryvHQIzTwyRunDijuPYgfxkZvLqB4Fx
 Pfew==
X-Gm-Message-State: AOAM531kfxa8ja6q9FLNGuq1SjmT5Moqx6mdv9/48b56Qh9WQpY+0y9V
 bWLL34UGakFDkhAbRPHjcw==
X-Google-Smtp-Source: ABdhPJy6vDSJt+2Ck3xeOse/ZCrzza/jwGRdp/B+jAHApeYlfASuRvLwRR/YsKxDPNWiiIv9Vr8qpg==
X-Received: by 2002:a9d:798c:: with SMTP id h12mr28578498otm.215.1629816282067; 
 Tue, 24 Aug 2021 07:44:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t1sm4592857otp.9.2021.08.24.07.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:44:41 -0700 (PDT)
Received: (nullmailer pid 416238 invoked by uid 1000);
 Tue, 24 Aug 2021 14:44:40 -0000
Date: Tue, 24 Aug 2021 09:44:39 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [v2 01/24] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8195 clock
Message-ID: <YSUF18AZ2HgOnkce@robh.at.kernel.org>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-2-chun-jie.chen@mediatek.com>
 <CAGXv+5FAEFD+dQsZzyZOzmwDDnwLZO3Z8wv8Z-=wVYdjjc3FYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXv+5FAEFD+dQsZzyZOzmwDDnwLZO3Z8wv8Z-=wVYdjjc3FYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_074442_834316_E781A9C0 
X-CRM114-Status: GOOD (  19.23  )
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

On Mon, Aug 23, 2021 at 02:53:34PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Fri, Aug 20, 2021 at 7:17 PM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> >
> > This patch adds the new binding documentation for system clock
> > and functional clock on Mediatek MT8195.
> >
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,mt8195-clock.yaml   | 254 ++++++++++++++++++
> >  .../mediatek/mediatek,mt8195-sys-clock.yaml   |  73 +++++
> >  2 files changed, 327 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> > new file mode 100644
> > index 000000000000..17fcbb45d121
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> > @@ -0,0 +1,254 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: MediaTek Functional Clock Controller for MT8195
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> > +  The clock architecture in Mediatek like below
> > +  PLLs -->
> > +          dividers -->
> > +                      muxes
> > +                           -->
> > +                              clock gate
> > +
> > +  The devices except apusys_pll provide clock gate control in different IP blocks.
> > +  The apusys_pll provides Plls which generated from SoC 26m for AI Processing Unit.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8195-scp_adsp
> > +          - mediatek,mt8195-imp_iic_wrap_s
> > +          - mediatek,mt8195-imp_iic_wrap_w
> > +          - mediatek,mt8195-mfgcfg
> > +          - mediatek,mt8195-vppsys0
> > +          - mediatek,mt8195-wpesys
> > +          - mediatek,mt8195-wpesys_vpp0
> > +          - mediatek,mt8195-wpesys_vpp1
> > +          - mediatek,mt8195-vppsys1
> > +          - mediatek,mt8195-imgsys
> > +          - mediatek,mt8195-imgsys1_dip_top
> > +          - mediatek,mt8195-imgsys1_dip_nr
> > +          - mediatek,mt8195-imgsys1_wpe
> > +          - mediatek,mt8195-ipesys
> > +          - mediatek,mt8195-camsys
> > +          - mediatek,mt8195-camsys_rawa
> > +          - mediatek,mt8195-camsys_yuva
> > +          - mediatek,mt8195-camsys_rawb
> > +          - mediatek,mt8195-camsys_yuvb
> > +          - mediatek,mt8195-camsys_mraw
> > +          - mediatek,mt8195-ccusys
> > +          - mediatek,mt8195-vdecsys_soc
> > +          - mediatek,mt8195-vdecsys
> > +          - mediatek,mt8195-vdecsys_core1
> > +          - mediatek,mt8195-vencsys
> > +          - mediatek,mt8195-vencsys_core1
> > +          - mediatek,mt8195-apusys_pll
> 
> The indentation is slightly off by 2 extra spaces.

No it's not. Indentation is always 2 more that the prior keyword. If in 
doubt, make sure yamllint is installed and this is checked as part of 
the build.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
