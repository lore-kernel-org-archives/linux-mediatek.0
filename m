Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5E2C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnmrUE6uA1UjU0DGZJd+ywoyYgk2RFZ2Qv8HjSJNWug=; b=c/mwwYpBd7h5dzCh6cRtofFrCz
	SeCaB6jYF3GyyD7q6euTuH3nNsm2XJf8J4sF6kPG76AczZipu9xPFS2bEyrira9/BY3YG+KqHbMn5
	7wTT49WjH/3mmpCxYhk+tT/mdnOEGOhAhAQBGnANlwpm/cijdoNTrZIZde3XE3l5baSdf71m7S3yl
	a0dSTBt6YysGHX7FGDYtoFaSHSfyckkLo34h8j0d6ASoDNHe5Jn8WiRCIXBujo2k8HqoBC5HI8e0K
	I17gjJuSO1QE+urGzyZwF5/+fQML56dLwNjpGLvcYPr4PxhsF70q3KlL+FK/Y9fD/JMOsgTrj2ebG
	hG8Syh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQ2P-00F0e4-2y;
	Wed, 13 Dec 2023 14:16:37 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQ2M-00F0bc-0p;
	Wed, 13 Dec 2023 14:16:36 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ca03103155so88322401fa.0;
        Wed, 13 Dec 2023 06:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702476987; x=1703081787; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnmrUE6uA1UjU0DGZJd+ywoyYgk2RFZ2Qv8HjSJNWug=;
        b=TtG2K50szkMQPzDHazvxVyeIMzcNA6pkz5skgFTKqsc+p0T2CLuXVEwdVYUKK6JW03
         ZltN+3nlJ6He88nxPw/xHZnBa0VzL+HXNzHZhIAK1Av9nklyqS33mdgEJLwCA1iwwluM
         CwyP6gAeSpr58pAGd57k/eiTq4wV2ZpD6816/dIoAAyDoqsXzsmsNPPueIJuJ70lqEgO
         n8E3AGsEgWTBR3Em8f3Vp37qC9eQK1g47D4JFez1ZBz/vEUnvkNKpTnkETXa+52oh8lh
         SwAv9TdemvHeG0Tp2g1JkCyQbBSpgFpnS80gu8icDt5S8qobHQgmLC/mHY45unipzzgE
         WpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476987; x=1703081787;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnmrUE6uA1UjU0DGZJd+ywoyYgk2RFZ2Qv8HjSJNWug=;
        b=FzPnL3DwRE88VuoIZX8WRawlnOgGFIwu9GPKXM1xwv5Lie3bkvki4btUAtI8sSvIJX
         PO1cV/uH9A8vMdwZvdYyOpjZnyayFGq6H0u+YNz76QPDHwRZ6gun5Ole9Px9RRH3oEEu
         rRMbJADuhBkh/4cMjvzxGWF0g/pMLXgArGcal0Q7oWEh0qv3UVVD6S7HlTnDy7N74dV2
         SfRgldQTD3haAc45Es54+935nT71+pY5XyE7kFzlwdnnqJjdjDd+CT7MNkH2ktYBkmLv
         dOtRxefkfp9vMeojFnlsGB0L7OjBAR4FwM9gCzQIrlHHtIT1ZHsW6KnosTuY9sUayWth
         jQjg==
X-Gm-Message-State: AOJu0Yy92KtOpWhIRNHnXDfJNDonQG6NqcsoWjj4QQUka7KOPK33jhQL
	hmD3PbPTb92ylU5Jb4p4yCA=
X-Google-Smtp-Source: AGHT+IHMEFbwY2jxx7Eqytsu4ONvN/Lw6aO1DvwW9XsiwGhW/Welyye/FmxGvgN+8ji2wLeKZxibCA==
X-Received: by 2002:a2e:9b03:0:b0:2ca:34cd:77ea with SMTP id u3-20020a2e9b03000000b002ca34cd77eamr2472316lji.44.1702476987175;
        Wed, 13 Dec 2023 06:16:27 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id 20-20020a2eb954000000b002c9f62145f8sm1868126ljs.82.2023.12.13.06.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:16:26 -0800 (PST)
Date: Wed, 13 Dec 2023 16:16:14 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joakim Bech <joakim.bech@linaro.org>
Cc: Simon Ser <contact@emersion.fr>, Yong Wu <yong.wu@mediatek.com>, Rob
 Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeffrey Kardatzke
 <jkardatzke@google.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Vijayanand Jitta
 <quic_vjitta@quicinc.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <20231213161614.43e5bca8@eldfell>
