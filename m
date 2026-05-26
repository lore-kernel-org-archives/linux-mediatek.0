Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE572CD5BC8
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXJWIuO8bbHBBvc8hAmAJEeX88yUO/65JWt4BhqEy1c=; b=b+6wz8flH+1wTXFKoKx2jaLKOO
	2r8KKR0l+qMC1yBid6M6+euddRFRqs1iIDTakZtR30uhfT+bcDxby3rPRYVMX3IPMKOqU0L3jmSUJ
	eBuPbigdnjuEKDmeHcCyH1er5EE9CU7FlzqnMDPB/IkJu+ZpbT4IH8BX56fk9oUUe/mdh4sVrfz9A
	3Bmu0Ao1cpE0t8ALUbZ4vDRRlTQy5RLUd0wNNm7ZonZdo/z6x/xUEjXb8ad4lbDjj6RVFTXOAC7Tw
	hGemF5Ax49H2BU1vTyQSzdJOPD2/Xj8RPeDQDIRrl2CyoWoOL5X796e93OqHYka9K5JuigbSSFVln
	QlDvDvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoEw-00000001Xn5-37aZ;
	Tue, 26 May 2026 09:38:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoEt-00000001XmR-1h3L
	for linux-mediatek@lists.infradead.org;
	Tue, 26 May 2026 09:38:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43d7645adbdso6492080f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779788297; x=1780393097; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXJWIuO8bbHBBvc8hAmAJEeX88yUO/65JWt4BhqEy1c=;
        b=nnII3SprczslNH5R+rPvJ6oQOpp15MyAPR5sEK510TiBDCRrhMZwbpZzqWaKsIsyez
         duO0kKKNRDQyOF9RPULIQZWVDQzi2YCP4wVjKs/9EhlTTHSeg8urxS7QMa3cm4KXJvmF
         Wbrdc+Sz2oU6LTI8TeNQrKTQ0TvRBlEqcHzSns4spJZRw5rIAInCZaHXSOEfBgj4hG6E
         J4UiKMl1VBOdxNw/6WM5I0j9nag+ICGhrx6iYWFlzw5BNG5RwpHH7ufYtnRnqD7tZrYg
         Ge3rWQI4Xw6batAnbMncfxrK2oYcjLIozNAccsjXZb59O7pq9wiM9IU6v0icrwTPKdWL
         8YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788297; x=1780393097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXJWIuO8bbHBBvc8hAmAJEeX88yUO/65JWt4BhqEy1c=;
        b=gxEd0AKeXmqA6AuYjdptrtPAuL1an8xNQVtfxM3XiZYz70H64e+d3zTpWmOjgSyENO
         FOid8qGug7RCsaxAOkcIjfAiPwcXMjsfecVxRrlnGdQlDnHJaHXAvXxHuQNwA5i6AR5T
         be4mHlnknmTpWRcwAc20msmfPZFjE0W4KwB0SHmToQ3NsWXhZn3yB6E6Bp0i+7jmJKb/
         wdSpTzNuatYx4pAeZkvW29G0A1uoYF2ctgkJOWm3fKJbUJuS2ilQ1vntTtekCPd7otq9
         di3p3fstE3t207KYRr97V+QWDVE1Q1FgsocX/BiKeCBhOLX9rsfHuP9HvLtr/4kXQk1B
         ltGA==
X-Forwarded-Encrypted: i=1; AFNElJ8BipuGyZPlU1X/W6gBO6jMawX8w2Vgn0nqv74IdZVKav6qFhokaqKsmUuji+HeO5QJfw97wyMWDp1B5IjvGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnelWPG87qNYWz0h+n8U4kTXISAV6FpnT8L3wysrm2O65E2j9w
	BgcQO1iCwYmiHgfmdONiSVeguCifohCsKhYm190cZqvBFyiEflE/11l+O39K78MaNRA=
