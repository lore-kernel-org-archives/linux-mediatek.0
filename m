Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OTvyjVSRMANRZ84PUaaEpo8fINhH4ZJcWuQGiTyWDg=; b=I1j6Qt2ouinLl/UQt97m7n9qt+
	8y6Yl0h930SLMCSA+9BMrqpf8vXS24ElJ2PT9pMCYWFMYL1REH5W+lazfJ1yIvjgOBwwGWapRtZuO
	Ltf9LEkHWm9YVM8h7wf5IPRSBXfXObHUPjCJZCr2hGrq3TfnzQuWfPj6pGMgENauE8pHcWhtQP2Vx
	nBoXRJf/mK1RRgLgXfCPCN1aiw0YmIcMoCFme5IrvjY2OaCBGDtPcD1t2kyX2x7cC3U+l2tdeC4VF
	jFNAgAp+G4JQw/PUI+AyhgSjW1D3pafKnhcAnPApl9wZAbE2JRjuzLJjHZ5cqGTg0k5aPyUCFwiHB
	JP6r8BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKBE-00GES1-Ms; Thu, 09 Dec 2021 14:13:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKBC-00GEQY-4A
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 14:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639059227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQmAx+jUTxBqUsx3uH3g7iKPHamEm185KbpiKQSUJOI=;
 b=bXb6+CKhqnbT4eLKnhAEWz9lDG8yp4c7jcLGgb0Za5SzyfXHMw4EvZNJ8aFTwPkQhSO1MN
 G69Xqm/IEbniza2U2X/5oyBXSSbEjxEjAYMiimF/yT8o5l7gQUtGJTcy7ZUqxu9b9Qtko3
 4+E4Wdxf5Bfbit+D9GpuJMRJJBs184w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-_o6EhrbVNXKar2yBSP9PnA-1; Thu, 09 Dec 2021 09:13:44 -0500
X-MC-Unique: _o6EhrbVNXKar2yBSP9PnA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so1433602wro.18
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 06:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T1S6rtyY8u3x7vV4s9QhxQiYkWds801oT9UBXiBzvq8=;
 b=s9NnxXSwsl0SE6DafsK9HV6MddNdkxCcK3U0wmJOtn5+L2mmvWjPyqwdKhBa9kJlEG
 hDqpjgiV1BjPWd1L53TKOWVRNFlIqn6ac2meZ1BbAFdRzVnkpjt5OJSmY55AB7mSh06E
 1hcRQDHHdtD2UX4bb7e8UIAIoGOB0rvZlvesHF3D4tJi5eg+MUgIPCDAq3e9r2+oMrha
 H7yfryby1Ev1p+YcQusftar9HFjPgiYBumb5fvTPIaLWGsk9m+HjECD/Ji+AciEANfn7
 oX9oLXPnnY5vU9RXhbcBFOVYY6h4zLetOYYQkSqWg7dQoXheWfBfyIfDo8eahx2d4bF7
 1+Hw==
X-Gm-Message-State: AOAM531THF+Sa7CTpvm50AzlstFJp/jp4Lr+Ec8ozKz09qCZyevM6UCN
 0E9noDl8UARhHyfnXRQ+k1LgnctrMCDzpODwf/mtVxCNpR/KJaFRNPvkjsPRXXJ9GrYQtQtOfkl
 2yYOGYKNPSAKTp4i5DcwDehK/6kMacAnV
X-Received: by 2002:a5d:5147:: with SMTP id u7mr6759850wrt.233.1639059222919; 
 Thu, 09 Dec 2021 06:13:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs0t32qLpqOAfF7JuE4spcBzfo3UmhJ71TMoONwX1ETI4ah//+LMIcCd8EGICtAe5qnDS5Gw==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr6759814wrt.233.1639059222708; 
 Thu, 09 Dec 2021 06:13:42 -0800 (PST)
