Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16463C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zK16PLC7YyQ800P7XqS/d4WVwRulehjggbN68Vyp2H4=; b=0NbltyOXp8D+PfkaB/8/2v3Vxf
	yhu9pBzhUH/Z4axz8qqWK/cOgE0mzlrAEgtsYMqgijJJal+XyNtze8+7TSd96GRyiiuZI0MlOmqbW
	r+p+30HOGwAV0sB90UgN3m/Mh27lTX9EbujEpXl+ojHXA3GTzayYurrTZH04tiwN2q218KW77Qpgc
	6YgvmAOpULI7cx/NI38qL7XswnPtW2jPWnBFAlVHfnJWkVpOfAVWCHG9EM3rkVCsilnXeRjiggDy7
	2ekWmtSBhpczoe+unngu0pR0WAPMHaihapYSeORdBk+/5tHEkYT9lqTI3Q7N+ykABljzjgaJCVRN6
	WJENDSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkqj-000H36-0K;
	Thu, 14 Dec 2023 12:29:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkqf-000H29-2R
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Dec 2023 12:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zK16PLC7YyQ800P7XqS/d4WVwRulehjggbN68Vyp2H4=;
	t=1702556991; x=1703766591; b=FNcWY1Kx8SSATRxnOT3jC6S2jh5cAS4+xYDz+247yYYdrn/
	Lc0AfAtGCzM84Saw/0hFV0z5RgVBgldX+fJTmiLMYw2PFjeXs8d0DtcRq+ZhfIA/h1r5BrWMBXY05
	xd5UK9/rTQ7g9dTjHqSnlsYW7lW12XGbvcHJj969oIrJhfcs5Aahkn/EqXtiyQby2zERoaMF2P7+H
	icutgIa2ySNyqW88afL8arVoJQ8+F9e0YmG7rEW/wG4Ip5Wjy6O28sSVwTff3JTPJYc+Xih/c7+Im
	gc6ukJMUfPiZDDihyXRZFvmuHw3nH72b72ow26lqmy/yF0okERJxA+WtgrJFXJ8Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rDkqV-0000000Ap4b-1qtm;
	Thu, 14 Dec 2023 13:29:43 +0100
Message-ID: <65d21336e8f7e180352403a3e894aeaf27a22cab.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: Update bssid indicator with real BSS
 numbers
From: Johannes Berg <johannes@sipsolutions.net>
To: Allen Ye <allen.ye@mediatek.com>, linux-wireless@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Money Wang <money.wang@mediatek.com>,  linux-mediatek@lists.infradead.org
Date: Thu, 14 Dec 2023 13:29:42 +0100
In-Reply-To: <20231208063820.25983-1-allen.ye@mediatek.com>
References: <20231208063820.25983-1-allen.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_042953_792820_92AF0AD1 
X-CRM114-Status: GOOD (  15.48  )
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

We should have Lorenzo here, he wrote the original code.

On Fri, 2023-12-08 at 14:38 +0800, Allen Ye wrote:
> The cnt member in mbssid is the count of total number of MBSSID elements
> instead of BSSID. Therefore, we fix this by reading the MaxBSSID Indicato=
r
> field directly.

I'll say I don't understand this much ...

Are you trying to have BSSIDs that are hidden from the kernel? Or not
contiguous in the MBSSID set? Not sure how the two can be not
equivalent?

> Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Co-developed-by: Money Wang <money.wang@mediatek.com>
> Signed-off-by: Money Wang <money.wang@mediatek.com>
> Signed-off-by: Allen Ye <allen.ye@mediatek.com>

I have to admit that I chuckled a bit about this for a 5 line patch :-)

> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index 606b1b2e4123..f90bcd59f85a 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -1164,9 +1164,11 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_da=
ta *sdata,
>  	/* copy in optional mbssid_ies */
>  	if (mbssid) {
>  		u8 *pos =3D new->tail + new->tail_len;
> +		const struct element *mbssid_elem;
> =20
>  		new->mbssid_ies =3D (void *)pos;
>  		pos +=3D struct_size(new->mbssid_ies, elem, mbssid->cnt);
> +		mbssid_elem =3D (const struct element *)pos;
>  		pos +=3D ieee80211_copy_mbssid_beacon(pos, new->mbssid_ies,
>  						    mbssid);
>  		if (rnr) {
> @@ -1175,8 +1177,7 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_dat=
a *sdata,
>  			ieee80211_copy_rnr_beacon(pos, new->rnr_ies, rnr);
>  		}
>  		/* update bssid_indicator */
> -		link_conf->bssid_indicator =3D
> -			ilog2(__roundup_pow_of_two(mbssid->cnt + 1));
> +		link_conf->bssid_indicator =3D mbssid_elem->data[0];

But this seems fishy to me, if you look into the element itself, you're
going to have to do some validation on it? And what about fragmentation?

johannes

