Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0F606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kks4ihwI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWUcIf7w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=; b=Kks4ihwIXYneGH
	EX8qTdLUDnRPlmCj9fJmbfOa3sF4+kLozK4ROGSUsku8v8GTPuPuflnOZ9/Wr0rzgRVZwPtxDY+Ml
	4ArE1MjrPomP3w3bXNa6emhd0wryDnymqWzWoU/Rcgag8zetLDeCFOdd0OhU9mDysKUWvP7End/KT
	VhdRm85FXBQGVk6OM89UuHGG+Vt2Th3qE7F8tGQ+IVyxRCsungjDzBrGkO0J6GI+XxB7glIfNbzo6
	aYQUeMWZMuMfUigN1K4l1rPVg2lkNXWfx6azTD1GucbFwBhcW+xfGLJTF2l/t8ncGLHN6SIKAVWNY
	I47lkBisxBsEbIS8IHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpeZ-0000000CYtH-0RUs;
	Fri, 13 Nov 2026 11:41:11 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpeW-0000000CYsl-3n6p
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 11:41:09 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-55650fe1f0dso950249b6e.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 03:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570068; cv=none;
        d=google.com; s=arc-20260327;
        b=awD0IyJNlEdYnttic1fxYUr3gztr55jR4M51XdDgN0bCjBMa2zfnEsnSrpbz5QGwq5
         5qciuvZLEDyk4gE8NeBfFNssYosq50F3c1cXmjkiD8+Sdy/AhkEqoAVBHum7W5ovPdDR
         e/OgSW5KtZCvaTTj4CWmL2zLTOOs5CwcqvmPREjo7BrnXD6TsOah+92StMmZHe6SD+kQ
         ZSoAHhp98WESd8rgipFtsB5l10ohK+nRY7pKRZraxdNAGzaVMi9nQOzNRKqa8Ft19wj6
         BbHycQKef1+B4EJ3y1GdxCWR6gtAPs39jlHs7fbKVJZaKt9+zDl77EgTHMFuYnRm18Xg
         57HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
        fh=H6Jhc7dh2tEMWwsuQY+uf9357zUftiJ9mN/jTvsly7c=;
        b=dlLMmBShbHqHd0eZg3SstrOUTQJ16FQNrgSRa6g1KfcGDDfiuVfedG0j3LvbS+R+Oq
         2IMS2g7jnyZgU2PuQm1oqQ5f0AEcijPKkF/YBta5aLZbpKVU0fFJfKhf7/OKsPUNN491
         nM1GkhiD5n5SL+alWmnziVRXVC4k/iGv01AZ/722/zq5R5/+WCeMhHLsRWRLPwCKjTA3
         oPHnHJ06p6ApsUT0WJd5PI/j5OxL8ARP9z6av6dymT2AI0ujUcWmqJwtPfQpK7EEBi5A
         CA2OJsxPNVJRVSCH92DbR3gogRJPP8jCwb3Wsz7WCopof8DUlrW2SLiU59fiqfzglX8a
         kB7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794570068; x=1795174868; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
        b=oWUcIf7wutXG0iOnspByiw/HSKaKxNJFvTAI+nN5B22Y4lsMDsF3W4bvl5gj+8/Kde
         YDPhMNvF4Ocogt9awfQE3DtgqIdO+D7cXgxfrTIyYd0o9RcRcOy/Pwql5bJd6tO8NQGv
         vt4809TlTNr8aCgTbqBPMn3lOZvMXXo9K409DYM8iEh7fAx+uYFhevwal4ebH/9inrrs
         HSl6nTZBwhFTYOG6iyFsBEYDy1Z0mSzrl+cBKTmBf7yKJNuUcaK3ru+JEVvL3n3NFT2z
         MyYuYlRAIDDwX7Hro02YA8RE1qsAJQoGmySl4vD/GTdqFyjW6VRJ7xhfo8MOwDt9zxpG
         R0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570068; x=1795174868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
        b=qx2P4sUnS7ClQ1i4vxbZ8d5yicjEGi1uQqMz9TSQfM0MTUOwWEcU0JXcS/Otm2gw69
         fd75GhqbsqiOaJk1cIssdT3sF0n/x27OrULCA25L6xuQMHCnHf5Bxg3SymnDBj8nhhfl
         Zd1EvdtsXzodB+8wZUERQJwaGJlDBClvoZcLOgBiL049StyUx8qv0xNN2hunuf47a7Qx
         +qW3Tu83FUAlwhzQe6CgzABa6IoTyAQBaq+lYr24ZJm0ARaUTjSDErJsAwPj6z2eGqoA
         Y8nn2pBFog9PXKalEc6GpEX0sEDQXFCynbm3B5ZbqomsYJKISelfcCTAA00mathOik2u
         nQPw==
