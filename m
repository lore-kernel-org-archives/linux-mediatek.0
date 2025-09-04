Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D2DCA1013
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xers2I679q5hQvL6Unsoq+KVQ+odJHrzRvjDGePd86U=; b=lC48iD2evUX5VvGM5/gpRvKQch
	7jTGKOtyfc8rr6xSR/ewUR2ff6884dCm9zlissOIviW9rviJo9r0pqZI5VI0kIlBIMAGDoOGEreXD
	fSzsDO7fHqm0WGyRc0FOe6X+aZJ+kPPY6Y5ZYALsutTQarkvkP4rBHtHbvaAAYRCjTbUfmPjCnSGN
	XRzOXCeLeu+OqJmQRlNO2CjBgHMq+i1Ut3EMqNear3Dul3MReiB6GZYhuvEXX0LDbL7opQw6nd0vt
	BCUm6QnSV9Z5cnN9byQxD6DDWlzvrp7/xpgc27gNpiANatG01KiQcN5vYu3HHJEtmpiJzUmGHRHeK
	pxwrzNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCoK-0000000CvEW-4A2r;
	Thu, 04 Sep 2025 16:27:45 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA6t-0000000BvFQ-1fWA
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 13:34:44 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4b109c4af9eso9885811cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756992882; x=1757597682; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xers2I679q5hQvL6Unsoq+KVQ+odJHrzRvjDGePd86U=;
        b=sSttXuhct+oGeDgXgBiuYtpxgDkhLD5iXIvClZJM8UTshz7GBXkEMhZxAVEEhRNsoI
         giglUF22Q3PwVwT05KrNhMp4qXXFLAvwErHKhDNqnmsuxdZdOkT8IxvasR91srQtx/M2
         3gyDG1Me8aKNb3pogaEPB4AaFTTEtgjGE+ub/g7lxR2Fa9Ohnurh8UdxQtKvopYTUXsa
         S7aRTJQWvYALCxRI4Vrh+CpPL+1Hbu5sOKEA8qoHrvhC2iSu2mQdksIHnqetqcBXvkpA
         7j27P7bINhGbGUON0Bnw0hyTZ8JC1eWa4vHbwHGVor3qTpgB9l9H7q80q2ECSnWWhw7c
         rf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992882; x=1757597682;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xers2I679q5hQvL6Unsoq+KVQ+odJHrzRvjDGePd86U=;
        b=FZzPdY3o4W5oPyStHJqKevsgETw8fRWyXVLXdwoQO5cTZPxMKwjuILw9Y5ySDIs67W
         lnKG4rehOrXSuJ+4dfOFuTN2/oUakqNTAbc8XEJllG1DliwnajghxLmr7ReIJt1F76Sj
         PlbzDR/eznJQzRa4/5NVTpImoApkBNmV8co2MZ5ElVuYQBk/57AzVzeeYnhjIK4VEGll
         a0J9E+c0S7/oVR+FdPzNSa3CYKtn2BKdIASrbbrVdIrKqz0wrsU+XyFAmQDiikxZ2PvM
         AoBNd4finGGoAtPi+Evw6lEHFdxi70AIuppGcEsY+OEO+XzRYSNTyHhffNI0rNdgZ6QA
         NjMg==
X-Forwarded-Encrypted: i=1; AJvYcCXKgHQ5mGe5X1R+K0x//nYh11EsI2Y+dzcCaMUOl40eIfp82FVwFGauIzsHBBrtmWMXEAVDmmo6Cp+t6IXLig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmPrUPR77Hn3+eBNrY8l9RWVTiNSNWALWhkz4gMegN4tOEsLea
	qQrUb01S4y2pf8bOxfojeA3piSAcWA+pXZ6wCfsK64l9vtGxUhSje5QY71mPN2lw5IY=
