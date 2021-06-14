Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BEFC48BE6
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 10:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D65611C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 10:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D65611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jlm6Nx2o7+VdQ9rMTduB10EaqDS1nUQGj4s7BgcplM8=; b=xgKab3O2hobJeKIn4RdhPYv3kO
	hTfFY8vAVatx1EOZ5v4oLC57hcd71zA/NWdVGPEzdn3ozofhv3hFRNVNV+AZOmpcktM0+B6hY4k5o
	D04LOGk8t9Hj0SQcIOOB6Qj1Mt9sCCGTYmZN+wYnVIuPbWAH3Vrx/NadkTtmcaWIfU9eiO7rzpVk0
	9mGmcLlGbSm+O/Dpk71dygQhVvBAd24Oc9Z72F9dpbWdfKGsgcKODe4iYZtecRtbDZwXar4Z80QUS
	O8AEevCLgOkJJRUTNiSw8DH5Yfo6MypwUu5OhPwDFwHc9H/6lXRlRQ9Lv6hUQRjLxL/s+cXjP7QKz
	qP9z9arQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsjqY-00DZWN-Ng; Mon, 14 Jun 2021 10:29:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsjqL-00DZSu-36; Mon, 14 Jun 2021 10:29:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9DE5611CA;
 Mon, 14 Jun 2021 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623666560;
 bh=lSeXCd4lcJ0tTuMRN1HC4nFi6fATD6bu2jRIYot55WM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ko+f3laW2JB91Bc8p/Oxg7X5WOwVgspcCNOv3A/lGSGEFNFS0RZvmjPLuYLC37Zcy
 FF9Dek5SERjFhw7J0R/SYulTkkNhuB7AHoVw8oRuFfOJ0s+PaQQxGisqrDS7gpFPCR
 QvF8Bnzkm1llBwn7Wbiv9RAO9utRIAeIzYZKupieuN3qykkxjbQpnJjoh+0Yf3Dhw0
 oPNCkTTmURuV3paBgSq0WXDOYnyO6zJw4pbcZv1nbBQobOKVXsq+iwcV4kTxpobuJr
 P6oy/IKGBLvjmeECmOOFzOTa+jUm0VQFR6flZtRyTXMmmfxYQia41zd08i/CPRLS4W
 LB+/BYqXHoPBQ==
Date: Mon, 14 Jun 2021 11:29:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 hanks.chen@mediatek.com, linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
Message-ID: <20210614102902.GA5646@sirena.org.uk>
References: <1623413625.22727.10.camel@mbjsdccf07>
MIME-Version: 1.0
In-Reply-To: <1623413625.22727.10.camel@mbjsdccf07>
X-Cookie: Some restrictions may apply.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_032921_177868_8151C933 
X-CRM114-Status: GOOD (  12.14  )
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
Content-Type: multipart/mixed; boundary="===============3708351222639304264=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3708351222639304264==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 08:13:45PM +0800, Mason Zhang wrote:

> 	I'm sorry to disturb you, this patch is stay here for a long time, Do
> you have any suggestions about this patch?=20
> 	We hope this patch will be merged as soon as possible,If you have any
> concern, I will fix it in time.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDHL20ACgkQJNaLcl1U
h9CsAQf+Nn4HRlnSP3tQV0DnMF2cdXi1Iq99YwPbLlaUcaR573n/pt3ERW1fG+RQ
Buc3s5ft40NrHag2fnlP1plJY3hlhBvcjyyPvK+JhJanfYd0YmiOAuMAssVASA0E
QDPO76npJtv1EJ+Y5ZmNec2Xyt9kpbbHVZrk/kQ1Uv01p/a/wXRLNN55ZYmeQ2kQ
xFObSTgbJEEZtl/WXK5A7EDT7kfUSQO2kQIwHDI2AmiCOtE0WbqEYALgdd0ijAx9
IAvq6Cte2W8E5S6bWtyJ/0wL7VFdyI+e8fIuhoaNK56cttomrsfDy/maEDQIRukA
Vj8gFPHEmIY2r4tRjLbrBcwg1baueQ==
=nGK1
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--


--===============3708351222639304264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3708351222639304264==--

