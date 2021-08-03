Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E97C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F9860F94
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F9860F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL2gqTXC0wl8s3CbK6jFSDp6jMl2uSyh/iJZlhGSXlA=; b=LTyNEZfvycsJBx
	vhqkiu8vtr5z9xw3UmZiRFkNh2eB7UDaXzuYQfybpv39xwYfakq9KZ+TpO/RtYE8si3le91tiPQhN
	+XO8T7fbjX6B2SjQPDonKqtTPuDMLfgIFk720jMpNtCk53mvIqpH6m0J8gW5WtGNC4fH0LJjZTO93
	D1gWNERFpbTtxMB9/rzpFCB/Ftek6gHiBD1jHPKNBuyCfjaITGFc1dWdArBV5L8xDPx/p6H0C+OBo
	vltn2+JpWrNpuCNcFBu9p5bLnRKvqndtCpK9iwbMbEKao7LHUIOmPoP351g7/3K7XXQBx+6U7zNVk
	1bkpknuzci6bqyCJmCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAvp7-003IHA-Qk; Tue, 03 Aug 2021 14:55:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAvou-003IEz-Io; Tue, 03 Aug 2021 14:55:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF42060F58;
 Tue,  3 Aug 2021 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628002503;
 bh=DRuO5cfsBSAF+iYWFud7iNIH4PmO8sgoaJdiS0nJyGo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tH973fCua+p9oBH6RvfFvQbdSi2vNr/Rp2EDqcYJ3u/fN0Pfff+HAtHBvsec8IwB8
 yRXp3m6wMZDvbiiK26MH09JvMwy5KNIg//hZzbPpiP3mUV2UXm3M/1iHzCwkpMPx/P
 k0LxD16I3oT0w122yfFd1GvMMP4/pLYe4ZVpqRLWq9+75fgicATh5X5hK3q5TuucNl
 DNaCyD3y5xTh5q4y0Yp6KnPykWboe1BwbsiFVFEEn5L0R4ELkN9+3dI+HEeEPT/rfR
 bCRuyxciaI8ry0bcs8XVRMcSpJt9HV9P+q8rOFKrr6p8a5jtWTIusOl5hhPj7tECp1
 DSdDZ+zlrx9tA==
Received: by mail-ed1-f47.google.com with SMTP id ec13so28828103edb.0;
 Tue, 03 Aug 2021 07:55:03 -0700 (PDT)
X-Gm-Message-State: AOAM5312Tx4gHF0Y2CYcscuJSOS5oeak5t3Hxyxk6qeoOISIWbn5ZonD
 ybpac2q14otsl6iEYUQCm07Dn552j7lroLDZMg==
X-Google-Smtp-Source: ABdhPJx1mfvWAIa8Gzwj7redo7OPRL41TR54YoEAvn/Pb97SizGwd3m59UMsPWWCkCPr5eL+6Ekyw1g8j/oB9veO4yA=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr26400510edt.194.1628002502460; 
 Tue, 03 Aug 2021 07:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051318.2570994-1-hsinyi@chromium.org>
 <20210803051318.2570994-3-hsinyi@chromium.org>
 <1627999172.502726.3179055.nullmailer@robh.at.kernel.org>
In-Reply-To: <1627999172.502726.3179055.nullmailer@robh.at.kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 Aug 2021 08:54:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOppSJx+rNvqtz9LGM_GFwjy9xCF1+On3-K1b8fOmuyg@mail.gmail.com>
Message-ID: <CAL_JsqJOppSJx+rNvqtz9LGM_GFwjy9xCF1+On3-K1b8fOmuyg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: convert pinctrl to yaml
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree@vger.kernel.org, Andy Teng <andy.teng@mediatek.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_075504_698118_79121391 
X-CRM114-Status: GOOD (  15.70  )
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

On Tue, Aug 3, 2021 at 7:59 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 03 Aug 2021 13:13:19 +0800, Hsin-Yi Wang wrote:
> > Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v2->v3:
> > fix comments in v2.
> > ---
> >  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
> >  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
> >  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 373 +++++++++++++
> >  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
> >  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
> >  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
> >  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
> >  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
> >  8 files changed, 980 insertions(+), 861 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt8183-pinfunc.h: No such file or directory
>    21 |         #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1419: dt_binding_check] Error 2
> \ndoc reference errors (make refcheckdocs):
> MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> MAINTAINERS: Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt

Not sure why the header patch is not getting applied, so ignore that.
But these MAINTAINERS references need to be fixed.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
