Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B53C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eX6+s3mpvdpSs9F4jSOUi42xtniB6gW6o5TRrTUv0dQ=; b=XzgSzMLKLmy3x8uCKWnEBMD3KB
	UYZc6U6XGIgF65cqmqYeJeS2L7ilzS5+dLDhIov1r8mubUYauON1iP2WSdB9n39jM26AacD3SeMwH
	aapW9rAZgnrd30ZJQrIozzWdJAS51ar9goDQHqv0t/mAL/MhvBKhyrlhR3xdKk8gkdXuxInO1FADT
	OB49xixL8/pwMWX79wgO3iunujJ9k16cb25RFqkDMTLEPEJqZz8GMYUOPCzE+kNS/uLl/riEc1A4D
	71ee+jNO8C/dC07lZWHTVRKycJNiZcHSWyGgZ18Nv4103fkzC4tSG+bKgk+bEg0xcm3DjBw8XK1ek
	ouVG6AYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbf2-0000000Cch7-1usf;
	Thu, 29 Feb 2024 08:21:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbez-0000000Ccg7-0IgZ
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 08:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=eX6+s3mpvdpSs9F4jSOUi42xtniB6gW6o5TRrTUv0dQ=;
	t=1709194854; x=1710404454; b=OL8LadCI7MgmVmWPeqmsWP0q1f/DUXH5vgdefW9aU59JKlo
	AwkVsbv3QN+jwjtzd13uq5P1Mghrn+SwavDv5bPuFdslfo7dqP3TmKVjk2/P2kNdPIhpL3RRem8uM
	SFNB+Kn9N9ySslwr4WQe5cn7i7GRG2MOJWZA2gGTXrNX78YY+S7RpfqloUlj3LtibokK9Fspib5+l
	0GOMaRDLj+JjqZXilI3xfgDGvV2UiFMXIyQN3qxqldqQnNTiNMy+Kyzn9H54vE1mCtQum0KbOdctf
	9DMg2fZrJktwDAS1lc/846Jz+lX0EYKm8PQEx3Iv00lSwpbiEUVsbMTq/wz3qSUg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rfbet-0000000DQaJ-0DA1;
	Thu, 29 Feb 2024 09:20:51 +0100
Message-ID: <8bf09320299478cc16751a7d3e5d090a6ecad331.camel@sipsolutions.net>
Subject: Re: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-cy Lee =?UTF-8?Q?=28=E6=9D=8E=E5=B3=BB=E5=AE=87=29?=
	 <Michael-cy.Lee@mediatek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  "nbd@nbd.name" <nbd@nbd.name>,
 Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
 <Evelyn.Tsai@mediatek.com>, "lorenzo@kernel.org" <lorenzo@kernel.org>,
 Money Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?=
 <Money.Wang@mediatek.com>
Date: Thu, 29 Feb 2024 09:20:49 +0100
In-Reply-To: <4e08126a3bed3e2108e76f2a30d9bf470b5fe4db.camel@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
	 <20231222010914.6521-3-michael-cy.lee@mediatek.com>
	 <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
	 <765fb43a372825f6063894809f204150d87d4d18.camel@mediatek.com>
	 <51cad25c273b27885f5387f995db48ef97df2996.camel@sipsolutions.net>
	 <4e08126a3bed3e2108e76f2a30d9bf470b5fe4db.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_002057_256008_E7DBC5D2 
X-CRM114-Status: UNSURE (   9.94  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

>=20
> https://lore.kernel.org/linux-wireless/3c550ae335a9762a9cbd0c8109b6dd99fa=
eb8f6f.camel@sipsolutions.net/
>=20
> We=E2=80=99re reading this discussion and will give our rely as soon as
> possible.

Great, thanks.

> > Would you be willing/interested in testing any of this code? I'm
> > currently not really able to test it, so not sure if I should push it
> > out.
>=20
> Of course we=E2=80=99re willing to do the test.
> But we=E2=80=99re still working on MLD AP right now, and the critical upd=
ate
> will be the next.
> In other word, to test MLD STA=E2=80=99s behavior we need to first get th=
e MLD
> AP ready.
> If it=E2=80=99s OK, could you give us your changes? Maybe we can test it =
during
> the development.
>=20

I actually posted it to the list yesterday, but it's probably more
useful to have it in combined form, so I've now pushed this branch:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/=
log/?h=3Dcrosslink-csa&cache=3D0

johannes