Received: from localhost (net-37-182-17-175.cust.vodafonedsl.it.
 [37.182.17.175])
 by smtp.gmail.com with ESMTPSA id s8sm6179183wra.9.2021.12.09.06.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:13:42 -0800 (PST)
Date: Thu, 9 Dec 2021 15:13:40 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
 Felix Fietkau <nbd@nbd.name>, Deren Wu <Deren.Wu@mediatek.com>,
 Mark-YW Chen <Mark-YW.Chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>,
 Eric Liang <Eric.Liang@mediatek.com>, jemele@google.com,
 linux-firmware <linux-firmware@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, jf@simonwunderlich.de
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Message-ID: <YbIPFIaya1vKF6bM@lore-desk>
References: <67f30cd5235e2065e6c20cfb4662e4ac72ef6395.1639037336.git.deren.wu@mediatek.com>
 <2314855.OJx0zA1Pyt@ripper> <3841963.FhVex8QpIh@ripper>
MIME-Version: 1.0
In-Reply-To: <3841963.FhVex8QpIh@ripper>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_061350_294330_351208B1 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: multipart/mixed; boundary="===============6528085565947720321=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6528085565947720321==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjkU6hzf6ZLTHJOB"
Content-Disposition: inline

--zjkU6hzf6ZLTHJOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thursday, 9 December 2021 10:21:02 CET Sven Eckelmann wrote:
> > Tested-by: Sven Eckelmann <sven@narfation.org>
>=20
> I would like to retract this again because it seems like the firmware is =
now=20
> hanging all the time when the default runtime-pm/deep-sleep settings are =
used.
>=20
>     [  521.553436] mt7921e 0000:05:00.0: Message 40000002 (seq 12) timeou=
t
>     [  521.559884] mt7921e 0000:05:00.0: chip reset
>     [  521.661983] mt7921e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build=
 Time: 20211129210838a
>     [  521.661983]=20
>     [  521.684088] mt7921e 0000:05:00.0: WM Firmware Version: ____010000,=
 Build Time: 20211129210917
>     [  521.723561] mt7921e 0000:05:00.0: Firmware init done
>=20
> This doesn't seem to happen that often when I perform a
>=20
>    echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/runtime-pm
>    echo 0 > /sys/kernel/debug/ieee80211/phy0/mt76/deep-sleep
>=20
> before setting up the interfaces.
>=20
> But even then, on the first "ip link set up dev mon0" (not only for mon0 =
-=20
> also for wlan0/...) it will crash with:
>=20
>=20
>     [  806.731357] mt7921e 0000:05:00.0: Message 00000046 (seq 4) timeout
>     [  806.737730] mt7921e 0000:05:00.0: chip reset
> RTNETLINK answers: Connection timed out
>     [  806.867666] mt7921e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build=
 Time: 20211129210838a
>     [  806.867666]=20
>     [  806.888441] mt7921e 0000:05:00.0: WM Firmware Version: ____010000,=
 Build Time: 20211129210917
>     [  806.928204] mt7921e 0000:05:00.0: Firmware init done
>=20
> But when I then set up the device again then it seems to work. This is th=
e=20
> case for monitor and managed interfaces.
>=20
> I've used commit 678071ef7029 ("mt76: mt7615: clear mcu error interrupt s=
tatus=20
> on mt7663") in mt76.git for this.=20

does it occur with an older fw?

Regards,
Lorenzo

>=20
> Kind regards,
> =09Sven



--zjkU6hzf6ZLTHJOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYbIPFAAKCRA6cBh0uS2t
rKx+AP9d7SOcOblztzxdRBXT0mu90H/4HHELZ2txXKAjgURt8AEAivSXJ/gYEtQg
Cx4dhBOmhYnSfz4fMWpM3Q9cyw1WiwQ=
=2F7f
-----END PGP SIGNATURE-----

--zjkU6hzf6ZLTHJOB--



--===============6528085565947720321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6528085565947720321==--


