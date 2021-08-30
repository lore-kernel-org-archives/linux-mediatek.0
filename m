Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C43CC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 15:06:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C9860462
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 15:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42C9860462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xigXLhHUUcfLhiwSXKTtpWPWSpQbO/R/bnLeOjgKKDI=; b=iWFL/7XNtoZ6ZM
	rBabXrVqVaBuif/bmECBK1VBApO6A5hhG7wo52ncLaBVlnw8cT/onoYxLZq7y+o0W5JVuX0xOEOJQ
	Q1NCeWIs1TxrV9QamerzHxQJfVl5rHMeVmJILlvuqir8rR+fz3Z8rp8dlFhjk2+qvmbe3WH+U3RjF
	g6tRAS3yU/754bsl5MfHqZW4vHtqW6yJxsmiCmqoWAZkgvKc1XpTL+KkuZrRxTIMDfzEdfuht+3i/
	Od1Yt+jgpkttjJXxtpKjAP5+bPcTgHV0IOVH/+A/UAaC0QIk9aDN8z0V5BfDlt7SkkPRa6QCsLZCW
	dZPeFeV4OHzJdOpylnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKir7-00HUw4-Q4; Mon, 30 Aug 2021 15:05:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKiqr-00HUrn-IU; Mon, 30 Aug 2021 15:05:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8D7E60F5C;
 Mon, 30 Aug 2021 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630335932;
 bh=+w96EgfxB/OnIF4TZZubblNzgSY24akfalBQTQOBFSQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kCwB0oJQhw9Sx58A5G93DB0VLM6imlaIM/sb/B7vDMY7X22XPdqQnS7BWCZ5Sqq6y
 Dq8la0BAuDSPiVjYNY6UBGJb2ScyD1ph+kvF7IyVV//+RDgNrUkvFhq784DXfF+I1Q
 0xCG0FaUen2RMwYJbNQ9TY3zYh3YTBOP7P7PYGPhwk6b3cVyo1UL3hwb9ELWPw58vt
 /tZ1Pfszrlnx2ouCcpZrhhsSRk0HVjq9R9L+tcuf8+uEEX1tDJkQOLDYDqbnpEL728
 pbGAx2Q0KhCCyCbEat8PcupTItksBdrDKJRwBM6Wgb1eDc/MQZ4CQIzmpw9657m+yI
 LN/w1gYFdT5yQ==
Received: by mail-ej1-f44.google.com with SMTP id u3so31731910ejz.1;
 Mon, 30 Aug 2021 08:05:32 -0700 (PDT)
X-Gm-Message-State: AOAM531GucwiIvlijLQ4Lcd3RfaDRnyKUpOCrbrWa0LYCGO+7fJePick
 SpHmfbHrokNKSj7x5E21qMMir20CUxT1UFC4Qw==
X-Google-Smtp-Source: ABdhPJyF3KMiFYr5oMzxYuwKYn4Ft/XJo6sPgysJQrJltM5HoP9Y3XlZs6D0letv4tX1E+fvnmMyrNrRlEjQqFfRe20=
X-Received: by 2002:a17:906:b4d:: with SMTP id
 v13mr26149139ejg.468.1630335931267; 
 Mon, 30 Aug 2021 08:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
 <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
In-Reply-To: <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Aug 2021 10:05:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
Message-ID: <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To: moudy ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com, 
 Sj Huang <sj.huang@mediatek.com>, ben.lok@mediatek.com, randy.wu@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>, Hsin-Yi Wang <hsinyi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_080533_685720_60A24757 
X-CRM114-Status: GOOD (  27.14  )
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

On Mon, Aug 30, 2021 at 2:58 AM moudy ho <moudy.ho@mediatek.com> wrote:
>
> On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> > On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > > a unit in multimedia system used for scaling and color format
> > > convert.
> > >
> > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > ---
> > >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> > >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > > ++++++++++++++++++
> > >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> > >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> > >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> > >  5 files changed, 471 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > ccorr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > ccorr.yaml
> > > new file mode 100644
> > > index 000000000000..59fd68b46022
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > ccorr.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> > >
> > > +$schema:
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> > >
> > > +
> > > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > > +  - Moudy Ho <moudy.ho@mediatek.com>
> > > +
> > > +description: |
> > > +  One of Media Data Path 3 (MDP3) components used to do color
> > > correction with 3X3 matrix.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +        - mediatek,mt8183-mdp3-ccorr
> > > +
> > > +  mediatek,mdp3-id:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    maxItems: 1
> > > +    description: |
> > > +      HW index to distinguish same functionality modules.
> >
> > If we wanted h/w indexes in DT, we'd have a standard property. Why
> > do
> > you need this?
> >
> I'm sorry not quite sure what HW indexes means (something like
> aliases?)

It means whatever you said in your description.

And no, I'm not suggesting you use aliases.

> It was originally used to mark multiple identical modules in the MDP
> data path algorithm, so that appropriate paths can be dynamically
> dispatched.

If they are identical, then why do you need to distinguish them in DT?
If there's some difference you need to know about such as connections
to other blocks, then describe that. Another common example is needing
to know what bits/registers to access in a syscon phandle. For that,
make the register offset or bits be args to the phandle property.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
