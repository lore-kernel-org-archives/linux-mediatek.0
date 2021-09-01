Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4B8C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F58560F4B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F58560F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT+AFpvX13+LLKFwHmqc7yN2Ch7utYBFc01SlxQEwhs=; b=rWLPAE+5OUYHaR
	BwDhIvMX+3EakI6WDvHKkmBaG5oQxtglLuyhJ4qAx9Ojn2awiIc24wwfLV72xa/rMEsSoNuIU9bSH
	DxVnXoI2Gjh6WYu0ziJIl4I9KtF0jw4me4Ypfl6DnJH2fcz+N/4aLK4wiZO8Pl6n6bbvrZvSF9Tfg
	HdmH7a90gX2haKimitibcK+XVuIMOkvDmD8zuUrTxW+ybAKB8spcsb56r41UYOCSnpahQBSuAAIh8
	M30zKRrDr675Uw+zt0qwdD5Wz14B6jgyOXPYfTNwyKfUL7eHdZG1PAF0ZvIYAR4QxO7dcAnB5Gcjy
	AQSoD8I7IZ0fRTM/hQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOCQ-005VgQ-Uv; Wed, 01 Sep 2021 11:14:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLNID-005Add-Uj
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 10:16:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id m28so5309090lfj.6
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Sep 2021 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=729GdT2MAhx/jAkVDNeGvCJtX9tbrZQ8mIDJwfE61ws=;
 b=TsbNK53CZn8ef5BEtVqTZyY/QDW8Rq4bPoXqq311KEaLylPbm35GPM9rS4+xye8UcH
 lIILdVPttftswk9PX0ZAsCjLZtKtqLoNdXChK9JCKAJm8Y/XoCjVdQHOqPO75UOli1ey
 8KKDxOap/6WYDNgiMTqySf7cXWC/ufsRxAWdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=729GdT2MAhx/jAkVDNeGvCJtX9tbrZQ8mIDJwfE61ws=;
 b=O/WVmYMHg1JO2R37r5RCfuc+JxvpJsQPfz89qZLxNrDEpXvcT3nOmuymY0ENQq2d/P
 D8STw3dcUqRcu36Yf4pwuLhHSBwPA+Ewl6i712VYL/GHM5mB8axaGPnaKB+SKwYVAv46
 QZp/NwDt5EkT080ApUQ39HrE4vRHxcqrf58HXPfscTucoI2m94KqPSUZfJeoOy/ScS89
 OJ4wlMMZVq7epeUszTsI49OK8s+rRa5wxMN8Mj4+0O3ufd5agqjMFBYFUzqiu2j1O59j
 I3nIhd0XgYAbuxDVA3Rx/DGuk7EwqMj8oIzExCgPAC9TW1PdbSSZBSYVDLQ5UGcv+GWy
 sQlQ==
X-Gm-Message-State: AOAM531U/MgblhP9DPfmvhl7RnlxJYI8Z4Kw+GKT1wmynU2MtuMjJ7Rb
 6hEWrZvXV5fNFIBQQjyKYBTovZayNdazn9JDnx4KFA==
X-Google-Smtp-Source: ABdhPJzaTQkdiTWOurV0MnyL5l8QjDiVDjzLfxezvLdsHxF6QsQIIMyf5M3YfDpHJWqLL0lbsbOs8FiJmtRBVKXRcv0=
X-Received: by 2002:a05:6512:318a:: with SMTP id
 i10mr3805568lfe.444.1630491388108; 
 Wed, 01 Sep 2021 03:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
 <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
 <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
 <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
In-Reply-To: <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Sep 2021 18:16:16 +0800
Message-ID: <CAGXv+5GtDNwKpXEnont+UshVrSugQnTPyNF7VF3dVzTX9ruNdw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To: moudy ho <moudy.ho@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maoguang Meng <maoguang.meng@mediatek.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com, 
 Sj Huang <sj.huang@mediatek.com>, ben.lok@mediatek.com, 
 Randy Wu <randy.wu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Hsin-Yi Wang <hsinyi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_031630_078113_7ABB1A58 
X-CRM114-Status: GOOD (  38.16  )
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

On Wed, Sep 1, 2021 at 5:04 PM moudy ho <moudy.ho@mediatek.com> wrote:
>
> On Mon, 2021-08-30 at 10:05 -0500, Rob Herring wrote:
> > On Mon, Aug 30, 2021 at 2:58 AM moudy ho <moudy.ho@mediatek.com>
> > wrote:
> > >
> > > On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> > > > On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > > > > This patch adds DT binding document for Media Data Path 3
> > > > > (MDP3)
> > > > > a unit in multimedia system used for scaling and color format
> > > > > convert.
> > > > >
> > > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > > ---
> > > > >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> > > > >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > > > > ++++++++++++++++++
> > > > >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> > > > >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> > > > >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> > > > >  5 files changed, 471 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..59fd68b46022
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > ccorr.yaml
> > > > > @@ -0,0 +1,57 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id:
> > > > >
> https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> > > > >
> > > > > +$schema:
> > > > >
> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> > > > >
> > > > > +
> > > > > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > > > > +  - Moudy Ho <moudy.ho@mediatek.com>
> > > > > +
> > > > > +description: |
> > > > > +  One of Media Data Path 3 (MDP3) components used to do color
> > > > > correction with 3X3 matrix.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - enum:
> > > > > +        - mediatek,mt8183-mdp3-ccorr
> > > > > +
> > > > > +  mediatek,mdp3-id:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    maxItems: 1
> > > > > +    description: |
> > > > > +      HW index to distinguish same functionality modules.
> > > >
> > > > If we wanted h/w indexes in DT, we'd have a standard property.
> > > > Why
> > > > do
> > > > you need this?
> > > >
> > >
> > > I'm sorry not quite sure what HW indexes means (something like
> > > aliases?)
> >
> > It means whatever you said in your description.
> >
> > And no, I'm not suggesting you use aliases.
>
> Sorry for the inaccuracy described here, the comment i mentioned before
> should be "standard property" instead of "HW index".
>
> > > It was originally used to mark multiple identical modules in the
> > > MDP
> > > data path algorithm, so that appropriate paths can be dynamically
> > > dispatched.
> >
> > If they are identical, then why do you need to distinguish them in
> > DT?
> > If there's some difference you need to know about such as connections
> > to other blocks, then describe that. Another common example is
> > needing
> > to know what bits/registers to access in a syscon phandle. For that,
> > make the register offset or bits be args to the phandle property.
> >
> > Rob
>
> Integrating the previous discussion, maybe I can revise the description
> to the following:
>     description: |
>       There may be multiple blocks with the same function but different
>       addresses in MDP3. In order to distinguish the connection with
>       other blocks, a unique ID is needed to dynamically use one or
>       more identical blocks to implement multiple pipelines.

With display pipelines it is common to describe the pipeline with an OF
graph. With the pipeline drawn out, you also get ways to derive identifiers
for otherwise identical blocks, such as from port IDs.

See Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
and arch/arm/boot/dts/sun9i-a80.dtsi for such an example.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
