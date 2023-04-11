Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581DDC7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 21:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeS4jHom2I9hOYAVSOLxAo/2gUtYfcTZSKxI2e4ZVrQ=; b=V1vc07aCNEtl8HlPLdGW8T2YEB
	PBh5fhpqZ5W1MF/0LS2A/3YQK4eBrjkzuFhVFPQqKnXSI0VkaxzQSb9pJf/5nR3dgUsnwGYqdSD+U
	peD24klbs3sw2ZlaC6ESt4ykQsVDKBYAtpBw/SQnR/c3wT51yFzccedTHN6EE1znkOS2GN5sIJX8n
	FvQWaYXNW5nj0dYLjUPUhQ7FQXuO681xvxEOdhtyhk1oY5Eq/TD4o4qAVDmHKI5f/01tkPNmzKrd6
	xdUhDQfMGsp44TImr7u972Gmlk71yAflDdT4mR1eE4vKGz1/RLi615z6Mde9lDGnkFZs5p0C3QATU
	iSqpN0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLb8-001CB8-22;
	Tue, 11 Apr 2023 21:32:18 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLb5-001C8f-0O
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 21:32:16 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id y186so9794052yby.13
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Apr 2023 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681248726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeS4jHom2I9hOYAVSOLxAo/2gUtYfcTZSKxI2e4ZVrQ=;
        b=ka5LXxgNjFJr/iFnVZLhnZ7E1yCVLBfu2j0cpYW4Rd3xWKicacXWoe4ZTln/EbRX4p
         PhTK4Eqkmw0CANBJGoOa9Pxo4R8GM5I2i2Ey4gDUnxZY1fIB/QVY/kAz0eep83IQ9Wms
         7n3j2HbUoS5ULKcZopYgYzHMwSdKU7cAJEmrkKQx4555bhFckblKgDQNRbo7nTf/CA34
         p1hZ7D/MlGfL5jprrXj5lYv1BVIYoZdx+GjKJY/bLGRvod1o261ebMuQ7WS5WUk/bc0J
         /fsE4OkrGFNxCREf7V9Y6Eern+A8OQeSgrX/czXrOHlN75d4H6vEpvFwMWitncL1UGuA
         gvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681248726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeS4jHom2I9hOYAVSOLxAo/2gUtYfcTZSKxI2e4ZVrQ=;
        b=L1hXDewnFWnSYjRZODwJfEw1H22CgACvel6xs1rwEAbUn2VhgUHsfLQPr6DzYiADTw
         MiM1G809SzaqgjzBkBbEdI5ZiY0LmkB5kAUBgSAglbh8HqIKzoqoY5uPVySZ7EQnobUI
         vNTRrGHjGmJKI7QQqecLYfb1k3V5vzpDWZBxgomtZAUUKEG4586FiPGNwQ1J7UsF5ctJ
         o3k92izxP1zA47/Amc5WeqxvpSCn46ipSLte+LhRAhpWHb9nxRjnDhdpy6uL8PDGad9M
         pirK/ePBRZj0c7ifwBqxPV5Otcvus0UvHheppq5NQWXy3jdZaKGg3IZFYZRi3cIB9YvP
         zL5Q==
X-Gm-Message-State: AAQBX9fjN4VdMOXGPd0od80LnAr2TBBitqLq26iyO0V0JMSdUxQwGMEs
	z/9Ab+fkwWGEIL9FYtp0sOi1g7yjEMDSqA5AJJn1mw==
X-Google-Smtp-Source: AKy350a901GIyrqbDiWssicho6VD6oQ1aF3Wwc8YpRauFzTD5PW6khekFH+UVi8XRjjeZGdz9uobkT9Kw17FeooXz5o=
X-Received: by 2002:a25:cac5:0:b0:b8e:d126:c64 with SMTP id
 a188-20020a25cac5000000b00b8ed1260c64mr2618154ybg.4.1681248726589; Tue, 11
 Apr 2023 14:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230407033341.5139-1-haibo.li@mediatek.com>
