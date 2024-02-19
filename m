Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F87C54764
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HO2qG5bxXyBnRnELqPKXj8gGN33xRt+6fa/vSUPQR44=; b=wyiJv/VeHhD72cYBIx5kDWyixr
	t6VV7MQgNolMKYJuyG0Ltcno/fkOClpo2uHcHG8+xCt0btLjJFtfS51/X2RSRc94Rug+lkvzxvCHf
	nbQv+hJ2qRP4+sBzp8yXCvyzUIjGPYphK8oKjUmXWgAsHRcho4FCFubkKTOcZqkPTKftsf3OpYa9Z
	IrSpf/9ZoVAUmN7og95tJqb1SAJhdMiHP4/1VW0Owiy2FQI+mJOfyFes5HmebgktHEQExLvHxg7Ug
	dcX8ooqK9xPEDe0JSpypMaN/ByMiqJEgzj2dLa3esGo/7zBnjna0LNEXVs7HBerRAhX1RhByt4DvD
	RmltYYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0XQ-00000009xb8-1Q1K;
	Mon, 19 Feb 2024 10:06:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0XO-00000009xaY-0aue
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Feb 2024 10:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HO2qG5bxXyBnRnELqPKXj8gGN33xRt+6fa/vSUPQR44=;
	t=1708337171; x=1709546771; b=izgw1X/kzRjnscTj8gQP4/JzjHsBZpczLKukNuqxEN/mmKx
	GHmXCMuh0z3o4njS187x6MNqFXKWa5unGSgS6KacJMBnUsjwF7qxHbG0/opT5RvhbLEnOjGDWW1wS
	Q/ODX5Awein8KT/RCbTTN1zX04o2VYS3pSNlIV7i3Ctj22EKb2Zx8BieQJ26Ocb7bbZKxoFxyxOb1
	gZkv7oCjxKsesu643FLI15fjOoFOVpoyvg1+DHEmgk+Ul54TqVoLFP44/sltDw5qsA3w3KLawNJ37
	IKr/r5Usc67c+pimlOb+QnwtfjuE3FnUstxdVIK6SwJiiZJ92qfhcpaYiVGuFIug==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rc0XH-0000000H1u2-2Kmi;
	Mon, 19 Feb 2024 11:06:07 +0100
Message-ID: <3a6f90ceb86013782329ba0054995aef225a53b1.camel@sipsolutions.net>
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
Date: Mon, 19 Feb 2024 11:06:06 +0100
In-Reply-To: <765fb43a372825f6063894809f204150d87d4d18.camel@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
	 <20231222010914.6521-3-michael-cy.lee@mediatek.com>
	 <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
	 <765fb43a372825f6063894809f204150d87d4d18.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_020614_329680_BF85809A 
X-CRM114-Status: GOOD (  18.80  )
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

> The rebase seems good. We will conduct a full channel-switch test,
> including hwsim tests in hostap. If there are any problems, we will
> send another patch to fix them.

OK, thanks for checking. The tests from hostap are passing, I make sure
of that anyway, but ... who knows what they miss :)

> > Shouldn't that have (had!) an 80 MHz handling case? Or maybe a loop a
> > la
> > the one in ieee80211_config_bw():
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Downgrade the n=
ew channel if we associated with restricted
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* bandwidth capab=
ilities. For example, if we associated as a
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* 20 MHz STA to a=
 40 MHz AP (due to regulatory, capabilities
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* or config reaso=
ns) then switching to a 40 MHz channel now
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* won't do us any=
 good -- we couldn't use it with the AP.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (link->u.mgd.conn=
.bw_limit <
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
ieee80211_min_bw_limit_from_chandef(&chanreq.
> > oper))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ieee80211_chandef_downgrade(&chanreq.oper, NULL)=
;
> >=20
> >=20
> > Feels like this should be the same here.
>=20
> Yes, a loop to validate the operating bandwidth is necessary. We'll
> send another patch that makes this change.

Sounds good, thanks!

> > Also note how this uses ieee80211_chandef_downgrade() - we really
> > need
> > to track the "chanreq.oper" vs. "chanreq.ap" in this code as well for
> > puncturing - can I ask you to take a brief look at that? I'll anyway
> > probably have to look at that soon though.
>=20
> Of course.
> In fact, we have plans to study and implement puncturing on our MT76
> driver. We're currently working on the AP side, and we expect to start
> the STA side maybe three months later.

OK, let's see. I probably have plans earlier than 3 months from now for
this, but not sure yet. Let me know when/if you start working on it so
we can sync up again then?

johannes

