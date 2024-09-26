Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E8CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gznSMtiYcyR3w+ziWE7zvvdEk/47hMv313+7HUPIjik=; b=KMVThjmx2ZK72G8BLClY2QGI/c
	v7zrGvBkmCIlEnp1pZcxjbIKX9K18TbAPcnla2ZKl3vuxxM365zUMM5cowe/gdrSorDHo2pKrBqkH
	EmoXsmZCZDYb5BV+g/HqwKNq/UBcBCpEeo7Jni3v3/fVeBWy9qF0fP7jcD0aFOjscWEn73kabPYAn
	UpcUKqU/DhanasqVPZIrvK1fCXhmsYZI5RfxybyORDpkRNbGfLVwhksK75E++1TgIYzFRmNxaDeiZ
	lo/32/NbuORQQF37SHy7C7+8mmX9tiS6UgSVJ1ztIXCQSwPX6+BgDTU49sW2Q3/x6MhEkVfYXnvhe
	B+L+e52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stkN3-00000007n8G-0vdt;
	Thu, 26 Sep 2024 09:01:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stk6X-00000007je3-2f44
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 08:44:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53659867cbdso1135506e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727340244; x=1727945044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gznSMtiYcyR3w+ziWE7zvvdEk/47hMv313+7HUPIjik=;
        b=NyBITWhhdwPitHEpfBfL7IFgnlQY5sbqRhK5lryXGcbLnx0XiUzbXLflsIxS0WMGtF
         cvyPKOb2zyMtaieRGoSQijwT9Sc8x9xY/HzDumApGHdDQIV6wL03H5IBDEUPF+nUdCIq
         vXazpDSiMidXHaegM5tMCUqpO09TcZN+D4jRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727340244; x=1727945044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gznSMtiYcyR3w+ziWE7zvvdEk/47hMv313+7HUPIjik=;
        b=J30K8OnyAzlkYrBOCv0IE6ZyN9CFM4KywLliQOzskbEvUxpXgxG1x7XK31l1DZEIOg
         cv2xmbhAHoqEN1zpNwhBfmPVQe2O/9BxYkNrByGq1HP0MqsA7m2skRHa1/l+VefwTxdg
         j8Y4CV1y++oWoHQ2JHmPVHES+lLgcA6K+MbWo2z5i5xcvGErTMovNUmj1iQFgnVqddh0
         3CxaJ4BMbFeMIaMBHNGZHV/JwGKmAveiZ7auhOiZiX9x2wiD00eAUUByEFliB/ycYzTs
         zPV5ENWzZMTMBrRVBBRScuewWasjE2GQFLJhgwW+JMCBK+i1s8Tqy5mLjdJJIWYw/P/l
         X1HA==
X-Forwarded-Encrypted: i=1; AJvYcCXqQyG4eppPbzC0PnuanQs/OMiNIHHsqW6SMAjaXGPRRCpD8MgSbNVo7BmRQXLRUCQMLs1jL0i9f97+p+F/8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YysuL/hdgcytUwQAtchpFvB3E9hVkMoZ2J1+sVqNITGm72aKKrm
	VkMLNg7hpbCedJLIARNgM883hlYoS9RnNCjgR5/JTI1gUAT2CEK1bB6UjAYTsRo4KqMzXfhPDG4
	l9PUdYJA93C+E8NILOgtUzHzsSoleBuoveFcD
X-Google-Smtp-Source: AGHT+IHaqH2XD1kwP3As68zb4RqTHQB3YnbJsTJoL46ahD760ygreD1XSQDeJe/F8UpUYLGLJ5vsf+1cWC0dd7Zm+uM=
X-Received: by 2002:a05:6512:1310:b0:533:483f:9562 with SMTP id
 2adb3069b0e04-5387755ce6dmr5254176e87.42.1727340243659; Thu, 26 Sep 2024
 01:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240925093807.1026949-1-wenst@chromium.org> <20240925093807.1026949-3-wenst@chromium.org>
 <ZvPscRdWlFPmtCyR@smile.fi.intel.com>
In-Reply-To: <ZvPscRdWlFPmtCyR@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Sep 2024 16:43:52 +0800
Message-ID: <CAGXv+5Gf9+rc+vLcr-JFhO561G8dw38ksV3drat+DyCfWEVakQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] regulator: Add devres version of of_regulator_get_optional()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_014405_734838_C7ED38DE 
X-CRM114-Status: GOOD (  28.85  )
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

On Wed, Sep 25, 2024 at 6:56=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 25, 2024 at 05:38:05PM +0800, Chen-Yu Tsai wrote:
> > There are existing uses for a devres version of of_regulator_get_option=
al()
> > in power domain drivers. On MediaTek platforms, power domains may have
> > regulator supplies tied to them. The driver currently tries to use
> > devm_regulator_get() to not have to manage the lifecycle, but ends up
> > doing it in a very hacky way by replacing the device node of the power
> > domain controller device to the device node of the power domain that is
> > currently being registered, getting the supply, and reverting the devic=
e
> > node.
> >
> > Provide a better API so that the hack can be replaced.
>
> ...
>
> > +#if IS_ENABLED(CONFIG_OF)
>
> Do we really need this?

What's the point of going through devres_* stuff if we already know
_of_regulator_get() is going to fail anyway?

Also, _of_regulator_get() does not have a stub version for !CONFIG_OF.

> > +static struct regulator *_devm_of_regulator_get(struct device *dev, st=
ruct device_node *node,
> > +                                             const char *id, int get_t=
ype)
> > +{
> > +     struct regulator **ptr, *regulator;
> > +
> > +     ptr =3D devres_alloc(devm_regulator_release, sizeof(*ptr), GFP_KE=
RNEL);
> > +     if (!ptr)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     regulator =3D _of_regulator_get(dev, node, id, get_type);
> > +     if (!IS_ERR(regulator)) {
> > +             *ptr =3D regulator;
> > +             devres_add(dev, ptr);
> > +     } else {
> > +             devres_free(ptr);
> > +     }
> > +
> > +     return regulator;
>
> Why not using devm_add_action() / devm_add_action_or_reset()
> (whichever suits better here)?

Cargo cult from _devm_regulator_get() in this file. However since this is
meant to share the same release function, both functions need to use the
same mechanism.

I could also argue that this is not an action, but an allocation, and so
devres_alloc() seems to make more sense.


ChenYu

> > +}
>
> > +#endif
>
> ...
>
> > +static inline struct regulator *__must_check devm_of_regulator_get_opt=
ional(struct device *dev,
> > +                                                                      =
   struct device_node *node,
> > +                                                                      =
   const char *id)
>
> I don't know the conventions here, but I find better to have it as
>
> static inline __must_check struct regulator *
> devm_of_regulator_get_optional(struct device *dev, struct device_node *no=
de, const char *id)
>
> Similar to other stubs and declarations.

I don't think there are any conventions. This file already has three types:

1. Wrap the line with the function name on the second line
2. Wrap the arguments; wrapped arguments aligned to the left parenthesis.
3. Wrap the arguments; wrapped arguments aligned with aribtrary number of
   tabs.

I prefer the way I have put them.

