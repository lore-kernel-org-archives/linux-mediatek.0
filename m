Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E5CC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAXgF0Vw75OM4m93jZheeRAI+t1Cyx6a/MIOmAcmuSg=; b=ZhRLwRKWsahm6+EsYs5wqWfIlI
	9/uHjw1dMCACbTrD9kJv4XhvD0ODkyYwlITr9kNom4IBv9aSP+7CNSQcshM5UNxnbmlfFgyDs2r47
	++jIREsehZVFswsXN2/hKkbRKj/7R02FIU5D37AhNPG+C0MFKWq96DmySPwAxTSvJMWkh8exvNJUN
	DYy+rTV5PZqZp0wYj9x2bQhY4PIciP2dfAZtpT1/P+JqredIByopFUaHxaAJ6+LnJsyfvezOFAzQJ
	sxhJ79Vm/UX5fwgU8MUO2qoM2y2fEyhGHFyQPSNkygV9728zWzqxMYeej/LlQOTNBMZCH6jBvldJ/
	l9nJTCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEui-004GpE-Ew; Tue, 25 Oct 2022 08:03:56 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEuf-004GoE-23; Tue, 25 Oct 2022 08:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666685003;
	bh=Z2HSpaRQj29O9zp94GLJhtJEeTFRJ0EOqD6UEleaf74=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dBBSXeoY3Eqyxvo9sdp3Ai6RmiwHSGeIu5/wMEMkZpNfD+/i6yETtWD4FTkb0nylP
	 QwcUaWUnmc7zPFNdLdjGFQZighJpw8STFiM7lgRWTj4qE2mAjXoT2N1fAFuPt5447T
	 dLYK7I5fLpBEexB4XX4DYXqc7TbsiajwJk0XV8kw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.57] ([217.61.152.57]) by web-mail.gmx.net
 (3c-app-gmx-bap29.server.lan [172.19.172.99]) (via HTTP); Tue, 25 Oct 2022
 10:03:23 +0200
MIME-Version: 1.0
Message-ID: <trinity-defa4f3d-804e-401e-bea1-b36246cbc11b-1666685003285@3c-app-gmx-bap29>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Oct 2022 10:03:23 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <Y1ansgmD69AcITWx@shell.armlinux.org.uk>
References: <Y1UMrvk2A9aAcjo5@shell.armlinux.org.uk>
 <trinity-5350c2bc-473d-408f-a25a-16b34bbfcba7-1666537529990@3c-app-gmx-bs01>
 <Y1Vh5U96W2u/GCnx@shell.armlinux.org.uk>
 <trinity-1d4cc306-d1a4-4ccf-b853-d315553515ce-1666543305596@3c-app-gmx-bs01>
 <Y1V/asUompZKj0ct@shell.armlinux.org.uk>
 <trinity-ac9a840b-cb06-4710-827a-4c4423686074-1666551838763@3c-app-gmx-bs01>
 <trinity-169e3c3f-3a64-485c-9a43-b7cc595531a9-1666552897046@3c-app-gmx-bs01>
 <Y1Wfc+M/zVdw9Di3@shell.armlinux.org.uk>
 <Y1Zah4+hyFk50JC6@shell.armlinux.org.uk>
 <trinity-d2f74581-c020-4473-a5f4-0fc591233293-1666622740261@3c-app-gmx-bap55>
 <Y1ansgmD69AcITWx@shell.armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:53WuUgAivhzjnbgTyCQ6ngUqS8VdgbK75ZA8qrv0jKAGadej8zg5bKvaxG2slWsUqvlar
 YQhB/6zRVpxflislPQnApGvGw85ekSAkh5GbGVLFfcvFYYJ3kT3dj+MObr31CFyop6B+UoLTcN5T
 X/+OXXbcWykkmlaL3bJX+GzK4WIEgjKnk+wBU7IS9ozKMXzRBMnQyaJC2VvkrnQNooxu5anmHshB
 8XpsMOb6k0zc3VtcwgW6jHQ3VnZqzIbOppgtq+tv0rM5NMg462jQpenEXY1s/SQPQRrHahfipUNZ
 Jo=
