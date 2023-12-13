Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF66AC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erM8V8RgO6KRLO/yh7jID1/baZLh+uPtPuh+atBa3V8=; b=GC1VvCBZSw5VgSqEi16eJbi8VU
	nf0Rd1mpHadyIZxzW/f4r3nakTScdvOExfPuS8qbc/UHvVGNqWmqlHgB+/tFpdOhm42g92TZhBsWX
	OKTlghZOJCytyNe3O+jFZz6L1czKhMt+6bw+tcuSpDOFVXMn4H/mISRDYx5kbSndZvYE49TfoXHMa
	ZFotT+zCUYU60gaXqIGBvgxt32LzTeKvaBD8YSZVp1oRLQ+kPWj8m4omijg6S9kC2Y6L1OuC3mc59
	vusi4vRJulmIAsYvTk5V+cbYENOJ5E02l6NfVrWlNNIVyxpNExbcw/vMGrRR7hdJk0BUn9SvpBWbi
	LtExdvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNZb-00EUnZ-24;
	Wed, 13 Dec 2023 11:38:43 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNZX-00EUmZ-3C;
	Wed, 13 Dec 2023 11:38:41 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so85984361fa.1;
        Wed, 13 Dec 2023 03:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702467517; x=1703072317; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=erM8V8RgO6KRLO/yh7jID1/baZLh+uPtPuh+atBa3V8=;
        b=ClV7/5pvrPVaH7V2C8d4GXrND/YuETSJJrrWfe1gnBkhwU0SJJSyGrB42plyzY55GN
         v9y1HExFyQt02VrIw1ryLhK1uLGDuUqhpaI9FJmjs9oURf9F0zt3CxzrBX8ljjr24vsi
         lTiLVua+EfrzZ/rGjxf4KAqbP9ml0fVvtNeu8heRPdVDbvJ92rho437vxm0u2kqJTAsd
         7dASeAzDK7lONJFJXAwUquo1J7lA9IUVZUOwO7EfKVY91P87qdRRlCwISDNNOXA4yzec
         ecDFCnqlmCRtrRti0+sX3c5I8bCTOPFIWPqUpJAIa+IRJ7ptIs0/J+gfnRB760PRohAx
         lKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467517; x=1703072317;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erM8V8RgO6KRLO/yh7jID1/baZLh+uPtPuh+atBa3V8=;
        b=XxVu1Z0O00F03Dhq2DPDhqwGNidkPU1l4rgULq1iIgPa06hR8dXWOdhqSytibsSNhg
         hb8C/fNOopHDY1LIcPr4B8SUV3riqKyqsKpDgrhSOTzvKwvZ8Ru6N3g/ss0KzvltifV3
         rat0IOFHeywhG+Hsciajq7yfeik+FZsuXO52/ntNgvHn5JFKg1SGx3oy+ope4OQBdq1D
         Fc1YqLoPmaI+EqxJ1ZIiPK6liNeuKWqYiIGNEK+gL4zrGyUv6oETBd4ogSxJRzKpO59w
         iPmRfACHChZ3CAgFznOMkGUrRWyPbduhPjNpsIeMXqVtdF5dNDxomVczDKY9JQtF5Zaz
         BFWw==
X-Gm-Message-State: AOJu0YzyS7BV6mb8bUSUZkgomGUDDl5XbEg1X36zgeWpJnVMVkRepAnw
	PU/WcPImRelwGhvts7WAbPo=
X-Google-Smtp-Source: AGHT+IGrw7mppJSoNS7Dsgtj7c74Wvr4sERgMIvNl5Jx450IZ2/p127Sh3s8TK2qiUjKMuJrmp211w==
X-Received: by 2002:a2e:330e:0:b0:2ca:226:423b with SMTP id d14-20020a2e330e000000b002ca0226423bmr2342385ljc.48.1702467517050;
        Wed, 13 Dec 2023 03:38:37 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id q6-20020a2e2a06000000b002c9e9c29670sm1767204ljq.47.2023.12.13.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:38:36 -0800 (PST)
Date: Wed, 13 Dec 2023 13:38:25 +0200
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
Message-ID: <20231213133825.0a329864@eldfell>
In-Reply-To: <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
	<DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
	<20231213110517.6ce36aca@eldfell>
	<20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xTcL2+m+K.KNDg_qGM9LG9u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033840_033906_E93F4081 
X-CRM114-Status: GOOD (  39.67  )
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

--Sig_/xTcL2+m+K.KNDg_qGM9LG9u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Dec 2023 11:15:49 +0100
Joakim Bech <joakim.bech@linaro.org> wrote:

