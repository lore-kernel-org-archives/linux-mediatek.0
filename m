Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 18:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3509B60F70
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 18:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3509B60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZMqRxR6UtPwB/9s3M5fomlg/bX8Fv1Z5rJ6ITIfb58=; b=sLWn9nAvzG52TCwBIlIHNfTGk8
	X0Ja/+Y+iq6AFnJUVdAqebOjzBOi3w8jO0aiJoZZNb5rEMGn0uWckZLOXhXB558zK36WA+mRup+g2
	B8aqj70ZfayjxwJ2/Gme1uribmXQrBiX4+DfFWlNQqlPfaw8eQoeZZ65ELSUQX4GNiRZO8xxZvQCO
	g2fXiaYg1eVFd3ZizH5/x+K79oUvZWOj7Z2LvfMfu+uhtJLWJ6K/5Jt08+YzHS6LbZPHzVHEm6o20
	Jg3DyY6G1z8ZEpWVFEh/xWs07nlIo1HARPB8kvyw+NI+AVMAUlq8cixoJFJZRkC870gapP5VqQEIn
	AZaRKdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhcCl-00H2sh-Sd; Mon, 01 Nov 2021 18:38:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhcCY-00H2mI-29; Mon, 01 Nov 2021 18:38:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A50360C40;
 Mon,  1 Nov 2021 18:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635791912;
 bh=W/465Gonb/T0JqYrNNmIPOX1fgL6mxL95dFICGRyvTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHLRDNtGoZE27FcSIAI/F13Fhr3dTzeSEvPxV1cJAkTaQACBsohjM6/6WpXuFQlfi
 ZBX5BMqlqZpfQ7jiSBVGWlY9uR0M7Z9G/hAHH0av3jmJS7ELm+l8c3ifbCQokC411U
 r3WkuXu9R2OLFTOmcGGnt66mQjJNaG5Bu5KqdInjni788VbqPGdYwEECNttkMD5ofd
 ZhLJLOHGGpC13Z4rhXZx8mTcn36r9aOzOI48LeM6lio2Dlp7Dsy7pyUAYxYIlrzy57
 0Mc/qZLnrCLpaSKIZ7gm0eVlJKhZzXGbT6kEUlbpZcfc6mJ51gWYpTt+Pu1TX6/CR0
 Odu/nYYmg8zWg==
Date: Mon, 1 Nov 2021 18:38:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: YC Hung <yc.hung@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, matthias.bgg@gmail.com,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
Message-ID: <YYA0IgOPGIt0TT0O@sirena.org.uk>
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-2-yc.hung@mediatek.com>
 <YXwoB7FtRw0AzgcD@sirena.org.uk>
 <CAEnQRZCQHxctG+3L72Xx3083shytF478ONGGpZf0A-6-+nFE=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZCQHxctG+3L72Xx3083shytF478ONGGpZf0A-6-+nFE=w@mail.gmail.com>
X-Cookie: Don't Worry, Be Happy.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_113834_149393_CC41F1B7 
X-CRM114-Status: GOOD (  16.35  )
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
Content-Type: multipart/mixed; boundary="===============2816934149548772116=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2816934149548772116==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3purBc6q6T2VLLY"
Content-Disposition: inline


--t3purBc6q6T2VLLY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2021 at 07:56:04PM +0200, Daniel Baluta wrote:
> On Fri, Oct 29, 2021 at 8:00 PM Mark Brown <broonie@kernel.org> wrote:

> > This doesn't apply against current code, there's no such file upstream.
> > Please check and resend.

> This patch was sent only to get an Ack-by for 2/2 from Rob Herring.
> The patch will go first to SOF tree and then I will
> send you a patch based on your for-next branch.

> YC sorry for not being more explicit. I think the right way was to
> mark this patch series as [RFC PATCH].

Please don't send me anything that's not targetted for mainline.

--t3purBc6q6T2VLLY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGANCEACgkQJNaLcl1U
h9C5XAf/ZnMi0VtMydTyjyAMioMHmBfWGL4fveMkiZQPSYLoiblCk0AaGzHUCyBq
PrT7qz+dVzaKjttBR/Y+Ljc6tecBjX722HXPGXJ0Cu5i4w2nuQqgrGiXAcj34LeD
wnV+C8IJBtALNo8yWJfg1bnUtHalkpRetQsT20T8t8UIvylou9wmtm1xOyAKD5o/
BYLXHVkYW6vhX3sZ7CHXIGhy1YNk8sE+oeyAnBlyVL+x9H93aTOz4FKGywsnnN1F
VFaf1vTMXMfLow7XHsAWFIDohc7mWNMnlZYPY7g3UrjT0aQtE8ZbBUVoxGL4O06h
BnhMWg1Wy2bhz5/KfjPbTSh6Udv3gg==
=Wieg
-----END PGP SIGNATURE-----

--t3purBc6q6T2VLLY--


--===============2816934149548772116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2816934149548772116==--

