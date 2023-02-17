Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB952C636D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4ak8ahu8k35l7y0Hx6rHha0rKjcyTHYW7o0rzdmLJc=; b=hJa21qMbaeUXjsrp9QdH0702+p
	cTMqZ3v/o9vEbOEQzvk1cutdTdE0HaUfsIyPln/mPRd+ELiB3CEZ8DRCiYeNljoO/wv2aSH9Wy4j9
	xuiSO1MQc4uW6qjuCEbeOEJLZyPAmuhWlo2Afi4Y3TXL0npmTDZAl55Pf4wpNDrLDMNnjYoW4DEBt
	qLHAP8yK5kLkLwQNlGBX0WuJf9/neZupZcLEl/MgLL5xxsYRBmnl6sdxKnaEA/h8hgUyGA3/s5ePk
	dEAKTS4CuSafUOqV4m2V9MKqLl8v7DAvBXDzbPfsPvpwqd9fP378lBXgA/oLK/LhCTJCVRqCFg6W+
	+71IWG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT5rT-00FQIQ-0j; Fri, 17 Feb 2023 18:53:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT5rP-00FQHq-It
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 18:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=K4ak8ahu8k35l7y0Hx6rHha0rKjcyTHYW7o0rzdmLJc=;
	t=1676660011; x=1677869611; b=WS/K3XLOnMX1wJvvQReS649xRMwInmTvahDxJnGQCDPD9Z3
	A6lvp1i/jQHvF3/cCxNKZ5cQ75HbTXu1+OoGLviwIKhHf0h5j0RrjEucwCGVv6zYET7yLZoMa6wOj
	YdUx12OP09V7cF0WgT+oL9kDKTk6Oq5c4sQjrfC7Kq6E0QX19x9X4LS15DfbSukH6LtRW2bMWbL3p
	Y2aYtxjbctEtTVDOW5Fw7v2FlBcjGiGpfwQFPi0DPncK+zyJoSPy+RMoSJVpw0WJLxOkfscy/2nxb
	c3dHWf0K5mJSBOwFkHhDAQmPRokMZco6lZTwzbo46ijuQKn4lB2ozcHhfka9E8Dg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pT5rM-00FA7E-0A;
	Fri, 17 Feb 2023 19:53:28 +0100
Message-ID: <fb3ab2d925fdeae2e7cc778419c1476102b9f85f.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: introduce
 ieee80211_refresh_tx_agg_session_timer()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: Shayne Chen =?UTF-8?Q?=28=E9=99=B3=E8=BB=92=E4=B8=9E=29?=
	 <Shayne.Chen@mediatek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, Evelyn Tsai
	=?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
	 <Evelyn.Tsai@mediatek.com>
Date: Fri, 17 Feb 2023 19:53:27 +0100
In-Reply-To: <fea6defb05d0f39d99bce96ea22e8c92d1a939ab.camel@mediatek.com>
References: 	<7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
	 <44f956b493e33bf394b2947b77e7c86f394b28ed.camel@sipsolutions.net>
	 <fea6defb05d0f39d99bce96ea22e8c92d1a939ab.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_105331_639536_DC0844CE 
X-CRM114-Status: GOOD (  13.89  )
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

On Fri, 2023-02-17 at 18:43 +0000, Ryder Lee wrote:
> On Fri, 2023-02-17 at 19:01 +0100, Johannes Berg wrote:
> > On Sat, 2023-02-18 at 01:50 +0800, Ryder Lee wrote:
> > > This allows low level drivers to refresh the tx agg session timer,
> > > based on
> > > querying stats from the firmware usually. Especially for some mt76
> > > devices
> > > support .net_fill_forward_path would bypass mac80211, which leads
> > > to tx BA
> > > session timeout for certain clients.
> > >=20
> >=20
> > Does it even matter? We could just request sessions without a timeout
> > in
> > the first place.
> >=20
>=20
> I think we're already. Our main issue is performance periodically drops
> every few seconds when .net_fill_forward_path is enabled. Wireless
> client have normal 500+ Mb/s iperf3 download speed for several seconds.
> Then it drops less than 100 Mb/s for several seconds. Then everything
> repeats. Issue occurs only on certain clients. (i.e. Intel cards AX200,
> AX1675, Advanced-N 6235 in Win11)
>=20

Strange. But how does this patch do anything about it, that should be
completely client agnostic?

johannes