X-Gm-Gg: ASbGncs+lsnAi2PHQRE5xV9Mz4vWTg6cjdDC1HC5k2RlcJq3MbSCRLq/RU8W37oR6GG
	0q64c+2XYZbuGBkCpKOlUU1IiYEjrZTShR6TQ/gU66xI7d+mebYrLPl5ATfickIoYmyzp27omHR
	0gHI2vMYCs7UEbY1gecZvfPMZbv3yStOKqyQW8XSvqixHTK1IJIOgCU8UI48Ng1Ykv1JdDMvqoa
	dCY5KfBNZ7iZoktRrJ8AT9bYlg422bB793DunT/Y4HMyjIphKgf+NFjp/jHUZSGu1aahxGv2ciA
	wzQXxpVWwt1Z0DdRVB/KHgM2527bQpLO2/p/2WFhUNAb9mah+GVO48PkxTCQTKi8nsp5F4uq3In
	fIbytlZ8lEXOqf6WFg+tjZ8SCR+E=
X-Google-Smtp-Source: AGHT+IFJXgXUcVFsu1NH4mZ7DQEdVfqgg4l25+Ql95DStib2FxOL1bHyzuLPNi7Gn6fpgR498c5n7w==
X-Received: by 2002:a05:622a:2a18:b0:4b3:8d4d:bfa5 with SMTP id d75a77b69052e-4b38d4de64fmr129330391cf.11.1756992881992;
        Thu, 04 Sep 2025 06:34:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f660361sm28267001cf.17.2025.09.04.06.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:34:41 -0700 (PDT)
Message-ID: <a8775c16be8a904b94b62df5cf530321f7424c95.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context
 list protection lock
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 04 Sep 2025 09:34:40 -0400
In-Reply-To: <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
References: <20250820075405.1041838-1-wenst@chromium.org>
	 <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
	 <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
	 <CAAFQd5B=0Zyyi2yJ5xD41LDBVYvAWoLu-oM_2XQORWgTDWo3uA@mail.gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YoA0CYrdj42Ik9SspLDx"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_063443_438566_1B0089B2 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--=-YoA0CYrdj42Ik9SspLDx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 04 septembre 2025 =C3=A0 15:39 +0900, Tomasz Figa a =C3=A9crit=C2=
=A0:
> On Thu, Sep 4, 2025 at 3:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >=20
> > Ping?
> >=20
> > On Wed, Aug 20, 2025 at 6:37=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> > >=20
> > > On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >=20
> > > > Previously a mutex was added to protect the encoder and decoder con=
text
> > > > lists from unexpected changes originating from the SCP IP block, ca=
using
> > > > the context pointer to go invalid, resulting in a NULL pointer
> > > > dereference in the IPI handler.
> > > >=20
> > > > Turns out on the MT8173, the VPU IPI handler is called from hard IR=
Q
> > > > context. This causes a big warning from the scheduler. This was fir=
st
> > > > reported downstream on the ChromeOS kernels, but is also reproducib=
le
> > > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even th=
ough
> > > > the actual capture format is not supported, the affected code paths
> > > > are triggered.
> > > >=20
> >=20
> > We really should get this in as this triggers a very large and scary
> > warning every time the encoder or decoder is used.
>=20
> Just to clarify, it does actually cause BUG_ON() panics, so if the
> original change is already present in a stable kernel, this fix should
> be merged to stable as well.

Pulled by Linus in 6.9 it seems, I will CC stable.

Nicolas

commit 9875c0beb8adaab602572b983fb59dbd761d5882
Merge: fe5b5ef836c8 d353c3c34af0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Apr 10 13:38:35 2024 -0700

    Merge tag 'media/v6.9-2' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/mchehab/linux-media
   =20
    Pull media fixes from Mauro Carvalho Chehab:
   =20
     - some fixes for mediatec vcodec encoder/decoder oopses
   =20
    * tag 'media/v6.9-2' of git://git.kernel.org/pub/scm/linux/kernel/git/m=
chehab/linux-media:
      media: mediatek: vcodec: support 36 bits physical address
      media: mediatek: vcodec: adding lock to protect encoder context list
      media: mediatek: vcodec: adding lock to protect decoder context list
      media: mediatek: vcodec: Fix oops when HEVC init fails
      media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-f=
rames



>=20
> Best,
> Tomasz

--=-YoA0CYrdj42Ik9SspLDx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLmVcAAKCRDZQZRRKWBy
9PouAP0ekHH3471rlAmon6D95TEYDnWiFxjRkRkmsQMiAwnxfQEAu4hBVxecyTXK
rWWNSWSrG6H6l4tO4LtVI/aSxxWfNQQ=
=fvsp
-----END PGP SIGNATURE-----

--=-YoA0CYrdj42Ik9SspLDx--

