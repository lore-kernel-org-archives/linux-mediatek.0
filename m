Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E4A606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XEKo49dJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkDlXTrL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=; b=XEKo49dJJlBL1o
	5GYvcTuUttHrdyam9B8iGd9udEcLuX/Po2JLOVVRhptqqhx+RtgM0lI3sMP4JSphlUmzvKRGXgzl7
	9CINRcLFrCFixuTf3Hg5+59gECtnT2EfudHoEX6BncrseRE13FZYNCUmZ/Im5xGrNrV0LadqKH6tS
	FEoEQ40LQpccfC7f6tTaiqHPVw1LwE8L8ez1vFgzu+DphpluUNsP3EG+3I4AbQ84qehcazcpD1sEd
	9HCMOqHysgXMUxIVbNhcusD9+DH/bzZ9y0G343qkruM2UyJgQbdVYLm1oAlcXt1W2Jz8XXx24Hebw
	223XmT0/bN9T1RTasUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSzl-00000003KfB-2wPF;
	Mon, 23 Nov 2026 12:18:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSzh-00000003Kdq-3kpo
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 12:18:04 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c40e30c26a4so879262266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436280; x=1796041080; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=GkDlXTrLtjyVQv3R0OYLm23EfhVib1OWeUNU0iKTWwAvZbeiubJnNCN1MTXAPQ85Af
         Zmd2po7cP7ZyFC+byJdrvN5O0c+UH8oxndFBc06/2NJ+zcJrCNjEgGhc9KCkd8VkDQtH
         XO0pFBV4vQFoIItyPXb1Ux0z22pPdVjMeqPvO9gcNVi7C8cKPIwgfC2uS2IrdmbyrWvx
         BHIP/J5I4ArXcSTmHU5t9DGW7aM2MuGoe36RQuC5JuMiashealpmZoWVmpDjKA3Dg7s/
         OuEB5Ngtv0qjYPA1wMYbt+S2/hnrIkus1X/f02RnTCTCW1njYV7HsFs+i+ldkYb5G59l
         8zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436280; x=1796041080;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=C0TqdAHckEvOGzfTxuWynJvZQ6FPV2Nf/xsChYGx5Plw7NtIDpW3CMr6GsAjVz/O9B
         9pILRRSo1H7vd+axK10Lunt88qvX8H1T6h+Gd1aGv8HgjrIDqk0yVPM3GL9J87DvAUTE
         l9M/P1Asf5i+5tuDAa8UFk0PEjEZJxwVtxuwKS01GyWicncwAsfQtbD49dimhX3/OYI2
         Ja8V4Kw4H0XfOD+jFG0ZzkP7ZtTpJmyMDit3sIyJm1LFr0D8pocU8L5dyiluKySR7tSU
         MrQb5xf4Xlzb2cx/Wpf0UyGEG4EfDbfJja/1yyAPy8V7YHWDnt8G2/Hh6rgElinVPTDS
         y+Xw==
X-Forwarded-Encrypted: i=1; AL+hErHaC+Szm/4WNloojc3LNe8871z1C9YV25uB376xCkgY/VQUJjsrEhD4mvTvN2dCHr/pZZNkAiFMCa5XC95VKQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9TKHEBIS1NaSjo8CMGEYx1jRxHsjJDEwXkwMnE6ziBEQyCh6gY
	iWeZmNL3H/XldN1VFCOPobdgkWAW/m59urnfKtIjCESo5RO57Husm5mH
X-Gm-Gg: AZFdTZc6h5n+wr9gXm30SxvWSedwuPnnpjmU/0GOIseiVHoBWUhBcAvawBqHmh1+rMS
	Z1Zc9xwWFiUcdeP6YzSFKjdYlSJYRSf0jbhDBn69/hoOdNQfvKKqLlL07kfMFt+OV++73PASQzN
	JtdkvW+ICVV7oIsHc88cHCxEpb85voGD4b4LbRqZgx/ZuUhgmMGPE1b2174xW0IIhNW4ygD/j9l
	obbXWKoRtOEBTneknz2ZEMz1Pw/KoWb7jvd9TQtYh8S++vNbREtxTsTTh6X2GewUwWRSlVIJWU+
	DFip2gA5XxD+t8OnQkeRDQtcxY5WbBxUCO+zgbWFj0I6Tkg+g/24clqLNpqfGUCgiXOGTHsxnDs
	T2DB+bbEHeeA/DLPJsLl2iQOo9FLJjDvFgD20egHxnw29hDJ2tLslUP1Ulr+pPxd4oaU7I39qBB
	sRkzDDZtMcqVLuQGcu+z5pTSa9VxFSddSS3BYFa7xk23mYhlm6qsFficjaK6FGr+MU5/UCBYbmy
	VBLyWn1+fVV3NkAT8zhn9lMBk/iSpoP31uFnUHf0nYkHlje5VYj6UVq2QkQ4Er0gY3TsM02OHeb
	ntqdtc/pV904+n07of/XzJPIprxl8MEyqEypnEtlZ6on20ZOLbJptOgV
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id a640c23a62f3a-c5150c98208mr692273566b.10.1795436279974;
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm397263266b.51.2026.11.23.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:17:55 +0300
Message-Id: <DN2L1II131YK.3M3CEKXTOAUDX@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com> <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com> <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
In-Reply-To: <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_041802_450358_95AD56F4 
X-CRM114-Status: GOOD (  17.37  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 23, 2026 at 3:04 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:59 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Hi Roman,
>>=20
>> On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
>> > > Bootloader dependency
>> > > ---------------------
>> > > This was tested with a modified LK bootloader that is not public.
>> >
>> > How are other xaga users supposed to boot the kernel? You might want t=
o
>> > port uniLoader instead, or if you're on an old enough security patch y=
ou
>> > can even replace stock LK with U-Boot. U-Boot chainloading is also
>> > possible.
>>=20
>> Right now I am replacing the stock LK with a modified one that knows
>> how to handle mainline DTs without expecting downstream Android nodes.
>
> LK is known to mess up GPIO and clock state. The earlier you replace LK
> the better.
>
>>=20
>> In an ideal world, I would like to replace LK directly with U-Boot as
>> you suggested, though U-Boot chainloading or uniLoader are also valid
>> options. Luckily, the security patch level isn't really a concern here =
=E2=80=94
>> xaga is already EOL and hasn't received official firmware updates for a
>> while, so LK replacement works across the final stock builds. I
>> definitely plan to look into a proper open bootloader setup for other
>> users in the future.
>
> You can take a look at mt6768. It's not upstream, but we replace U-Boot
> and TF-A with custom forks, as well as provide tooling to prepend
> meditek-specific headers for the latter.
>
> Best regards,
> Roman

Thanks for the pointers and the mt6768 reference, I'll check it out.

Best regards,
Alexander

