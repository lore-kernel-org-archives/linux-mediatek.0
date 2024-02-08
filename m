Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18E7C48260
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r17q1U4BSEBGcEVJq5z9iZi13EGZhxsJ18ERvTeuATs=; b=x/2B1OSfan1p598hdmA+HuPbTl
	2ne2OfV7UqFAAjjpQ1ULW0wnEyvLKLM3r9W9tT5jTjBPFWwEW06vFS9rPjOLMVWyXU7CikolDPAIU
	Oh2Y6vfo6xCvw0OqbglSXUn82K8o4EVgoByy/TmL21DrXpqvFXel2dnB5EocCphHpNSJHPzFDG3Al
	QFHfxKVT5p5KvBJtUenwodBScraCKlCv+1IVKSZCliOGpRWmrVqNLJGQw7AGhEAsPVJjOYVmiN7Bv
	vH3RvClZfBIPHQVBrJ4UsqyqDfqegdGHHWela8I6kwNS/emSYym7iKbfyNgES05J8WWI7biiChQiI
	fp9Xh4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4ZI-0000000DuiI-0Yt6;
	Thu, 08 Feb 2024 13:35:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4ZF-0000000DuhZ-1LWp
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Feb 2024 13:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=r17q1U4BSEBGcEVJq5z9iZi13EGZhxsJ18ERvTeuATs=;
	t=1707399350; x=1708608950; b=itHMInCZMb5lMxoLEziI9i6SKnf4WGP9ODqWOqLRYY7uN8e
	78ygeK66oOKh6ocW7NXLo0pCZO8dyNlnDc2/4f3wiMAfBZciAwFbkPHNAY2lVnJt/L1BEIU01jfL/
	+sOIj5EjYtbYo1fkhQGYom9c+blx6Jx7nmw5eWOLwV4QEEv6wencmGBRYbQTnJOOWFLZ0RrEveS1c
	erelUzPswHX+XCuUzowmoqDt2hWKOjAaWYZVpZLWzUhYHjTHiOc2vtv38VlnIXr+V67iT6oRRVaGX
	RbrCpWMBcATc6J03T70fokOeSLA7dL8xgRHXGl9sX6LzujOeO38uMQ3fP+gSyLwQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rY4Z7-0000000HUJa-2rLW;
	Thu, 08 Feb 2024 14:35:45 +0100
Message-ID: <b74f21d22a41b2ca635e64f04c06d5db6d38d920.camel@sipsolutions.net>
Subject: Re: [v4,2/2] wifi: mac80211: refactor STA CSA parsing flows
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Thu, 08 Feb 2024 14:35:44 +0100
In-Reply-To: <20231222010914.6521-3-michael-cy.lee@mediatek.com>
References: <20231222010914.6521-1-michael-cy.lee@mediatek.com>
	 <20231222010914.6521-3-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_053553_389578_8937756A 
X-CRM114-Status: GOOD (  12.18  )
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

So ... I foolishly applied my other changes first, so I had to rebase
this - please do check.

Couple of questions/notes, if anything needs changing please send
another patch.

> +	he._oper.he_oper_params =3D cpu_to_le32(u32_encode_bits(1,
> +					IEEE80211_HE_OPERATION_6GHZ_OP_INFO));

(I changed this to le32_encode_bits, FWIW)

> +	/* if data is there validate the bandwidth & use it */
> +	if (new_chandef.chan) {
> +		if (conn_flags & IEEE80211_CONN_DISABLE_320MHZ &&
> +		    new_chandef.width =3D=3D NL80211_CHAN_WIDTH_320)
> +			ieee80211_chandef_downgrade(&new_chandef);
> =20
>  		if (conn_flags & IEEE80211_CONN_DISABLE_80P80MHZ &&
> -		    new_vht_chandef.width =3D=3D NL80211_CHAN_WIDTH_80P80)
> -			ieee80211_chandef_downgrade(&new_vht_chandef);
> +		    new_chandef.width =3D=3D NL80211_CHAN_WIDTH_80P80)
> +			ieee80211_chandef_downgrade(&new_chandef);
> +
>  		if (conn_flags & IEEE80211_CONN_DISABLE_160MHZ &&
> -		    new_vht_chandef.width =3D=3D NL80211_CHAN_WIDTH_160)
> -			ieee80211_chandef_downgrade(&new_vht_chandef);
> -	}
> +		    new_chandef.width =3D=3D NL80211_CHAN_WIDTH_160)
> +			ieee80211_chandef_downgrade(&new_chandef);
> =20


Shouldn't that have (had!) an 80 MHz handling case? Or maybe a loop a la
the one in ieee80211_config_bw():

        /*
         * Downgrade the new channel if we associated with restricted
         * bandwidth capabilities. For example, if we associated as a
         * 20 MHz STA to a 40 MHz AP (due to regulatory, capabilities
         * or config reasons) then switching to a 40 MHz channel now
         * won't do us any good -- we couldn't use it with the AP.
         */
        while (link->u.mgd.conn.bw_limit <
                        ieee80211_min_bw_limit_from_chandef(&chanreq.oper))
                ieee80211_chandef_downgrade(&chanreq.oper, NULL);


Feels like this should be the same here.

Also note how this uses ieee80211_chandef_downgrade() - we really need
to track the "chanreq.oper" vs. "chanreq.ap" in this code as well for
puncturing - can I ask you to take a brief look at that? I'll anyway
probably have to look at that soon though.

johannes

