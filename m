Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0A9C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 08:13:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E566661289
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 08:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E566661289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aq83CCf2f6+X6XwIvKJo/6xsoqL0ypS77O32k3oVgyM=; b=CqEljzTpxr16D8E5oqcepDQCN
	LIlwkV90TPX781VtW2vr/rbsQRnptnaSNYqdnvJWl99uApnMP70vTtb3PE3/NEiV6RcY2lH1hiedG
	SuRd/Ed3ZvEWEqVLiFrtrhFYbgLQ6ZGBonovI0T4FKqfkTWO0IZD89yxIeq9dVWd6IyG5q/GY11za
	SoqSCQQtS1DFKqy1EOWLewijrPxGcTeEOPZVK3TJlM4zN7IjSkWA4yrZMpPyI3bbzHWcWOFBVdRu8
	m6tGjHoIq0BU4UGmMowfEjvv+zCa/35piVeTwPusW3X3xbXdrXivV2+jjtQSjactjkAisb1mtDUAw
	3Z20SkX3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbIq6-00159J-FA; Tue, 27 Apr 2021 08:13:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbIq3-001587-UD
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 08:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:In-Reply-To:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oxEBttOl4a1kKljaNatNbnTnmbpYDtvagxJJe5Etukg=; b=VWDnppsjlz+j95DAUmhWFNoTHS
 LDMi/i51fVFJrGnnd6ELomQetNwQaimQijP+Oo3miWRTAECOHCi4l7TZx01kf95a2iHJEKbl54SXf
 Yk2OGH5WNIpSTeSYOmkRDFhlLCrVLMlvpih6gDoELUTdoRDRYmIdIg+W2kBipZHsTV9tkPdJVdNX+
 pfK4Ix9FfN/rr5SFXYndC9QYvAj/ll3mgViSXnznD0pBM0fOb3CgST1ddneGljqQN0C2H/6ncPE63
 QFCAUmvALQ8GtTHX7gqBSNPPgscWs3dumyb6dDRKq9l+k7TiRyCesEiLIRE6rZfYSCNRCYxVH+unW
 g11sJ2Yg==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbIq1-00GX93-BE
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 08:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619511174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oxEBttOl4a1kKljaNatNbnTnmbpYDtvagxJJe5Etukg=;
 b=TDXu0x/QoCFzPYJq/G7x/s33GvgdqdW+V0vGorkOCE3wSsZG2a0ILWiYQwwc1xD9lKmyJy
 hhSH7R/xBNvV9vg/tjy2hlUgtlxCywiuq6EHZp8AMNPXmG5gnUCsLJfKdG5pvXwWHPJlJl
 Fx8LeC7JNeCONIqS1/zWJj3wHWija+U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-CoLGH40dPqmwV1F5fejN4A-1; Tue, 27 Apr 2021 04:12:51 -0400
X-MC-Unique: CoLGH40dPqmwV1F5fejN4A-1
Received: by mail-ej1-f71.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so10962028ejz.5
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 01:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SiYctwTe5i2KDXxaksxLTUtLgydwhlO+q4SO9irAoxA=;
 b=ftOOPJRBRB8B/0WZWcg3eTt5+QQfx2KBPAydIzK4XleFBSCGP/Z7PcsX/0BzKBeNzq
 7tkEQb25xUD8AbfMIzLZTbNNmet5NcOI2FDVu1v29pIqPAvvFaAQMjKIRIYadZTr+AF6
 Imb+8ZjnqiadXn8GKohEtu1jJVtro1taqu3WKnQkQRYGISnNOxlcC9QRSRrruzERNJ44
 95yP2nKemddoVHPGS6NGdeyZ9ArwblbZdYNkWzEgCfoblA/GjAJINN0ZoasH/F6aCUhk
 GCQ3yb2rFWn8bWrjXRMvwksUQYEkaBvDpDWpH8wmMAOfXoo31q5weSuQ+HNRyq3URFzP
 +nLw==
