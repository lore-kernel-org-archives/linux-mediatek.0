Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75E9C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVnEvaxqsd9dCkI2giCqtV+/ipEyruMB7htKp3/+osk=; b=BicAAlztSTy7jdyPESZgPeRzm1
	cQ1vMzFBGoTWqrEP0pNJv200VQnGvd2YjABNPge2puD7KeJa5J2c6+xVFku5+uTA9TiFYF1ZddqjP
	t/ego9ecQ5+JqGgRbyAS3vtPxKpU3LsB/VTkm9yfzMrm8IS+VrHo9H6hx5izLmFMqjWGuEQ9Br8x0
	K8vUCcMOBcM4rZf1/SQaZc9EKaOusLPYD5NdeaaPqPPsM//KlgrV4jpHti4Q79ue+nJCsA+l/y9od
	7vOE0dG4lzzaNrtRxXna5//BLLvHm8cyPRZ9tZNo5Q0XAp/Rvllv0ojKjcHECdL+djyHxF204Z8yu
	C8A4rPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruA86-00000001oHj-1DxD;
	Tue, 09 Apr 2024 11:59:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruA83-00000001oGW-27Wd
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 11:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712663945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AVnEvaxqsd9dCkI2giCqtV+/ipEyruMB7htKp3/+osk=;
	b=QFSX1KneAFwn1CZhOp5vDvAzqDbWo8H9EjYAJvHoqZj01nGDeW9rCIWT51M6fqgrXPRE4q
	228Bh9wc+ErJPbtN7KeUZczQBCn4QbTtYpx3aSUznJUrB7uSJjFhy8W4XKvQyDpRKBClDf
	X05vunP6AcvZEtO5K+i2M3BnhgShFBk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379--dhFBQtJNvaW1TAsMoMN9A-1; Tue, 09 Apr 2024 07:59:04 -0400
X-MC-Unique: -dhFBQtJNvaW1TAsMoMN9A-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6993921ae18so7017696d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 04:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712663942; x=1713268742;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVnEvaxqsd9dCkI2giCqtV+/ipEyruMB7htKp3/+osk=;
        b=m8Xasp376HMdfM7b3IR9rbQxWvXXqkG3GVHaWWbp3v2uYghgx2Cr429aO+QeCSU34d
         Y2nhfg5BKvY0TaAzLQXHaEqFuvkFtxHfsctB35jEetLUXrJDQTDp0FY57odCXDIqw+yP
         ZZrCaXuhPdb5LNsDz7o/61RS+d9yVKev8WyPADW8jY6Cy6mPihJU+DLRyS5V5g7emxbC
         n+vpj7Q+DyOSWAtAayU8klnnsfHILtgPMpKB5IKAKGS2XnSTXoI6K4BiwkeV6CC/Jo9w
         Ds2uPQCB+R2BUMLDf+Xn1uIVFNbmGnjNW3jGkMLcTrfAnTyIWB9hNm/loA+dwoS7qiOd
         aYbg==
X-Forwarded-Encrypted: i=1; AJvYcCUoCEvrqYDtEmb6tplqD1962uJplc5dP1v4NNrMCs6Uy9JOkgT1WhP/nZEZlVodNMKRc2w9I6r2ijh2XLGYSPS8fbOZr84s1C9SFHJQsAbEgO5E
X-Gm-Message-State: AOJu0Yxg9E9VstWQdwm843lXPKvVxTiqa5EAVJhrR1s5Q2Oc97tWcUpd
	XQTHqBTHb8+5iai+3wYlLAsiPERh6gxqB7cQhntAuAB6eTHpSCRM6Rd8zmNP8bJQuenP01tznQK
	9nn+6Op8GkOg9CjuNM7gWcOzKoYIE8uivNWOj6vJ77ZV1BYPnMTtDjoQf1W2fqy20ToCvEA==
X-Received: by 2002:a05:6214:2408:b0:699:2d88:744f with SMTP id fv8-20020a056214240800b006992d88744fmr12560479qvb.4.1712663942484;
        Tue, 09 Apr 2024 04:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKcKqg6OiKy05WliAywffygt+wTBvOwmYCPaEUR8+Z7dbH4Z0DauesnEKqhKw8Fu2D+h1LNg==
