Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76280C52D7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 04:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2sGTnWhAAxCBideXOSfildCbbJbkxzd9wlf9Y8JEp8=; b=qXl1jH0HSLTkW+dfDGPBhN2K/X
	bwySNRPiE6BdbLXjRlFLY++eAYtj4NGgaIGJnkH+6kJEKMgVkRdnPX/a04YqApsQ2OBkaHwlw+8CY
	+c7QSqEpfaCaSGyB5pBNtQlWv/1q38olc79ujoq4NNikaKSiz4SSR3bGY8FSC0WTd0FZ1UyXo4Jpy
	Mw+pn0fGqw7Y4Qut/fidLj8FQg1leEvRXnUrUcuu08I9cO1SyuwKXAa7qu+vrrijhiIFmsoZ5DpmU
	4q9nTyd0AnBuscgrcQuRqhOTLWgmTs8Mr86dQWna3h+sWUGKxcU720D0hYMkRd6pTt0D1zbwp5y7J
	NFhXCYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se5bE-00000005h15-0i2v;
	Wed, 14 Aug 2024 04:27:04 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se5bB-00000005gzd-3iUQ
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Aug 2024 04:27:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52f01afa11cso7623477e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Aug 2024 21:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723609619; x=1724214419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2sGTnWhAAxCBideXOSfildCbbJbkxzd9wlf9Y8JEp8=;
        b=C++cYZep3676io+StK+gSHSf9H0eXS/5XyHTDrUwy60iualY1aSgoDdqO76Sa+vXtF
         kqReqnU1vP83Xbwz53hC9Hupzk8MDJkCEDyvCWFng2iUzlHVAw1X4tsXFLRaaHTiCnNA
         hAvazzkuodwrBf27jml5XFas1/k3V8Cf6jjX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723609619; x=1724214419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2sGTnWhAAxCBideXOSfildCbbJbkxzd9wlf9Y8JEp8=;
        b=RfaUlA9CHEq9JVZK2WbB3gMZMDE5lH5YUlDDNrvXt3a0+cCkeMxbxJSuDFD8bGl/Ll
         V5p40WJTIdbew118y1OsIJ0xW/0GKMABI44zjbJoUVy4sndVYymrAu5IJfddmQx8H+db
         ztBYwoPqpr751qqzhHwpYPoLhpeND8/AJql2/J52hpePoahCUCcJDp+l4Qc9ADRmvPwY
         2vhm1FlgklNlknu68/gzfmMrtAFhlFTRQ3O7/bM6vNMkaVVfHYsED+I40UXWKCmPUnSZ
         G1rblmHcC+rDX0NUsqPwENIKf6HGiP97w7P151n6i0IljMNAIB36fQ3LV+W7rKcMnL91
         G3MA==
X-Forwarded-Encrypted: i=1; AJvYcCVJgGCIdrBb4XYLuWmfZodMA/4NB6vt+D1Q/mjEGE3TdnKvbDdh0NYWup0bphAwy9W3YK79F49jiQYjpIFzs/Wbmif/0uAVKdAV3CQaxcJ3e97B
X-Gm-Message-State: AOJu0YxM9NUCjGsABad0py8ycaLMLMnU/mpbDiiomQjvNLz3ol7do09w
	98yq+xiVhJkj+q4bl9TIhJs29kRrbLzhTgAeRHis1NSJ5aTzKs/xHvithxPUIHuwaKSk/y/eiWb
	tmgqM+Y1LhZZoTp+k7QLTXAIZ/dV33IFl9PbC
X-Google-Smtp-Source: AGHT+IGq5JnrkQvBmtbDIMCjqiKcKn4UUIGlSmcL8VKx33PYxUW8uxuiq5DIDlEU7bjWcTHbhZFieWS9pBfHwDH245w=
X-Received: by 2002:a05:6512:350f:b0:532:f1db:d0bc with SMTP id
 2adb3069b0e04-532f1dbd293mr332752e87.20.1723609619020; Tue, 13 Aug 2024
 21:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-2-wenst@chromium.org>
 <Zrs_YijPxKBFQF0_@smile.fi.intel.com> <20240813191835.GA1598838-robh@kernel.org>
In-Reply-To: <20240813191835.GA1598838-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Aug 2024 12:26:47 +0800
Message-ID: <CAGXv+5ER7DDdE-778JJZu9WTQejy0W0dYM7WZhXj2MzrUWrC6g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
To: Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240813_212701_966420_22DCD0CD 
X-CRM114-Status: GOOD (  19.38  )
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

On Wed, Aug 14, 2024 at 3:18=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 13, 2024 at 02:11:30PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 08, 2024 at 05:59:24PM +0800, Chen-Yu Tsai wrote:
> > > Add a helper function to add string property updates to an OF changes=
et.
> > > This is similar to of_changeset_add_prop_string(), but instead of add=
ing
> > > the property (and failing if it exists), it will update the property.
> > >
> > > This shall be used later in the DT hardware prober.
> >
> > ...
> >
> > > +int of_changeset_update_prop_string(struct of_changeset *ocs,
> > > +                               struct device_node *np,
> > > +                               const char *prop_name, const char *st=
r)
> > > +{
> > > +   struct property prop;
> > > +
> > > +   prop.name =3D (char *)prop_name;
> > > +   prop.length =3D strlen(str) + 1;
> > > +   prop.value =3D (void *)str;
> >
> > Is it the existing style in the file? Otherwise I often see style like =
this

Yeah. This was mostly copy pasted.

> >
> >       struct property prop =3D {
> >               .name =3D (char *)prop_name;
> >               .length =3D strlen(str) + 1;
> >               .value =3D (void *)str;
> >       };
> >
> > in the kernel (IRQ domain, platform core, ...).
>
> Okay with me to use this style regardless of existing style.

Ack. I'll update it to the more modern style.

ChenYu

