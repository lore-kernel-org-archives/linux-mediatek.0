Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CB0C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwNWU9H0jlFf7a3RNgRpbLKduCFaN8GBzI42VxtTjDo=; b=vfruNqZyXEtz3F1riG0kNQlKk9
	OLtv3AtZiT3BncfqQtyy7i/GA0rlZK+SO4qq7Q7ymFIjH0oK3ZNLQ4++7P7PJQJ/3nAskkV4ViTVs
	9kvxzqRaKwFTx83BgB5XWzbP3lvRKOhpKRRE99Nh9tcuIBTqeFAAEt9c9sQyQEguXaiHmrs3Vl/Yt
	UKFDGha2g2eGJn3Zl5HWa/nOojabOfmIw+nAyplmc0DMQ1K2j8jOlZIPNnYy+gnkBHj1O+8KR665C
	SuUDWot4VK5gogOjRE6dB2d3wHdQtYN3cPMtI+Y7JeueTYRbLpJXeNMe2OUQ6mrLGvOsqCSPBFmz1
	HL90cHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4vj-0009Jo-Kd; Wed, 18 Jan 2023 09:40:27 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4vh-0009Io-4o
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 09:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=DwNWU9H0jlFf7a3RNgRpbLKduCFaN8GBzI42VxtTjDo=;
	t=1674034821; x=1675244421; b=i4KP4hsVNSPEFCBwZwGBMjqdEd8NcTeGMS2arXV3KLO9TlG
	ljbGWnOvLj6LvIoK/51Eu0xPBMkR39Uj1XuZYij5IIhAPY+Lqjh/joaA7gTnmXgh8nwOFw8c6+1bj
	7uY9AOIbNxBmq08NPab7/O1CikIZ1rruS595+ituTrFwfMr9oA8Lm50YmrGNgnWH6gHwhIJ7aPJm+
	LLbb5E2sD4EvEr61FCf++63KqXdnqT6xWajZPqsWSmJX6uw9Ak39XOH+J/qkVgOrQc5ZtxSJ8mjdJ
	cibu5LtAt7+6NLTFm+c87mx2JOdT3onGZyo/wIuTnm4IeHeguJJ3XxstXkW9Uklg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pI4vR-005XzM-08;
	Wed, 18 Jan 2023 10:40:09 +0100
Message-ID: <277f8db1f790931aaac0f94ba0ea69efcb6ba3ac.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: check the control channel before
 downgrading the bandwidth
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Wed, 18 Jan 2023 10:40:07 +0100
In-Reply-To: <20221222091354.14050-1-michael-cy.lee@mediatek.com>
References: <20221222091354.14050-1-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_014025_331994_B826A1F8 
X-CRM114-Status: GOOD (  24.20  )
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

So I've looked at this patch a few times, but it just confuses me ...

On Thu, 2022-12-22 at 17:13 +0800, Michael Lee wrote:
> When the link fails to use the channel, chandef's bandwidth will be=20
> downgraded without checking the control channel.
> The issue happens when the STA of an extender with limited channel=20
> context associates with a root AP operating on a different channel.
>=20
> Below is an example:
>=20
>     ______________           ________________
>    | RootAP(ch36) |         | Extender(ch44) |
>    |              | (ASSOC) |       AP       |
>    |      AP <-------------------- STA       |
>    |______________|         |________________|
>=20
> - RootAP is operating on channel 36, while Extender is operating
>   on channel 44

What does this matter? The extended is just a STA, no? Or are you saying
it's important that the extender has a concurrent AP interface that's on
channel 44?

And if you say "ch36" or "ch44" that's just the control channel (I
guess), but what's the actual complete channel configuration?

> - When associating with RootAP, Extender-STA downgrades the
>   chandef's bandwidth to be compatible with any channels on the phy

What do you mean by "on the phy" here? That's not mac80211 terminology,
so not sure.

> - Finally, chandef's bandwidth is downgraded to 20MHz and=20
>   the association fails
>=20
> In this patch, a control channel checking is added to avoid unnecessary
> bandwidth downgrading
>=20
> Signed-off-by: Michael Lee <michael-cy.lee@mediatek.com>
> ---
>  net/mac80211/mlme.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
> index 0aee2392dd29..bc435e8508e2 100644
> --- a/net/mac80211/mlme.c
> +++ b/net/mac80211/mlme.c
> @@ -4616,6 +4616,27 @@ ieee80211_verify_sta_he_mcs_support(struct ieee802=
11_sub_if_data *sdata,
>  	return false;
>  }
> =20
> +static bool
> +ieee80211_check_same_ctrl_channel(struct ieee80211_sub_if_data *sdata,
> +				  const struct cfg80211_chan_def *chandef)
> +{
> +	struct ieee80211_local *local =3D sdata->local;
> +	struct ieee80211_chanctx *ctx;
> +
> +	mutex_lock(&local->chanctx_mtx);
> +	list_for_each_entry(ctx, &local->chanctx_list, list) {
> +		if (ctx->replace_state =3D=3D IEEE80211_CHANCTX_WILL_BE_REPLACED)
> +			continue;
> +		if (ctx->mode =3D=3D IEEE80211_CHANCTX_EXCLUSIVE)
> +			continue;
> +		if (chandef->chan =3D=3D ctx->conf.def.chan)
> +			return true;
> +	}
> +
> +	mutex_unlock(&local->chanctx_mtx);
> +	return false;
> +}
> +
>  static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
>  				  struct ieee80211_link_data *link,
>  				  struct cfg80211_bss *cbss,
> @@ -4842,6 +4863,9 @@ static int ieee80211_prep_channel(struct ieee80211_=
sub_if_data *sdata,
>  	    chandef.width =3D=3D NL80211_CHAN_WIDTH_10)
>  		goto out;
> =20
> +	if (!ret || !ieee80211_check_same_ctrl_channel(sdata, &chandef))
> +		goto out;

Not sure I get how this is any different - you're describing a case
where "ret !=3D 0" (because if ret =3D=3D 0 nothing happens in the while
loop), so then you fail _anyway_? So what's the point?

johannes


