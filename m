Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC4C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OCQkreozwY1trDAvVl49hOYJhbSKGMOBxd56W0AJzw=; b=srI57UJktQ/dIxQWUahpvd1ZyQ
	jTMWsndkGa9PTfrwv5qEefUTvAnVMr/LQ2VBL2bGxlI3ckweUNhPa0QRb/Q9+Q3e0hatNara3U5D2
	dPVO+IaEnZYmYRP79bVyEpkB8Cf+bSuMwC+QpYOFKc6+iQFgZH4otE4yfuHnvPzT7oEGpuP40L4GJ
	U0jIhZzuVrXPI4wxfUdpTZ7zWrPrXUaaMDuffMMv8PDJb48uL+/cGONRrka/GjtLZyb/jgNBINX+q
	dN1sA6p8K6QlLbGJLswNaHmbN3mz5+XDsnCvSCxCyhbkRZOsxkhFO5uTZyn3dUxM2nrB1Y/9ckQrI
	b8WBfPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YRr-0021he-1e;
	Mon, 27 Nov 2023 10:02:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YRm-0021ev-05
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 10:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=0OCQkreozwY1trDAvVl49hOYJhbSKGMOBxd56W0AJzw=;
	t=1701079350; x=1702288950; b=aeIqrWU7RRwRCJn+5gmrgT70ERmn7oX1tw7Pces8OYspj6+
	ZHvbxkBoqqwxwK2IQFMx20Bkn6C8QPE3C7Q9IhUftEVwO92i/Kjp/+wFme7dNwD8v4/+X8DJEDQrz
	FK0L4M2VacDRzh7I9lk/IQXaR3gE6QiAlkkJfjcSKPrQ4u1pnCv1br8ZBmTVTCsCcB0uBwx7a8QLg
	BMVWIscthSIdO95zM0XpcjC80cc6NQzTbiRttO99HtMGJqgCMPLkFqkWSaG9se2KfP2XvmG3xerr0
	HDr6AromDr5U2Qx8/vDvWQNn+6G/809Br9S2tYicgEyGFzWktpzV5FItCcKrUeVQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r7YRe-000000065ei-34cP;
	Mon, 27 Nov 2023 11:02:26 +0100
Message-ID: <d13570223dd4bad257a719fb77b0cc4f2839cb36.camel@sipsolutions.net>
Subject: Re: [PATCH v2,2/2] wifi: mac80211: Refactor STA CSA parsing flow
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
Date: Mon, 27 Nov 2023 11:02:25 +0100
In-Reply-To: <b4b3a5b0e6cf03564c6d09f01688dd41df5fe137.camel@mediatek.com>
References: <20231113021107.13110-1-michael-cy.lee@mediatek.com>
	 <20231113021107.13110-2-michael-cy.lee@mediatek.com>
	 <9dd37c008572bb0938bd0d0a0fa207dd70aa8b98.camel@sipsolutions.net>
	 <b4b3a5b0e6cf03564c6d09f01688dd41df5fe137.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_020235_651571_1799BD1A 
X-CRM114-Status: GOOD (  13.94  )
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

> The old flow also converted the Element to operation elements first,
> then it used ieee80211_chandef_vht_oper() to build the new chandef from
> operation elements.
>=20
> We think it's necessary for the case that AP is trying to switch to a
> 160 MHz bandwidth, while the STA doesn't support the 160 MHz bandwidth.

Yeah, you're right, it did before and I suppose it's still easier than
managing two conversions, since some formats are the same.

> Just like what had been done during the association,
> ieee80211_chandef_vht_oper() checks the STA's capabilities and builds a
> valid chandef for the STA. However, even if the STA doesn't support the
> 160 MHz bandwidth, ieee80211_chandef_vht_oper() doesn't mark the
> conn_flags as IEEE80211_CONN_DISABLE_160MHZ, so the same check is
> necessary when handling CSA.

Right.

> Like we had discussed in previous mail, we expected the patch will be
> simplified.

Yeah I just circled back to it for stupid reasons (I guess mostly forgot
to mark in patchwork that you were going to make changes) and looked
again after having looked at all the other code in the series I posted
late last week.

> In summary, the steps for STA to handling CSA are,=20
> 1. parse the new channel information from either operating class or
> WBCS Element.
> 2. convert the channel information into corresponding operation Element
> (HT/VHT in 5 GHz band and HE/EHT in 6 GHz band)
> 3. Build a valid chandef from the operation Element.
>=20

Sounds good.

johannes

