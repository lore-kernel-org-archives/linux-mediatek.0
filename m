Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E71C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 12:51:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9F261373
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 12:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB9F261373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTNB/FccU2N9OdGxRhb68kg1ysnhd7N0uw8A2L6GpfE=; b=TbVIRXBhw0OOX2C6OEIBOZ+Vo6
	bPXR6gK3mIyxcOaKc2lo+Gepk5S8ytsn37MVGta9xKUiwTt/WiKQNgwWIn9r3EEPKj59yJGACZWqi
	rmLua16YXxPgJFLvCSmFyftKPqtIZtJ+L3LSTrV/72nQl/JGU5T9RST8hr6kFGt+PmAQr9C/0KfOL
	j8CjPgyZSZNFbD2GVmnriRmHeVWVFhf8SJydd4qN6QraW44YH19/Gx4dPKquO80Jd0ZASfyV+UZTY
	IaUi/JsqCtgisGwUAWDWKEzFhRyMKx5ctT64dL73sYhXVluHSsaoQ4IG5wBbHTyL7KT4U+fCvmAxf
	iCyu89dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXNQx-006VPn-Fq; Mon, 04 Oct 2021 12:51:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXNQl-006VMq-3k; Mon, 04 Oct 2021 12:50:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 406E46103B;
 Mon,  4 Oct 2021 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633351854;
 bh=DEPXcUSwkuLvKTygrBe4+mBiRWgvdY/Y44xGRtMf2bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i/lAB4Nxk794gnkR+a90qgK3LEiKjd12Aka1uL4kohj9qPLfYiRlpqOUWC66yUIXN
 +bywrc7QRJB9zbaCA7CDVrT0k4ub6MkrIBHh33vrTrelp5BgsZhWui4ctH47Fxh6oL
 e/SbulhfwqhZhbkPimdNnC9TFgDIctMXOeV0P4MwMAnMsXh/6Fclp8EJEbDE3J3ddo
 4B+CjbdbHybFlYMpkQVRoQtcvHdhtlvuAOPQwmESQVdyptJUAwA0WmId0YrZCU/P/F
 Xg3xNI3uQJ+fbj1brN/VDai97pYqukkm7sjeuBOEWhIJFblRZjU9O83tCAx0k3DI7k
 +5ZvpJurMMvVA==
Date: Mon, 4 Oct 2021 13:50:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Chien-Yu Lin <Chien-Yu.Lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yichin.huang@mediatek.com,
 hungjung.hsu@mediatek.com, allen-hw.hsu@mediatek.com
Subject: Re: [PATCH] ASoc: fix ASoC driver to support ops to register
 get_time_info
Message-ID: <YVr4rAbfS220ucDr@sirena.org.uk>
References: <20210820130210.3321-1-chien-yu.lin@mediatek.com>
 <a6336289dcf0009f2fc900c74f480b3c5fc0e8be.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <a6336289dcf0009f2fc900c74f480b3c5fc0e8be.camel@mediatek.com>
X-Cookie: If it heals good, say it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_055055_192694_2A2912B6 
X-CRM114-Status: GOOD (  13.78  )
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
Content-Type: multipart/mixed; boundary="===============3206389332573340622=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3206389332573340622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HwyruTVZFZxRCbxq"
Content-Disposition: inline


--HwyruTVZFZxRCbxq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 07:38:22PM +0800, Chien-Yu Lin wrote:
> Dear Sir,
>=20
> Sorry for bothering you.
>=20
> Does it have any status updated, please?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--HwyruTVZFZxRCbxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa+KsACgkQJNaLcl1U
h9B44gf/fUMPWu+biAIQkH3GN1XQANoRFWcvCfbt7GluF29wUwCmTWWNbE+pOnbC
OIAiltjgUkizwDO5UqxK+geASqmI24BRHOFxgb+0MLsEkcrV+oQXfq1ysba61lvR
ATwkOnFC9x/QQA1h9bAf7On6ma6w4nRKdXiJm8HwzlS2oNuiG3Q8yt2FM6MbrnYb
HSc/8lWwFnyB68zIZgpOV9boN8mxC1q/QW4QaYa5eVfsreRm+qGVLsL+ZQYcxv4Y
NznJUih2U3JDc+4vXZSm9uta360+wMLE6q9wsuBin6SOUdQlE0+k9RKTG0UTVB2+
dzSebepqIS215S5s9gGIE0/xHYCRZw==
=r+iv
-----END PGP SIGNATURE-----

--HwyruTVZFZxRCbxq--


--===============3206389332573340622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3206389332573340622==--

