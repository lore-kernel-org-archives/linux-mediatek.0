Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 15:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 681CC610FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 15:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 681CC610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Obd4z/Nk6I0u9hn36jX4UPvDGtL4VNZ+rPOfzqsIbEU=; b=1RFqsdXumbrnHWQAik8x85nD2s
	OyDDUasXX4ftnzFolsVVHj09vjqOj2LnsSqGslo0tjIN+n/yPlECRpfgRRtJYoXRCWB1FAMw6oIyW
	myNX6koPe/T4KxgmPoJkeeuuq28JQk7UwSEyxpKfWVcOIQrSZ/+HxP5l5WfxxKDNXsnL4aAf8zW1N
	eDf982i2RZXptQSlC6Vr/LpVYHR8TmKrLPk6yzWra+IdEchCZFT0nUTI8BFdFII55tyQWeAcbqCtx
	mep3AsCUKcInbS/+snhFuZ8vWwivLmcqsq6xevlWUcDPH0QQNiwi/Otq6VAah+cpBqIkk6k3h2dTh
	vpcmn3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miepm-009HTU-2I; Thu, 04 Nov 2021 15:39:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miepa-009HRm-0p; Thu, 04 Nov 2021 15:39:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2109610FD;
 Thu,  4 Nov 2021 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636040349;
 bh=33691hjBX9cadGoNuJzUiBoacTbjKNGx8fgHdxnQIQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBp55FzKYxropmUNncWTfpvAEjPc/Yu8oqJK2u3YOsk5m/En/j7Bpm+EP3D7MKN3t
 yQR8Hq7NEYxbZdyB0vj0BxYacEjwI1oT8GCQ0apH3XudV1TIhYef54Dd4q6E6MZVaW
 gvylekx8Cts46ms8jezMX80mEeJhXX34EMUO6PNBMMiPbKlyWtjyzPq3aqDPmf4EP1
 ityBueCMVcwFsPI0/xsXzuiTu3Lvrm2zLX5syOP/bWZ6/BbZZys0M/9Jw4U1Yt285W
 5JqfDrYERFsWks5bOSxaXR1own0RBt5X4JfQ5gRlmqKxhSoVaVICXnUzIbNUOzpoAw
 vvslMfivQEspg==
Date: Thu, 4 Nov 2021 15:39:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, yc.hung@mediatek.com, daniel.baluta@nxp.com
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
Message-ID: <YYP+l7tMofYoB+aC@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211103100040.11933-4-trevor.wu@mediatek.com>
X-Cookie: Motorized vehicles only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_083910_106575_8CEFB467 
X-CRM114-Status: GOOD (  10.93  )
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
Content-Type: multipart/mixed; boundary="===============8236452655309547118=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8236452655309547118==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c/fvPxmf2qWNcw9j"
Content-Disposition: inline


--c/fvPxmf2qWNcw9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2021 at 06:00:39PM +0800, Trevor Wu wrote:
> Because we will add DSP support, an new machine driver for the same
> board is required. BE and codec configuration will use the same code
> when machine driver is designed for the same board.

I don't follow why the DSP support requires a new driver?  Shouldn't all
systems with the DSP present be using it?

--c/fvPxmf2qWNcw9j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGD/pYACgkQJNaLcl1U
h9BAqgf/Us8BcF+vWFc8NQqr1anc/z5wXrFIw7io61z4wr+ALcAiqTXbLnt7KKse
vtZMFvaxL3V/QbElufEk96G8jEXIrjYRuLAubtVQDl0a3LAtlQ8Se2ynhzu2Ib12
Rf8pihv2OkEOM8Cj11mnLnokKBRQPj/CeloGdaE0xvVqlrO+ymOTdXZ8luP69uI5
kCIYGzh3zlGA8G/aT88Doxmc9T5mgCoj9eu35oxN3h05bf4/h5kN77JHL6eiK5op
h3Xb2ql5Kaok5XZ1R4ZSbc6DhTY8xtsmfBkR7wZwPkmpXyXU9H4FTQXqib55VyXA
q5NZy4f9SyI9MoQnUgLHSiijyH5mQA==
=N3h7
-----END PGP SIGNATURE-----

--c/fvPxmf2qWNcw9j--


--===============8236452655309547118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8236452655309547118==--

