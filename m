Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A089C282D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2025 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRCj/8TAJAuJJJ0i17Nh93VZ/UIjIMRuizn2fdB09cA=; b=4iXqmxZs/XuBDE6fqihhY9F88U
	u3u73QYYb8AxA698rZTZPhs1+F+WEreEKQvLuJBDeGFRxY+cmVP5jakK0/oSRxkI7DsnMriGdtb4G
	dU6rFisetKsjXPLcw67nWvUCJ6ztso0Yrt5PEhGWqxC46OhXZ+sR17TRdXQMwo56kYt7hWmNkOvnA
	WqWIVgRXMZRqvefaG0V6iZn9Emzn5GEnIx6bATww7D9fkrDm7gZa8FbhS02rYz5nzn06pZZv20Dob
	QbAoPUx0PlBa17PwtdQSDRxaBczaAIKIeQMyqZwrj9cPqAuDyx9Ts1yMnnTJesCTOkBEPal2MzPFf
	IAHyeXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4VR-0000000C1IX-1Zah;
	Fri, 28 Feb 2025 17:50:37 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4Po-0000000C0Fz-3aR0
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Feb 2025 17:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1740764682; x=1741023882;
	bh=ZRCj/8TAJAuJJJ0i17Nh93VZ/UIjIMRuizn2fdB09cA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fk9sbzBJMBVZrv7z3GCpRvHpsWTvPCNjq+XIfPVndaeg1kWMHvmDQL3CYq+tX3i0q
	 T9tHtYfm1uvQqnoHlWSPR5XNRIIgppZI+KXKCblrafxV+OmOSGTT1Ufo/pWAtwj1VT
	 I7S6DnOkDMieOkOxQTMGa0sFEp05wlJqyg1PWl/N5MX2SRPPFMP36zvlMauBKWKQc0
	 15yXL3S/xqbl1bR++2sc8rhrqKkaRdi0h0JI7Jp2bJst58tF8Z/bZsUwNM1/Pkv8Qx
	 MfsW4p+rDi8F/jhkO13BcMiabRZsjTkQuYw2VtI+G7Rw/4B9fR8WIJmUU5clFIfD/b
	 RJNf6S4oJQnDg==
Date: Fri, 28 Feb 2025 17:44:38 +0000
To: Peter Seiderer <ps.report@gmx.net>
From: fossben@pm.me
Cc: Christian Heusel <christian@heusel.eu>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED][STABLE] MT7925 wifi throughput halved with 6.13.2
Message-ID: <JZIl1iVcv9U3s8KnXJqR-ZKFBUzbVvbqR3NN0LO4as5_yXxPPS4yIfzGK22Z6rNZOyOysBzWPZGQgL-8eychueJtr7TvC3A0I-s3CVHHDUo=@pm.me>
In-Reply-To: <20250228161420.11ac4696@gmx.net>
References: <b994a256-ee2f-4831-ad61-288ae7bc864b@heusel.eu> <20250228161420.11ac4696@gmx.net>
Feedback-ID: 134317997:user:proton
X-Pm-Message-ID: a944d88e39b523d475fe769a680d961766ce4442
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_094449_054797_52C46E51 
X-CRM114-Status: GOOD (  15.40  )
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

Hello all!

Christian provided me with a linux-mainline-6.14rc4-1-x86_64 package to tes=
t with today and I am still experiencing the issue, so I am assuming that r=
evert did not happen yet.

To give some additional context for the performance regression, I have an A=
T&T 500/500 fiber line. As of this morning on kernel 6.13.1, I get 550 down=
 / 470 up over Wifi 6 on speedtest.net. Testing immediately afterwards with=
 Christian's mainline package, I got a result of 170 down / 75 up, which is=
 similar to the results that I got for all the other bisection kernels Chri=
stian gave me to test.

Thanks!
Ben


On Friday, February 28th, 2025 at 9:14 AM, Peter Seiderer <ps.report@gmx.ne=
t> wrote:

>=20
>=20
> Hello Christian,
>=20
> On Fri, 28 Feb 2025 11:19:52 +0100, Christian Heusel christian@heusel.eu =
wrote:
>=20
> > Hello everyone,
> >=20
> > on the Arch Linux Bugtracker1 Benjamin (also added in CC) reported
> > that his MT7925 wifi card has halved it's throughput when updating from
> > the v6.13.1 to the v6.13.2 stable kernel. The problem is still present
> > in the 6.13.5 stable kernel.
> >=20
> > We have bisected this issue together and found the backporting of the
> > following commit responsible for this issue:
> >=20
> > 4cf9f08632c0 ("wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for=
 MLO")
>=20
>=20
> Seems there is already a suggested revert of the mentioned commit, see
>=20
> [PATCH v4 1/6] Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_=
ba for MLO"
> https://lore.kernel.org/linux-wireless/20250226025647.102904-1-sean.wang@=
kernel.org/#r
>=20
> Regards,
> Peter
>=20
> > We unfortunately didn't have a chance to test the mainline releases as
> > the reporter uses the (out of tree) nvidia modules that were not
> > compatible with mainline release at the time of testing. We will soon
> > test against Mainline aswell.
> >=20
> > I have attached dmesg outputs of a good and a bad boot aswell as his
> > other hardware specs and will be available to debug this further.
> >=20
> > Cheers,
> > Christian

