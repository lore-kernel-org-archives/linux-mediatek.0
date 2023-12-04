Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6663C46CA3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=; b=pY5pdAQBp4BWKnUrDcnG+lOPJf
	4sTTHUjyzfqT/QGzQwo+Qck1POWIJ8lp5QgVPP+MUUiNXzGOAetfcv29eednGNlXB1ZCw+tz5H7xc
	9qPB6U1qqYog3WFXiTwI40wC2sKDhoiSrcbclIXDjA3UuEflMRUcx+33Ni+jYbLCjJpK6Fd1M+NfN
	s/ZkG10AAh//JVdLxtu2pVW75HHUSAvsGc8cGWRvEXUdCesd2U41P6IWkNTpbaH2Vk/Rz0hEAy7a7
	v/bm0uTnAHkjWjA8n0e6gQGgsQZB9aQS1Q1kce+o63/woBl5HMgrs83exoA4C5XzGeWy1FkSB+EpW
	XGYOk8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rABWJ-0053oY-0d;
	Mon, 04 Dec 2023 16:10:07 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rABWG-0053mp-16
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 16:10:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso6029496a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 08:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701706200; x=1702311000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=;
        b=BsZFVFgZf/2/467lkbKCU7xkQw1Idejkhvi17slGLZqJZuUuAO/dg5KmHg9cs1bEYc
         r/qPgDd9st0f4phXnZMdrdg8Xtuqy9DPctgZq1wZ1y4bweQbS66kVUhpA9G4yPVbrgZW
         8trBFHELyahy5tjn0jYFt8dRK4RJ55ylvYZKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701706200; x=1702311000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=;
        b=XbA64/BVk01b1PRAdcVnfSrOPyuTCG8aNZNg9VQ0nTvCHWOpt925s7HOEfMtWQfWUx
         mrkIagv/Nz4+P06DIPfyEE0TNlbuDIHSDfapwW71otb8KafLYKNG6ETzbK1aAWnZjLtN
         y4Roox+xuIHC9gCfZc134yOuRSHNyS1PAgDvYX74s7XfXs4ETq9I3GufqIs6vkhw/v6q
         6jf/6UIbBKs9yAxUp3IiQvQNrr3y8teu1eXgG5iNhNsVlUA7lU1G+yduQ6it9h1K6pu6
         cHy+hkBHhJWwre73vpadIJmttp1f/SurRgmuQ2fhDh+PtM0Pz4Y/PjMXnFFjvC+2EskF
         luTQ==
X-Gm-Message-State: AOJu0YxaFWyldd33NyRHc18BYYpX0IzBGjLCptUKWWGul7vTger96PS6
	xrHrNcWHIPRR94P3WVt6c4EmpFZ7OOgyyFBSVWKfa3b4
X-Google-Smtp-Source: AGHT+IGabmDUIKbuMyBETWDbsfn/kIpzAAzGoxV4zQZf9Sy7Ua76DjXoM47ycJ4I3V0rqHOT+So39w==
X-Received: by 2002:a17:906:dfda:b0:a19:d40a:d23d with SMTP id jt26-20020a170906dfda00b00a19d40ad23dmr1862989ejc.265.1701706200460;
        Mon, 04 Dec 2023 08:10:00 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id re17-20020a170906d8d100b009b2ba067b37sm5377746ejb.202.2023.12.04.08.10.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:10:00 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b422a274dso112295e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 08:10:00 -0800 (PST)
X-Received: by 2002:a50:99de:0:b0:54a:ee8b:7a99 with SMTP id
 n30-20020a5099de000000b0054aee8b7a99mr280850edb.0.1701705841514; Mon, 04 Dec
 2023 08:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-3-wenst@chromium.org>
 <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com> <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
In-Reply-To: <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:03:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtvPUD+tXv0GghreG3w5yWedeHTYzhk-LNzf94fJ6B_Q@mail.gmail.com>
Message-ID: <CAD=FV=WtvPUD+tXv0GghreG3w5yWedeHTYzhk-LNzf94fJ6B_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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
X-CRM114-CacheID: sfid-20231204_081004_402088_43612BA0 
X-CRM114-Status: GOOD (  39.77  )
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

Hi,

On Mon, Dec 4, 2023 at 1:53=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > IMO you should prototype how you're going to handle regulators and
> > GPIOs before finalizing the design. I was going to write that you
> > should just document that it was up to the caller to power things up
> > before calling this function, but then I realized that the caller
> > would have to duplicate much of this function in order to do so. In
> > the very least they'd have to find the nodes of the relevant devices
> > so that they could grab regulators and/or GPIOs. In order to avoid
> > this duplication, would the design need to change? Perhaps this would
> > be as simple as adding a callback function here that's called with all
> > of the nodes before probing? If that's right, it would be nice to have
> > that callback from the beginning so we don't need two variants of the
> > function...
>
> So I think I can prototype designs with one GPIO and multiple regulators,
> assuming each node has the same number of both? At least they should if
> they're on the same connector.
>
> More than one GPIO probably means there are some ordering and timing
> constraints, and won't be as generic.

I was hoping to see a prototype of how this could work in the
non-generic case where the board needed a custom function to power
things up. It seems like we'd still want to be able to use your code
for probing.


> > > +       for_each_child_of_node(i2c_node, node) {
> > > +               union i2c_smbus_data data;
> > > +               u32 addr;
> > > +
> > > +               if (!of_node_name_prefix(node, type))
> > > +                       continue;
> > > +               if (of_property_read_u32(node, "reg", &addr))
> > > +                       continue;
> > > +               if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I=
2C_SMBUS_BYTE, &data) < 0)
> >
> > I'd be tempted to say that the caller should be able to pass in a
> > function pointer here so they could use an alternative method to probe
> > instead of i2c_smbus_xfer(), though you'd want to make it easy to
> > default to i2c_smbus_xfer(). I could imagine someone might need a
> > different way to probe. For instance if you had two touchscreens both
> > at the same "reg" but that had different "hid-descr-addr" then this
> > could be important.
>
> I'd say the only specific probable type is hid-i2c. And that could be
> generic enough that we could incorporate it here if we wanted. However
> I think we want to keep the initial version a bit simpler.

I don't mind if the initial version is simpler, but I'd love to
understand how this will grow. It doesn't feel terrible to take in a
function pointer that will probe the device and then provide a
function that callers could pass in that simply did the simple
i2c_smbus_xfer().


> > > +                       continue;
> > > +
> >
> > Put the "break" right here. You've found the device and that was the
> > point of the loop.
>
> In its place we'd have an if (node) { <enable node> } block. I guess it
> makes it easier to read still?

...or perhaps an "if (!node) goto exit" block and then you don't need
indentation? Essentially the loop becomes the implementation: "node =3D
find_the_one_that_exists(...)".

-Doug

