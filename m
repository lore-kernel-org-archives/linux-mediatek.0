Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E099CD4F50
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 03:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=; b=SA+NwOJbcCDc19XQlRKNhoAJVI
	BvcMTS8+eFjLuzZBc7PbatIY/SWEEu9nMNiUko8JE0qgY+BgUSfBZMJveZoFjsHGhxHqcnfmz3Xzg
	lelEgItTF/DhUPATeY7UQTu8kMVufZici3FsWW7yr8uAYHwwfbZfijmvg4YbzHXbjMCtJOYsduEn4
	LtFO5LPfKWUqCp0YtVt2R253d8FQZw/Lg4uZuRbEBCW5OMIEp49OebZvCQF8Ktd2H8q1TOZwANBAE
	ZJ5q6D402STJQp1LLjG9d2ZMJDOYG0lFersHebY+SGUW4yTFwkbyA4Z6Tq7YYNAHE/V0pYt1GDKFv
	ZPl2/C4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm3Z3-00000006rLD-46g7;
	Thu, 05 Sep 2024 03:53:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm3Y5-00000006rEc-3VAQ
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 03:52:47 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so236810e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725508364; x=1726113164; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=;
        b=CRIvN4uiHLIFfbSIEXp+NLs/batoBpbd6wVSGr/MhrtQpDVNYYdLFUA+5nlQkt1QMi
         ZbcKc8hi7iej858WUX90l6vid0yPUopKfWHucywGZiPLRQd56AyDJ/PGolhSzQ5U0sBW
         KOXmwN4S1SIy/KRDTo/l+CBbtWgj35KvCoOyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725508364; x=1726113164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=;
        b=bsKOVEhZiUnvf3uUGmj/nC0hB9LTSLCXKgIQUDSCzzw/DokTFnqEIXb2yfTO80OY7B
         0wPS3TZ7FAvGl2SBC1F+V4UxfU6IBcV9UgN75l6nKe63Q32bnOiARkvDG6kbgmCqv9Os
         iFTaTXwCsYtGCdnmJGS8JQO325IqCpQNfPSB4G2BY2LkN+nE6bLdXJnNJkfdSHLTRjc1
         D3fD/Z/e1EnQMNNatfUdfN9Og55oxzFVwzTD9xVb3OWgW1m5eBaNlqURzuVaocmHtwSP
         MjHQv/jDV0spxmGFP0KRX8rCdt4NC8fMQK471RvKS/1YBBvD3GZ3a/9NhjefafUe1r9k
         GHuA==
X-Forwarded-Encrypted: i=1; AJvYcCUIIPTqNaGZ3pj1E6H+Z3luG8A5hzbg4RRnGIR29gIb30XnEmQmveT8b2ga0NDHw+TWWLrIN72LdGmSzf55uA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/TzMYqBBvOLvtFwgCKUJQIq/K1l2mRpiCRJNxZXXPXjAlaqxR
	2pFA7TjYzqK8ocGqydjzHDYzOiWKqiCcyhNb7yNWIVqmY3tS7Vp0qkngsExvKKcltN95FrewO2m
	7N7mM+hOdw4Z6U+M1cd0a4bdvMaUkPqJq49pR
X-Google-Smtp-Source: AGHT+IFf4LunjDbLMZ4JbahUyowVfro0pxQijuaHaPzJX7btNK9HgFjL//PjfHIonl230ee/BtNVKcZVy4RESHnFt3A=
X-Received: by 2002:a05:6512:350e:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53566ffc733mr2025998e87.48.1725508363601; Wed, 04 Sep 2024
 20:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-12-wenst@chromium.org>
 <Ztgxlmhnkn7NVC81@google.com>
In-Reply-To: <Ztgxlmhnkn7NVC81@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 11:52:32 +0800
Message-ID: <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware prober
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_205245_920754_38501ADF 
X-CRM114-Status: GOOD (  14.58  )
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

On Wed, Sep 4, 2024 at 6:08=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/=
platform/chrome/chromeos_of_hw_prober.c
> [...]
> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > +             int ret;
> > +
> > +             if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
> > +                     continue;
> > +
> > +             ret =3D hw_prober_platforms[i].prober(&pdev->dev, hw_prob=
er_platforms[i].data);
> > +             /* Ignore unrecoverable errors and keep going through oth=
er probers */
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     return ret;
>
> Is it harmless if some of the components get probed multiple times?  E.g.=
:
> comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
> later, chromeos_of_hw_prober_probe() gets called again.

Yes it is harmless. Components already enabled will not get disabled
in the error path. And the prober that enabled that component will see
that a component was enabled, and skip doing the whole process again.

So something like:

    comp1 probed -> comp2 probed -> comp3 -EPROBE_DEFER ->
        comp1 skip -> comp2 skip -> comp3 probed


ChenYu

