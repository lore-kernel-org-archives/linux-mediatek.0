Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BEDC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 18:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVed8Rnvfq4FjlwRD+WfoxppllbH1Oh7uX/fYAJ28JQ=; b=4ASK7XsnwgUKj+YBAxeepST5gd
	PJW+NNs7GsSikPRWPIayD/w7NmHiODvCgAkPUwAWyt0zMqwF3n3rTv9doZPb/KxnjsCoszE1juNkd
	rNZxFVYn6aNvURv8+oWKlQlXVF/zGT8AAK3hJUNc1V51bduCuoA1iFFZ/qohgJN5VrqeO0zrxx2fd
	QSfyxfr+tsHVkU7oJvBeIcdKfpP9VrDnY8ri0dR8VhTKluu7bQJl5WirnKbYk1Iae7KF6Zzl+x3Za
	qb+PFOUJM7Rxg56xUiV3TW7oZfUt0Qq6mKwiuhcNVXRxdg/Y2h1/bvkFD2ng//8N8mQ7bmoExwPAa
	OTMGXHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKjY1-008iiS-0y;
	Tue, 02 Jan 2024 18:31:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKjXw-008igH-1T;
	Tue, 02 Jan 2024 18:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F218BB80C07;
	Tue,  2 Jan 2024 18:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB0EC433CA;
	Tue,  2 Jan 2024 18:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704220282;
	bh=a2nksk6kIBPxDGBv3UGxAQM7iBjL7hf0hbNNRAGystg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eEv45m5kFoRQ/7gQWJ1sqsuCI3uLdd4x6RajWHJLuydDWfnRJkRgWeHZoX2tnol1f
	 CeCsC4jfMxqtijOSfUAzCJiUcp0CJ5SIDfI/Cf80JujlnUhVJkhMZbkeU/xIP3VJBs
	 sX82tksg08IZOae+c4ufqN1Ll0Ju+haJb6dT5bh6417y1qI24e77k8jrh0yzTDV6C3
	 XVG/h2M3ZBwuKFmhdiu633fMR08EFaOh0axrjnBoz+1JXic4iN0rwPbF7Ou8u4zH/B
	 n96uFjwY6kZrqkqz+E1gyk6k2Ba2IgiOBEWeVeRc41AteZ8IcM9QTwqoh6+GXDuqZb
	 FHSOKBaX8WTWg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cc9fa5e8e1so104053751fa.3;
        Tue, 02 Jan 2024 10:31:22 -0800 (PST)
X-Gm-Message-State: AOJu0YyjhnFE2xjauPC/zUCSXdAovN6nDf8rRKFuAPeKMfgZWqENF6GL
	VR4Hwa7vF2P722h5UYSmZrS+9E49CUfcByCotA==
X-Google-Smtp-Source: AGHT+IHcaSoyRt5IyzuibmWh/dkkmcEzUUJ2eE6UdEpzS4Cis2MFZeEfvXQ3c/lHwNcUCtoAWOKO6fNIjTfdWYhMEJk=
X-Received: by 2002:a2e:7816:0:b0:2cc:f1aa:8a3f with SMTP id
 t22-20020a2e7816000000b002ccf1aa8a3fmr2707582ljc.88.1704220280569; Tue, 02
 Jan 2024 10:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20240101114432.28139-1-zajec5@gmail.com>
In-Reply-To: <20240101114432.28139-1-zajec5@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Jan 2024 11:31:08 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+hpOS-rdOYasJ1dzU6d_vVDWv2CseRhYmNHA2H_p=_pw@mail.gmail.com>
Message-ID: <CAL_Jsq+hpOS-rdOYasJ1dzU6d_vVDWv2CseRhYmNHA2H_p=_pw@mail.gmail.com>
Subject: Re: [PATCH RFC] dt-bindings: crypto: inside-secure,safexcel: make
 eip/mem IRQs optional
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-crypto@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_103124_814141_3992E482 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, Jan 1, 2024 at 4:45=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmai=
l.com> wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Binding for this cryptographic engine defined 6 interrupts since its
> beginning. It seems however only 4 rings IRQs are really required for
> operating this hardware. Linux driver doesn't use "eip" or "mem" IRQs
> and it isn't clear if they are always available (MT7986 SoC binding
> doesn't specify them).
>
> This deals with:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000=
: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too s=
hort
>         from schema $id: http://devicetree.org/schemas/crypto/inside-secu=
re,safexcel.yaml#
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000=
: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
>         from schema $id: http://devicetree.org/schemas/crypto/inside-secu=
re,safexcel.yaml#

Which platform does the schema currently match? None, because the
Marvell ones get these:

     28  crypto@800000: interrupt-names:5: 'mem' was expected
     28  crypto@800000: interrupt-names:4: 'eip' was expected
     28  crypto@800000: interrupt-names:3: 'ring3' was expected
     28  crypto@800000: interrupt-names:2: 'ring2' was expected
     28  crypto@800000: interrupt-names:1: 'ring1' was expected
     28  crypto@800000: interrupt-names:0: 'ring0' was expected
     28  crypto@800000: 'dma-coherent' does not match any of the
regexes: 'pinctrl-[0-9]+'

(28 is the number of occurrences)

The existing list of names defines the order AND index. Since there
are 2 versions already in use, you have to define 2 lists.

>
> Cc: Antoine Tenart <atenart@kernel.org>
> Ref: ecc5287cfe53 ("arm64: dts: mt7986: add crypto related device nodes")

Not a documented tag. Don't make-up your own ones.

> Cc: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/crypto/inside-secure,safexcel.yaml      | 2 ++
>  1 file changed, 2 insertions(+)