X-Gm-Gg: Acq92OF1ZFIoLW/uxX0okg19wumEJ/BRj3tC8X1BgVfhlzYSeCmUNGi3hilJgs9JeOT
	a5qT71TkQL0DfpKX4KYUOY1WeAHD6Qtj8g+q0j8SpIi17QQ4TtU4QkjNzyVU4hVK47eLN8SZ+IN
	ioL9mwiIMcMoINQQ6iH1PP3+us0V9jMK2tvqhsRnCHsFq+K6MY9s6Lq36ZCyHzzbKDLZ38fjaUX
	/6176CortsXYokwi0rvEjyrSdDEEWFnpciR5RF1E3OKsqWy1zQ14PbH+5AvmDCU8SJuz/LpE7ov
	vO9SCXapfTxyMoj7S7xJSboSG/Hf5sbWDbceBH78tYSzM/UUOmnH0SwlbYsap/jM7ijZDNtd4WC
	u8IRXswx87WfEHT5Zeh4s7JlkYS16J3zKDbGcfD6YGAvTRqVRXHH+uMe4fW0cfxgMHirdok2D14
	4XH3T280T+BgDJ9AjE8FX0HJ4x+VlVkWu7vOrI1PrFePI/TvBCV3Dr10sQ7zEI6Ihk+bG08eVOe
	7iQ7m8jbR6tuQ==
X-Received: by 2002:a05:6000:1447:b0:452:d03a:7abe with SMTP id ffacd0b85a97d-45eb38b91c3mr32067787f8f.17.1779788297057;
        Tue, 26 May 2026 02:38:17 -0700 (PDT)
Received: from localhost (p200300f65f47db047ec792ae18ec05cd.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ec7:92ae:18ec:5cd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6d49132sm34150219f8f.24.2026.05.26.02.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:38:16 -0700 (PDT)
Date: Tue, 26 May 2026 11:38:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux-mmc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-bluetooth@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <ahVpRY6lxiWbJ7Qc@monoceros>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtihelpcu7j6kvgw"
Content-Disposition: inline
In-Reply-To: <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_023819_461437_12CE4E9B 
X-CRM114-Status: GOOD (  24.75  )
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


--vtihelpcu7j6kvgw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
MIME-Version: 1.0

On Mon, Apr 20, 2026 at 04:46:56PM -0400, Luiz Augusto von Dentz wrote:
> Hi Uwe,
>=20
> On Mon, Apr 20, 2026 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hello,
> >
> > On Fri, Apr 17, 2026 at 03:10:47PM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > On all current Linux architectures sizeof(long) =3D=3D sizeof(void *)=
 and
> > > this is used a lot through the kernel. For example it enables the usu=
al
> > > practice to store pointers in sdio_driver_id's .driver_data member.
> > >
> > > This works fine, but involves casting and thus isn't type-safe.
> > > Additionally with the CHERI architecture extension there are machines
> > > with sizeof(void *) > sizeof(long) for with the traditional approach =
of
> > > storing a pointer in .driver_data doesn't work.
> > >
> > > By replacing the plain unsigned long .driver_data by an anonymous uni=
on,
> > > most of the casting can be dropped and it yields a working solution f=
or
> > > CHERI.
> > >
> > > All users of struct sdio_driver_id are initialized in a way that is
> > > compatible with the new definition, so no adaptions are needed there.
> >
> > sashiko.dev found s/sdio_driver_id/sdio_device_id/ twice in the commit
> > log and once in the short log. If you consider applying this patch
> > please adapt the commit message accordingly.
>=20
> No problem I can fix them up once applying.

Now that Ulf gave his blessing, would you please merge the first patch
and the bluetooth ones (#2 and #3)? I will follow up then once your tree
hits Linus's tree with the remaining patches for wifi.

Please don't forget about s/sdio_driver_id/sdio_device_id/.

Thanks
Uwe

--vtihelpcu7j6kvgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoVagQACgkQj4D7WH0S
/k5P8Af7B8UAQJSjX3WHqmRdJihAfbJzuB0qsIl9eOVYHCAaEiAnVpqnjNkntHIU
lX0CcswR4fXl9pEV+1mobDSLHsbDhg9BtXTuAm4pavvYRoS5isVyCkasNUeNDGt9
B68NNR4oKyApL/DFvXCG4CPWrhA8TL+m9HE7DCkm2IYcH2TB2WdUCQnnQFV8E94x
1eyEfCrTCqn5UlW+2urdJLmngSk7o3yv1wJ36pgHxMNQMXU8mPWN4nOCqEZAvtmP
CrtRviKQ1QpRXNBA7blduSvvqqfr7uQEKta7E2argdEhkor6XY/fTTlu687QRi6n
Po62G/0XCxIUYpanmYULzD9YbpSlyA==
=Zdz8
-----END PGP SIGNATURE-----

--vtihelpcu7j6kvgw--

