Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DC9C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:17:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD6A61A0D
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD6A61A0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gWec+iMY83JvWcZExNE8aB8E9OEAqz+Yld6x6L7e4HY=; b=LAk2MAmKq3sabsaXVPbZmMGxe
	ArgDoZ9f2130qtYHL+H6nzFqFHjLRiLooZJPKkaCkJKW+Ag3hGRYdM5UhwHnWU5uzURAUIs3sBJBf
	wy0GGnrFqb2TVm6TRpGgpC/wEUrvwL83ciQZAl7cXGtfCFZcLPywZugShH5ZKReq9eycM+5jzenMs
	Fz9bsFmYqIL7SMQisEND2KddQGiDp5xj/B/9+YYGWuezb36Jbwe1YqqzAt/2eDXUqDOYGCEL7ws/i
	eI+vuK3e3Mg/MJJ8u9Zf/FFi93+iLODFuIPgkucWcoyKvP1ZlwkDslJtsZkahcUuK/otrM+L9ywhu
	XhAAwIvzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP6Bg-00HMoO-JL; Wed, 24 Mar 2021 16:16:52 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP6Bd-00HMnH-1Q; Wed, 24 Mar 2021 16:16:51 +0000
Received: by mail-il1-f181.google.com with SMTP id t14so12034800ilu.3;
 Wed, 24 Mar 2021 09:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QXqHoBlkPrNwRpEMtYqdUlQOXPQTYdJ14Lsi73wF+Zg=;
 b=kYclogbPhwRF7QKHuAs6klIdCmop1+K8vCEwAMcAH3rnFZ6bzdp3c6CimYQSEw1SC/
 z2KL01BEYaX//12eHvNcp3dkTbDCfm/fpDPenfPPQcQsGLU3PGHle4jBVsnJygI7UbQA
 7DUd/hQM2g9Ddeh5ctc4poWIybbm81eWQwk6N/XLjfmz3Ak5SWB84yUaPo+oBhO1mLE+
 AjqCnfSxPYPOHW5WcnsxzegcQUceIIjlARzlDaOot9kPW1mAu30K5rDq8sHd+YbdIaeV
 RdWrXqI7awiSPoURawl7bUR/E7Ms5uA0wzINYaatI/f3vjo2VkksaCXgS0f0vdXi6fic
 PmqA==
X-Gm-Message-State: AOAM530IrSpUYS4HWknILwigOeYE07IMb8BYFKzgVM/zmsamBia9/U69
 AtSJOgj6kdlRiu4XxN32lQ==
X-Google-Smtp-Source: ABdhPJzMyvEIIYrr73Ih8QIqBO2t7JAHQThpLoQIFcY0siF6lIGYTH+7kk66x+8FHWGn3D2H2WkCvg==
X-Received: by 2002:a92:5214:: with SMTP id g20mr3131964ilb.260.1616602607879; 
 Wed, 24 Mar 2021 09:16:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m20sm1299949ilj.66.2021.03.24.09.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:16:46 -0700 (PDT)
Received: (nullmailer pid 3176722 invoked by uid 1000);
 Wed, 24 Mar 2021 16:16:43 -0000
Date: Wed, 24 Mar 2021 10:16:43 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: matthias.bgg@kernel.org, Lee Jones <lee.jones@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 2/7] dt-bindigns: regulator: mtk: Drop unneeded compatible
Message-ID: <20210324161643.GA3170381@robh.at.kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
 <20210312145545.26050-2-matthias.bgg@kernel.org>
 <CAFqH_500_xUU9=y1t=FFErD5LwUb8p9KT7qngW_t99_OPQWeVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFqH_500_xUU9=y1t=FFErD5LwUb8p9KT7qngW_t99_OPQWeVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_161649_146401_1FF9ECA3 
X-CRM114-Status: GOOD (  28.38  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 18, 2021 at 03:11:56PM +0100, Enric Balletbo Serra wrote:
> Hi Matthias,
> =

> Thank you for your patch. There is a typo in the subject line
> s/dt-bindigns/dt-bindings/ Rob might miss this patch as he filters the
> patches by subject I guess.

I should, then I'd have a lot less to review...

> =

> Missatge de l'adre=E7a <matthias.bgg@kernel.org> del dia dv., 12 de mar=
=E7
> 2021 a les 15:57:
> >
> > From: Matthias Brugger <mbrugger@suse.com>
> >
> > The regulator does not need to have a device tree compatible, if it's
> > part of an MFD. We leave the node name to the SoC specific name (e.g.
> > mt6323regulator) to allow older kernels to work with the new binding.
> >
> > Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> > ---
> >  .../bindings/regulator/mt6323-regulator.txt        |  2 +-
> >  .../bindings/regulator/mt6358-regulator.txt        |  4 +---
> >  .../bindings/regulator/mt6397-regulator.txt        | 14 +++++---------
> >  3 files changed, 7 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/mt6323-regulat=
or.txt b/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> > index a48749db4df36..69f32e1a6702e 100644
> > --- a/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> > @@ -19,7 +19,7 @@ LDO:
> >  Example:
> >
> >         pmic: mt6323 {

This one is wrong...

> > -               mt6323regulator: regulators {
> > +               mt6323regulator {

And this was right.

> =

> If you convert this binding to YAML, you'll probably get a review that
> the node name must be just 'regulators' here. And then, looking at the
> other patches something will break I guess ...
> =

> >                         mt6323_vproc_reg: buck_vproc{
> >                                 regulator-name =3D "vproc";
> >                                 regulator-min-microvolt =3D < 700000>;
> > diff --git a/Documentation/devicetree/bindings/regulator/mt6358-regulat=
or.txt b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
> > index 9a90a92f2d7e1..ba1214da5bf7c 100644
> > --- a/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
> > @@ -23,9 +23,7 @@ Example:
> >         pmic {
> >                 compatible =3D "mediatek,mt6358";
> >
> > -               mt6358regulator: mt6358regulator {
> > -                       compatible =3D "mediatek,mt6358-regulator";
> > -
> > +               mt6358regulator {
> >                         mt6358_vdram1_reg: buck_vdram1 {
> >                                 regulator-compatible =3D "buck_vdram1";
> >                                 regulator-name =3D "vdram1";
> > diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulat=
or.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
> > index c080086d3e629..2b14362ac56e1 100644
> > --- a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
> > @@ -1,11 +1,9 @@
> >  Mediatek MT6397 Regulator
> >
> > -Required properties:
> > -- compatible: "mediatek,mt6397-regulator"
> > -- mt6397regulator: List of regulators provided by this controller. It =
is named
> > -  according to its regulator type, buck_<name> and ldo_<name>.
> > -  The definition for each of these nodes is defined using the standard=
 binding
> > -  for regulators at Documentation/devicetree/bindings/regulator/regula=
tor.txt.
> > +List of regulators provided by this controller. It is named
> > +according to its regulator type, buck_<name> and ldo_<name>.
> > +The definition for each of these nodes is defined using the standard b=
inding
> > +for regulators at Documentation/devicetree/bindings/regulator/regulato=
r.txt.
> >
> >  The valid names for regulators are::
> >  BUCK:
> > @@ -23,9 +21,7 @@ Example:
> >         pmic {
> >                 compatible =3D "mediatek,mt6397";
> >
> > -               mt6397regulator: mt6397regulator {
> > -                       compatible =3D "mediatek,mt6397-regulator";
> > -
> > +               mt6397regulator {
> >                         mt6397_vpca15_reg: buck_vpca15 {
> >                                 regulator-compatible =3D "buck_vpca15";
> >                                 regulator-name =3D "vpca15";
> > --
> > 2.30.1
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
