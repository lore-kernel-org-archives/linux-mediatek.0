Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65015C00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/Y/NbqZxDj+kqOqdtLhlNs19TdoZG5mB8hj9HN7FnI=; b=NFarr2oCkfPdh3WKITisnTbZjW
	c+/+YxRA1LyZPeBPFWrSNs7kSAFcdWmGZOOF42fzzdVZJM98U2yrgwVwTgn4IqxQ7EsrZ3CkSlM1K
	CydyPP8lAexfGDvUvPE6gjJdmE52FtgVi6OdjbTNy2J6RThGSG+c5qmKdSzwjBnfZHNz5SAWRO1Jw
	l+Lplair3DmNgJJNw47+//8zFYJREfjOvUJHjWSNpqd5binu4lr/HcPpAQqzQzvVXZ/SnW4j1eh9D
	LV0dhZez6gm/JvGvREhlslcWqKjB9ESLekgamxKsXKQC2OUfLdD0Nn6O6wxAxSVqdSUaFDoFPCEgL
	9PV/Q2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJY3-00000007rWN-2ks9;
	Mon, 15 Apr 2024 10:26:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJY0-00000007rVk-3CGs
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 10:26:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4187d5f0805so682695e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713176805; x=1713781605; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Y/NbqZxDj+kqOqdtLhlNs19TdoZG5mB8hj9HN7FnI=;
        b=B4T5yw85Sc63tmNl2rn7ukto5dXlmokwgng3XSIXkitNDrasCPlUd4dmMJrR2kSnnH
         3Smpki2tJKWjxxKsE+L5h0qzFDsCMQckTpzaYHtlL6KTlqJrEbN8uOKhCFAoCXdK/Ile
         7GeZ4KfBFXejpYyL2NsFencYRmeLJvFzCWwgGdQG5YVcBdsvrF9dqyAsQzDBR0y6RHFK
         4f6Sw5/xs7cRL2mSW8RojLLD+v5ZY1e8hHdPfVVA5n9ojWsWPCppjWww4ce2TopAxGse
         ScFnVWjtpBDFStuKtmAm9ua9iUzB6UYbxyzj7q6xXw7JpjVMSgmTARrgr226oXgncPLZ
         qV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713176805; x=1713781605;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/Y/NbqZxDj+kqOqdtLhlNs19TdoZG5mB8hj9HN7FnI=;
        b=DHjsU3d3wFVtC1eAlyJZaQeM1w0cRFhupXRNHX25JGprPaXd8nYf9uWB/bJtUoRWOP
         PgPPpEsxn4cui4oymox7LlPgDWKJ4tp8Dr+HQ+HNHnn5a/idpRvhzUwtsPv7OZyj5y4/
         8tFacNYR8iqYYeofw+iEpveVpb6L8uKUuP007JCsPpHCqNlpA7j5rbPYOUD/CDNaMlfF
         a4A6guxD2EEVB4ObHx/wVCJhv7FpyVXmfM/1sTb8sdNBMbEk9R+Y2ls1Vzmgef9ROL6r
         sbs3aKuqBrRoKknWkakkdBnOI3dZo4gTMXVEGF+E7IunSk8MTc0FWqGfnrgkk3j1RSuh
         wCkg==
X-Gm-Message-State: AOJu0YxZPjuJzvAA+6+c9VYoAzC+V//K6NL+MhpMbdkc9MpCqXMifLt9
	nUD/x/jK8dGpdHEwo5SRgncxGI21CJLU1rHbs2wNFXU5K3ZZYpaK
X-Google-Smtp-Source: AGHT+IGvKvf5HKbu50Yr8KwlSHELhAlYVvkeipf2VYz/Kv5xegJ8UnkNOufy+E3a6hs3rUhlP5GLsw==
X-Received: by 2002:a05:6000:12c6:b0:346:c7ed:22de with SMTP id l6-20020a05600012c600b00346c7ed22demr5609992wrx.14.1713176805080;
        Mon, 15 Apr 2024 03:26:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:0:2100:9290:7e66:a4db:ab5a])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4808000000b0034599eca6c9sm11619063wrq.41.2024.04.15.03.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 03:26:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Apr 2024 12:26:44 +0200