X-UI-Out-Filterresults: notjunk:1;V03:K0:mxDCYmMzkp0=:wOIllALP4nys1rPLXvZWds
 Vy4r3vMmtLvgvrr5XEEQWkKjiPyAFZIZqOorBEvL3BqwDNjMTYLixTsM1zilCKdnp/TvhONQz
 8TzkJTuhPqR2Eqac1f5ufPabrGp8sWIQNPpot5bCG+tcLZOMNtbXS+lY3z2/E0vqe+UtgH6RZ
 DjZdtv5myPOPOZsAS3nLLx/LgmoragQKtho/qZfhd6ayEC4MymY8M9BASv+rF1XfccDqneCej
 NN3cM/omTbGuEEbB/HkhavsNWCVqwXSyco4Flgp70J5KPpOSQJe0qBNoDM/8UbPt2U1CtojZn
 qNuq2TsBMvvUas2SEd19+fo4mVIUu2/iS0QvTQgZAC5w0UCCY+62BHryVd5lpmuPlk+MXoJmE
 kOy9jsdRFIw4EKDHKVPw2YQE5Knyjs1vOFDBhUEPKe+NMTK8c0WRc2rQQkwzCcN4Yq7MHafnO
 +aXyeQ1EGLEf3eeZ3/vO7uuVulCx7a+eft6+GbEJ1BQNY186TdzCOoxCdmx1gcS9qIkpaowoM
 YJW+BR3NAd+NR3R+Aj9QImTbWrZHwBJLVQo0VPF1kp4hemvf/ZX8XvFmaeI1xCObC2EAgjt/j
 o2MIySN6ikcxdhEJddTxgxxUrOdPPCjlAo6+hbyQw4HOrl7mXSgEfS8+f0WeVJmCzDZXSJs4k
 eyrdfql6pj421ZWIZyx7MGWATTPMw8XEjkZqEvi1lnhi8JqARu8oti2zaVXbXgut9wUM51MjF
 dusyFqrkxVPZH1zb7e4Gx9h3HjUE4gqSgM4Az/UnTUbAoyCuRWbsAX1pCU0VWQs28W0C5Je+s
 PEXFo88zo9QRcFUSRGSrT5T8qYdIUtIboDugunO65CGmFB9eZj/Ib7rHvhsVLmE4Ugiq7qJ7K
 K5RFW5znIiNMhJGSasxsREBnuyOhvBU02YqLD67yN9H5NWnyA4wSbf/hz/h5Wttajsygn28YU
 flI9IxubLW7oYeWUaSWmSqWzwXjYYKrGfxr+SGwzS0YTx8HqrUyvGXp043kPaWHLJdIKiuC6M
 79/XMOGX56jqO1Et858zK/97OBnAyzshur0l3QitoVujuxcCzgtcwkgzwQZKapusMeuVRKtC3
 UzhbyNXLn3HUpo6mYPopa2L7lRNYMyHhujWYf8OzIf/8EqC7KB+t7dn9BHB2i5hheOOIGUDN/
 xwmvILfAMz42LQgi/HoKQtnqWO5Sh9I9lgwUAHdBuVEc0hxsEIOyKWKJO7jKlLbpp1UGWXuLt
 3v+BZwIJRpS3agG85HFYet5Vh4QGQvZBYcID4DvK6rQxSioUTEq0xONoSOADfAQ4dtUI5GZPJ
 1UDweX5X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_010353_596062_1229CD3E 
X-CRM114-Status: GOOD (  23.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Montag, 24=2E Oktober 2022 um 16:56 Uhr
> Von: "Russell King (Oracle)" <linux@armlinux=2Eorg=2Euk>
> On Mon, Oct 24, 2022 at 04:45:40PM +0200, Frank Wunderlich wrote:
> > Hi
> > > Gesendet: Montag, 24=2E Oktober 2022 um 11:27 Uhr
> > > Von: "Russell King (Oracle)" <linux@armlinux=2Eorg=2Euk>
> >=20
> > > Here's the combined patch for where I would like mtk_sgmii to get to=
=2E
> > >
> > > It looks like this PCS is similar to what we know as pcs-lynx=2Ec, b=
ut
> > > there do seem to be differences - the duplex bit for example appears
> > > to be inverted=2E
> > >
> > > Please confirm whether this still works for you, thanks=2E
> >=20
> > basicly Patch works, but i get some (1-50) retransmitts on iperf3 on f=
irst interval in tx-mode (on r3 without -R), other 9 are clean=2E reverse m=
ode is mostly clean=2E
> > run iperf3 multiple times, every first interval has retransmitts=2E sa=
me for gmac0 (fixed-link 2500baseX)
> >=20
> > i notice that you have changed the timer again to 10000000 for 1000/25=
00baseX=2E=2E=2Emaybe use here the default value too like the older code do=
es?
>=20
> You obviously missed my explanation=2E I will instead quote the 802=2E3
> standard which covers 1000base-X:

sorry, right i remember you've already mentioned it

> 37=2E3=2E1=2E4 Timers
>=20
>  link_timer
>           Timer used to ensure Auto-Negotiation protocol stability and
> 	  register read/write by the management interface=2E
>=20
> 	  Duration: 10 ms, tolerance +10 ms, =E2=80=930 s=2E
>=20
> For SGMII, the situation is different=2E Here is what the SGMII
> specification says:
>=20
>   The link_timer inside the Auto-Negotiation has been changed from 10
>   msec to 1=2E6 msec to ensure a prompt update of the link status=2E
>=20
> So, 10ms is correct for 1000base-X, and 1=2E6ms correct for SGMII=2E
>=20
> However, feel free to check whether changing it solves that issue, but
> also check whether it could be some ARP related issue - remember, if
> two endpoints haven't communicated, they need to ARP to get the other
> end's ethernet addresses which adds extra latency, and may result in
> some packet loss in high packet queuing rate situations=2E

tried with 1=2E6ms, same result (or even worse on 1000baseX)=2E i guess ar=
p cache should stay for ~5s?
so at least second round followed directly after the first should be clean=
 when looking on ARP=2E

apart from this little problem it works much better than it actually is so=
 imho more
people should test it on different platforms=2E

regards Frank

