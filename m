Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD5BC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=; b=CkuIJmhRBKiV/spquORUS8nBFc
	1rYCXIh3g214fbiRktyOa38L4Zl/xLDFDvXxvK/MRBlZQgBap8y5r3r98vuvP4e3TUNsyc7sXSRpR
	nj9lHeSukNGv8S2WNkZnevMUOoQhF33g062skZ3hRsns/2UqRyTieJzObE5EBM4jIqFcly1sXBnd8
	K/6XgPO8odCCgaoWbI0kb+QS1448MuLFhHh2G42rzj+N5aU7mSjEWYvM0EYGSTNjkN0ICDpyh7KTx
	3RNbfkTPbAGoghrTboPUMFSISPh2+GHyMmzNrnyBF23qOaREIRV/+6BhB5E7NmGLqRMaeMGu5CZan
	FRiJgN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOCj-0000000FXW3-0wwz;
	Fri, 23 Aug 2024 06:55:25 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOBx-0000000FXPC-2OGC
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 06:54:39 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2f4f8742138so1375631fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724396075; x=1725000875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=;
        b=P92uRh/lbWltX/Wwrw8bdgbYwaehTxpqdCYJWFQEUzUOwHyeAn770I/SQrTsUgZ3hs
         Rep/O9vqWJB0t1A0aiXTjhme2vxv5+LlYxe5CaOa5HUNsDg5pb6+BwFZNNm/twu3UC8D
         htbe5ycSc4vQuPRk5ZKLps/ZA/wG5nuhMUZIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396075; x=1725000875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=;
        b=aIcDAcJVZgB5hbXRGyk9Qpa1RLapvSGLsAs99P/FRDL7sfGMY6aPHs3IYd7UVX/hK6
         DzpCgRaEwqQLVYG4Ag0mwOSEHpLMCX+e+LMPrwqI+FU0yJF2dQVEIxIgB1zJHeAHbrss
         NwRCZ5RSZ0EfxEz9fi/9aA2k9NBSkaB0Ldh42awJsi6sdtBJ+yPwTuweTocW9C8S028J
         JPwAERubCsI1Vj+jxFwZ9xhrwCDxuVf2eTdrcHX7C3xKDcNQARtq291BTrgS2QR7GXwD
         7b9UWYQkWehkKVPZirE43KcUi/XfqkrKnJQ0eD3lV8pU348hFLfULY06b3v0B8n780ga
         Dd+w==
X-Forwarded-Encrypted: i=1; AJvYcCXs6ndlTYXxraw/gqKxd28kO1iHzOBKGVtiDHH6XmjNF6ZLqITQ0Ye/eE7DPU8ZyUi2Uz1McKUg7R8s9vWEWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuee8rGRwRJNPWSEyKzGBzMiA1jg6Mkc3Jv/+MkFUROCg54sHo
	dPay/HIfWZTitfPs96vPRc/aTC1Rf08lUb4HA+ySPJhZ1ARnZZoW3hxbsmAyu8rUAMG//qqIXfN
	UkmtNaTPUnSjM5FPJIgDskFBMvaJjv9HLgGq8
X-Google-Smtp-Source: AGHT+IGDC0WWTfFgI9QnQzvX49/NewGmGwj3Cz1KMtz32yMSQX3nF9dwL9fql5Pr3fEZyw3lnpJjTa3uuZm7Vkpw1m4=
X-Received: by 2002:a05:6512:3b82:b0:52f:154:661b with SMTP id
 2adb3069b0e04-534387681c5mr853124e87.11.1724396075319; Thu, 22 Aug 2024
 23:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-4-wenst@chromium.org>
 <ZsdB1vsEe0atW88_@smile.fi.intel.com>
In-Reply-To: <ZsdB1vsEe0atW88_@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 14:54:24 +0800
Message-ID: <CAGXv+5Ew1tQKmuKckovfHCgH-ja0qSmqJWOk2qowQC4k_1tvYQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] regulator: Split up _regulator_get()
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
X-CRM114-CacheID: sfid-20240822_235437_613792_A4B530DC 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, Aug 22, 2024 at 9:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:56PM +0800, Chen-Yu Tsai wrote:
> > _regulator_get() contains a lot of common code doing checks prior to th=
e
> > regulator lookup and housekeeping work after the lookup. Almost all the
> > code could be shared with a OF-specific variant of _regulator_get().
> >
> > Split out the common parts so that they can be reused. The OF-specific
> > version of _regulator_get() will be added in a subsequent patch.
> > No functional changes were made.
>
> > +/**
> > + * _regulator_get_common - Common code for regulator requests
> > + * @rdev: regulator device pointer as returned by *regulator_dev_looku=
p()
> > + *       Its reference count is expected to have been incremented.
> > + * @dev: device used for dev_printk messages
> > + * @id: Supply name or regulator ID
> > + * @get_type: enum regulator_get_type value corresponding to type of r=
equest
> > + *
> > + * Returns a struct regulator corresponding to @rdev,
> > + * or IS_ERR() condition containing errno.
> > + *
> > + * This function should be chained with *regulator_dev_lookup() functi=
ons.
>
> kernel-doc will warn here: No "Return" section.

Will fix.

ChenYu

> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

