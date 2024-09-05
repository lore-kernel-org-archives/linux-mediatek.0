Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE07CD4F59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=; b=t7ylYn+sS+jgxi5S1xgW0KOTNO
	Uw8NrEVw7bUCWLhPLKLX/CBXm4lMK1tvKqAlITS/gipDX+A1WPQzCNEtyToOkWIoHQZhwXqVqZWZE
	8K7NIWneEPYYvI7rJoxEf1rzTocJBB07vmmiFh9nJUo3Z84o9rnKwn9xLD0rDl/3mwmlP3DMQM4ft
	Lq1tv6x1fEXwfIehsLPUT3sHPpmiSXee1Qw6ihWa312Gl8bfMeJjC08ckx37i+ylWGgB2XWLBKiqT
	xPyJ6C3BwuT2DRuz3f4Bd2R91Rhxf9wyHA1W+xQVeTCzsW9z29Gq1YJTCNPGwBOa/AMR3jDxQhRAs
	ouX89Ddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7bJ-00000007VKv-44iT;
	Thu, 05 Sep 2024 08:12:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7ad-00000007VCo-3Ewx
	for linux-mediatek@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=; b=YbtusdICH8OBVPuAi0w/hbHmwr
	uzZWu/zn9CK7f29egwK1PAMiJuUmJe6YQGT+8LV2Yat02hDlYgWFlAPkLYS0hDU3E0/ULOqVKmtWh
	MyW5YuLs9+wMKZi7zDMovIAE5lw1+lhZ+ZtNZd6cJvgMiV0/rEE8mL4QoSCkVxW3i8ItdYr1XndpJ
	90v+HdLHVySPjDpIyBrKLdNkGGuE6ABNAEewQeVaMnsvKyg9/eWmHjAJRNLITrgC6/wDwdPPckuTf
	EQd8Q0GAD7LtU7zu/8lWPj9tkfRLkXLqA1hyxql7zvVTDxxtI9LGO2W3mKKOcKMbtblTnjnMA+GBf
	1RIS8HQA==;
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7aa-00000000QME-1DIk
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:38 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2f64cc05564so5114581fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725523891; x=1726128691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=;
        b=DBK9Y5T1TYvLIWRUgpgPbRJR0B/zCHSit+HesI4ARYvSm2WsYWWZlw03pHN+o/Cykr
         89txRoeV/lFEa0hgQmGLuK/iIjgZRpgdcUTXQ1iAoS78uX38beG1IzNxKH+8SlzTibvL
         hgPgrSGc3O5NpElXVA41uHP6cLDmlgX4C6IxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523891; x=1726128691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqxrNHgbeGAL4h4J6aJ4gyN3+tB2yX3dGNtW99El5js=;
        b=pYUKV/GoFZwVyyd3xu/l+yEUg30dO3xcB/gZh0G92SZhz0K2E2crlYnwOiZ7HHe1Ef
         xMUPVf8o3hJPEEKQOo60v95zWIGhyOcWXSSOCrJQFHZ+7IQG7bZD0Ic8BSCD9C6KJVBO
         y9N6F6x5SOCAqTQORSxvv1ySxCzCOGUa/Xh/RiIxpSmwVY6WtAbFkVIgJLucNH0BQgNv
         Ilets4noiR0wStcpJI3Fl2Us9loYeGo9oe727GAAprtsCaGlx48bQsDRkoLTh1DXItAk
         FsIgGdx1uBF0Ut6yiqAkfXneMAjuEWQxwsP15zOovVjqQzgqxFZw4C/C4iWHFGBPU3ku
         wJpA==
X-Forwarded-Encrypted: i=1; AJvYcCXEkpJNqhYMgybP4Y0V+VXX65DKVHLCYAOSNuSbrnHZAWmeykEer9Sezfn2Iw7QnPFeiJ4oo8gSJ6TNWcMxYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3F8GfjidqPaBG5aHhnapMexkyWedi0RXgkhsnKZq5bLiDuxkC
	agixinA8LI1EqQQy80/WKyOkKGLDH3MYlKe6SgSNR+yuujMqFQD6yYkLKYJOvR6Y1dls6dRoJWX
	xt7vSEYnjiBnhA5mYYqFXCEYlbBoR53JN58D4
X-Google-Smtp-Source: AGHT+IHgBQxVW+6mWOLd4xU/v/uqA2bXrlgX+qclLv/VfI8suvKUwIZp0O6ejzR9OBlUf64DSkNg9Mtn8N7ARtFnYaI=
X-Received: by 2002:a2e:a9a9:0:b0:2f4:9fb:5905 with SMTP id
 38308e7fff4ca-2f64d38cf3fmr53482011fa.0.1725523891012; Thu, 05 Sep 2024
 01:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com> <ZthdU6UGlM75GJVj@smile.fi.intel.com>
In-Reply-To: <ZthdU6UGlM75GJVj@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 16:11:18 +0800
Message-ID: <CAGXv+5Ew23BGgw6XpikBtAm+wQiOjFDyGuCSpt_GsGhoAwD22A@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_091136_545311_9FD4A4F0 
X-CRM114-Status: GOOD (  17.50  )
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

On Wed, Sep 4, 2024 at 9:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 04:09:26PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:
>
> > > +static struct device_node *of_get_child_regulator(struct device_node=
 *parent,
> > > +                                             const char *prop_name)
> > > +{
> > > +   struct device_node *regnode =3D NULL;
>
> > > +   struct device_node *child =3D NULL;
>
> Btw, redundant assignment here, as child will be assigned anyway AFAIR.
>
> > > +   for_each_child_of_node(parent, child) {
> >
> > > +           regnode =3D of_parse_phandle(child, prop_name, 0);
> > > +           if (!regnode) {
> > > +                   regnode =3D of_get_child_regulator(child, prop_na=
me);
> > > +                   if (regnode)
> > > +                           goto err_node_put;
> > > +           } else {
> > > +                   goto err_node_put;
> > > +           }
> >
> > I know this is just a move of the existing code, but consider negating =
the
> > conditional and have something like
> >
> >               regnode =3D of_parse_phandle(child, prop_name, 0);
> >               if (regnode)
> >                       goto err_node_put;
> >
> >               regnode =3D of_get_child_regulator(child, prop_name);
> >               if (regnode)
> >                       goto err_node_put;
> >

Looks like Mark already merged this one. I'll send extra patches to clean
this up later.

ChenYu

> > > +   }
> > > +   return NULL;
> > > +
> > > +err_node_put:
> > > +   of_node_put(child);
> > > +   return regnode;
> > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

