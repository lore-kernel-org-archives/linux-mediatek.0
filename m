Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A156EC4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49mGNK36uTAc2PcGxvuMH6FjMrZ7N2e/dp51dNcG2WI=; b=TVtlQUChtha2D4P4IiPNakKfgg
	UMlzuKsBMEXfHiM4wTrmn7PzBmV7u2WCPt5xjf59/MRO6+8qN64F/ADMW7OXLjQBxI6mNzVATUWPW
	Syyk+cIHHJwE299MVMl97RYhbpk886zR0OHFo+zQ9MZIFas0a4RO9pLhB+2VFyrhXfK0e6qeICTm/
	0l7VIWmX+77/2caY3U5enm3QBkiRBu3wdzSx+sUz5kyi8lXTpQBYY/wNpL4VvEIJsFpZY6PyES+CK
	oL6vDt8RQdUhYklVE+wsn279ym8eSId6r9Dt0cJgtgFaghiEF4ybmTARs2AWGgBH7vs/Cvp9Gh8lM
	oBtv8oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOEOX-002RHq-0j;
	Fri, 12 Jan 2024 10:04:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOEOT-002RH8-0p;
	Fri, 12 Jan 2024 10:04:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50e67e37661so8385851e87.0;
        Fri, 12 Jan 2024 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705053842; x=1705658642; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=49mGNK36uTAc2PcGxvuMH6FjMrZ7N2e/dp51dNcG2WI=;
        b=UhMWWZq3bhdzRQuPvGpILAVEVKeBgDOpTOnvaG+ynXOh/6nGYZ8mS9YCtoxJw7QUa2
         JkmC/WFvLv6YpH6Gf6Kf1dDgQryDwIMJzznZ6cTZWODsOB2mvQuxOneKh9vd8jveMdv/
         W8YUS2A1cSGwlU8vmfFsHEos7BnsvXILog9jG1he0M5bdv3On2vsb0rn/SmT6A3nLkfm
         waKR2qBUZGIQvXotOmlJ2T6mGTtnTbjmeDfIlZDZggyBmYuC0dXZrmjnSeqr4QDQeU7x
         Ki7VfTEkOfKa56gzrTnrnZrRROZW5IGMDDMjHEf+ifhUlEFnen0zH9K9I3aaszG0eJvF
         Iyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705053842; x=1705658642;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49mGNK36uTAc2PcGxvuMH6FjMrZ7N2e/dp51dNcG2WI=;
        b=THRSiSUM8rEhJsRAy5NelHUw9FvmiNvEa8zO9xCUzeum8VrYu+A5SVp+qvBQ+NwGU9
         qmwJgoYUqEgH1oOZylhpgy9bu1cogamD1RZoDG1mOBkRZe8M7COm258lBslgrqfKVpby
         J5A6Jm00NL5SdprsuBHy9erYSof3F8bRc/L2rFDdM2//23dcBi9K0EBdNbSlZ1ecDGRp
         hcVe8rc5W86fAvpDhLHruOfwJ2jPbALyoZR+bFVIzqxgRB8JJ0rAh7rAYwOjaFFYoiDB
         2alu1XbCbgbmTgMSeAQrEuQk46rZogMvgRYintnOBSaiktkHLPr1t6EciURmI/FRwS2f
         EEug==
X-Gm-Message-State: AOJu0YxSxsu9vkFuvXaKNuCeB4HP3OOMX7Gk1osDNU/nHD9c1sQkbKqA
	GcBVbPEbnO8d6nFSIRwziAQ=
X-Google-Smtp-Source: AGHT+IEJgqgQRPe4+wGucPThB/wEKQwuXAHrrbJUK/XGlr7TnjYBQAAXKDwmwnzWG8Ho0OJhEyyxYw==
X-Received: by 2002:a05:6512:3188:b0:50e:6b48:5407 with SMTP id i8-20020a056512318800b0050e6b485407mr667018lfe.82.1705053841920;
        Fri, 12 Jan 2024 02:04:01 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id y22-20020a056512335600b0050eea9541casm26727lfd.44.2024.01.12.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 02:04:01 -0800 (PST)
Date: Fri, 12 Jan 2024 12:03:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 <tjmercier@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
 <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Pavel
 Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>,
 <jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
 <youlin.pei@mediatek.com>
Subject: Re: [PATCH v4 0/7] dma-buf: heaps: Add restricted heap
Message-ID: <20240112120357.724e9326@eldfell>
In-Reply-To: <20240112092014.23999-1-yong.wu@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lS=3R00MGWXjD0UrR5LXr4S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_020405_301493_90161557 
X-CRM114-Status: GOOD (  32.83  )
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

--Sig_/lS=3R00MGWXjD0UrR5LXr4S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jan 2024 17:20:07 +0800
Yong Wu <yong.wu@mediatek.com> wrote:

> The purpose of this patchset is for MediaTek secure video playback, and
> also to enable other potential uses of this in the future. The 'restricted
> dma-heap' will be used to allocate dma_buf objects that reference memory
> in the secure world that is inaccessible/unmappable by the non-secure
> (i.e. kernel/userspace) world.  That memory will be used by the secure/
> trusted world to store secure information (i.e. decrypted media content).
> The dma_bufs allocated from the kernel will be passed to V4L2 for video
> decoding (as input and output). They will also be used by the drm
> system for rendering of the content.
>=20
> This patchset adds two MediaTek restricted heaps and they will be used in
> v4l2[1] and drm[2].
> 1) restricted_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video
>    Path). The buffer is reserved for the secure world after bootup and it
>    is used for vcodec's ES/working buffer;
> 2) restricted_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
>    dynamically reserved for the secure world and will be got when we start
>    playing secure videos. Once the security video playing is complete, the
>    CMA will be released. This heap is used for the vcodec's frame buffer.=
=20
>=20
> [1] https://lore.kernel.org/linux-mediatek/20231206081538.17056-1-yunfei.=
dong@mediatek.com/
> [2] https://lore.kernel.org/all/20231223182932.27683-1-jason-jh.lin@media=
tek.com/
>=20
> Change note:
> v4: 1) Rename the heap name from "secure" to "restricted". suggested from
>      Simon/Pekka. There are still several "secure" string in MTK file
>      since we use ARM platform in which we call this "secure world"/
>      "secure command".

