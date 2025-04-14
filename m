Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A63C369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 21:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7BZi7HnKfbbt9TH74oPDg7WDBebYy2OSaVokgDUUbg=; b=bPD7ighCnS5Xl95zz8VHHEI3be
	24lsZg34hv+U2FG+Bsr4a+YAUv28UsO8s3QEgGAl1o+5tp24K7DdVDG1bmWaytReMQbNQ84hgn81c
	O5pu87qOrvp+28eLU1G87/TYs/lilddMhZdpZenBv9Qw0KzpOap4tsrosQK6aQRpAf8yVf+PPbUwp
	/jG9N47/tJMc+3oVdg42NdYkmlB9a1crPF4wl/RFCtuxFB8q/JEr4II2kZYPrDTJq7Pj0M7bWTX7Y
	/gWRPpSFHU1oBU8oriznwWkEBuqzVBLz38cww8ozk+enm8NdHZlfPqB0TtH4T5cKG0aP4xNKjBO3O
	hZ37kPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RTz-00000003ZyS-4Bkg;
	Mon, 14 Apr 2025 21:36:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RSA-00000003ZnE-14lo
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Apr 2025 21:34:56 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so8910805a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Apr 2025 14:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744666491; x=1745271291; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7BZi7HnKfbbt9TH74oPDg7WDBebYy2OSaVokgDUUbg=;
        b=0Z+AaAJ+gi0HklMWs3WqxC7zZbNG/xkjYq2Qzw8F8iAw2llCu7EISvz3a9jwOnaXAN
         qHqpP66S1NppAfcGFySiYH8Hr9V+c+Uy0gvbvW96Ly6TL4tn6xvjfqlaWxZy7PkC0g2b
         Jfe6lZRRLBgtpxVEVn4XVamZpyXi1CPddbP+pOCql0cCJQtCfnpoNVfBqrpRoz4YiaGa
         aTlzRDAsvGLHyfucA1HO3hLAZWhquhu2BDkXHh00Th6ecy/vnBCmz7PAL5msnEH54aoe
         jUnmOwieXFcHNsWcp/HtD0E7YxN1m2ThubyhXx6/kVcBRtQUksQ4AIc0Kv9qd/CcVNmr
         DsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744666491; x=1745271291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7BZi7HnKfbbt9TH74oPDg7WDBebYy2OSaVokgDUUbg=;
        b=HgmW51w0TvuOH2yVKbzP+nsIiY+frEocIcUdinRJsSEC8VXCniM54Sj2q8KRSkCyxN
         g3W7ea721Fpdwn8dxtHgaIgSSRAu8Lb3tT7cC2CvUxIl4e9em4c7lkoA5cLBQ7O6nWtp
         tUThH7+PoewN++QTKofDGP76n+GDNdu2Md3p8YaaUTyC+iZzJOdghiQWgyZcg1KZIuRS
         jyGqyGXXwDp8BMtGBNUFJcJpe++FyBmrOJ0sYqxAlgT38wszZca0C2p9fAXAlgeU9PTi
         ppOKgIn8m6Vz4soR37ZH7pAGohEPSlH5lImXZqSMlvGnHepCa2VaoQlh+n9TkWcnzLKM
         Xb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbkfN4UfzTk4zi/zPZ2Lybwe6PCTafC07QcKaDmNtZ1tIJsLEJKS5iGj9ARLsQf/HGCEzjYwI81D97kqJNog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWVDISIyXSRUB9L/cGJsURsLgJDe93IKxq5JCdXa8BlWg1MwqD
	NwXUAFC+v0dGZ5bsKBIOPAT0UCqUo3H7ltvKpsXty2VEXxWjAgUhbcUccwOABS8=
X-Gm-Gg: ASbGncsTxQUvD73KfWfdi+smgcnjbIE669iJguvyBKKF7Sgu3Bcz4eYxcf0u/JsyJ/j
	dMSaN4UVTwfvmxBr6BnIS7vovaBb9FpYnehVtnXLmSLfayqSY+Efsk+2ycrv/4q8WJDlPoYVHkg
	rAij9lzXOrz8b1ie6whSlHzRMtvThcdQEZCcXRw9oDW0RHbWntJJauyY+jaHCvnpCLamSOtm0Ye
	JeXumgFe+oQBgFM6uoh77u6vE/cNlOOicVMM8uuWShmgl4Wy/MzTpkP9Kc/jpP7JZ1UXaR4VN5U
	o9MAVIn7WQcMKpKkXEklqQ7Hwp4/vD5X3Jo9bRAFa+qTrA==
X-Google-Smtp-Source: AGHT+IG/kDZsmoxinyBq4n/Im69g3ys9L3BT2wiv3DJKobRUo+Jzgfnpx2t+FVw18cLid5H4hJIEjA==
X-Received: by 2002:a05:6402:1ec9:b0:5f3:8171:a4e2 with SMTP id 4fb4d7f45d1cf-5f38171a75amr12298487a12.18.1744666491385;
        Mon, 14 Apr 2025 14:34:51 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36f506425sm5554281a12.53.2025.04.14.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 14:34:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 23:34:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
