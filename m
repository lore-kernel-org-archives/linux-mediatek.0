Return-Path: <SRS0=6guZ=OI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 10:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFCE61074
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 10:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FFCE61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzJqsPTX0rcD6u2voflvhGtA43VUyNLEhJBlCQplHzc=; b=3mGAYlFlxsR91ka1dVv9TTfDNu
	FZ/Yd6ldv+MTqhV1uvQ4C+oVHsbfkS/xluSX/gLPTCBnAkvCiyOnvRty4oZSBVTFqmtyUXcXrmvjB
	1Vfml1KCn0VvEn7e0CeWLRx4m2DotMYUFPVhQLBw3YFZwPFLHkav8BYT10i8pTNEtWv2/JVvnU5QM
	kwo29b8cNFXBHM13D6k8Qs/R8UiWHSA0OifVI0QOz2uFZkbUGFWZjCWQ5vC6R8pCR0B16y+alUGcc
	ifmPagcWvICK/fO72LdiJHex1ENiH+LTgl7c8/S9PPgZbgLmi5A+ZUIFeGbMAt99f9MPkMK97LogJ
	NmfWcU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRXNN-00FkeE-IL; Sat, 18 Sep 2021 10:15:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRXNK-00Fkdh-J4
 for linux-mediatek@lists.infradead.org; Sat, 18 Sep 2021 10:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631960113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58VMp04LwAMuqKiiKIHQOVRbVSOldoNuKarwwTfYw3w=;
 b=e5rPG9PSvSZa7Sj6xr6S+CYoVijvkC6Nflv/Gy7CmEaWN+6gyADCcAzCqkpA4wxws4yItx
 ES/Dz5ufir8t+s+CvZYXHEHq4HOFep3qZkmLf3uMj1Cw35eIQLI8zuQWua00c9HeF5+/fC
 ohcFWFqU/nRNiAyhYcZm+fj/r8Q2BEk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-uNEkoUrOPjOv7S9KI9LJIw-1; Sat, 18 Sep 2021 06:15:09 -0400
X-MC-Unique: uNEkoUrOPjOv7S9KI9LJIw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x14-20020a50ba8e000000b003d5a565de3aso10501920ede.18
 for <linux-mediatek@lists.infradead.org>; Sat, 18 Sep 2021 03:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S/7EmwLFFDQP/KzrTW8Ir1otVMUhMlWVF+7ZHoCcdtQ=;
 b=Kxq7gEl+oKxadVu4YHq1VCqMB6DOuRHw3kOBgogkiDWNWmiVApa1h64rDfY2Q0IgoU
 QbKNSIe1e9RMAzYcojFLXvKI3IBm8LnS53LxFhMzM1qI+7QKWYSENFo6Jr84ejg2wnfM
 Kwhsq+4nQS19wbpZIqfvtP1NiYQgKuGDBBOi+JXBJa3a0e+GxQZ3QOIgigt70vYpAE3X
 ZAp79As743FjtpteFcM8WwACytx24VULLz7RSxzhjmdAimSeNNkcyJQfJUemA+MJPTAw
 2L4IIFSCS1cRA1Nvxxhpgqts88BdNk97vK4AEhAm8+uLr8iHrVlCUFVdC26YihtHlJHR
 7tNA==
X-Gm-Message-State: AOAM533Co16pXTIH+/xLj8juRatNOEJocchMjNuy3SRsf+c83OYUUsM7
 DY6m7EmuJ1qpt4QqQH61uTn/Xaw3xkalalzQPdQBb6jvckGGcW6E7boYPPWrwu8PN1k+/4TWVF2
 sdzGGuTkCgoSYaGHdU1A46qAutFJRr59C
X-Received: by 2002:a17:906:1f49:: with SMTP id
 d9mr18011177ejk.150.1631960108323; 
 Sat, 18 Sep 2021 03:15:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/8lI6Vy9wCLjIieh2EG36R/DLCixISYQ/RXFzHWu3L2yJ9ELZcaUS1Q5KoPy0Qy0gCUhpXA==
X-Received: by 2002:a17:906:1f49:: with SMTP id
 d9mr18011156ejk.150.1631960108096; 
 Sat, 18 Sep 2021 03:15:08 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id g21sm3440295ejs.53.2021.09.18.03.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 03:15:07 -0700 (PDT)
Date: Sat, 18 Sep 2021 12:15:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 06/16] mt76: connac: move mcu reg access utility
 routines in mt76_connac_lib module
Message-ID: <YUW8KBTC7t3PHJwF@lore-desk>
References: <cover.1631918993.git.objelf@gmail.com>
 <42112d6b7b1c09bcdfa37d4417e55ef45c09ceff.1631918993.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <42112d6b7b1c09bcdfa37d4417e55ef45c09ceff.1631918993.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_031514_758020_D499046F 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Type: multipart/mixed; boundary="===============3278852646943812053=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3278852646943812053==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjmTM+NR3uzpPGj1"
Content-Disposition: inline

--tjmTM+NR3uzpPGj1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Move mcu reg access shared between mt7663s and mt7921s in mt76_connac_lib
> module.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 27 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  2 ++
>  2 files changed, 29 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index ae692052de97..a53f6344a184 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2406,6 +2406,33 @@ void mt76_connac_mcu_set_suspend_iter(void *priv, =
u8 *mac,
>  }
>  EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_suspend_iter);
> =20
> +u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset)
> +{
> +=09struct {
> +=09=09__le32 addr;
> +=09=09__le32 val;
> +=09} __packed req =3D {
> +=09=09.addr =3D cpu_to_le32(offset),
> +=09};
> +
> +=09return mt76_mcu_send_msg(dev, MCU_CMD_REG_READ, &req, sizeof(req),
> +=09=09=09=09 true);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_rr);

It seems quite a common code, does it worth to move them in mcu.c? (mt76 mo=
dule)

Regards,
Lorenzo

> +
> +void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val)
> +{
> +=09struct {
> +=09=09__le32 addr;
> +=09=09__le32 val;
> +=09} __packed req =3D {
> +=09=09.addr =3D cpu_to_le32(offset),
> +=09=09.val =3D cpu_to_le32(val),
> +=09};
> +
> +=09mt76_mcu_send_msg(dev, MCU_CMD_REG_WRITE, &req, sizeof(req), false);
> +}
> +EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_wr);
>  #endif /* CONFIG_PM */
> =20
>  MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index ea46dde364e1..6c410c4a8d6e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1111,4 +1111,6 @@ void mt76_connac_mcu_coredump_event(struct mt76_dev=
 *dev, struct sk_buff *skb,
>  int mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy);
>  int mt76_connac_mcu_set_p2p_oppps(struct ieee80211_hw *hw,
>  =09=09=09=09  struct ieee80211_vif *vif);
> +u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset);
> +void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
>  #endif /* __MT76_CONNAC_MCU_H */
> --=20
> 2.25.1
>=20

--tjmTM+NR3uzpPGj1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUW8JgAKCRA6cBh0uS2t
rJmOAP4xMokaGnfDzC2YzQvKQtrtKFOOFICvPWlGDeQ3K5WovAD/WdXEiTcKyGhR
hhW3fjRW1DWZUXK3Psyij8xtd+ov4Ak=
=mDxl
-----END PGP SIGNATURE-----

--tjmTM+NR3uzpPGj1--



--===============3278852646943812053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3278852646943812053==--