In-Reply-To: <20230407033341.5139-1-haibo.li@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Apr 2023 23:31:55 +0200
Message-ID: <CACRpkda8qTuCmF_RDjtp26k_DMpME=0wAPjejh4ODkUr9SxVqg@mail.gmail.com>
Subject: Re: [PATCH] ARM:unwind:fix unwind abort for uleb128 case
To: Haibo Li <haibo.li@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Anurag Aggarwal <a.anurag@samsung.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, xiaoming.yu@mediatek.com, 
	Russell King <rmk+kernel@armlinux.org.uk>, Alex Sverdlin <alexander.sverdlin@nokia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_143215_165925_E94E1257 
X-CRM114-Status: GOOD (  21.99  )
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

On Fri, Apr 7, 2023 at 5:33=E2=80=AFAM Haibo Li <haibo.li@mediatek.com> wro=
te:

> When unwind instruction is 0xb2,the subsequent instructions
> are uleb128 bytes.
> For now,it uses only the first uleb128 byte in code.
>
> For vsp increments of 0x204~0x400,use one uleb128 byte like below:
> 0xc06a00e4 <unwind_test_work>: 0x80b27fac
>   Compact model index: 0
>   0xb2 0x7f vsp =3D vsp + 1024
>   0xac      pop {r4, r5, r6, r7, r8, r14}
>
> For vsp increments larger than 0x400,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>   Compact model index: 1
>   0xb2 0x81 0x01 vsp =3D vsp + 1032
>   0xac      pop {r4, r5, r6, r7, r8, r14}
> The unwind works well since the decoded uleb128 byte is also 0x81.
>
> For vsp increments larger than 0x600,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>   Compact model index: 1
>   0xb2 0x81 0x02 vsp =3D vsp + 1544
>   0xac      pop {r4, r5, r6, r7, r8, r14}
> In this case,the decoded uleb128 result is 0x101(vsp=3D0x204+(0x101<<2)).
> While the uleb128 used in code is 0x81(vsp=3D0x204+(0x81<<2)).
> The unwind aborts at this frame since it gets incorrect vsp.
>
> To fix this,add uleb128 decode to cover all the above case.
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>

[Added people such as Catalin, Ard and Anurag who wrote the lion's
share of actual algorithms in this file]

I would just link the wikipedia in the patch commit log actually:

Link: https://en.wikipedia.org/wiki/LEB128

for poor souls like me who need a primer on this encoding.

It's great if you also have a reference to the spec where you
found this, but I take your word for that this appears in code.
Did compilers always emit this? Then we should have a Cc stable
to this patch. Unfortunately the link in the top of the file is dead.

> +static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block *ctr=
l)

So this decodes max an unsigned long? Are we sure that will always
suffice?

> +{
> +       unsigned long result =3D 0;
> +       unsigned long insn;
> +       unsigned long bytes =3D 0;
> +
> +       do {
> +               insn =3D unwind_get_byte(ctrl);
> +               result |=3D (insn & 0x7f) << (bytes * 7);
> +               bytes++;
> +               if (bytes =3D=3D sizeof(result))
> +                       break;
> +       } while (!!(insn & 0x80));

I suppose the documentation is in the commit message, but something terse
and nice that make us understand this code would be needed here as well.
Could you fold in a comment of how the do {} while-loop works and th expect=
ed
outcome? Something like:

"unwind_get_byte() will advance ctrl one instruction at a time, we loop
until we get an instruction byte where bit 7 is not set."

Is there a risk that this will loop forever or way too long if it happens
to point at some corrupted memory containing say 0xff 0xff 0xff ...?

Since we're decoding a 32 bit unsigned long maybe break the loop after max
5 bytes (35 bits)? Or are we sure this will not happen?

> @@ -361,7 +376,7 @@ static int unwind_exec_insn(struct unwind_ctrl_block =
*ctrl)
>                 if (ret)
>                         goto error;
>         } else if (insn =3D=3D 0xb2) {
> -               unsigned long uleb128 =3D unwind_get_byte(ctrl);
> +               unsigned long uleb128 =3D unwind_decode_uleb128(ctrl);

Is unsigned long always enough? We are sure?

Yours,
Linus Walleij

