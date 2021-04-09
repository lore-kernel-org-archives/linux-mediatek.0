Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81197C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 12:24:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7B7610D1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 12:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7B7610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=npZcwC0ctlIhlsOMRyk1rkH0fpErxVO5WMzOxfr7pqo=; b=RgZIijVnSaZ0Y7DBdDLdyx147
	nU37iD0gDjywJtfra3cilkp/+mxA1mtxbWOo5wgBmhgWryfTHEjKkJw6QK+AWkJj8dXl1iRy7OcNL
	6WGN5TNAfhWk9SzPL74vON4N+Tr5og81J65Eu8ZlBJtnft45HMvT9tKJJjaHsgRUKxGJ9o/wzponI
	ofoAOO8EJQf2QmANiYpvbddhEgje1/aKU9T1/hKh8+QfguJOdnrN0EuCTdhgd2XsDtidt/5Bn3its
	ziFNK9Mx6rlvaCNQmCj5LbQt29xXn56ttw6QjYxlvALYrtZDj1sC2SoWynImqAvdR0yb7/9LVNiuW
	Mxxnk20Zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUqBU-000iqm-Pf; Fri, 09 Apr 2021 12:24:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqBK-000ipx-6r; Fri, 09 Apr 2021 12:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dDmmuOMnrTstdQHLcak7JJ08nQ33vOnMIv2U8P95spE=; b=wBTAlaALT5VAKW8X/AXLQj8VDb
 ZQERW/igcWnRKkBjwjsnmVbiYmH2xty0MfP+GldyZFfHXP9+cao6WCUDrEL8Yc8TgArX4QME8zezK
 9yh8YW8DyMb+a64TiF37CO65O9iEkg43PmU+h2gkyQ3IJk9XTzq4/z94G8K31zBcCc4whebNHwtrf
 /1U/jgjr8Z9n8BuLqg5FDxwzfsfJFNH9G5VIgtnUI34eePnPxSWStZY3D6W/cxIZ/AplCEz+U/fYH
 vCvLz42DINhIrLvLZQsJQ29QnXyNkxu92hJ4SYKYhUboL0hyDNpVnhm2uiWzjHW19buKRDuPfBxXh
 TKIsrrBQ==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqBH-004VUM-Jr; Fri, 09 Apr 2021 12:24:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id h10so6299948edt.13;
 Fri, 09 Apr 2021 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dDmmuOMnrTstdQHLcak7JJ08nQ33vOnMIv2U8P95spE=;
 b=iMm27RJjZpAnS1VjwjNFdEdlorvTwevDfiANV6EBz84mi1L9Ympa/MEL45nLob0r5U
 SLw1cAa/mcaLCCudi3m3kCtphAU3NuZl4DDSlo8xCMY0kd2Tm5Mnm5U5B1+bHkypbJH4
 irU80VH9KgyZjv7FuzP/IDfFmr2rzgBFamd6lx+OwThKIHxFxPjbg5C0EUiQlxewiVw/
 MKxUQ+OFKpMqSA1eUDXqdBRSUd6nRn5oC2wna7hCne4xo9Rs+Ryl7oCqYYpyDBPc7Kil
 maDL0YpDmSJVrObWzO89A7t8EqPB5Y7PTxNnguM6+/TV0+BdmT5YSOKdcTY2v6MBq01d
 +YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dDmmuOMnrTstdQHLcak7JJ08nQ33vOnMIv2U8P95spE=;
 b=UU2u6bxeg+pJWm0jAir7m/k82p30PSIcdTMm3zzZwnmBGOZbkwPhYsoW0VEfneHFBE
 CoWsM/LXAwQhJVU/a5+JbvCf0USArCepo0IhBF+5LEIrswkH+R9G/LbuGB36GUXx9MyZ
 OroyJS/O4467wgwamNt9ctL4YSymr6YVjTpeQHUK2x4cbmUhYvGUiULEot7huv5aPg9A
 uxqTDlhJK6wEWcpLl+06m2HfhBbXWfjeE1Mc7Ed3Fqmn9nuiB5/A8Eg3lG4OctxTj1za
 CjQp5lnfPLIKDxAavzKniaDUp5NSm42Hg8ryocz3HAJaCniWz6un43gdr99v4Ofuud0U
 dw+Q==
X-Gm-Message-State: AOAM533brc9X9MVh0X/q7T7rcRkpDmCQCcqu0WiS5wcXkQ3e/gh2mrjE
 unnoBpFA91c0c+E74uGpfRU=
X-Google-Smtp-Source: ABdhPJw1UQ8t+I94zh+tUqUsDHSoeO2DCGHzyhF75nSRTJ1hIv1N/Mwn2ysHBEgVkMwveeTttbR0/g==
X-Received: by 2002:a05:6402:1a2b:: with SMTP id
 be11mr8900562edb.304.1617971048229; 
 Fri, 09 Apr 2021 05:24:08 -0700 (PDT)
