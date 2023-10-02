Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37164E776D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsrzhgDbcJtwYX/2EGwafIR0w5juOFXJIQAbPgvHjTw=; b=mcwGyyvZTmdZztalirarAzp+rK
	eWZODYZb6Z/HbLEdtrCZwZtN0qM14jysD6URhWIE5iaoOOJeAkHuxlV2hQud2I+OUzzguKIfNs5mR
	IF3MZhkr6mYXh9R+L0Za7ZwMQ9s6L4kO46VwH7knsF1QTqeCqD14WzGBh2Gi0woNv4Aj55PH7SwVO
	4rau22cJUcsgGVW/e0Sun2PJRuTF4oks82+/x4vhiG0/5MJ2ZIyKgHmy7uetWCMVJLbKfxxFjkhIZ
	Jojk3iVVOhQLCFJwlD7MU+5PnYBvcunkH5l5HBV9BqufVN5pQifgeWOm5MvnKaayKTo+Ul7Cv0y0A
	1eIt91dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnSd8-00DXxP-2Y;
	Mon, 02 Oct 2023 23:47:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnSd4-00DXwJ-0K;
	Mon, 02 Oct 2023 23:47:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-27752a1e184so234726a91.3;
        Mon, 02 Oct 2023 16:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696290424; x=1696895224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MsrzhgDbcJtwYX/2EGwafIR0w5juOFXJIQAbPgvHjTw=;
        b=FhCjjUFEDRxyrUT43kR0HOEJFQFTeHrgElWA97jSzni1xXPaxm5V/dnhqHd8eS9GIe
         LGQnCan8zLLp3Wjc9iBOS07CaUXDMGOfXdGlyQ274xr6OUpkJ10CeMsVR3OXbB+syJYk
         ly5lYLrnsD/srps4538r7vtLVQII6fsO85c7NzyQtNrtUibrPoXJB68LdmWsur0YIL+r
         1bw1a4axr5jk0VP+zP5jaXtMMXQZuNFBEKvT97ILg7asmjuFVx6X0AjtHD85+AaFPz8K
         eFMjZMajCJrvDSiL2RDVhpymBa0Cn/laJRn2uW3IaP20ed/CDaBeQhPL+VrG8sgowl7K
         DTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696290424; x=1696895224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsrzhgDbcJtwYX/2EGwafIR0w5juOFXJIQAbPgvHjTw=;
        b=JKSTTHtYuVYx5E72jOh5/p6hP5IXpkXBOKV9vZkaLE2a+sNr94dT1+AyRvsd9VOZ1j
         29sk1tMhhPdPTlEKJRF8ThEtpO6fISMvv/KX5e/qVNgW64hVc2fG/nuSFj9dycM0za7K
         MTyXHB63AGBfd53oPzyymYDpvZ0b+0ilHBE7kRObpFUpqWzQiTenGisOvD1pg4hnPd1L
         vVs7iKwz8pNsyxhpLpPrlH9YHWAFNqmEsxyvFxQlz5hJQ0cbPUdwqELBjkZph7ZnFvW9
         9DSFMezYQO4NJ1icyjU+L1iaqjZ7TGXmkmdsM6R2L90FwL8sEYKDv7xmhUpm29NXx3Kc
         IkVw==
X-Gm-Message-State: AOJu0Yx8oBmCZd/ZFDt1Y8tr8KQXhqBA+06LO6Fwa0zLfSMuzg0L6hAb
	dGaO52EL6NYgu6TpRtTwBPs=
X-Google-Smtp-Source: AGHT+IEBCTbSZM/8E/uKaeav4fYt2K5qKUh3CuUFJFJQXANJT3CbxyYRJqvtwNk3zj/OuJrUW2TzCQ==
X-Received: by 2002:a17:90b:1194:b0:269:32d2:5ac4 with SMTP id gk20-20020a17090b119400b0026932d25ac4mr13277538pjb.25.1696290424438;
        Mon, 02 Oct 2023 16:47:04 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id ft13-20020a17090b0f8d00b00276b60aa43bsm6884452pjb.17.2023.10.02.16.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 16:47:03 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 8117881A3121; Tue,  3 Oct 2023 06:46:58 +0700 (WIB)
Date: Tue, 3 Oct 2023 06:46:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Erik =?utf-8?B?RG9iw6Fr?= <erik.dobak@gmail.com>,
	Linux Stable <stable@vger.kernel.org>,
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Mediatek <linux-mediatek@lists.infradead.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
Message-ID: <ZRtWcgiH5JhD5NU2@debian.me>
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fW063juLwqeEFwfL"
Content-Disposition: inline
In-Reply-To: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_164710_165904_95372013 
X-CRM114-Status: GOOD (  18.86  )
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


--fW063juLwqeEFwfL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 07:47:54AM +0200, Erik Dob=C3=A1k wrote:
> Hello!
>=20
> I bought a new laptop fujitsu life book and everything is going fine
> on artix just the bt makes trouble:
>=20
> /var/log/error.log
> Sep 30 18:43:48 nexus bluetoothd[2266]:
> src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv
> Monitors: Failed (0x03)
> Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to clear UUIDs: Failed (0x=
03)
> Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x03)
> Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x03)
>=20
> i searched a bit the webs and found a new commit at kernel org that
> does do the trouble:
> https://bugs.archlinux.org/task/78980
>=20
> follow the linkeys inside the commits there or read this one:
>=20
> ---------------before------------------------------------
> /* interface numbers are hardcoded in the spec */
>         if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) {
>                 if (!(id->driver_info & BTUSB_IFNUM_2))
>                         return -ENODEV;
>                 if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2)
>                         return -ENODEV;
>         }
> -----------after----------------------------------------------------
> if ((id->driver_info & BTUSB_IFNUM_2) &&
>     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) &&
>     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2))
> return -ENODEV;
> --------------------------------------------------------
>=20
> the dude just hooked up 3 conditions in a row with && where before it
> was 2 conditions in 1 condition. + the comment was removed.
>=20
>=20

Try latest mainline first (currently v6.6-rc4). Because you have to
compile your own kernel, please refer to
Documentation/admin-guide/quickly-build-trimmed-linux.rst if you don't know=
 how to do the compilation.

Also, don't top-post when replying; reply inline with appropriate context
instead.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--fW063juLwqeEFwfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRtWagAKCRD2uYlJVVFO
o0d+AP4oNwd9Cjay1Ao/Mm5lLmmn0rZYovuJO9UIOSdBN/w/sAEAuTvELS2Y3NZ+
a45nNYc16F/Qn5lYdAjNfJcrgNQwyQE=
=X3ML
-----END PGP SIGNATURE-----

--fW063juLwqeEFwfL--

