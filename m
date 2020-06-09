Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0470AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 16:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C910820760
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 16:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/6lRfzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="iXSICJKU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KevHb/78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C910820760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EvYO62HXyZRyFmULtQYpvyiBAKwZm3rETRGXREaOXl4=; b=f/6lRfzY4bTJrtNtiaPTVmGMI
	dZxp7sExfij/X/pPWLmgsfxqDGHcwnQ0hzOPlBn2g4cXQSIN41lIbFs1PMtB989dao9ypt8Bddvfu
	1nBER4oXJHQJhwVHrJRBEODW+Q6cjYHS9WhHC7XnSmfwaar+lE/NrkIjCw5Be3n8Aa64CHrK/2Zai
	g4VW92dv4TmRUReN1gmGJ6bya1zXd7r8IfaZu5gsOUqWcH6j9swdXoIQyRcd223n9Imi+S4m3wxDe
	WKZ5QAT0QFKgwIoXaCVVuaFn+2VR9DGJ3iQxOjCXZ8MkQftY76mA7J+GWbwHRQ0FPxIUqurK8RKqs
	Z1I3cHOUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigkb-0004D5-7j; Tue, 09 Jun 2020 16:05:21 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigkI-0001fi-2B; Tue, 09 Jun 2020 16:05:04 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 00C9D580198;
 Tue,  9 Jun 2020 12:04:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Jun 2020 12:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+Z1CbKKzxFQkq1/YTSxGbIdFSzg
 K4ihAD5NZF8upwxI=; b=iXSICJKUKbub8O1mb/4XprYG6trgvVZ4uvlrXgS6UAu
 c/McrLTaBFyWCe4ecRAseIC+ifBoW5MlWqPmgDAcH9CiFJdaYh0MrveUwspHRR3S
 h+JcXC77Qph8GLfibzZsYPx6mytiIT37zLfd4QTnetypJDO1xGsqhg8mkiUPGNGF
 fnZS+aYnQSw6na7bt/wCkN8r4250fx6vx9QTdzE0e+DAVIgc6+qPsPQ7YGsy7ban
 9E+V3ODTGK6PA0xlZC+UCNCdYKqcEO4JjURsm/Pl6HdwX4LtLPNf8arzMf1O2wR4
 v7ithUgvhcJ8R00QgJteE93qBUfRB9OHW14zfSmIxOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+Z1CbK
 KzxFQkq1/YTSxGbIdFSzgK4ihAD5NZF8upwxI=; b=KevHb/78PKKepKdMUBnr7h
 R+3lIkYZ6Zt08egMuE/+Hk7EI89kBhUVXeE7KTd+SLGGqZ00cJoDemOBkhAjd9T9
 qLzRgYxZCSnjG0mNo0k9Awg8jzwL+QZFYDcyKvu7c1IP44AXb2L0Noi3dR8n3JHv
 uj+ztELeVjOCQF+KwWPWbVqY0WpiyPmzBJOiCR7lCQNoJPDy11e4JG4+ToWboADn
 NOg7rCJzuJt1makv7efI6L7YDyADgKYO+aWvtYM8k++ALzAtEQEFA93m0FZSU520
 WguNFHqrTaYOGZ2hjWYYx/epchsMOjpzVBeiyZwAE6z0xP4dV9hYZOpFNwiCGANQ
 ==
X-ME-Sender: <xms:IrPfXuWsSVa0ZPTZYogX02FsTEzNbd6NO09uJ5DEEC7s36akvn7-1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehgedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IrPfXql3xi9awde6ICH0Hx-fY0FjpOH84zr4Y_UEMI7Yd0GL9dhQwQ>
 <xmx:IrPfXiYhL3ztgubReA5xwKSGkPocTbuzeOFsM1nJ3S3-yniFLQ7NNA>
 <xmx:IrPfXlWtxP9_Dk07K6cZ9SZF-Jk3BaVFA9LMLlEfJZ-VEsuQ92jxMQ>
 <xmx:JrPfXi6fIGP-gCnnKabye7wBEem0m1quMDoyKnUC1ckdjhuXeWEQbQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47B1F328005D;
 Tue,  9 Jun 2020 12:04:50 -0400 (EDT)
Date: Tue, 9 Jun 2020 18:04:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 1/2] mmc: sunxi-mmc: do not hide address in sunxi_mmc_irq()
Message-ID: <20200609160448.cy47xfwqs6hkxi7d@gilmour.lan>
References: <20200605125545.31974-1-frank@allwinnertech.com>
 <20200605151810.vmgnnzp7cadfwsu5@gilmour.lan>
 <CAEExFWuoHhLqt4aukmP30SSXmwnmYuRq2t5HWKUBvreeABg=XQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEExFWuoHhLqt4aukmP30SSXmwnmYuRq2t5HWKUBvreeABg=XQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_090502_290062_3755D10C 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: marex@denx.de, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rmfrfs@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Frank Lee <frank@allwinnertech.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 chaotian.jing@mediatek.com
Content-Type: multipart/mixed; boundary="===============5041353737237468923=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5041353737237468923==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uphnnc535acqsyc6"
Content-Disposition: inline


--uphnnc535acqsyc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 08:54:51PM +0800, Frank Lee wrote:
> On Fri, Jun 5, 2020 at 11:18 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 05, 2020 at 08:55:44PM +0800, Frank Lee wrote:
> > > From: Yangtao Li <tiny.windzz@gmail.com>
> > >
> > > Using %px to show the actual address in sunxi_mmc_irq()
> > > to help us to debug issue.
> > >
> > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > > Signed-off-by: Frank Lee <frank@allwinnertech.com>
> >
> > I'm fairly sure this hash is on purpose, and both the commit log of the
> > %px introduction (ad67b74d2469) and the checkpatch message are pretty
> > explicit about it.
> >
> > What issue were you trying to solve here?
>=20
> There doesn't seem to be a strong requirement to force this to be printed=
 out,
> I just think that ____ptrval____ is very unpleasant.

That should happen only at boot when the system doesn't have enough
entropy iirc, after a while it prints out hashes.

> Or delete %p directly?

You mean the message in the driver? I'd be fine with that too.

Maxime

--uphnnc535acqsyc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXt+zIAAKCRDj7w1vZxhR
xb84AP46JXO+C4VULSIH3+jYn7G+NlNEDTE3GV7/bT7NB3BsmQEA7Kq4fnJRdk4P
/iG2Sff9PD+15yt8ZNIKVw2xH/1twQI=
=t5aH
-----END PGP SIGNATURE-----

--uphnnc535acqsyc6--


--===============5041353737237468923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5041353737237468923==--

