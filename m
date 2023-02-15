Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A202C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thkmbSvo++vteVUZ4wrW/o6bEV8amItdP0fgdfx7U0g=; b=t7fzl9ZaD3FBa84hP+U5Npay0E
	NZBwoxp7xVOiZa4gzKT90WBTEnyRBou21302rNBayGW5LJOwjCXIRoWKtPpgY3GOAvpkIjxCEKL3d
	0aRm4AnbWQefST4svcqpH6++mMjkZcKg6AuNCzWLe5Y/iskaZnoQDfqiBkEl6j0frOxY8uAZkitO0
	GZHMEeewaHxs1cZ8C2ajYCdyLhknMrAczAxyxYR1R4t+RdU9cCwqLX3nbQGmbejmWvt53Wcz785fg
	NKaLs1t02ljps/Ti1Duf2UIVJwkRnLeYC/1sChXKn/WCMQoT8e9CkRT9sah6yACUl7t2JfCngKtb/
	pwVwIHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLoS-006kWb-3e; Wed, 15 Feb 2023 17:43:24 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLoP-006kVm-HI
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 17:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=thkmbSvo++vteVUZ4wrW/o6bEV8amItdP0fgdfx7U0g=;
	t=1676483001; x=1677692601; b=H/Xdeqa2Ea4wkt6QlVz8k9vxk1SZdArH6yVdSjr0hPOhL4Z
	bVq3UfwpVevHB/Rf+kIctPRWtjJ/WUwfJJ+4ESA+uCBIZafpFVNyjDpPZX2IsJxXOapdoueD3pjCz
	0LKR4BraU6MKtRVLiCSNqvqF8JgXN2Xane9AgJHOPAKbQ/lVocogTZxcbj+7bEIH2eZUcVWqcD4Ad
	Yrs1EZtom9NB9VkVKFHBKqOM85eDeyz8bq365L9bqfntElxDVgZN68LCz8I6p0cmPdmLBjoC0XUh9
	P7TdTtXzJbP+u1+sCTQszM+hdVQ1/VaeEybNuD+LusbDX4t+6LS+3xrHrVwC0Z2A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSLoI-00D9VL-0t;
	Wed, 15 Feb 2023 18:43:14 +0100
Message-ID: <165dcb98f58e8d6049d89d8e4ebb326b8fe631b8.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: mac80211: add LDPC related flags in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	 <evelyn.tsai@mediatek.com>, linux-mediatek@lists.infradead.org
Date: Wed, 15 Feb 2023 18:43:10 +0100
In-Reply-To: <4e5cff1c538cbd9ecca171e0e4d6fddd87c3dfa0.1675893838.git.ryder.lee@mediatek.com>
References: 	<c1a6ef2f42e26a6e0473d4fb2ce1b572f8448d87.1675893838.git.ryder.lee@mediatek.com>
	 <4e5cff1c538cbd9ecca171e0e4d6fddd87c3dfa0.1675893838.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_094321_586807_46C49C56 
X-CRM114-Status: GOOD (  10.99  )
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

On Thu, 2023-02-09 at 06:09 +0800, Ryder Lee wrote:
> This is utilized=C2=A0to pass LDPC configurations from user space (i.e. h=
ostap) to driver.

again, hostapd

why do we need this?

> + * @ht_ldpc: in AP mode, indicates interface owns HT LDPC capability.
> + * @vht_ldpc: in AP mode, indicates interface owns VHT LDPC capability.
> + * @he_ldpc: in AP mode, indicates interface owns HE LDPC capability.

what do you mean by "owns" the capability? Has? Uses it?

> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index 6bf1cdf254f6..a080010da8fb 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -1252,7 +1252,16 @@ static int ieee80211_start_ap(struct wiphy *wiphy,=
 struct net_device *dev,
>  	prev_beacon_int =3D link_conf->beacon_int;
>  	link_conf->beacon_int =3D params->beacon_interval;
> =20
> +	if (params->ht_cap) {
> +		link_conf->ht_ldpc =3D
> +			params->ht_cap->cap_info &
> +				cpu_to_le16(IEEE80211_HT_CAP_LDPC_CODING);
> +	}

No need for braces.

johannes