Hi,

I am really happy about this name change, thank you.

It is unfortunate that ARM specifications use the word "secure", but so
be it. When referring to specs, it's good to use the spec wording.

In everything that is not a direct reference to some spec though it
would be nice to use the "restricted" terminology if possible. I
presume there are other vendors who use words other than what ARM uses
for similar concepts. A common vocabulary would be nice.


Thanks,
pq

> v3: https://lore.kernel.org/linux-mediatek/20231212024607.3681-1-yong.wu@=
mediatek.com/
>     1) Separate the secure heap to a common file(secure_heap.c) and mtk
>      special file (secure_heap_mtk.c),  and put all the tee related code
>      into our special file.
>     2) About dt-binding, Add "mediatek," prefix since this is Mediatek TEE
>      firmware definition.
>     3) Remove the normal CMA heap which is a draft for qcom.
>     Rebase on v6.7-rc1.
>=20
> v2: https://lore.kernel.org/linux-mediatek/20231111111559.8218-1-yong.wu@=
mediatek.com/
>     1) Move John's patches into the vcodec patchset since they use the new
>        dma heap interface directly.
>        https://lore.kernel.org/linux-mediatek/20231106120423.23364-1-yunf=
ei.dong@mediatek.com/
>     2) Reword the dt-binding description.
>     3) Rename the heap name from mtk_svp to secure_mtk_cm.
>        This means the current vcodec/DRM upstream code doesn't match this.
>     4) Add a normal CMA heap. currently it should be a draft version.
>     5) Regarding the UUID, I still use hard code, but put it in a private
>     data which allow the others could set their own UUID. What's more, UU=
ID
>     is necessary for the session with TEE. If we don't have it, we can't
>     communicate with the TEE, including the get_uuid interface, which tri=
es
>     to make uuid more generic, not working. If there is other way to make
>     UUID more general, please free to tell me.
>    =20
> v1: https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu=
@mediatek.com/
>     Base on v6.6-rc1.
>=20
> Yong Wu (7):
>   dt-bindings: reserved-memory: Add mediatek,dynamic-restricted-region
>   dma-buf: heaps: Initialize a restricted heap
>   dma-buf: heaps: restricted_heap: Add private heap ops
>   dma-buf: heaps: restricted_heap: Add dma_ops
>   dma-buf: heaps: restricted_heap: Add MediaTek restricted heap and
>     heap_init
>   dma-buf: heaps: restricted_heap_mtk: Add TEE memory service call
>   dma_buf: heaps: restricted_heap_mtk: Add a new CMA heap
>=20
>  .../mediatek,dynamic-restricted-region.yaml   |  43 +++
>  drivers/dma-buf/heaps/Kconfig                 |  16 +
>  drivers/dma-buf/heaps/Makefile                |   4 +-
>  drivers/dma-buf/heaps/restricted_heap.c       | 237 +++++++++++++
>  drivers/dma-buf/heaps/restricted_heap.h       |  43 +++
>  drivers/dma-buf/heaps/restricted_heap_mtk.c   | 322 ++++++++++++++++++
>  6 files changed, 664 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/med=
iatek,dynamic-restricted-region.yaml
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap.c
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap.h
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c
>=20


--Sig_/lS=3R00MGWXjD0UrR5LXr4S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWhDo0ACgkQI1/ltBGq
qqdgnhAAiXIHptPG8WhqVlmOGF8J+Dj7PxjrLasFg2BG/gbUDAM2FICO1VBkblIw
bW1+LqpcdVG+FBs/hGrQOvEblaiIKjMXf5jyNnqPun4xGzi4VggC3sU7erHyIaAb
bLqfGVzrG782jns8Ibj9AeX1fck6aooUm8yD6w5JvGJRKRNIXKIeGPZrRkiotfnn
0NcTZ4BVoTufB5dzYgJABuiTmk1OyT4QkCVmVVE0mVn4tTc8Yd+s4m3rXqr/r3YE
A0geZB/426wfXy6oxNmf0ftQzsyEIcVP/WZJZKtbh6rnXQ2RcMkK38wTTG0Bmyuf
F1FW2L0GEyile6Vm6DyRJf97UQSzWCMraDUJKEd9+AbyjbreEnSUSL5WnPpWTbND
lmsCrC1rVM+/hTOD7or/0mF6kp2WgfSaaH+BhrkvDb8MGjj/84yEs4v0jAwBM5y4
knMaP00XF33xsX4OWEWbjniT+ZCdl9lhrGju9A+0+ZDTH+2LKAuzF5Rq9GgzWUzD
NqoAZ3aLTUS6KdLfjG6Dzz+eLtjrmOcOcP0gdxKbObO5DXo3yL/r3WZyGDoBDDNr
Ko38kjrDz+kuAsfKRzu1tDbPLnJLnVyt9rBl4NiD5Gl3BrJv0WvFRtuyzYrlNKHU
M5t91RcbiaPApyXCZT0eXqefR5B27nW2e20Kqcf3kEPh+dsLVzc=
=Y8bP
-----END PGP SIGNATURE-----

--Sig_/lS=3R00MGWXjD0UrR5LXr4S--

