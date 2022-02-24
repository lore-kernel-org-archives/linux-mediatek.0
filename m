Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wmZ5KYGAe3DfrsdbbSP4RzSOn+AwfMeDY39Kmg5qa4=; b=hQV9DTibFSJangX8pEDFDp100C
	5pA8uTFOnartNp45cXHNF6FoJKy9HZNVZMcqYxrsWKAybbPkRp9AeGVDBOy+pHvaSAC9FNwpWawiK
	d0Ktt5L1e+JN/bH/tn+VPkVyN97f+GcacGd1HRyQpuUtiL8FAalOtc3oh+bdfaSIePshVOHU84g5U
	n8y9TJc+osxluNiUZ0M7bnffOI75ZdI7QEYi3cB4ico9hf6gaCGRjMKtc21sTXt0ioZy6Eqd6DnrE
	1Dnt6LruPM1HzkwHwGDwJc7E8zaQLsOX4F4VpXO1jKWRJqNnIMQ8sWox4O2RhiZkXFltyuUXWuiQP
	WwQHgxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNEYb-0010km-6v; Thu, 24 Feb 2022 13:53:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNEYN-0010f2-MD; Thu, 24 Feb 2022 13:53:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cm8so2956462edb.3;
 Thu, 24 Feb 2022 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PsHbpOEJCVknsAa9Ew1MJQLg7HZo/XSZeiEybp+5mZg=;
 b=QDxmyMXJ4i9lHmwVUraX5Rlhf7hv+wUE4GLih8mYSl/hCGo1BUhJX+Y1I3L2c+enob
 vVGhLR9hh7gop8Cd9+9Fu2E8hC2ruBDcwonDLTAUXu7lIp+BB8Z3CS3fsK5uje4RIiLY
 QoOgti+cWfvrzDU6e/JGaF9aParwVVPvQzocuJS1VgnybVST51Qa6WZJJHXfCM7n1KaP
 1TzCCXiMaWKOvNqWIecYig8Dqg14gY2X/xZZGn3kgC/OeeI6CHA64opA52auIsSFqB3B
 gAMnHvg7efk1a2N1H0cbJiHPtCcX6botTUG9kpQbXMsoWLce9e462CquDLW5x+owxfii
 xAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PsHbpOEJCVknsAa9Ew1MJQLg7HZo/XSZeiEybp+5mZg=;
 b=yp38X33vO0aQfNNK9xApRPADKh55+hVnaf1DF9TBf+H4baJB9l2m3c7Yyc4P023+j9
 5Up+Fv4SzOA8bWmDsCpCNg0iR+jfJClvxAdjujsLOxUqO76TUDA72QPW/xjF9uuPulBL
 2Wf5kCsrLId7IgorN0QvUTRTExzj7qU0QrUGsB88vKVEhUQdVGYy5ItS4uJtPryNnYRF
 Fq2QesRKNEpqGdhMDFIa3Er/DiKmjE2vuhiQMQofl3iV2UTJ3fSX4woOocRtk3Vy853Y
 WUHdTwT7It/KsCIsdwpvEZV9jgtFwVfnvo1dquLBioKPC4qHwyoEa93ip2s7by7IubVy
 Dnow==
X-Gm-Message-State: AOAM531LQNb2Z6rbwo369TDXuYVJxrh75SkCFjsdnlric//Z9PUw7J2J
 1DA0X+8buk8gu1cl3D4fiuc=
X-Google-Smtp-Source: ABdhPJwYJ1sQPo7eUQ7M9X2zgdVZRDirXqwrTv0tPiXNsHmdAq6JmlyGZffSuNvBcEayqtpPP6YBHQ==
X-Received: by 2002:a05:6402:3583:b0:410:a99b:59ee with SMTP id
 y3-20020a056402358300b00410a99b59eemr2402863edc.454.1645710785751; 
 Thu, 24 Feb 2022 05:53:05 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id c11sm1550197edx.42.2022.02.24.05.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:53:04 -0800 (PST)
Date: Thu, 24 Feb 2022 14:53:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/3] pwm: pwm-mediatek: Simplify error handling with
 dev_err_probe()
Message-ID: <YheNvqKMfDPqM48r@orome>
References: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_055307_746687_0CAD020A 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: multipart/mixed; boundary="===============8214628870141607140=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8214628870141607140==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d2Zfu6vgd3T2uyn0"
Content-Disposition: inline


--d2Zfu6vgd3T2uyn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 03:03:37PM +0100, AngeloGioacchino Del Regno wrote:
> Use dev_err_probe() to simplify handling errors in pwm_mediatek_probe().
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/pwm/pwm-mediatek.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)

Applied, thanks.

Thierry

--d2Zfu6vgd3T2uyn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIXjb4ACgkQ3SOs138+
s6Fk8hAAnIRaKfj9+HXIijwEGPCmMx7BlzgpvJ6PmUHUWirU6k2C3ptFUVxh1p/R
sp1MdzkgMXh1QR6sffWbmJWMrBW9c4tFzjeHTvGls/dEchQi2VWqTaHEvcY6dMB5
yrK4MZfCbGe08jFJfI5CwDirhxNK/cInmKOVxGL60u2QSEMPRKvjjlIl2YvFqf3o
C+TIRlC7C9rc9tuOBKvwQwnixOeJELte3k+E8WSIHBE2/G3lwpCQxCQd8VvERBvQ
+nBAx0vE9b+xe33lYZBnc/C5RhW8FDoIZ2qoXxhycQvrBX1H/2am+F47zGr+097Q
kyX24SIvodLAt/9Al7/W0TrLqYlTh5kL595/sT5ksT8pJqtGeHJKBUhlpjIMD+3K
J8MPsi8jQA7B/bWB34BFjF6OgIT28sCHFUGL3MT1BKEpsyt0py6TBt480LQ7kT8V
T7H+whLUZ5uImhIbCon1z2lP71MneIRG9bUYYVlEX1S1syajKdSlBldmPAX3FUEc
LDkfTSRwFXGsydlLl/qiOhSj03yHymPWBa8UZHlQptZ4PQQJ/tg/Z4kFmZxE/Vca
91FrqBN42oUtjJd2H/NxGsLfB4n6hFWrHL7dHdDwXmMWD919IqFmAzmzj5wwW+sn
zh2J3Lb+vqmhNTZ8PhM3lWG566bR2W9XfzKlCmIpCzokyQf/9Ns=
=wC81
-----END PGP SIGNATURE-----

--d2Zfu6vgd3T2uyn0--


--===============8214628870141607140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8214628870141607140==--

