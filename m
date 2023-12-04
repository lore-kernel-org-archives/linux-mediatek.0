Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6CCC10F13
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 06:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKeCfLZc7mdf5ttEOE5xpGWsNMCS5nBu7bohK0rYA9k=; b=RK44x/YZWpwlNpVT5OTLKFVL+G
	3JGoos2cWLgJ96ApgEIg1Lx0Ymkl0VheBDy3O2tthE5s4rlHMqpQ8r0EjMKh2yqb1disiXduvFSJu
	9VMHqa/wilZIFPaIQId1RPbxdzx/MUIlSVY7goT7dygD9uusdBcCJ/7EKy/PVIjmLAjh0LOrn7YfJ
	6qtZlV0M9VBHOFuoMns77a2PpiM4hjlm6u09D5Oi/5y2gZ8WfPndWJPLBZvh6nF1SSezT6czHhrLE
	UNfLW/4/fHpkCaUBwIOERihMAiJMYneYqztpG5qwpY88ly/RtNrbbF/zA01mE3KDnY/MziTw2+8cq
	Jwx39VqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA2RY-0036Sq-1l;
	Mon, 04 Dec 2023 06:28:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA2RV-0036S8-1p
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 06:28:35 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bc22c836bso5462154e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 22:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701671311; x=1702276111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKeCfLZc7mdf5ttEOE5xpGWsNMCS5nBu7bohK0rYA9k=;
        b=AP8xWDMb6E6fsd4U093fkCFqE27ewVH6TyVtd5aUGK1O30s/8w4nsWW7iSK7+AwRPZ
         zWQ3o+TUmXOa1DZxg20Kh5oe0MxO8Q/ePE9x7BicZGDT49RpS2C4FLixU2gjxLuirPDQ
         PWDLDFINK429zU8irVH3GIfeXKBZl1NCRMcl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701671311; x=1702276111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKeCfLZc7mdf5ttEOE5xpGWsNMCS5nBu7bohK0rYA9k=;
        b=ZivqfkndgHT36mzmkIiFM3PLH9u8+sxKVQP5bLRZtSd+ud5HGBsvs3PfISIzy4GFR0
         Y6xxZWNCvDSLnLeNUxKiOLJ3xlPrG3kjKehpkGNYvuHKqtA03S/SxQK/JTDCkSzTRTGG
         GtLRME4KnerHALBEE5LfYtOIccnjWALPjMv7x4pOqHNZS5vdIzHdqFJbEhySWZBIGoUs
         ob0JcdO6eSW0/Nmpwv9XrnNwf0lHTbBtetG7mCpnahgcM0YS+hUOC3IEFDlFj6qbrvvS
         UIBF917kQxTjMCiHu4svctsqxgQZkd6HRTiTWaFEKE12vEDPCCpjhSdWvN5/PJQlv2lv
         VqcQ==
X-Gm-Message-State: AOJu0YwFqt0JbwXNRAWZx6IBVxG0qKTq03/luKWgwjWwzicxguee8GzB
	34EAZI7ke9Xt6pbo1Gh1VD7nMtG9T8mgCPgVneakyw==
X-Google-Smtp-Source: AGHT+IG95fL6ZmhFrrdBZs1yHZpwJEkMdnWR6Z3TRg/FZYz0mqiHrefYfWV2agXhFMwbCcFaJSeavkE3C7jpb9RAWYc=
X-Received: by 2002:a05:6512:368f:b0:50b:f88a:dd63 with SMTP id
 d15-20020a056512368f00b0050bf88add63mr334344lfs.102.1701671311129; Sun, 03
 Dec 2023 22:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-2-wenst@chromium.org>
 <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
In-Reply-To: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 14:28:20 +0800
Message-ID: <CAGXv+5GiwgF4CJBPT7JucV8qEMY0jLAvT3TqRzvLjCKcVMZ0Mg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_222833_958148_C3866AE4 
X-CRM114-Status: GOOD (  13.41  )
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

On Sat, Dec 2, 2023 at 9:01=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_ch=
angeset *ocs,
> >         return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
> > +
> > +static int of_changeset_update_prop_helper(struct of_changeset *ocs,
> > +                                          struct device_node *np,
> > +                                          const struct property *pp)
> > +{
> > +       struct property *new_pp;
> > +       int ret;
> > +
> > +       new_pp =3D __of_prop_dup(pp, GFP_KERNEL);
> > +       if (!new_pp)
> > +               return -ENOMEM;
> > +
> > +       ret =3D of_changeset_update_property(ocs, np, new_pp);
> > +       if (ret) {
> > +               kfree(new_pp->name);
> > +               kfree(new_pp->value);
> > +               kfree(new_pp);
>
> Given that this is the 3rd copy of the freeing logic, does it make
> sense to make __of_prop_free() that's documented to free what was
> returned by __of_prop_dupe()?

Makes sense.  There's also one in property_list_free(). I'll add a patch
for it.

ChenYu