X-Gm-Message-State: AOAM5308Jw963xMSWd+SbWe+Y2CXXTaRTxYIS9OE6vGl1q72ShyF85Qv
 lv59pH3/EWet5UxIUUS5DZNO2d8rIA3p1poguYnPsOgUuv2kG9599ApHNpDb7nftfq5X0x8+VSM
 VuDWNEyOJ7f+ThVnuzJvYoPfxsw2jXIlc
X-Received: by 2002:a17:906:a017:: with SMTP id
 p23mr22649642ejy.460.1619511170463; 
 Tue, 27 Apr 2021 01:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZlfwMstp/CiemD9GPBlDqRtHbbZ+zfzP5hC6bxcB2k6kTlac1UNxQ4XfJLVC58lCcHrhavg==
X-Received: by 2002:a17:906:a017:: with SMTP id
 p23mr22649633ejy.460.1619511170289; 
 Tue, 27 Apr 2021 01:12:50 -0700 (PDT)
Received: from localhost ([151.66.28.185])
 by smtp.gmail.com with ESMTPSA id f3sm12601516eje.45.2021.04.27.01.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:12:49 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:12:43 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mac80211: minstrel_ht: fix minstrel_aggr_check for encap
 offload
Message-ID: <YIfHe6d5IskhogTX@lore-desk>
References: <d5303cd9935a9a2f44b76070d191e753895da516.1619489753.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <d5303cd9935a9a2f44b76070d191e753895da516.1619489753.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_011257_595344_63A7C6BB 
X-CRM114-Status: GOOD (  13.27  )
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
Content-Type: multipart/mixed; boundary="===============9072492066507571549=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============9072492066507571549==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="83y9azwuOsjwp1b/"
Content-Disposition: inline

--83y9azwuOsjwp1b/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Avoid checking ieee80211_hdr to support encap offload.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  net/mac80211/rc80211_minstrel_ht.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_mi=
nstrel_ht.c
> index ecad9b10984f..02a6648aba54 100644
> --- a/net/mac80211/rc80211_minstrel_ht.c
> +++ b/net/mac80211/rc80211_minstrel_ht.c
> @@ -1180,20 +1180,19 @@ minstrel_downgrade_rate(struct minstrel_ht_sta *m=
i, u16 *idx, bool primary)
>  static void
>  minstrel_aggr_check(struct ieee80211_sta *pubsta, struct sk_buff *skb)
>  {
> -=09struct ieee80211_hdr *hdr =3D (struct ieee80211_hdr *) skb->data;
>  =09struct sta_info *sta =3D container_of(pubsta, struct sta_info, sta);
>  =09u16 tid;
> =20
>  =09if (skb_get_queue_mapping(skb) =3D=3D IEEE80211_AC_VO)
>  =09=09return;
> =20
> -=09if (unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
> +=09if (unlikely(!pubsta->wme))

I guess we are changing the behaviour here since the check is done per-pack=
et
and non per-sta

Regards,
Lorenzo

>  =09=09return;
> =20
>  =09if (unlikely(skb->protocol =3D=3D cpu_to_be16(ETH_P_PAE)))
>  =09=09return;
> =20
> -=09tid =3D ieee80211_get_tid(hdr);
> +=09tid =3D skb->priority & IEEE80211_QOS_CTL_TID_MASK;
>  =09if (likely(sta->ampdu_mlme.tid_tx[tid]))
>  =09=09return;
> =20
> --=20
> 2.18.0
>=20

--83y9azwuOsjwp1b/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYIfHeAAKCRA6cBh0uS2t
rJ40AP9s6SLk4IcjrZzQrwyK7qXNgfz7YsCNihD0/e/z6jszdgD8CnpJET02ahT0
lLNlUKno+70LFeDa4y8N6vJVnne3YQ4=
=So7w
-----END PGP SIGNATURE-----

--83y9azwuOsjwp1b/--



--===============9072492066507571549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9072492066507571549==--


