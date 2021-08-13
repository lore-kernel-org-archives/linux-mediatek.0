Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9828C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 17:26:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D11360F57
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 17:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D11360F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zAoy+WGJtE+4pvW8cZyEFAAt+a9VzklKR4O/dBFlqg=; b=OF+eQQU6QIa6/2ivlGilMV3Q9+
	MTsl1ZZEpcqkazpptr+fnWHQcgtfZJgN/0RtBAWIrLvWHvhTaLfzOD3GBCJItFYQHwLIYR4EYAies
	IRCs5lJmXdaDYswCH0Y24BafBk4Ncm/T3Aj/42S6SAORWAj8k9RBalGkO8CFoUDoCvTbS4dXymHxj
	6ax01C0Gv7AHx4bpEQB6fmMe2MbEOwFUeMksUBIUY6v/+McOl5J23+6DKXimEjVqhDIaZpdemgAd+
	Dx9zJWwu+alncIRFxq5Mfd/i6iIrdP9AMzVATX5PsIqXz4/Zp8WcLDs1IO5VSStfD8ImvYtng8V6y
	uJJH5cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEawR-00DFa5-Un; Fri, 13 Aug 2021 17:25:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEawD-00DFXW-KH; Fri, 13 Aug 2021 17:25:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4D1060F36;
 Fri, 13 Aug 2021 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628875545;
 bh=bmfn7HbaaCItG5D2XO6GaE2puQJLN9rvaABOzoYwYRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwgXXRq72gtd4nZHWuZoh7lOvyjwD50w3KX0bd//GnWIV0vc1ulSzvI/Tnc/M/pk9
 a0m+QuNF0RSxm/QTGyMWyeY4Aeli4trKm6bGJfTNsqC3HLPdthQXE4fHjyg0gU9aTR
 K0VzwueqE0tGHRfClLzJp1hpzipICxLVX+wbGJ8AIB9I9o9sMKuq4K5PqcMrRepXwR
 pXnbFz0d0zaAT7p1gK4rdG2ESVJM6v5sH2aelEdVoZfHfm6AIMCyR9nWdfsRVBSB/d
 E3EJ2UPCDbXbL7cZDdgKR7GnAChJ22fQ3OjVGxfhqOCLbl8EyDPohfhLRxNKXTufl7
 h6MdWyntVwWmQ==
Date: Fri, 13 Aug 2021 18:25:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com,
 matti.vaittinen@fi.rohmeurope.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH resend v6 0/3] power: supply: mt6360_charger: add MT6360
 charger support
Message-ID: <20210813172524.GG5209@sirena.org.uk>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
 <20210813155438.4ssph6deqksob2uv@earth.universe>
 <20210813155858.GD5209@sirena.org.uk>
 <20210813162029.q5slrkubelfy3mvh@earth.universe>
 <20210813163254.GF5209@sirena.org.uk>
 <20210813171106.entpro4b6dstho4s@earth.universe>
MIME-Version: 1.0
In-Reply-To: <20210813171106.entpro4b6dstho4s@earth.universe>
X-Cookie: E Pluribus Unix
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_102545_734537_F9AD39F3 
X-CRM114-Status: GOOD (  11.96  )
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
Content-Type: multipart/mixed; boundary="===============5398731983844752309=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5398731983844752309==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 07:11:06PM +0200, Sebastian Reichel wrote:
> On Fri, Aug 13, 2021 at 05:32:54PM +0100, Mark Brown wrote:

> > It would be better, the issues I'm worrying about are more general
> > refactorings or whatever that create actual dependencies rather than
> > just trivial add/add type issues - it can make doing some kinds of work
> > really painful if things go via a different tree.

> There you go:

Thanks!

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEWqwQACgkQJNaLcl1U
h9B8MQf/SabFhXiu82blgagfCOLQoxiKYIr+aSGYjCQoWyz9Zvt1gSq1HULJmgc1
ofKQVgValsxqtpU6UYzPMVBIPhqpZ/TIbgYHvlLMSrpD07Nt3tddjDr/g6fYGyj7
dwfQAa5QrxXz3uRPWpszlgQtkas3tpTM4lNF/ytOHWq1Lk9Mz3CmujN9qsbPKf/U
DBVVEsV+oBCVG1atIOrKqZQCUrOkhG/KxhTrw1DquIN4IL6ygGUbhNVxi7nbRgu1
z0TtqU54hgl3ALZZ1jxS3ehe/9zNP4zMZKk1qG+T6pj2kYwRmmDPVD9VFntbP1lP
0KOZoYGZKBO8aBs6x06t78BGFwd42w==
=KFpM
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--


--===============5398731983844752309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5398731983844752309==--

