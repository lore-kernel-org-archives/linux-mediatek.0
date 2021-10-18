Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 19:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A0360EB8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 19:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03A0360EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZ2MGSNp1mKShMf9MIHKZbzeU62aJ9GrJ5TEtGhy28g=; b=Srxf3tGgSuhOvA
	cnD9kYLnAPqfBGhY/g/0TX+aiMGXuR+dbsgINXNzG0rliczs9ztztUGrzn7zNHUZVcH8jotIutlh/
	0hvEmuk6qe6n/UBbSkspKjob9NkqBNEqvFoJl3MznU3Y4DQfnm4jZBguDtANtq5xVV6q7zviMGCGr
	FnLHIer/jaR2uBPye7olMKOKhluIhvasdxqFec7hCUKdd+o3wrOiIIeboQmTE+lLrChd8cNrGIRtc
	8qRW15+FuWS1VpfSaPAxkMOlbgDmqySOAD4wJLoU1s2ipNfdQ9xw/LGCo1EL8x9yNNDXVAigAtYMV
	vLQTSihbP3i7Irk5Xo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcYd9-00H7vP-Vq; Mon, 18 Oct 2021 19:49:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcYT9-00H3bi-0K; Mon, 18 Oct 2021 19:38:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F6BC6108E;
 Mon, 18 Oct 2021 19:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634585926;
 bh=+lafo2T6te+gWjhQBzL22he7ufSIIGdZoxOzENsqwDw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DzmUOv7eA69aFSAJKeAC/hNoZLKjM2sZMrV0TtnTaTD/zwPjJ5Nk8+Kht0mrv/ZAg
 H0O1rbvyBt1m6AfDD6EIPjiaaFctaa633hxpF0s5GgAZfH/QCzSIn8rb5uopWlKnyt
 5LpOCr3AmgohKZILQLjuCGeOEkf24qrzHXSbP7dL+LIbCTniCCkB0l3j/gUl0O5JrT
 SlDVt/l4r2Wy/5s4FbFDLAcWGICUKGff3KxenybdtbiBaczpduXXbQ9mD1LK95HA1Q
 wgn4rF32c9j6alhETh37ZUHokI1nwvvbjqPokiLRMIwrXV25QaW48q7xMeRL08xeUa
 90TTSaV28OfuA==
Received: by mail-ed1-f47.google.com with SMTP id w19so3310686edd.2;
 Mon, 18 Oct 2021 12:38:46 -0700 (PDT)
X-Gm-Message-State: AOAM530Q/WMMnBR4p9C+98k/+gy5qWQZ/ubY0t+eR6VHvm/YuCO0klEm
 yX6gJsblns4c2UhPeKgnmSJV4qMf6KKhrxvlVg==
X-Google-Smtp-Source: ABdhPJzGdFAfWjzAMWuADPM5EPYzjfE9/sFvO9OlTDhrOb2mbL6H+KG2sXfvp8vOCsyn0d1W4fqaY0LBzO34Ejzirnc=
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr46194930edb.318.1634585925034; 
 Mon, 18 Oct 2021 12:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
 <YWTaJOXGgF2bHznv@robh.at.kernel.org> <20211018141908.fuevv2m66fw3xg36@blmsp>
In-Reply-To: <20211018141908.fuevv2m66fw3xg36@blmsp>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Oct 2021 14:38:33 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+QwEPNEztD+yg-UO8gWf_X=E-n0_HMYJsGxteZAZparg@mail.gmail.com>
Message-ID: <CAL_Jsq+QwEPNEztD+yg-UO8gWf_X=E-n0_HMYJsGxteZAZparg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_123847_119088_C6EC4898 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, Oct 18, 2021 at 9:19 AM Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi Rob,
>
> On Mon, Oct 11, 2021 at 07:43:16PM -0500, Rob Herring wrote:
> > On Mon, Oct 11, 2021 at 11:46:19AM +0200, Markus Schneider-Pargmann wrote:
> > > This controller is present on several mediatek hardware. Currently
> > > mt8195 and mt8395 have this controller without a functional difference,
> > > so only one compatible field is added.
> > >
> > > The controller can have two forms, as a normal display port and as an
> > > embedded display port.
> > >
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > ---
> > >  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > new file mode 100644
> > > index 000000000000..f7a35962c23b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek Display Port Controller
> > > +
> > > +maintainers:
> > > +  - CK Hu <ck.hu@mediatek.com>
> > > +  - Jitao shi <jitao.shi@mediatek.com>
> > > +
> > > +description: |
> > > +  Device tree bindings for the Mediatek (embedded) Display Port controller
> > > +  present on some Mediatek SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8195-edp_tx
> > > +      - mediatek,mt8195-dp_tx
> >
> > Are these blocks different?
>
> Good point, the registers of these blocks are described in its own
> chapter each. Also I do need to distinguish between both in the driver.
> Would you suggest making this distinction differently or keep it as two
> compatibles?

If the registers are all the same, then it should be the same
compatible. If you still need to distinguish, then you should have a
panel or connector node that will let you do that.

Also, s/_/-/ in the compatible string.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
