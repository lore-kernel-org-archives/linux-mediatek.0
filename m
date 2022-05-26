Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HC6VUUrj1B59s1w28kxbUiMhT5+Ow9AEia93NTsYLA=; b=1eBFmIICKGt044aubTo7vUmqUc
	KsClxCp19EmatfD+Hsjdaf3lUPlwwD2pRvt4OSvVPYRF22XByyc7B4f/PG37UsptufTpwWi0llV+C
	OspakeyfjBmYWB7GltB1fsHA89oofD2RxG37Or0+E+63dBm9iiSuJo0+XZ+xmOqf7Oe7k39KRhaZD
	buIdkGqxeUBSza5NGsSu1FXCGCgrsz3BYk7QXCiH1NdnBQ1ngjKXtH+VrIfrLsP0eQLMt2PSk85TA
	TOy5ao3CPA8kybZqxgdf97KPgWLY6okub1CpQhX6u+eSWyRkuuYYnYTu69fO56Kn4u4A9XHEhRb9t
	FLXK2lJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9u6-00EE3c-Eh; Thu, 26 May 2022 09:35:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9u4-00EE3I-IM
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 09:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653557732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JmnRO7LHTYggSFd+n0zAYXE0N2NAbgdq/MhcoO3eVeQ=;
	b=db3IzVGroGqoMcF4c8Hra3F6KIFE9kSwTM7zz3hrqKoRPh5LMvtFZSH05iogdl0peQrkG/
	DoOmlu48VaVzSpQA/XvMAaak65Trl68vh4i6mKIeQgRL7W9IxN7usVeaANEaMp/L/15UM0
	xqDKtU1fZzGh49ai1BYG0JP/UrHFx9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-htek6pGMM_yvHdHkEBoUUA-1; Thu, 26 May 2022 05:35:30 -0400
X-MC-Unique: htek6pGMM_yvHdHkEBoUUA-1
Received: by mail-wm1-f72.google.com with SMTP id k7-20020a05600c1c8700b003974d762928so645419wms.7
        for <linux-mediatek@lists.infradead.org>; Thu, 26 May 2022 02:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JmnRO7LHTYggSFd+n0zAYXE0N2NAbgdq/MhcoO3eVeQ=;
        b=keSOiTxmczCcle1vUk4qJNt9FK4FbVfMyztMAcU6hLXxnQX0FtTyqvUUPtyoNkxE+/
         ce9wcY9J/5igppTxUxjyPyDO8+3y8MNUdh7v59a+FKSYH0U/D2Bu+N0STOkWZwVJl04d
         xU0ilbr5vHIphfDROXLDyIVTlHY+dGf0PKrBI/zsTMYgBlIAdvnhyXEdwt1IOGnYovaz
         fsiSYiXJCWoaAbCllkbCr3huG4BA9MU2O7P29ON4tcEaBNynUxdPUhEY7RYPdaC63Pp/
         okit3+qGC7qgXIWQ+yoJbYoxtuFymiDiZLWcAPuTi+b5kUuHpAFNnBAZ8J7Y+mt/aO8C
         mabQ==
X-Gm-Message-State: AOAM533MyzPweQmy6H4YmQiXoWOlHl+aQF313HLX2ggPeaouOB7SQZ06
	MoDD9smVJjMjXqqFpYbAnWmtU0hi8oHOA9+34UtKXRVGN+nwqNgDF+5WMbA84b4j6R/X9YzE4c6
	Gbp6XCCfJyyT56EYmQYYes/7HgvaRW6Tn
X-Received: by 2002:a5d:56c8:0:b0:20e:7638:ce53 with SMTP id m8-20020a5d56c8000000b0020e7638ce53mr26336957wrw.420.1653557729605;
        Thu, 26 May 2022 02:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDULMePG4Y7BXWXBNJHRLjgkWShICKdMlLsOk2j8S7NZVAPgSkqkQJnrzSF7YRqyGy6gYdnw==
X-Received: by 2002:a5d:56c8:0:b0:20e:7638:ce53 with SMTP id m8-20020a5d56c8000000b0020e7638ce53mr26336937wrw.420.1653557729392;
        Thu, 26 May 2022 02:35:29 -0700 (PDT)
Received: from localhost (net-93-71-56-156.cust.vodafonedsl.it. [93.71.56.156])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d648a000000b0020ff877cfbdsm1249445wri.87.2022.05.26.02.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 02:35:28 -0700 (PDT)
Date: Thu, 26 May 2022 11:35:26 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mac80211: check skb_shared in ieee80211_8023_xmit()
Message-ID: <Yo9J3j4mjD5ep6Da@lore-desk>
References: <1ef9b892cc93a36b1e62a6dda0e2e0a019f4e5f7.1653555361.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1ef9b892cc93a36b1e62a6dda0e2e0a019f4e5f7.1653555361.git.ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_023536_721752_9CA5F19F 
X-CRM114-Status: GOOD (  16.97  )
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
Content-Type: multipart/mixed; boundary="===============3188917413485206827=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3188917413485206827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pe8cQTOWleRQHimU"
Content-Disposition: inline


--Pe8cQTOWleRQHimU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add missing skb_shared check into 802.3 path as 802.11 path does
> to prevent potential use-after-free from happening.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  net/mac80211/tx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 0e4efc08c762..b026e746ac5b 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -4437,7 +4437,7 @@ static void ieee80211_8023_xmit(struct ieee80211_su=
b_if_data *sdata,
>  				struct net_device *dev, struct sta_info *sta,
>  				struct ieee80211_key *key, struct sk_buff *skb)
>  {
> -	struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(skb);
> +	struct ieee80211_tx_info *info;
>  	struct ieee80211_local *local =3D sdata->local;
>  	struct tid_ampdu_tx *tid_tx;
>  	u8 tid;
> @@ -4452,6 +4452,17 @@ static void ieee80211_8023_xmit(struct ieee80211_s=
ub_if_data *sdata,
>  	    test_bit(SDATA_STATE_OFFCHANNEL, &sdata->state))
>  		goto out_free;
> =20
> +	if (skb_shared(skb)) {
> +		struct sk_buff *tmp_skb =3D skb;
> +
> +		skb =3D skb_clone(skb, GFP_ATOMIC);
> +		kfree_skb(tmp_skb);
> +
> +		if (!skb)
> +			return;
> +	}

I guess you can use skb_share_check() here instead.

Regards,
Lorenzo

> +
> +	info =3D IEEE80211_SKB_CB(skb);
>  	memset(info, 0, sizeof(*info));
> =20
>  	ieee80211_aggr_check(sdata, sta, skb);
> --=20
> 2.29.2
>=20

--Pe8cQTOWleRQHimU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYo9J3gAKCRA6cBh0uS2t
rFmCAQCaolYs75JOv0Zht8/vMW6lA2NyXUt6FnUf0Lsuh+7PagD8DiUDWY9LYMhF
WestUWb7Ak0vkSyywILqS3E5rRLOVQU=
=7M7Q
-----END PGP SIGNATURE-----

--Pe8cQTOWleRQHimU--



--===============3188917413485206827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3188917413485206827==--