Received: from localhost (pd9e51abe.dip0.t-ipconnect.de. [217.229.26.190])
 by smtp.gmail.com with ESMTPSA id p22sm1159691eju.85.2021.04.09.05.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 05:24:07 -0700 (PDT)
Date: Fri, 9 Apr 2021 14:24:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3,PATCH 3/3] pwm: mtk_disp: implement .get_state()
Message-ID: <YHBHizYI7oyULZx9@orome.fritz.box>
References: <1617703062-4251-1-git-send-email-rex-bc.chen@mediatek.com>
 <1617703062-4251-4-git-send-email-rex-bc.chen@mediatek.com>
 <20210406102756.4kncasxe4um3q6wi@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210406102756.4kncasxe4um3q6wi@pengutronix.de>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_052411_695625_D3F07AD8 
X-CRM114-Status: GOOD (  23.81  )
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
Content-Type: multipart/mixed; boundary="===============6463333669097579194=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6463333669097579194==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IeOqv4HFT+wQMYyn"
Content-Disposition: inline


--IeOqv4HFT+wQMYyn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 12:27:56PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Apr 06, 2021 at 05:57:42PM +0800, Rex-BC Chen wrote:
> > implement get_state function for pwm-mtk-disp
> >=20
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>=20
> Ideally you S-o-b line is the last one to show the order in which this
> patch went from one person to another.
>=20
> > ---
> >  drivers/pwm/pwm-mtk-disp.c | 46 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >=20
> > diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> > index 502228adf718..166e0a8ca703 100644
> > --- a/drivers/pwm/pwm-mtk-disp.c
> > +++ b/drivers/pwm/pwm-mtk-disp.c
> > @@ -179,8 +179,54 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chi=
p, struct pwm_device *pwm,
> >  	return mtk_disp_pwm_enable(chip, state);
> >  }
> > =20
> > +static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
> > +				   struct pwm_device *pwm,
> > +				   struct pwm_state *state)
> > +{
> > +	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
> > +	u32 clk_div, period, high_width, con0, con1;
> > +	u64 rate;
> > +	int err;
> > +
> > +	err =3D clk_prepare_enable(mdp->clk_main);
> > +	if (err < 0) {
> > +		dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n", err);
> > +		return;
> > +	}
> > +	err =3D clk_prepare_enable(mdp->clk_mm);
> > +	if (err < 0) {
> > +		dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n", err);
> > +		clk_disable_unprepare(mdp->clk_main);
>=20
> As before: %pe please

According to the documentation %pe only works on pointers for which
IS_ERR() is true, so I'm not sure it can be used with plain integer
error codes.

Looks like there's a bunch of drivers that will do %pe and then use
ERR_PTR(err) to make this work, but to be honest, that seems like
jumping through hoops.

But I don't feel strongly either way, so choose whichever you want.

Thierry

--IeOqv4HFT+wQMYyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBwR4gACgkQ3SOs138+
s6H28RAAjleBEqp+dx8paKdyG8VdIU9HykF82fycv6g3VrCecRf53SQtxA7boouL
ZwXKfG14xpSZe6RGEhlG3s4CLwzQQVnoVn/pp2hIGwJHB58lXYKZ7RlUUvhKxov9
J341uNYUPUkBheLIkgbF44ohGIRH8YV107LdI2KpYLZP7Q0cyX7B6tat5VTxH7R9
l2TGrEjpzpXjwx1k1zhTnIubJNwTqYGAnat2WpGDTWsBrL3Bm1u9i7kkYEfrYuvp
LUGiQuZTbIlFY5xU8A+7+4oNVwkEI4k+yQeltm5dS4TNH1JPeA8iX87B8WIaOQ30
tO8rufvyeU+mfkwmZw7gxU6uQoBNip9K9hksXP6ufxz9mQk/7EDYDvltQeFWLQE1
P0Iop2JaL7WVWRwVYoG/K4tlkwDV88LgVxSNq7I/VoXe8b+yOXsaYCxcOKfWdEDz
FjgYDq8i2FiA/twxnAopPtFWZhyctrTokPU7JRv9wNCkFG+7V4kjbtQNcE/STGic
bsuPg1MN0iev2oDsXEolXhLorZNkREpfOjTc15jUmunEWjf/V6/m1aEKaodhjptq
bGNcXEWogDc9ZwJbi59KR8GDhClYLfdBRfGTBLazdX5iZ/63pOk2nCHF353EEldm
jN3Ca0o0VnHUcc9HzMdZEaPMvGgh3SZs3/rcivNtIZSyModYZf0=
=NX8J
-----END PGP SIGNATURE-----

--IeOqv4HFT+wQMYyn--


--===============6463333669097579194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6463333669097579194==--