In-Reply-To: <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
	<DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
	<20231213110517.6ce36aca@eldfell>
	<20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
	<20231213133825.0a329864@eldfell>
	<20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m_y9/L720k3.YUUEknjTd2h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_061634_296318_D19B5139 
X-CRM114-Status: GOOD (  64.09  )
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

--Sig_/m_y9/L720k3.YUUEknjTd2h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Dec 2023 14:22:29 +0100
Joakim Bech <joakim.bech@linaro.org> wrote:

> On Wed, Dec 13, 2023 at 01:38:25PM +0200, Pekka Paalanen wrote:
> > On Wed, 13 Dec 2023 11:15:49 +0100
> > Joakim Bech <joakim.bech@linaro.org> wrote:
> >  =20
> > > On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote: =20
> > > > On Tue, 12 Dec 2023 16:36:35 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > >    =20
> > > > > Is there a chance to pick a better name than "secure" here?
> > > > >=20
> > > > > "Secure" is super overloaded, it's not clear at all what it means=
 from
> > > > > just the name. Something like "restricted" would be an improvemen=
t.
> > > > >    =20
> > > >=20
> > > > My thoughts exactly. Every time I see "secure" used for something t=
hat
> > > > either gives you garbage, refuses to work, or crashes your whole ma=
chine
> > > > *intentionally* when you try to do normal usual things to it in
> > > > userspace (like use it for GL texturing, or try to use KMS writebac=
k), I
> > > > get an unscratchable itch.
> > > >=20
> > > > There is nothing "secure" from security perspective there for end u=
sers
> > > > and developers. It's just inaccessible buffers.
> > > >=20
> > > > I've been biting my lip until now, thinking it's too late.
> > > >    =20
> > > The characteristics we're looking for here is a buffer where the cont=
ent
> > > is inaccessible to the normal OS and user space, i.e., Non-secure EL0=
 to
> > > EL2. I.e, the content of the buffer is meant to be used and accessible
> > > primarily by the secure side and other devices that has been granted =
=20
> >=20
> > s/secure side/proprietary side/
> >  =20
> I'm using the nomenclature as written by Arm (other architectures have
> other names for their secure execution states).
>=20
> > I presume nothing of the other side can ever be in any way open?
> >  =20
> I'm sure there are lots of examples of things running on the secure side
> that are open. The OP-TEE project where I'm a maintainer has been fully
> open source since 2014, to give one example that I'm familiar with
> myself.

Oh, I didn't realise there were FOSS implementations of the other side
that tie in with this secure/restricted heap here. Sorry.

I think the patch series cover letter should point to those to give a
view of the other side to the reviewers, just like DRM requires
userspace to be open for new UAPI.

> > Maybe the other side is even less secure than the FOSS side...
> >  =20
> > > access to it (for example decoders, display controllers if we're talk=
ing
> > > about video use cases). However, since the use cases for this exercis=
es
> > > the whole stack, from non-secure user space (EL0) all the way to secu=
re
> > > user space (S-EL0), with various devices needing access to the buffer=
 at
> > > various times, it makes sense to let Linux manage the buffers, althou=
gh
> > > it still cannot access the content. That's the overall context. =20
> >=20
> > Yes, we know all this (except for the exact meaning of EL0 etc.).
> >  =20
> Great!
>=20
> > > As for the name, it's always difficult to find a name suitable precis=
ely
> > > describing what it is. "Secure" is perhaps vague, but it might still a
> > > good choice, if you carefully describe what secure means for this
> > > particular heap (in the source code and the documentation for it). Fo=
r =20
> >=20
> > Carefully describe, as in, re-define.
> >  =20
> > > example, the definition of "secure" for a secure heap as here could m=
ean
> > > that buffer content is inaccessible to the host OS and user space
> > > running in normal world (using Arm nomenclature). I wouldn't have any
> > > problems with calling it secure if, as said it's defined what we mean=
 by
> > > saying so. But I'm all ears for other suggestions as well.
> > >=20
> > > Safe, protected, shielded, unreachable, isolated, inaccessible,
> > > unaccessible, fortified, ... would any of these make more sense? =20
> >=20
> > "Restricted" sounds like a good compromise to me. The buffers' usage is
> > severely restricted.
> >  =20
> Yes, restricted isn't a bad choice. We would still need to describe what
> we mean by saying it's restricted, i.e., what is it restricted from,
> since I'd guess that "restricted" by itself also could be a bit open
> ended for a lot of people.

Yes, but "restricted" also does not give out an immediate wrong
impression. Label something as "secure", and it immediately raises the
questions of what kind of attacks it prevents and how can I make use of
it.