> On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote:
> > On Tue, 12 Dec 2023 16:36:35 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > Is there a chance to pick a better name than "secure" here?
> > >=20
> > > "Secure" is super overloaded, it's not clear at all what it means from
> > > just the name. Something like "restricted" would be an improvement.
> > >  =20
> >=20
> > My thoughts exactly. Every time I see "secure" used for something that
> > either gives you garbage, refuses to work, or crashes your whole machine
> > *intentionally* when you try to do normal usual things to it in
> > userspace (like use it for GL texturing, or try to use KMS writeback), I
> > get an unscratchable itch.
> >=20
> > There is nothing "secure" from security perspective there for end users
> > and developers. It's just inaccessible buffers.
> >=20
> > I've been biting my lip until now, thinking it's too late.
> >  =20
> The characteristics we're looking for here is a buffer where the content
> is inaccessible to the normal OS and user space, i.e., Non-secure EL0 to
> EL2. I.e, the content of the buffer is meant to be used and accessible
> primarily by the secure side and other devices that has been granted

s/secure side/proprietary side/

I presume nothing of the other side can ever be in any way open?

Maybe the other side is even less secure than the FOSS side...

> access to it (for example decoders, display controllers if we're talking
> about video use cases). However, since the use cases for this exercises
> the whole stack, from non-secure user space (EL0) all the way to secure
> user space (S-EL0), with various devices needing access to the buffer at
> various times, it makes sense to let Linux manage the buffers, although
> it still cannot access the content. That's the overall context.

Yes, we know all this (except for the exact meaning of EL0 etc.).

> As for the name, it's always difficult to find a name suitable precisely
> describing what it is. "Secure" is perhaps vague, but it might still a
> good choice, if you carefully describe what secure means for this
> particular heap (in the source code and the documentation for it). For

Carefully describe, as in, re-define.

> example, the definition of "secure" for a secure heap as here could mean
> that buffer content is inaccessible to the host OS and user space
> running in normal world (using Arm nomenclature). I wouldn't have any
> problems with calling it secure if, as said it's defined what we mean by
> saying so. But I'm all ears for other suggestions as well.
>=20
> Safe, protected, shielded, unreachable, isolated, inaccessible,
> unaccessible, fortified, ... would any of these make more sense?

"Restricted" sounds like a good compromise to me. The buffers' usage is
severely restricted.

It is the opposite of "safe", because accessing the contents the wrong
way can return garbage or intentionally crash the whole system,
depending on the hardware implementation. One example is attempting to
put such a buffer on a KMS plane while the connector HDCP state is not
high enough, or a writeback connector is connected to the CRTC. It is
really fragile. (Do KMS drivers fail an atomic commit that would
violate the heap rules? Somehow I doubt that, who'd even know what the
rules are.)

It is protected/shielded/fortified from all the kernel and userspace,
but a more familiar word to describe that is inaccessible.
"Inaccessible buffer" per se OTOH sounds like a useless concept.

It is not secure, because it does not involve security in any way. In
fact, given it's so fragile, I'd classify it as mildly opposite of
secure, as e.g. clients of a Wayland compositor can potentially DoS the
compositor with it by simply sending such a dmabuf. Or DoS the whole
system.

"Poisonous heap" would be fitting but politically inappropriate I
guess. After all, "poison" is data that is not meant to be read by
anything normal.


Thanks,
pq

--Sig_/xTcL2+m+K.KNDg_qGM9LG9u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmV5l7EACgkQI1/ltBGq
qqd21w/7B5AOlcm0BJvZ+kXMgngEgshf4OR5HVOLoGtC3uQwgQJLmIotDzGjaXnM
YNpvxE7i3jgF/MvfUynt58CspSm4fcgJzP5fjqD5zTAQ7BH2PFxnyl8Ko1AemP1A
yauV0Fco65ZDgsZRGCxZeCI60vtceCYPECULnQSC67w2ToHsdQsgaSH2DnTmNPgZ
TSqV553NtqYEc4U1XcfN0kwwwG7l3B5k7Fv57eEcLbpYjHhVHDc2Lbr138SWn7fx
APC3vIZGlAKGPSDwHCApb/xA9SiCprT1nxKtqsPnYON3OWeivPqd8w3ehdaHGI93
d5F6GM6c7XyTxSpde5H9UueQROreZB1JOrF81Pw4u3dJ0NMYjludA64BBnbDx4u7
HDPQDMMtpq2Gvg+FosmzYa3Pf1laWztXyqcjhrvr9W7FPvzDOvnA8Jt05jgRYHBO
Fi+ghVDeIkuiv3Yk5Ien7FStcO6OKjSeRErZvR3Cqu1ZdTZOd7+Pg7eZe+bdNtsN
lEaSLNF8x9hRQjBE3hsP9El2dcOIZbvxElDhczpHy+mEfHyf4wp6slc8be+dFiwq
b/kHVXxALVcRSBoa7E26WS0zcXgE0CyHkFAoMI/E6S2Ijxxf1UIGwTQyVzaUQ/V4
5FZEBlGLow3ax7wAl+aXTOAubzc4cm+LI17q6TbeRqcL9y0EBcU=
=P1qu
-----END PGP SIGNATURE-----

--Sig_/xTcL2+m+K.KNDg_qGM9LG9u--

