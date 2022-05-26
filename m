Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D912C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9CS88xle5SyZt7OgxM793p0nVhXOL4iJ7i0skZYP8A=; b=kgchIRfHLDQQOVE2Vp/eHGpoCu
	9IQ0i67vBuTSBUmO1EuUc3tgOzgR5NfTaji3tecTEzKPVf2fmpeghugptPJ/tedEBxjK2zgpk2E3J
	2gkgDBlaurfWVFPkUf/gtxK3u4Ls5nYqA/KsCY/Dac1fH+uPrxyhhgzRKCzw58piZZKckrod8v7Fn
	oQgzmUQrSWdoi7x7aSCzO2EfJv5QiQZ26qxbvM7kuP6Q+vjH2w7QmEMha2wxqfbC8VtWwvykvolZd
	GCiGikqDq7TRfYARmOifQ3jENbOfhIIw1M+Hcc0vGtXrdJag+uWorLUCe4X+/1C4hoty89chE4wkI
	pu0KifwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuCDU-00EkZd-I8; Thu, 26 May 2022 12:03:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuCDJ-00EkXe-Fw; Thu, 26 May 2022 12:03:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D7FF9B81FC7;
	Thu, 26 May 2022 12:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC14C385A9;
	Thu, 26 May 2022 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653566614;
	bh=SHqqNURW0tOPuSJZlgicE58CRfglRqKvrHRf4aGn/KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFhOM90Uf3ORx2YP3k0ca345cTnr8wjLC/1P+VIqBbxasy12k7Y+25tNh1w1Hb26S
	 mUThSla4M+oq3Aw1xnSwORP9KVIPYVwEpowS0QRmFWFbTciiy2/iJIrIfwd3N0rG7o
	 dUV51RKtzbjF86DS6+rWCsiOkTNMH/BVj4gn5yHjJQPvuFeJf7vIP8+EFtIki+FdbZ
	 iQo5l4ohVe9E7LKdZ2So8Lf3AtverLb2a2wXHDKH4C3B4nkAZnmFhy0Em0wXgC9dSh
	 k4Q2P+cKpsrYvqXEvPJeHvwVRSqdvw4cdSJU7Hjvvtri3ykQNZ+D1y3uUJbL8g0cOS
	 qFUbTlr4DKpIw==
Date: Thu, 26 May 2022 13:03:21 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <Yo9siXkJ5FUD0+w6@sirena.org.uk>
References: <20220509205847.607076-1-nfraprado@collabora.com>
 <20220525205346.6ik67nduv3zexl4p@notapiano>
MIME-Version: 1.0
In-Reply-To: <20220525205346.6ik67nduv3zexl4p@notapiano>
X-Cookie: Money is the root of all wealth.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_050337_869286_62C6E7A0 
X-CRM114-Status: GOOD (  18.61  )
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
Content-Type: multipart/mixed; boundary="===============0818951645520849999=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0818951645520849999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9qit21t6XD5yksAs"
Content-Disposition: inline


--9qit21t6XD5yksAs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 04:53:46PM -0400, N=EDcolas F. R. A. Prado wrote:
> On Mon, May 09, 2022 at 04:58:47PM -0400, N=EDcolas F. R. A. Prado wrote:
> > The Mediatek AFE PCM controller for MT8192 allows two I2S interfaces to
> > share the same clock and act as a single interface with both input and
> > output. Add patterns for these properties in the dt-binding. The

> Gentle ping on this one. Any feedback for v2?

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

--9qit21t6XD5yksAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKPbIgACgkQJNaLcl1U
h9BEugf7BubpYYtmW6MsYqo17GyOLuEtujTpIaBpCHr3zKHc/G1ALk3Jic2PFQm6
SB/+DOLHkLjRB/u+jrX8LqA6LIxIJru5qi8RLa0dtuae75+uLoTe8qBs8HrxOQBK
QTPYr1vlII6EKUM8gw3LcucEszhcahCvPfuyQ1w6mmfPXqV+SpyZ3skJ+YwcvK5e
XefO3Ju7mxtkSNStuKQ02By2CxSUD2gRj2lkqVk8BUN/KPFWe0la6tn5xfvt9hig
e/hDuIqgm/EsPhoQSzJo93geTQpN8ATDiKPrRod0d8xMXFu687sbquNQBQYGhVzR
6Y9ziy+V1HLDz+UWE8WzWYuGQknX5g==
=d5lb
-----END PGP SIGNATURE-----

--9qit21t6XD5yksAs--


--===============0818951645520849999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0818951645520849999==--