Is there any use of restricted buffers outside of Digital Rights
Management though? Could a private person somehow make use of it to
protect their own contents? Like a photographer sending drafts to a
customer while not wanting give out any digital copies?

If not, then restricted buffers are something people would generally
like to avoid, not embrace. "Secure" gives a positive impression,
"restricted" a negative impression.

> > It is the opposite of "safe", because accessing the contents the wrong
> > way can return garbage or intentionally crash the whole system,
> > depending on the hardware implementation. One example is attempting to
> > put such a buffer on a KMS plane while the connector HDCP state is not
> > high enough, or a writeback connector is connected to the CRTC. It is
> > really fragile. (Do KMS drivers fail an atomic commit that would
> > violate the heap rules? Somehow I doubt that, who'd even know what the
> > rules are.)
> >  =20
> I believe one of the goals with reviewing the patches is to highlight
> issues like this and try to figure out how to avoid ending up in
> situations like what you described by suggesting alternative solutions
> and ideas.
>=20
> > It is protected/shielded/fortified from all the kernel and userspace,
> > but a more familiar word to describe that is inaccessible.
> > "Inaccessible buffer" per se OTOH sounds like a useless concept.
> >=20
> > It is not secure, because it does not involve security in any way. In
> > fact, given it's so fragile, I'd classify it as mildly opposite of
> > secure, as e.g. clients of a Wayland compositor can potentially DoS the
> > compositor with it by simply sending such a dmabuf. Or DoS the whole
> > system.
> >  =20
> I hear what you are saying and DoS is a known problem and attack vector,
> but regardless, we have use cases where we don't want to expose
> information in the clear and where we also would like to have some
> guarantees about correctness. That is where various secure elements and
> more generally security is needed.
>=20
> So, it sounds like we have two things here, the first is the naming and
> the meaning behind it. I'm pretty sure the people following and
> contributing to this thread can agree on a name that makes sense. Would
> you personally be OK with "restricted" as the name? It sounds like that.

I would. I'm also just a by-stander, not a maintainer of kernel
anything. I have no power to accept nor reject anything here.

> The other thing is the feature and functionality itself offered by this
> patch series. My impression from reading your replies is that you think
> this is the wrong approach. If my impression is correct, what would you
> suggest as an alternative approach?

I just generally dislike locking people out of what their systems hold,
but I also understand why extremely big companies want this Digital
Rights Management technology for their business model. If Linux does
not support that business model, they and the whole broadcast industry
might use something else. At least it pays for kernel developers who
can hopefully do some genuinely useful work on the side as well,
benefiting the community.

Let's just be honest about what is what.


Thanks,
pq

--Sig_/m_y9/L720k3.YUUEknjTd2h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV5vK4ACgkQI1/ltBGq
qqeSrxAAsVMu1uwUAEiHOmIbdZ3IMpYONvvX9PjrsowXIzc4xZ+sohcdjwWsN9LM
ZwyXBLhxVmbSKy55b8fNI2UR51yIDO8E6lZLQieSxAulEzya2aMjmJEHoXdBo/sS
A3aGLk4Wu7hh4kSbyeOSoLf2Xf+Fg85puarR12WrxHwXn2JvFteRe1NX2v5+QJSn
lzGOqYb4bFIIC7oL7qBVH3VBT/st+RdqvUGnsJlvngSO/YEZz8Q2AZTt8sE1R/mT
6eZ9cidJoUdKqF9vKAxiKpTJyiVLpYqvhm9cvGQinbsYz3QKoUICKcSIGCGZlQti
2GShGtnPL1qpZfo95xzcu+fw/9g9DC3BRbG/+dV84txlxzn8y1pD6kGka9HjPhi1
ZuPC1MVNFvSOpv7tIvRRI/lD4ZRKdRJnvW4DDFntEhVfjGq0I5ezVjqBBHcic4QE
tWWjkepYco492avLdzrJFuVbzj9VwzCRt+M/mlIyons/QfvX/SoRGDya2pk1DNvF
NBK3Rf4qvOsooioZRNe8PnR/aBXw0MRFMN8htEKcuUHZnOCeIih+PV7VJwGMLMC2
vjYC7/yXalMFutcYjBJeMyqQylgXUsoJY2WB4d4alazZvlMFrQ/v6+t9y2aOHdpZ
+XGDbbjlVimKW1utrZlaHsi8w8Dbk9OH3I3tOZZQYfBgAFj6Nco=
=IiKA
-----END PGP SIGNATURE-----

--Sig_/m_y9/L720k3.YUUEknjTd2h--