Message-ID: <vpf4apahhpovhrqje4i647nldszen2pglbm5fdmar7bsyg7uao@3ymuod45ftlj>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local>
 <202504111339359e840246@mail.local>
 <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
 <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgxword5effrvsfi"
Content-Disposition: inline
In-Reply-To: <97cfeafe-7044-4f06-b2e6-e4a158419473@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_143454_516529_EF2CA282 
X-CRM114-Status: GOOD (  31.50  )
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


--xgxword5effrvsfi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
MIME-Version: 1.0

Hello Alex,

On Mon, Apr 14, 2025 at 03:56:11PM +0200, Alexandre Mergnat wrote:
> On 14/04/2025 13:09, AngeloGioacchino Del Regno wrote:
> > Il 11/04/25 15:39, Alexandre Belloni ha scritto:
> > > On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
> > > > On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
> > > > > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > > > > index 692c00ff544b2..d47626d47602f 100644
> > > > > --- a/drivers/rtc/rtc-mt6397.c
> > > > > +++ b/drivers/rtc/rtc-mt6397.c
> > > > > @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_devi=
ce *pdev)
> > > > > =A0=A0=A0=A0=A0 rtc->rtc_dev->ops =3D &mtk_rtc_ops;
> > > > > =A0=A0=A0=A0=A0 rtc->rtc_dev->range_min =3D RTC_TIMESTAMP_BEGIN_1=
900;
> > > > > =A0=A0=A0=A0=A0 rtc->rtc_dev->range_max =3D mktime64(2027, 12, 31=
, 23, 59, 59);
> > > > > -=A0=A0=A0 rtc->rtc_dev->start_secs =3D mktime64(1968, 1, 2, 0, 0=
, 0);
> > > > > -=A0=A0=A0 rtc->rtc_dev->set_start_time =3D true;
> > > >=20
> > > > This is going to break the time for people upgrading their kernel, =
you
> > > > are unfortunately stuck with this.
> > >=20
> > > To be clear, the breakage will happen when upgrading the kernel but n=
ot
> > > the device tree with 5/5
> >
> > Yes, you're stuck with this. Devicetree has to be retrocompatible.
> >=20
> > Besides, this start_secs is what gets used by default, and the start-ye=
ar
> > devicetree property should take precedence and effectively override the
> > start_secs default.
> >=20
> > Just keep it there.... :-)

It would work to keep setting start_secs but allow overwriting that
value in the device tree. But see below.
=20
> When you boot your board for the first time, is the date January 2nd 1968=
 ?
> If not, that mean it is used as a finetune offset year.
> IMHO, mktime64(1968, 1, 2, 0, 0, 0) is a workaround for the rtc framework
> issue we try to solve in this serie because start_secs is negative (1968 <
> 1970). Now framework handle the negative value properly, even if you keep
> mktime64(1968, 1, 2, 0, 0, 0) , the device time will change. I prefer to
> notify you.  :)

I don't understand everything you wrote here, but as far as I see it,
rtc_time64_to_tm() not being able to handle dates before 1970 is the
main issue here. This is of course only relevant, because your hardware
occasionally contains such a date. The technically right fix is to
extend rtc_time64_to_tm() to work for dates >=3D 1900-01-01. (An
alternative would be to assume that a hardware read returning a date
before 1970 is invalid. If you refuse to write dates before 1970 that
should give a consistent behaviour. But the original approach is the
nicer one.)

> TBH, it's hard to follow the logic, so I've a question:
> If I push in my V4 a framework fix that drivers using year < 1970 will ne=
ed
> to have a new start_secs or start-year value to stay aligned with there
> previous value, do you will accept it ?

Doesn't the need to shift the start year simply goes away once
rtc_time64_to_tm() is fixed for negative time values?

So I would expect that going forward with just patches #1 and #2 should
result in a fixed driver regarding the breakage you're seeing. (I'm
unsure about patch #3, I'll address that in a reply to the respective
mail.)

Best regards
Uwe

--xgxword5effrvsfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf9f3UACgkQj4D7WH0S
/k6kAwgAn7QiSrVS5Jy5qEwJYxUOj7XozPsN8Zq0zgKKYBqm8IWz+mS1nyNSrfl5
oZQooSYT9XLLkgxOZJjHUV47P8G3ClP+nR+PvatZa7ukJTHU32GEOWNEtAd1NZ6k
EbH7z1BFqU+zXbNp4lCwS4bXpp0JH3j4r727u/UD5rg1yrO7HACF+VoNUYKpcKuw
aEVAFy51VngHisOufxAY3JYnQMtwhLN03t1UpwWrm/dhcukyWsBQGgJHs3cQMK0r
JJhVftzvihK98K3vv94fjlc8tr51LJIl8HVqMSZkVp/C9QwkaFHUy9bV9UGWqhQO
wBdR79PYhwox2zLOU50JR6euQ/yhFw==
=Kl2H
-----END PGP SIGNATURE-----

--xgxword5effrvsfi--

