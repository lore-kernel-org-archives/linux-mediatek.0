Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6412EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=564BVC0M9RKkCKu/nFO9CCPiM+5OWhkckjXDQ/i8j+M=; b=D5fS+pR3RfNcPW4CCyqmVArval
	Lw9z3UsEOY92XaATNcHEzhngmNX5WESHUerngqH+9Rk19m0FOjHcV+mT2O5P+uBoyvCBdTLLBZ9A9
	XmMPTCllZraIzYAdmzYfPR2uu6/PYZpdJ7jOe/TtJcw3s+Tlzr0w/1GZ+5i79m2kXGqWKqcv8OyR1
	5AsPIREskx9eHsmgIoWR8RgR7H7zxQWp5YwUPu0fRwdSqpud0CqUg77EtE/PmwwIsG/2qgAUCdNhU
	tA/V4A4QExeeOxhr8HiVOfWA2bwELi2zxl+NvD8/qCjA71zda/0OOw4wqtpEBHCYXnzlntrzvMDNH
	Fa8Z+6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNEAo-000vac-MM; Thu, 24 Feb 2022 13:28:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNEAb-000vXQ-OD; Thu, 24 Feb 2022 13:28:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id r13so4360289ejd.5;
 Thu, 24 Feb 2022 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U8ApFWalU/hZbExAJu9JWeDMkdzMfCYpGYwY4Mu/h8M=;
 b=ZDdWZqYPv3xo+qzcqesSu1qnNyPqCyHCU4OTXzCSqSQwhRi/qS6kNmN0325KLkNBaf
 r5hW/WSKtbo/Y3wpevI8uC1ygyW+hfhYeF6OKt0pRzS8tz2idVleGnvW3w8N5Ba4efMI
 o07e3JtoB3WlJQd2LYHDboHxsjYgCXqPsSbKc3vdAXQ3CxG6ziQYkkrf/Sqm0DGNQZBd
 i+ScYOWJobDhFC6MnjaW+Df4s+NSMMqI9aCfXnxuxDbbLArHOaRUn737n94EqPromu7j
 uBZ01kJ9YM2QwHUBwPrXopvtLI3T4Xzelj4TcPsh9a4oem3kUy6HLEvRy0Hqgbe2zRan
 x6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U8ApFWalU/hZbExAJu9JWeDMkdzMfCYpGYwY4Mu/h8M=;
 b=xknXveMBE3KMqwpYccAJKfHTe1rFDYK0/jhb2Ww27cnBNFQuUG1BQWQxqy8r5P2GOr
 6bxaFFt6Oq5CptLmb+BcRTMaSd3fKuV0wY9xeMzwlYh0ZwaCl1Oaf0X20UbL6EhFXkWP
 yIpzjviLuyFfVDC0WT3UcBvJFkNJ1scW4KcHZeGN/zHWlZNQ1hQf7Rv1b7R8jN0gmA9t
 GuPjD2WzLnhr3choAqgZXRIYME9cte0mKZFrZ8gmVvUVJitdWQmOnsY9RL5x3rPh1cgR
 tinG+3lRVC9ZSjgfeKf0JeiaWYezYpUeGBgNY91y0aGBAQLHQgcK0wVigGXcNyhkuPxY
 rR6g==
X-Gm-Message-State: AOAM5310JW0V3fiVxipvmVgL36AkK/v8KJliiuGbd7q9pWW/g/inrEAB
 bzLVwjhDEoFz/dVo03f3fZw=
X-Google-Smtp-Source: ABdhPJwPx6i2k9MdRnfKfvY56jx4rXDQln+lmVh3vJlUwi4M0boQKgn4cQwqDpz1f0/3cxt8jrbl7g==
X-Received: by 2002:a17:906:4b11:b0:6d1:ba2:5bdb with SMTP id
 y17-20020a1709064b1100b006d10ba25bdbmr2270099eju.61.1645709311805; 
 Thu, 24 Feb 2022 05:28:31 -0800 (PST)
Received: from orome ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id b4sm1332753edu.105.2022.02.24.05.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:28:30 -0800 (PST)
Date: Thu, 24 Feb 2022 14:27:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] dt-bindings: pwm: mtk-disp: add compatible string for
 MT8183 SoC
Message-ID: <YheH3uAzJCoPVyin@orome>
References: <20220207112657.18246-1-allen-kh.cheng@mediatek.com>
 <20220207125158.t5362u2dddccdmsq@pengutronix.de>
 <f6633fc82c4fa899c7f4ca27d9751d9e61fb90ac.camel@mediatek.com>
 <20220208091029.iwnepc343djtcvq5@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220208091029.iwnepc343djtcvq5@pengutronix.de>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_052833_812577_AF308DA6 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: multipart/mixed; boundary="===============2158385920657998777=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2158385920657998777==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0RdXHY+yV2W/4ltL"
Content-Disposition: inline


--0RdXHY+yV2W/4ltL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:10:29AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Tue, Feb 08, 2022 at 12:28:23PM +0800, allen-kh.cheng wrote:
> > Thank you for your suggestions.
> > We will send another patch for .yaml format.
> >=20
> > About the last reminder, sorry, I don=E2=80=99t get that.=20
> > Do you mean upper/lower case letters in an email address?
>=20
> exactly. I don't know how picky Thierry (who is responsible to pick up
> this patch or not) is, but a 100% match is the safe bet.

Email isn't generally case sensitive, so I don't care all that much if
they case differs. Ultimately the username part of an email address and
the domain should match to clarify that both are the same person.

There are also circumstances where it can make sense to have sender and
author differ, like for example if your corporate email tends to butcher
patches.

In this case it's fairly obvious that sender and author are the same
person, so I've applied this as-is.

Thanks,
Thierry

--0RdXHY+yV2W/4ltL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIXh94ACgkQ3SOs138+
s6FyyQ/+O6qlN6bd84T6E93BHOHVbJc9Hg4VTzKRkidnyBGqSibA50ETyN9Dp8ds
OMon+0lkvEsU4dqgzbW4P7PygDbXUJQUwP4isAN9MVRJKHiuWaWFlJ9udehLsU5d
6D+2KfUjvG7vXxmGToSan3xPlKjCcccCqYcduQxEixalh0nzR088O0JJXHncX4a6
3CQOhfiyKL3cDcLbg/eQZ+/PZKZu9sLOXKuhw4Nh7DruZ+b8rYIS7DM7imKxp51K
vZQnuP9qnMuAkgXKoh2p+Tf3zar2yf2zQj9gPodaS8p8ljfaeYJVA5uNoGE4jLgg
c3I6WdGR93ErKJXglYsWSs0caFMBrdONAjbWHysHuEE8UhIanh/K6TRgCSAeLx5e
QIzSYpb/p27CyuTOiDK8EysrEVmLZeio/Z8yJJ2FUSEEZjc/lK4Do6xviBxwpkRV
N5yYZ1sMtpTB4HqExgRC/sEMGGlNbvRnLjco77dOdN0m9W2QYY9gDfI2iuMGsjuc
+A5mVTSyj+/eQJyvFH3kzUy8D+FDtR2c7fr85jGXmGziuMJi2c+IMR5mn/u3X4tz
7JBXnR6cyiycJ1gk3XR92M1QWZq2baSrMd68rtDx88ZMhfJDzMqSv8znq7Et9+fT
638mkXNwHKgLrzDmMaCFpg1UBZznMwHiqxGFa0jt2Ed+axL1mq0=
=XDqO
-----END PGP SIGNATURE-----

--0RdXHY+yV2W/4ltL--


--===============2158385920657998777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2158385920657998777==--

