Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F60C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 20:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3028D6103B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 20:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3028D6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9N1N22v6qMFIW4H4YT1IjapsVlEcgKLcSGUkhxI4PY=; b=jHsLQxXZrmeYfvBl6jRPycyTF3
	ltP+ggtJPRU0H6PwXuGHQVYZjYrUjjsXGlCGWAgpxsPoeXpQiwB184fCs69D6GP96aC565/l0bcsM
	hPY3x1PQxB2Pt9C5RQD+okFhKXwlKFDfr7tpDObE3Z9RvVBuG9ZxSZyuoCuzZH/gkCZPWNEWgyyUC
	0Qaqp93LS2DMMrlG2hYDfqi1NwQ48a/341q1j9ch16WtEb4N63aufCNpC4mzPPMrnTE0aAaxYtGou
	qx30rSWGlr2+7RoSvH48ZG8Lso9M1gLZCrY0LUFMl2zPTGPtQsykA/M1+cYAuF1pzKX7cSoeLKKGc
	1DG0PUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYZyI-000gnY-Rv; Thu, 07 Oct 2021 20:26:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYZyF-000gmz-Na
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 20:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633638384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkmK/0Pt+OTCmbq0sg5B4K8OrbYP2B26i1ouyqEItjs=;
 b=Ys+l5nPovBUJtekFEqEJIyVhkMv/SK4E9hzuPZPmpt36VdddgZGxPXU3ZUHlDvNVuR4uCM
 Fp48x+if5ScsOSsmqcP2AhrL2MJpgaD9ydHqV0rm85sP+QapWza9KPySRT4W2bz/lxqKjU
 OjG1Q03ew0O8ho0jfejMgBKNxLYOFNA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-LuksZ0NzNoW-6vCF-VAD4w-1; Thu, 07 Oct 2021 16:26:17 -0400
X-MC-Unique: LuksZ0NzNoW-6vCF-VAD4w-1
Received: by mail-ed1-f72.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so7008968edl.18
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Oct 2021 13:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hZusz9cYbIWQpV9csYN7a8WKv66KCgntMG2FiC0Mxdw=;
 b=wMfsX+u/vX6n6LctGAnLErgtsZ+UyIddw/P2Hd3ES/wzKTdAza6+2wIgyl6GFhSECK
 gKZ+C/SSV9xw/htcGvw7pG1XBiULHB/l581jl4eNYwInnTEwDH9VfHoTI2NUIO2ZGGyQ
 gAqXLkHEtk4PTMr2IESd4eaHL4gapf5Gx5cZH5hiZ7NhEsNInN0iXKZDXtjEeVDlU2co
 zKRuNLeeQglBoXdj2ZPg0xc6JzDGClKYxttkuw5pOFxQdfcKbSi8v11UQsuJgs4gxQNt
 J1A73lU2yz3aI7r51glZYRmpFk1t8Uuh3ZvL5AcOQqyMfYgI6/NbO4Tp4Sniv5rAU23x
 zStA==
X-Gm-Message-State: AOAM532WASMglSEModqL14GubgUCOblvyDEVmX+r+8sg/O+WwAaNiXNS
 Pxmk8OTek0xlmg7x8F3Y70lqJan6KiHDCZXn0v2wa1D6JVtLK7w1tNryM3uhFxD7vSD6sNxdnPK
 tKKJJ2MX8B4rr5ZBdSVYgCTCzcJ615bMW
X-Received: by 2002:a17:906:1945:: with SMTP id
 b5mr8122713eje.347.1633638376272; 
 Thu, 07 Oct 2021 13:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNxpIBpDKVTBcNdJ7m+OMEIWpOE/VlJ/xlBkqyxOTuTBAy7834GbYjWU2EDtyZU/IHTeYWGg==
X-Received: by 2002:a17:906:1945:: with SMTP id
 b5mr8122686eje.347.1633638375992; 
 Thu, 07 Oct 2021 13:26:15 -0700 (PDT)
Received: from localhost (net-2-47-237-124.cust.vodafonedsl.it. [2.47.237.124])
 by smtp.gmail.com with ESMTPSA id z16sm200305edb.16.2021.10.07.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 13:26:15 -0700 (PDT)
Date: Thu, 7 Oct 2021 22:26:11 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: add MU EDCA cmd support
Message-ID: <YV9X43y1pQCDApd5@localhost.localdomain>
References: <181a8f619a55c5a509c838d2ea5ec64641d4aa19.1633632336.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <181a8f619a55c5a509c838d2ea5ec64641d4aa19.1633632336.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_132627_876103_985E2222 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: multipart/mixed; boundary="===============6013170429779106751=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6013170429779106751==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JNVcCZ/mkz4SeEUI"
Content-Disposition: inline

