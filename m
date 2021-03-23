Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F22BC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 17:16:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4513C619C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4513C619C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f+GZJANNyDv+MD8mFkPUdVpxVUkiCOCVrhX4U+9e54Q=; b=P0ho8TZjMrFsJH2aFwJgKDqlc
	iqjfzEgPRsSdURKsw0KftFx8oVJQq3mS7RuRi67h9wBkEalNyYPpxLNH/gLu55V06Wq0vRCcR1Y4Y
	C41/7Tn+/wG2D/HcrRjHa2ZuSqozTKbcUG+cuODpl6MeSLkLPeyvwtXniZwt6sbhfpqqM9RR1+3Z/
	sdEfMPQzD9yZK32N3IgiTMThnZaqkx5OaE+nnJVQ+1WwWAYUDz4LWKYtg+x7vY9DN7YPR50f15WhQ
	JVic9jgUU3LL0VeQbIn+2kq/VFMOnYm2/cL+d2IeaZMhM77q+vlupv5ggUSjGUnJqbSigmLPosyNh
	Tm0VF4HNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOke8-00FNYX-I3; Tue, 23 Mar 2021 17:16:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOkdy-00FNXH-WD; Tue, 23 Mar 2021 17:16:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8204061937;
 Tue, 23 Mar 2021 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616519795;
 bh=M0vsensJWPkDXt6/BdRDvTl7TrhY/roqEdREaiWe4Aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GrBxWn9XF3SVWYtxSyaWE/PGGCPwatw6+L1Zegl2o9i4DdoNwG2N8w0qWq/KtzoWt
 Iw65MpUaiG3kh9PklkmSdeLA7YRckxblBhqpxvz/cOEtG7JHpfLL/UKdakQlVXa19M
 KxxSK/aUsoAcg/CxFMheZFJRMUibExyVdduXflTgwxrKL1MttmrCok381pty0+0VMf
 Wap98k1Ej5sJ8kubdJyJ/d0O3rvpbHfmwYHNJs545AwbwPiyAkkG4GfubpA2bKhR5+
 2n2k0aODiK31yBD/NFax+IZItyT/7GmUD9QrfSFDGHZecx3MNHXiy6ct+n8rnjJNjK
 cPgW+282nD0OQ==
Date: Tue, 23 Mar 2021 17:16:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Jian Dong <dj0227@163.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, huyue2@yulong.com,
 Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] regulator: mt6360: remove redundant error print
Message-ID: <20210323171628.GA9323@sirena.org.uk>
References: <1616502161-125407-1-git-send-email-dj0227@163.com>
MIME-Version: 1.0
In-Reply-To: <1616502161-125407-1-git-send-email-dj0227@163.com>
X-Cookie: Do you have lysdexia?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_171639_233335_0ED3E77A 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2975008122138803368=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2975008122138803368==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 08:22:41PM +0800, Jian Dong wrote:
> From: Jian Dong <dongjian@yulong.com>
>=20
> fixes coccicheck warning:
>=20
> drivers/regulator/mt6360-regulator.c:384:3-10: line 384 is
> redundant because platform_get_irq() already prints an error

This doesn't apply against current code, please check and resend.

Applying: regulator: mt6360: remove redundant error print
error: sha1 information is lacking or useless (drivers/regulator/mt6360-reg=
ulator.c).
error: could not build fake ancestor
Patch failed at 0001 regulator: mt6360: remove redundant error print

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBaImsACgkQJNaLcl1U
h9CT/Qf/fI+Ve9XBpCARK5KtyPiB7dUkhxs+7CfYhtmLauGIgs9dnR9mwm+ElsWg
nfZeRuqUg7IjUq9JQotr15bdGoqm6/nUAOglznOuZISAKv3dXm1bmJj+2QqEdfp7
mViOgfHw0o1h6FPjOZ+lGmFUCNUG/DyOaVcR71m2Bsz3FvJhqa40FAW6xzvH1dak
it71vBH9Y+kCDR0nx8wifGqLwbXQTaPIoGjMjk0soSLk7/5nGLK0vVmizur23gEy
scR531mK5sMFyYWPrDMXJBKyk8MS2er/Y97uD2IDc0dWggg/PHbkSxmHxe5x2D1c
CB1Uvi23YM/iAswBL+0fwkRApum4gQ==
=GJoq
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--


--===============2975008122138803368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2975008122138803368==--

