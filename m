Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AE4EB64DE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 02:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=; b=M9kUf5XPtHblBuyvQ69HRbiKx2
	6AE7J0zfkK8J26nyli0nJowyKHFrJNkqfmzSlO/5toFYBM9i2mmMqClWSRR2/CAejZRYwyJYuIsRx
	rlNq96v3ceeDb/QiaqIaoO39WHb6MKosxNTlkAC2aKWv4CdTX7XZw5Dl0i73/+Z4TMaGHUlFFr5GR
	zSWdnVLTALPs73AKadXy3qgDGO+lOJ7PEeOEjfOCTHGnqvbkc4/RDnchF0rVVC9LTPS8m1bu1KvJ4
	1Zh3BjZ+tgQZQCmSeH0LemHk83uzAnbv5WrsjtxefShCCOiePO7L7cKxZVfaTSfppl2sTTiT73G11
	Gc08uM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUJr-00000000In3-1iQV;
	Mon, 09 Sep 2024 02:39:59 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUJo-00000000IlV-1oPm
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 02:39:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5356bb55224so4342863e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725849594; x=1726454394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=;
        b=CZci8D1hy5gi8VgPq3iIkicFDB5T5mc7D/IQbLJfRbVA7kRQOI+mFJSGGRL7z2Up93
         WfyMjKoY9Xd5YkxvUaUnhkDgRRdX6L/MERBgI+pPIeC/0puJRE5umhkbdfsMk0+Zbcd4
         UsHue78fED/dWgCWC55jvIcR0HdHY33BMbJ44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849594; x=1726454394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cFi5jfefYj2+h0zGqYNyKUh3On9Em31F3FUiHDsAPI=;
        b=dWLH/V+Qje1h/sqG+ltJWdHsbt+oXFBzt71dqwCQi0cTsShsNnf3920/bf1B8hxuRd
         B1T6D4d3Iya4JAG5lntsfs03BEVZ67JSnMyO86W969dC8TPTVXb+GC7LX4VGC9TMc9Sy
         X5OBpmg/eRQZ5n7Qxdb0JAMCeEvcMjNDQzvWNm+MD8jLLRMSlBf2674sL9/tK+hpO4cY
         D5kUaIuwWVnaxYvCA0Mxkz8eg1er3E3YcXO6uRhNWX6Khf9OhLBHBj9mdeBvbX60FWWI
         TqfXlVmwu2Q2jR8sauKoFp+Zb4VplLtLLBU128g0MWya756Fu4APzwjFaytYDeWDYSkE
         UhHg==
X-Forwarded-Encrypted: i=1; AJvYcCXcFBluGEYiBiYEKl5xiFbLiatFOBSF/DQysrYYNovUTWFLyfJHGTETH5VDeLFcSJTyQvLK5Eg0zuuRdVoalA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO9YYNTpHBMwpTPLAObD4HNQWvx5lvpcseCpuMep0hnHrsbagz
	cKxOW3Qf/VpgvW5ObiZSGAUpxZ4UbvpwSA/j7MpxNVlaksQ02R40RphzbqMN5yGU9g4bDzP5jTk
	H2oMWKN2qrByaUtCZAAIMcN9MGw3IvLPHDauu
X-Google-Smtp-Source: AGHT+IHlN5GLZpAnPwP9Nfh6dJDXv4dqOvMPNVAV72HrfVF/EPodSu+G81D645T++W4Kv1SPpVAmGlS4gT+SnusBNKU=
X-Received: by 2002:a05:6512:1384:b0:52f:413:7e8c with SMTP id
 2adb3069b0e04-536587abe8amr5156459e87.14.1725849593704; Sun, 08 Sep 2024
 19:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-6-wenst@chromium.org>
 <Zthc8r62z2eaR8k0@smile.fi.intel.com>
In-Reply-To: <Zthc8r62z2eaR8k0@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 10:39:42 +0800
Message-ID: <CAGXv+5FCctBG5uOSvH_-0z2Jgi36zRs-Cg0_P+q8aikxLcwmbw@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
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
X-CRM114-CacheID: sfid-20240908_193956_656420_1EB6C319 
X-CRM114-Status: GOOD (  22.56  )
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

On Wed, Sep 4, 2024 at 9:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 05:00:07PM +0800, Chen-Yu Tsai wrote:
> > The to-be-introduced I2C component prober needs to enable regulator
> > supplies (and toggle GPIO pins) for the various components it intends
> > to probe. To support this, a new "pure DT lookup" method for getting
> > regulator supplies is needed, since the device normally requesting
> > the supply won't get created until after the component is probed to
> > be available.
> >
> > Convert the existing of_regulator_bulk_get_all() for this purpose.
> > This function has no in-tree users, as the original patch [1] that
> > used it was never landed. This patch changes the function ABI, but
> > it is straightforward to convert users.
> >
> > The underlying code that supports the existing regulator_get*()
> > functions has been reworked in previous patches to support this
> > specific case. An internal OF-specific version of regulator_get(),
> > of_regulator_get_optional(), is added for this.
> >
> > Also convert an existing usage of "dev && dev->of_node" to
> > "dev_of_node(dev)".
>
> > [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Make it Link tag.
>
>   Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec=
@gmail.com/ [1]
>   Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Ack.