Message-Id: <D0KMHQSFOY0B.3P66MD08H96FZ@gmail.com>
To: =?utf-8?b?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?=
 <Mingyen.Hsieh@mediatek.com>, "nbd@nbd.name" <nbd@nbd.name>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?utf-8?b?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
 =?utf-8?b?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>,
 =?utf-8?b?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
 =?utf-8?b?UXVhbiBaaG91ICjlkajlhagp?= <Quan.Zhou@mediatek.com>, "Sean Wang"
 <Sean.Wang@mediatek.com>, =?utf-8?b?S00gTGluICjmnpfmmIbmsJEp?=
 <km.lin@mediatek.com>, =?utf-8?b?U291bCBIdWFuZyAo6buD6Iez5pi2KQ==?=
 <Soul.Huang@mediatek.com>, =?utf-8?b?UG9zaCBTdW4gKOWtq+eRnuW7tyk=?=
 <posh.sun@mediatek.com>, =?utf-8?b?RXJpYy1TWSBDaGFuZyAo5by15pu45rqQKQ==?=
 <Eric-SY.Chang@mediatek.com>, =?utf-8?b?Q0ggWWVoICjokYnlv5fosaop?=
 <ch.yeh@mediatek.com>, =?utf-8?b?Um9iaW4gQ2hpdSAo6YKx5ZyL5r+xKQ==?=
 <robin.chiu@mediatek.com>, "Ryder Lee" <Ryder.Lee@mediatek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: mt76: mt7921: avoid undesired changes of the
 preset regulatory domain
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240412085357.13756-1-mingyen.hsieh@mediatek.com>
 <D0I1D2J8EB1L.2DPV9W79YKN2C@gmail.com>
 <3e2eb7ab155cbc4819096e32b914d220166a9adb.camel@mediatek.com>
In-Reply-To: <3e2eb7ab155cbc4819096e32b914d220166a9adb.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_032648_833579_C0867F42 
X-CRM114-Status: GOOD (  28.04  )
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

On Mon Apr 15, 2024 at 7:53 AM CEST, Mingyen Hsieh (=E8=AC=9D=E6=98=8E=E8=
=AB=BA) wrote:
> On Fri, 2024-04-12 at 11:27 +0200, Nicolas Escande wrote:
> >  	=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Fri Apr 12, 2024 at 10:53 AM CEST, Mingyen Hsieh wrote:
> > > From: Leon Yen <leon.yen@mediatek.com>
> > >
> > > Some countries have strict RF restrictions where changing the
> > regulatory
> > > domain dynamically based on the connected AP is not acceptable.
> > > This patch disables Beacon country IE hinting when a valid country
> > code
> > > is set from usersland (e.g., by system using iw or CRDA).
> >=20
> > I always had trouble fully understanding the regulation but isn't the
> > country
> > code IE sole purpose to adapt the regulatory of the client ?=20
> >=20
> Hi Nicolas,
>
> Yes, it is. However, if the users have set the specific country code
> based on their region to the driver, they do not expect the country
> setting to be changed by the country code IE as the AP cannot be
> entirely trusted.

Hi,

In AP mode, I understand that the hardware/firmware (and so user mode to so=
me
extend) is the source of truth about which country/market the product has p=
assed
certification and what not. Thus the country code of an AP should be truste=
d.
If you put an AP from another market at some place, you are responsible for=
 that

But in STA mode the end user should not need to know which regulation follo=
w,
right ? The AP's Country code IE is where the sta gets the final info. So n=
o,
the AP should be trusted, and the user should not (and not the other way ar=
ound)

Of course, I am no an expert on this. I just want to check if there was som=
e
though behind this change. You guys make Wifi chips, you know what you are =
doing

Thanks
>
> Best Regards,
> Yen.
>
> > >
> > > Signed-off-by: Leon Yen <leon.yen@mediatek.com>
> > > Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > index ef0c721d26e3..3c9a5fcd6924 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > @@ -135,6 +135,13 @@ mt7921_regd_notifier(struct wiphy *wiphy,
> > >  dev->mt76.region =3D request->dfs_region;
> > >  dev->country_ie_env =3D request->country_ie_env;
> > > =20
> > > +if (request->initiator =3D=3D NL80211_REGDOM_SET_BY_USER) {
> > > +if (dev->mt76.alpha2[0] =3D=3D '0' && dev->mt76.alpha2[1] =3D=3D '0'=
)
> > > +wiphy->regulatory_flags &=3D ~REGULATORY_COUNTRY_IE_IGNORE;
> > > +else
> > > +wiphy->regulatory_flags |=3D REGULATORY_COUNTRY_IE_IGNORE;
> > > +}
> > > +
> > >  if (pm->suspended)
> > >  return;
> > > =20
> >=20


