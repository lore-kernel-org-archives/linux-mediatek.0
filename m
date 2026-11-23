Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F4606A327
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vOsBGsAq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+SC12mi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=; b=vOsBGsAqbvil8c
	zaD4WNJNzEgOhCFuO1jGM/jwLtCWwPnaU1Y9ZLAm/MCiCZGxehR8AVgPjCit78iTPYVuTEXnYeeD2
	jCXJ9FyUNoGEnwv4aZkcBU1SotHznqWyUOZ0jyK8V6aKPN6rFzcHXvZHxhkpVxsY7TvArlllFlJ7/
	hg0kfo9p1zwG5mmUqjU/MmtclqOLF28c6cQDMp8p1lRVSgRx+91cCHM11qQAcKXoylFIwHdbeAb0z
	c2spllllS6ijjfa2o9/fmeABxDMESbyo9RpBzkpuiFYQjNr+YCXkqVdH4Ziickhltynm2EGAHA6Dm
	FND+4IjYHsb3ZyXz5hUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVShf-00000003GCr-19fD;
	Mon, 23 Nov 2026 11:59:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVShb-00000003GBO-2Ar0
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:59:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so3936582a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435157; x=1796039957; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=E+SC12mifgLLxpWaAho6n9AlQnnzNaOr3eLRAjNi8O/uBGDONqvjreHUIVemII6zt1
         IbTHGObqrJ/AcKN0Wd9iLuNPyc4wUMwdkxjC2i65TaVcao1U8hanG7EI0UmPtN80nrRq
         5t3ou277FsdXmcg61C543ZN0tkinonoNlIAx33reeKR+MOwrCLux3sSDNxY2QFz+s8B0
         dEQvhwPDqi0EN+su+hwn004hjtbKI9KOoMHL0TxhFIx0xx4IIPkw5eZIES47iWgxpKK9
         RBf8+mpPiH74e/lahG71gA6m7vYqwztiqESk4ZrOGsMr7YDYVFBZgoajeb1yJD5QU0v8
         vRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435157; x=1796039957;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=La50ovpqbLcu1PwBDpdUDFv1cRjrY90Paas2YM1iIXHdybl26VNvonZrXqYes6ya00
         FxI8HJ70cv4NIX+2igYMQloIKcKVagW9Bos4YmSYVedY5zi9qbCPwyIeOe1BUVIDwk9r
         3HsyPzWw1bw9exlLlX/VdJWgK7WmKTn/7zPnXWBreT4M5Xm3azx/Y7ZYNnePPUi7jK4X
         AFOXnUB7sw0xwp1w+3ySPev5L2laT1WMzwKa6rnhLTln7OXEsBDM7EnKkdKrNFOiDEzJ
         opFiBaP+ZJAgqMTePfiycQdiZJtXzD1LFIG8BLhUrZ1ubrXtxB00PgY/BI9KEHGAm5M4
         Sy5w==
X-Forwarded-Encrypted: i=1; AL+hErF4+qUtrkpn7cbW3VXzOp65n0vY0jq7Ogq2kSQQb70z8frfGYA29hE4eHdHEGjjTs7Y/RQCGablThUpPopJrQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/dSTEfYEuLAFrStq8Xc7kxn3i1GIC3KRuzke7P48FWGWlZ8YG6
	Jy98r4HkLS6NgQwm80FCUHeTP02Oc65cG7BxHwdoeY6CvduCBJdA030y
X-Gm-Gg: AZFdTZfwbGrcKFiJ41UjAqGx42Nfd04oYzj2+MhxBhXybxM2D44rt3PysNAXcwuw7r9
	cH+oNSw4Zgi/sYnPyO5tSKIt8eCf6uzdM6vmShNGoZQKFPNK8yW+UZEC7LQx+6Sz2NRaPDQuliO
	gnpgVUOZe/b+JtNqBLmp92j/fH9FaGYRhVOk8qPpGzvk/oaBX7pE1g09pHWodW3hLVEyp3yT/XI
	C/Jy7zV42rTXDsfJXGlrDcrRdWQTIHfyE5hCIf/H4J0YTyydLGZ08icsAhWxqjLxO3gpCNb8bpP
	S3SMj2YbbQfZTlzKqZXeJ24d0LzKVL7QRp0gfIk47Arq6tTVWpuIhOv3CIhOek6+DQJdNmPZgYg
	I8iIiaXqYA5PbdIQeAz4QwjuLChTYJYB28QGWz6z2ISETQ2pf93MoGudGn9ehYoo6XXfz+oZWQK
	fguN/tMprrkZZD6R1e/myZBaCP09jnhWpfEa7q0HYuCeu0rM911X2gumFhrVUkiqCCxMfKGxGAR
	o71z89ed8kXJb7t/BhYljLVunJgj4tKYGh0eRJ/6czsjr1VANZS5HnXs5R697MkoRTKlPQ3Q2Tg
	ZQT8RUR+Ju6wQIo8CK/uosJYv9OHyCtJWtGsqV8hDdWGiEzPc8IGIzOU
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id a640c23a62f3a-c513a5da8d0mr870341966b.12.1795435157410;
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68a9asm395946466b.30.2026.11.23.03.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:59:13 +0300
Message-Id: <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com>
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
To: "Roman Vivchar" <rva333@protonmail.com>, "Alexander Letuchiy"
 <asalde.le1@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>
In-Reply-To: <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_035919_573805_4CC531B8 
X-CRM114-Status: GOOD (  16.69  )
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

Hi Roman,

On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
> > Bootloader dependency
> > ---------------------
> > This was tested with a modified LK bootloader that is not public.
>=20
> How are other xaga users supposed to boot the kernel? You might want to
> port uniLoader instead, or if you're on an old enough security patch you
> can even replace stock LK with U-Boot. U-Boot chainloading is also
> possible.

Right now I am replacing the stock LK with a modified one that knows
how to handle mainline DTs without expecting downstream Android nodes.

In an ideal world, I would like to replace LK directly with U-Boot as
you suggested, though U-Boot chainloading or uniLoader are also valid
options. Luckily, the security patch level isn't really a concern here =E2=
=80=94
xaga is already EOL and hasn't received official firmware updates for a
while, so LK replacement works across the final stock builds. I
definitely plan to look into a proper open bootloader setup for other
users in the future.

> > Firmware behaviour
> > ------------------
> > Two things in the stock TF-A affect what the DT describes, but not the
> > DT itself:
> >=20
> >  - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
> >    The vendor kernel lifts this earlier with a SiP call, so with this
> >    series the idle states only start to be used after that time.
>=20
> It might be worth porting upstream TF-A too.

Agreed, upstreaming TF-A support for MT6895 is also something I plan to
look into eventually, which would let us drop the reliance on the stock
TF-A quirks altogether.

Best regards,
Alexander

