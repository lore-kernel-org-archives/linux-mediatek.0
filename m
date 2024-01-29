Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA94DC47DB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWhkThM5HLpNAscJoDRfAdaXQ5RtNuQoWcA3TFK0gy8=; b=QKjd2cUi+viQWKu3OTNKZhfJ2K
	+KLemtc0LwsOdaHJLJRxPxWT+rZPD/XW56FWP9CcVmTDd5yUAajaREYyDBgQ2Di+XpVITvV3XsCbh
	P3ZAcHi3ws/8+UkLQ7hhQEYBEwdCpfWtFkQWvK3z2exCRaJCWZFzEh/lCFJVL+IfdOBGdkoJY8Uxh
	vODbBrvZRFW+lyvvSY13IJIkUmzjCYA5ZC9zVX8l5OYQ+b3SgUFO2k9U7dxzBLQh4jx5AeqiK0FJs
	/IwqQ1cC8+yVG7LLGPViN1A9mUTRLcnGBCc6QEh/IhIInhNGXBSL9dMHeupQrhbBg7tAso4KrvZ4o
	YE5RUlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUYg-0000000DVzd-1hrv;
	Mon, 29 Jan 2024 16:32:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUYc-0000000DVvg-1Q4h;
	Mon, 29 Jan 2024 16:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E7E9622EC;
	Mon, 29 Jan 2024 16:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE89C433F1;
	Mon, 29 Jan 2024 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706545913;
	bh=JWhkThM5HLpNAscJoDRfAdaXQ5RtNuQoWcA3TFK0gy8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EK6Yi77V6SDCy01q1J50677XZiXDmd8zaLFHmndYsP5/PBrsI3M9gWrvWS5y8FNmk
	 IrRNXVp+jKfunBpgh2wN02+jW0bfOad7roru5CecBPtDECjXe1o8Gv4hhIyvcQtj+h
	 LrzgmXam9MyTeOIxnBV999XtyNfKIeasNWveJfDpF7wkAmYc4P5e25Xg96yYotZhtB
	 xj3HJDnEUw7cYQPa7zTVDqYMp5A+gUOf1xO3bOtaxfbR+6XDDUP46GhqOAHqBEzj9k
	 vlGBd2wFSAcSSGwKniHtIpQh30x99HRyhGPrc4rGVGa92auklVg2GeVpexU7cpyEqi
	 LRMQTql/I4NWA==
Date: Mon, 29 Jan 2024 08:31:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Daniel Golle
 <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Message-ID: <20240129083152.34d899cd@kernel.org>
In-Reply-To: <431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
	<20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
	<20240129125241.gu4srgufad6hpwor@skbuf>
	<431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_083226_441790_F3046F57 
X-CRM114-Status: GOOD (  10.44  )
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

On Mon, 29 Jan 2024 19:22:28 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> > I hope this moves the patch set out of the 'deferred' state.
> >=20
> > ---
> > pw-bot: under-review =20
>=20
> I still see deferred. I guess I'll have to submit this again. :/

Took me an hour to fix the mailbot:
https://github.com/kuba-moo/nipa/commit/6766e97e72ac91ffb42ed2259bc8e2ace44=
6d0ef
email is the most quirky thing ever.

