Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9515FC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSj5LeYjkpK9XNI4Yvas4e5knCrKA+ZPbN7x3+5ThhY=; b=Rm+J9An5viSTHnag2uOoDhYY7c
	YECoqehIlxnsujJ0w7nF8HyqopU5UJl15CifERG3bZHZrI9coI4cs6422za63Y//x9z408fk7/P7u
	IUDq73gPgezb8sVYotO3K3UX5J8VP0Bl5kxO5lRzlBKYey5oxo/CTbLo7ZPYBYe9ePZ5zCwS1ID7Y
	J6IZtpST8W1gCm69OsznTsrXsqJdlkqRvwoaEoZ7eURlJ3pdcZNrnshEBJ07/AqRaSwUt/ynQ5Zm8
	t00WMGeGoCbmCXEDCBZXL8chrp6sSoDPz+EDtD3WDD5sjOo2qOvaZ/lcitUZzZVXdKv+YFWjvMhgt
	HEo52n2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzED8-0000000H4XT-2Rxm;
	Tue, 23 Apr 2024 11:21:18 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzED4-0000000H4WX-3pcu
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 11:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=TSj5LeYjkpK9XNI4Yvas4e5knCrKA+ZPbN7x3+5ThhY=;
	t=1713871271; x=1715080871; b=PxvO91rQesngU6BQuWRn5mQ3jYQFRobQq2bhPjNlVfOKvtf
	+UtsjVv9Z1wOgK6pGfYjzPNfcJrOR5W/n458mXzjju6LzQh5CbXyGK9rp1lAz/NtrfqMNyIKBTnBs
	+weGvY6Q3XPorePYDiG0IzIpOuJRC6Vlt0PCQaEkN8HrDawiZsYbpuvdJa1zIfLfo5idR2zzqMRBf
	SBXhRgcAphE5GyyBJQY/hewWBVgriDKlEIK6cvrfGlpTdtEmoQ2al8nPkwIqzgr70ZoO68mw5JTRR
	RuNci8KGR2Z64Kja4fIe0DBiiNeOMslRUc5y9Jk7mzXj/A2YgPwXwUWU/AP7pf5g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rzECt-000000025Sw-2Tpu;
	Tue, 23 Apr 2024 13:21:03 +0200
Message-ID: <757f417d63a750e84ab883b500becc2773e9ff17.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: Update bssid indicator with real BSS
 numbers
From: Johannes Berg <johannes@sipsolutions.net>
To: Allen Ye =?UTF-8?Q?=28=E8=91=89=E8=8A=B7=E5=8B=B3=29?=
 <Allen.Ye@mediatek.com>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: "lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>, 
	"nbd@nbd.name"
	 <nbd@nbd.name>, Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
	 <Evelyn.Tsai@mediatek.com>, Money Wang
	=?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?=
	 <Money.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>
Date: Tue, 23 Apr 2024 13:21:02 +0200
In-Reply-To: <c23373d71eff81ea043783edff0345502bb2e299.camel@mediatek.com>
References: <20231208063820.25983-1-allen.ye@mediatek.com>
	 <65d21336e8f7e180352403a3e894aeaf27a22cab.camel@sipsolutions.net>
	 <c23373d71eff81ea043783edff0345502bb2e299.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_042114_979719_E00FD5E0 
X-CRM114-Status: GOOD (  21.24  )
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

On Wed, 2023-12-27 at 09:38 +0000, Allen Ye (=E8=91=89=E8=8A=B7=E5=8B=B3) w=
rote:
> >=20
> > We should have Lorenzo here, he wrote the original code.

Actually John/Aloka at least also did ... so whatever.


All this only _really_ matters I think when you have EMA, right?


> The number of BSS is not equal to MBSSID element count plus 1 because
> there might be multiple nontransmitted BSSID profile subelements in one
> MBSSID element.

Yes.

Actually it's even more confusing:

> Also, one nontransmitted BSSID profile subelement might
> be fragmented across two MBSSID elements if the length of the
> subelement exceeds 255 octets.

True; however, in this case, a single entry in the
NL80211_ATTR_MBSSID_ELEMS array (and thus in mbssid_ies) must contain
both MBSSID elements together, so it's only counted once still. More
importantly, otherwise we would split them across two frames with EMA,
which is wrong.

So really mbssid_ies / NL80211_ATTR_MBSSID_ELEMS is *not* the list of
MBSSID elements as they should appear in the frame, individually, but an
array of *sets* of MBSSID elements.

For example:

mbssid_ies[0] =3D mbssid_elem(profile1, profile2), mbssid_elem(profile3)
mbssid_ies[1] =3D mbssid_elem(profile4_part1), mbssid_elem(profile4_part2)

when you have EMA with periodicity 2, and 4 non-transmitted BSSes where
the first two are small and fit into one element, number 3 is bigger and
needs its own, and number 4 needs to be split ...


> > But this seems fishy to me, if you look into the element itself,
> > you're going to have to do some validation on it?

I stand by this though.

> > And what about fragmentation?

But not this :)

> Whether the subelement is aggregated or fragmented, the MaxBSSID
> Indicator field would be the same for the multiple BSSID set.

Right.

> Therefore, we directly retrieve this field from the element.

Yeah, makes sense.

> For example, there are five BSSes in one multiple BSSID set, one
> transmitted and four non-transmitted BSSes. We might use just two
> MBSSID elements to store all the non-transmitted BSS information. Here
> the MaxBSSID Indicator is 3 in both MBSSID elements. However, the
> element cnt is 2 and if we use the original method to calculate the
> BSSID Indicator we will get 2 which is wrong.

Right.

Anyway, I think I agree, but can you please add some validation of this
to cfg80211 as a first patch, and also document all this better in the
commit message? Optional, but some additional nl80211 documention would
be very nice.

Thanks,
johannes