X-Received: by 2002:a05:6214:2408:b0:699:2d88:744f with SMTP id fv8-20020a056214240800b006992d88744fmr12560454qvb.4.1712663942159;
        Tue, 09 Apr 2024 04:59:02 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-144.dyn.eolo.it. [146.241.244.144])
        by smtp.gmail.com with ESMTPSA id a8-20020ad441c8000000b0069b1f86f754sm1411709qvq.28.2024.04.09.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 04:59:01 -0700 (PDT)
Message-ID: <1f2bc5416a0a73756cc1f45f3300619eb201b0a4.camel@redhat.com>
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix enabling EEE on MT7531
 switch on all boards
From: Paolo Abeni <pabeni@redhat.com>
To: arinc.unal@arinc9.com, Daniel Golle <daniel@makrotopia.org>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?ISO-8859-1?Q?Ren=E9?= van
 Dorst <opensource@vdorst.com>, Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com,  erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  Florian Fainelli
 <florian.fainelli@broadcom.com>
Date: Tue, 09 Apr 2024 13:58:56 +0200
In-Reply-To: <20240408-for-net-mt7530-fix-eee-for-mt7531-mt7988-v3-1-84fdef1f008b@arinc9.com>
References: <20240408-for-net-mt7530-fix-eee-for-mt7531-mt7988-v3-1-84fdef1f008b@arinc9.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_045907_737827_FEBFF9E6 
X-CRM114-Status: GOOD (  27.31  )
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

On Mon, 2024-04-08 at 10:08 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL via B4 Relay w=
rote:
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>=20
> The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features"=
)
> brought EEE support but did not enable EEE on MT7531  MACs. EEE is
> enabled on MT7531 switch MACs by pulling the LAN2LED0 pin low on the boar=
d
> (bootstrapping), unsetting the EEE_DIS bit on the trap register, or setti=
ng
> the internal EEE switch bit on the CORE_PLL_GROUP4 register. Thanks to
> SkyLake Huang (=E9=BB=83=E5=95=9F=E6=BE=A4) from MediaTek for providing i=
nformation on the
> internal EEE switch bit.
>=20
> There are existing boards that were not designed to pull the pin low.
> Because of that, the EEE status currently depends on the board design.
>=20
> The EEE_DIS bit on the trap pertains to the LAN2LED0 pin which is usually
> used to control an LED. Once the bit is unset, the pin will be low. That
> will make the active low LED turn on. The pin is controlled by the switch
> PHY. It seems that the PHY controls the pin in the way that it inverts th=
e
> pin state. That means depending on the wiring of the LED connected to
> LAN2LED0 on the board, the LED may be on without an active link.
>=20
> To not cause this unwanted behaviour whilst enabling EEE on all boards, s=
et
> the internal EEE switch bit on the CORE_PLL_GROUP4 register.
>=20
> My testing on MT7531 shows a certain amount of traffic loss when EEE is
> enabled. That said, I haven't come across a board that enables EEE. So
> enable EEE on the switch MACs but disable EEE advertisement on the switch
> PHYs. This way, we don't change the behaviour of the majority of the boar=
ds
> that have this switch. The mediatek-ge PHY driver already disables EEE
> advertisement on the switch PHYs but my testing shows that it is somehow
> enabled afterwards. Disabling EEE advertisement before the PHY driver
> initialises keeps it off.
>=20
> With this change, EEE can now be enabled using ethtool.
>=20
> Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
> Here's some information for the record. EEE could not be enabled on MT753=
1
> on most boards using ethtool before this. On MT7988 SoC switch, EEE is
> disabled by default but can be turned on normally using ethtool. EEE is
> enabled by default on MT7530 and there's no need to make changes on the D=
SA
> subdriver for it.
> ---
> Changes in v3:
> - Remove patch 2, it was revealed that it doesn't fix a bug.
> - Patch 1
>   - Use the internal EEE switch bit provided by SkyLake Huang (=E9=BB=83=
=E5=95=9F=E6=BE=A4). It
>     is a better method compared to unsetting the EEE_DIS bit of the trap =
as
>     the latter method causes unwanted behaviour on the LED connected to t=
he
>     pin that pertains to the EEE_DIS bit.

Since this leverages something relatively obscure, it would be great if
someone in the CC list could independently test it. Let's wait a bit
more.

Cheers,

Paolo