--JNVcCZ/mkz4SeEUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Add MU EDCA MCU command support to update MU AC parameter record field
> from the access point.
>=20
> Co-developed-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
> Signed-off-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
> Tested-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 56 ++++++++++++++++++-
>  2 files changed, 54 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index cb36dd39221c..0ce670d65673 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -563,6 +563,7 @@ enum {
>  =09MCU_CMD_SCHED_SCAN_ENABLE =3D MCU_CE_PREFIX | 0x61,
>  =09MCU_CMD_SCHED_SCAN_REQ =3D MCU_CE_PREFIX | 0x62,
>  =09MCU_CMD_GET_NIC_CAPAB =3D MCU_CE_PREFIX | 0x8a,
> +=09MCU_CMD_SET_MU_EDCA_PARMS =3D MCU_CE_PREFIX | 0xb0,
>  =09MCU_CMD_REG_WRITE =3D MCU_CE_PREFIX | 0xc0,
>  =09MCU_CMD_REG_READ =3D MCU_CE_PREFIX | MCU_QUERY_MASK | 0xc0,
>  =09MCU_CMD_CHIP_CONFIG =3D MCU_CE_PREFIX | 0xca,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 56fb7e54e283..53b2eaad2af7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -974,7 +974,31 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct=
 ieee80211_vif *vif)
>  =09=09.total =3D IEEE80211_NUM_ACS,
>  =09};
>  =09struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> -=09int ac;
> +

can you please remove blank line here?

> +=09struct mu_edca {
> +=09=09u8 cw_min;
> +=09=09u8 cw_max;
> +=09=09u8 aifsn;
> +=09=09u8 acm;
> +=09=09u8 timer;
> +=09=09u8 padding[3];
> +=09};
> +=09struct mt7921_mcu_mu_tx {
> +=09=09u8 ver;
> +=09=09u8 pad0;
> +=09=09u16 len;

I guess __le16 here (even if it is not actually used)

Regards,
Lorenzo

> +=09=09u8 bss_idx;
> +=09=09u8 qos;
> +=09=09u8 wmm_idx;
> +=09=09u8 pad1;
> +=09=09struct mu_edca edca[IEEE80211_NUM_ACS];
> +=09=09u8 pad3[32];
> +=09} __packed req_mu =3D {
> +=09=09.bss_idx =3D mvif->mt76.idx,
> +=09=09.qos =3D vif->bss_conf.qos,
> +=09=09.wmm_idx =3D mvif->mt76.wmm_idx,
> +=09};
> +=09int ac, ret;
> =20
>  =09for (ac =3D 0; ac < IEEE80211_NUM_ACS; ac++) {
>  =09=09struct ieee80211_tx_queue_params *q =3D &mvif->queue_params[ac];
> @@ -995,8 +1019,34 @@ int mt7921_mcu_set_tx(struct mt7921_dev *dev, struc=
t ieee80211_vif *vif)
>  =09=09else
>  =09=09=09e->cw_max =3D cpu_to_le16(10);
>  =09}
> -=09return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE, &req,
> -=09=09=09=09 sizeof(req), true);
> +
> +=09ret =3D mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE, &req,
> +=09=09=09=09sizeof(req), true);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (!vif->bss_conf.he_support)
> +=09=09return 0;
> +
> +=09for (ac =3D 0; ac < IEEE80211_NUM_ACS; ac++) {
> +=09=09struct ieee80211_he_mu_edca_param_ac_rec *q;
> +=09=09struct mu_edca *e;
> +=09=09int to_aci[] =3D {1, 0, 2, 3};
> +
> +=09=09if (!mvif->queue_params[ac].mu_edca)
> +=09=09=09break;
> +
> +=09=09q =3D &mvif->queue_params[ac].mu_edca_param_rec;
> +=09=09e =3D &(req_mu.edca[to_aci[ac]]);
> +
> +=09=09e->cw_min =3D q->ecw_min_max & 0xf;
> +=09=09e->cw_max =3D (q->ecw_min_max & 0xf0) >> 4;
> +=09=09e->aifsn =3D q->aifsn;
> +=09=09e->timer =3D q->mu_edca_timer;
> +=09}
> +
> +=09return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_MU_EDCA_PARMS, &req_=
mu,
> +=09=09=09=09 sizeof(req_mu), false);
>  }
> =20
>  int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd)
> --=20
> 2.25.1
>=20

--JNVcCZ/mkz4SeEUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYV9X2AAKCRA6cBh0uS2t
rBrWAP0Q6iX7EM5XsMtfJajnloN+IIQAmc7DNNcOvp8BXDkA+gEApGfu8/DNDOPK
akalhUaMq1vu40nkD/2t2Y4AtSEUxA8=
=HSnB
-----END PGP SIGNATURE-----

--JNVcCZ/mkz4SeEUI--



--===============6013170429779106751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6013170429779106751==--