X-Forwarded-Encrypted: i=1; AL+hErGCzao6ExucjMl0jdhIVzuapYOAySpBLXIZF9w0RhNWU8QcDdwnIqxdfWZr0WkPn91EJPDHrviZafGP8reN6Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z98ecyjp2Al3JWw6sT4vbiwyEEk7Y7uYmi57kLLlvyPZxUPNQ7M
	IZkiVn364aS/L2rwWAvCQJP8aHEwW+KUm/x6hL9IOAGOdb/xGeMNjuDTIqckS2KUlQShiqIwkgo
	OpYyOOnxRbTfJ5t7KaAUsVV6EKgkq+Q8=
X-Gm-Gg: AYBFou2EFwwDan7T1QiTZreRPvxvc9ed6gUSGd3LEGqEJ0pHUq5Ljz8ai9mj/KqWR+D
	DWVWVIQ0HKn5wPpVmGsw5RlO6YZH/4JPGYIuYTQCl8FqDJa9cnh5ePN7x00RGnL8YfIeZQkM21x
	jEcdUcuxcTdEvqW2egcor6argqdRhHOIa+MgK6f6IVHcNOCLJpb38nCp6HBX3UJ8lk/Sok3BipZ
	oSQ7QY9YdyiQDx68UdJXbnWulzzGsswg0nE5vcL0rAzTfVizC/AJLgkVqXFnrRsMeJrmEcgBoze
	juhSYmEoti6yqmwrQNUndIp1rcRHhXTm4m9BdHK2pEL/j4MzxalFeq7QJuoQeXe+q+P4ofSyNUm
	EvdD3LV0+ece+YAlpe72IGDO/JOnBQRvK2DxOnx2lz98DZJl3RjtrmwIgQCwJdIfpvSs2jJf5dv
	UMPsGtc5ZRmDTE1AaU
X-Received: by 2002:a05:6808:1a0d:b0:4bc:336d:7494 with SMTP id
 5614622812f47-56e63489ed0mr1659739b6e.30.1794570067734; Fri, 13 Nov 2026
 03:41:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com> <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
In-Reply-To: <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Fri, 13 Nov 2026 20:40:55 +0900
X-Gm-Features: AclHuK_Sb8EucpQ_1kcbihJ9nEtIMxpgWourPainPCnNSFmKltS9fjavm89w8gE
Message-ID: <CA+m4KrDA9rx9YB4pPMdZ+Qg-GbGyYb2Mnfbb7NdgrwGWduEuYw@mail.gmail.com>
Subject: Re: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
 powered while streaming
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: devnull+getfeus.gmail.com@kernel.org, Xiandong.Wang@mediatek.com, 
	andrew-ct.chen@mediatek.com, houlong.wei@mediatek.com, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	mchehab@kernel.org, minghsiu.tsai@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_034108_952225_F5AFE14E 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan,

Thank you for testing this on another MT8173 device and sharing such
detailed results. It=E2=80=99s great to see the fix working on the Fire HD =
10
as well. The broader codec coverage and suspend/resume test are
especially helpful, since I hadn=E2=80=99t covered those on my Elm.

I=E2=80=99ll include your Tested-by tag in the next revision if one is need=
ed.

Out of curiosity, are you working on mainline Linux support for the
Fire HD 10? Your mention of the board DTS being under review caught my
eye. I=E2=80=99d be interested to hear how you=E2=80=99re booting and runni=
ng Linux on
it.

Thanks again,
Youngjoon Lee

2026=E5=B9=B411=E6=9C=8813=E6=97=A5(=E9=87=91) 15:46 Ryan Brue <ryanbrue.de=
v@gmail.com>:
>
> Hi Youngjoon,
>
> I hit the same thing on another MT8173 device, an Amazon Fire HD 10
> (2017) tablet (board DTS still under review), on v7.4-rc2 with VPU
> firmware 1.2.0, every job took about 1.9 s, the firmware reported
> success and the CAPTURE planes stayed zero, for MT21 input and for plain
> NV12 -> YV12. LARB4 was off during the job.
>
> With v3 applied (one context fixup for devm_kzalloc_obj() on rc2), all
> seven sibling blocks bind, and MT21 -> NV12M at 1280x736 from the
> decoder matches a software decode byte for byte for H.264 Baseline, Main
> and High, VP8 and VP9 (30 frames each). LARB4 suspends again after
> streaming, there were no IOMMU faults, and a system suspend/resume with
> the driver loaded left conversion byte-exact afterwards.
>
> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Best Regards,
> Ryan Brue

