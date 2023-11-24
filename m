Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EF9C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdYW0UnSptvVu1ecZsLZqmt09nJo2Af7g+iQo4CJVDI=; b=Mj3c8PU1158eKX7XBX0QVADWY1
	GXyjUBdS2eky88TXYeHHWAc2VoYu4WkQZJnTeIgZ6pk9N27Db2lRFPTH/P79TFiDABBHJPB1lCu1O
	D5MHRwOB3BawiLOBTyBxsFq3OEfARF7mwGrrgHxCj4GRmR1J8OTMqkfTwKtikMEZ6rKomiBihyNJI
	yq5lgKohBdAnKgzKiZ7+gMzGj2PapG3QAKCMIQHOSFUojz/km5YdMS/3aDsEA4fl9ep3SyVBCTrUS
	xjMSaiZicWRsceMy857DwDvAFKUw1JKtGE+V5cgksrMQJCNPEgfD5jowH+SwLaLidKx07MEU0kQ5N
	YA5Dx+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bu9-007wzE-26;
	Fri, 24 Nov 2023 19:31:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bu7-007wys-0L
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 19:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=LdYW0UnSptvVu1ecZsLZqmt09nJo2Af7g+iQo4CJVDI=;
	t=1700854314; x=1702063914; b=mIyqAVRXuz0dlsn8Ck/kNxyokOXw0mYKDRAfM+Q7kabKACj
	cXo+dQbe28X4WS6NAYhJjAVyn9HBx6KT4SIlSUuNDfGQXF6QCYTGbr4Dq8cchqKjcHSkXVHo83Thn
	i0iLqy8Wf2PFI+A3em+cjtqSBf03bT7CMhHn0alvtwKEs+Uhg+psPb2oCcJ3aiDMqXImlQCDVT5b4
	AVtmAl7NEzCkEm2IrpvcS0cdxo6zqVqCkt94kdYQoqOMhRF1NBB7H4+MixpwbX0A5WSCycrsKy1r3
	PaF/5wZVAaQHZm4ck/CDlsZ7VLquCqESoENdKpxhGI4W4+rK9C9exYP3X/yxKH+A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r6bu3-00000002kEE-2FfI;
	Fri, 24 Nov 2023 20:31:51 +0100
Message-ID: <9dd37c008572bb0938bd0d0a0fa207dd70aa8b98.camel@sipsolutions.net>
Subject: Re: [PATCH v2,2/2] wifi: mac80211: Refactor STA CSA parsing flow
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 24 Nov 2023 20:31:50 +0100
In-Reply-To: <20231113021107.13110-2-michael-cy.lee@mediatek.com>
References: <20231113021107.13110-1-michael-cy.lee@mediatek.com>
	 <20231113021107.13110-2-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_113155_165520_2DFD6B06 
X-CRM114-Status: UNSURE (   7.12  )
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

On Mon, 2023-11-13 at 10:11 +0800, Michael-CY Lee wrote:
>=20
> +	new_chan_width =3D ieee80211_operating_class_to_chan_width(op_class);
> +	if (!ieee80211_operating_class_to_center_freq(op_class, chan,
> +						      &center_freq1,
> +						      &center_freq2)) {

Unless I missed it, I see two places here calling it together, so seems
reasonable to fill in a chandef here instead?

> +	new_chan_width =3D ieee80211_operating_class_to_chan_width(op_class);
> +	if (!ieee80211_operating_class_to_center_freq(op_class, chan,
> +						      &center_freq1,
> +						      &center_freq2)) {


Here you have it too.


> +		new_chan_width =3D NL80211_CHAN_WIDTH_20;
> +		center_freq1 =3D chan->center_freq;

And actually you could just have a chandef created with

    cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_WIDTH_20)

which mirrors the failure case here, and just not update it when
something like

    ieee80211_update_chandef_from_op_class(op_class, &chandef)

returned false (not that I necessarily think that name should be used.)

Or just pass the channel, and make it create one with WIDTH_20 in the
failure case?

    ieee80211_create_chandef_from_opclass(chan, op_class, &chandef);

which is is maybe even nicer?

I'm also not quite sure why you're converting to operation elements
first?

johannes


