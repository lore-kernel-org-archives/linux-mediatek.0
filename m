Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC353C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 14:30:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF7364E34
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 14:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF7364E34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e7CfeN6b3IUq/ULLhfnU8nsod6afKy3hMVK+nReb4CY=; b=0s/IEn2qZSbvEBqx4DLg6dDSB
	VPrZ1Spuvlng2nd3C3MljpOGxaafqYzWe7nBT8hhr4ZSBD9aLe+MOJTMKalRHrMBRmrXnD+FAONO+
	+hcWgn7O10AIXW6oxqn2hhve1/7Mp3ZIaQQbi/lmXB4Vy/kU9lTWX71KE2C0DHkJG0GGyJGKfENc8
	IOVXfFUkCpv2j9YUKAHWEsnLG6fxGfNXinI0LRre89wb2+P5to1FK/Obt4k9Q4osy0u73O/EQdL86
	487G7zSCfC55NwUWljmlEUlSf/owl9XiyIP3zGgqrCUQJkwweTaSD4YYKNPz7gRWqW8+ezOGtb2U/
	HU99gW6SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lECDb-0006fH-Aw; Mon, 22 Feb 2021 14:29:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lECDX-0006dq-8c; Mon, 22 Feb 2021 14:29:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id v21so648679wml.4;
 Mon, 22 Feb 2021 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=08zyHvZoEG/sqiEKTTXb/ZE6H1gD+YssvdQYgyBdOxY=;
 b=VwEdznWfVJlZSWsEWm6FOVFH3mbb4RZPXPPs3gygoYSeMB2leyT6iMvncQG3h4IAFV
 7BNlRnbv0/87MOWb7gpZbVZuXSyTY96MjC8LPhExk3GW8Gd35x3Tr6iy/XEQI6J92Twr
 fz5ENjfRlM4rT60e4ud/wIPA7c5LCj9tZouay2PPhOe5mPs+KjJIUBqIEBKLNjIlp4jc
 Ty722lQhcjcOW6JzhzsYDTzlnTi7OX8+Eua1Rwo8tlS1DG1EVHH2WLMFlCaP0jue5Ry2
 ppgGLImXxAcXkvFIvupOpAU72CWJShV/RfTD7kqfIDBGD3ybTHuEYPADhNmL+Xy0cYkB
 MYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=08zyHvZoEG/sqiEKTTXb/ZE6H1gD+YssvdQYgyBdOxY=;
 b=VLkoiAHoOHnljSs6am56g81r07tQOz9oUY3q++EU2bsxdAMCBM1zKHLLHLeQxkv67o
 c5DVtKMVqPeWNy339DTFm0n6kBVKJoqS/I2eb18bN0HHram6nyqRt8LRnqI80+7/gps6
 rxo/4dldLBUAfK1POMioP2CQJTd/IDzKrkNOhwZQ0NhSlhN6rjMDlWq2YhBQkU9EgZp6
 bYY+Df7pG5JQC5WLzdbclQ5FGgCUn8FgCYeuGjrk48cnUN4SDXdgj0B91VB3BF1S+4Hd
 D6CQolRnJrb6YUV5f0DMEG5/PNiQjB3PfHTiPQronvqoGf0yE+aZ6sdFm2qdQfQ54NOY
 mopQ==
X-Gm-Message-State: AOAM532ghCPB/T7PwvpnY0oiGRS+/gWadbyrZKlVBLm3MAa6zBxMO4so
 IpdUOsNDP8XnWQfSm3MPKAk=
X-Google-Smtp-Source: ABdhPJwJnopNAx8z65vXkOX33mUFv/6rm7XYKYtPdM/rvug0lHGJoQrCoatVgjrReM448ObplsNzUg==
X-Received: by 2002:a1c:e446:: with SMTP id b67mr20642654wmh.65.1614004180402; 
 Mon, 22 Feb 2021 06:29:40 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id t16sm10830487wrq.53.2021.02.22.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:29:38 -0800 (PST)
Date: Mon, 22 Feb 2021 15:29:36 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2 1/3] pwm: mtk_disp: clear the clock operations
Message-ID: <YDO/0Onf6a09YRsP@ulmo.localdomain>
References: <20210130141226.25357-1-jitao.shi@mediatek.com>
 <20210130141226.25357-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210130141226.25357-2-jitao.shi@mediatek.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_092943_339526_1E2AA4B9 
X-CRM114-Status: GOOD (  15.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, srv_heupstream@mediatek.com,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8103872566436143949=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8103872566436143949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C/yvIL2pWg3hjnxv"
Content-Disposition: inline


--C/yvIL2pWg3hjnxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 30, 2021 at 10:12:24PM +0800, Jitao Shi wrote:
> Remove the clk_prepare from mtk_disp_pwm_probe.
> Remove the clk_unprepare from mtk_disp_pwm_remove.
>=20
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)

It's not clear *why* you're doing this change. It's already obvious from
the changes in this patch that you're removing the calls to
clk_prepare() and clk_unprepare(), so instead of duplicating that
information in the commit message, take this opportunity to describe why
this change is needed. Without any further context, this would seem to
just break operation of this chip because now these clocks are never
enabled in the first place.

Thierry

--C/yvIL2pWg3hjnxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAzv8sACgkQ3SOs138+
s6GcPhAAmaYjEXbN1rSMvBmNnA5AzGixIFwjkZrW6KmtzXP0/GhhDKu/S4ExOHrX
kIwYifz2tmYQxR9aLwRc5ZPq2lbUDq/2XX3oeN641O1Vjc6pHCkE4mBZEIC9XuLw
XY1uKGkwEq7V2dK7j0L574RcMXEa0epWnGUROVVVMXWol6+lGzGsxHGWCi9dl7+D
1V5bDvR4BAGAXPnTCsXa56zM3ChJ2bz6EcetF3lK0/mW93aeCQ8ArkeEHcZTcZok
7RrbAN+gf19RTiVz3HPjyv5uHg89OM4No9Y6CNgzvKyP1lMYpf6p33rkcDMCX6OW
/OQslfs/M6Fyxh4iCo+nf1gQU+xtJBjZKhBTLALncioaCfks19F1mxMy8dqOadKD
Vdbz74tR99AY4J0txeoZVgsJSmVXt3+VNGUstn1dnzJZ0B6qKTFBV0p94rROjUAO
JO/e3cC2V953JB0K7OGcaOW2uJDwHvWptRli3pz+10EF1xSz92GqEwxSbz0JHoN5
Gc24Lotut5K9dAogZeGhbc8H2M4yyYaqH71c6BT+jaZxsNIWdP//QBOq7KqErn2s
WNOo0Mh8itD8RrBx8YQRsf34hJ1tn1tnjWOL7ps1BfCAMWwlG5nGiLpYlpCkZkVB
b+JcNRZrNchuGqZw7mR5qoLVBHiy2QQS4B7AmX8qTNnbwETqbow=
=qfDp
-----END PGP SIGNATURE-----

--C/yvIL2pWg3hjnxv--


--===============8103872566436143949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8103872566436143949==--

