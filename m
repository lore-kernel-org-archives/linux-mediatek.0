Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC2EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfYFC820D1pbCMtZYZeXrcP8yknUOsnJ9X0l99RKhzM=; b=BIMvVZe5nUvURBIkJq76hNpx4U
	aSFfShRCi5eS4HN2IGIhjGEKvIUS69TEh/sjStsM0RtQTqEJQW77enYT9XQhZ2HaF5nnce+j8xcTP
	xJgGmNIaenMeaiFdnHJrBbaLEzYpWjAiXxpdk5bCxyjcgdbaULDtbN/gsWGPlIsjCvtsCzIE14W2N
	udzOFrNRAAWFXtY+8yv1uPVkENuYcD6qOi3sk3cXDPe3WJBbUhq/F93IQR936oTKB90jPrTdwqlSt
	8EU9juvoVkqTTBFMzXc53Brxbh6xdWue02h7ZNU+kyMzOjX5vZiZo7jZAz3+uJTYXq4iYZXlCvmwF
	FMN+hNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0JK-005XUa-1F;
	Wed, 19 Jul 2023 06:05:18 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0JH-005XT6-07;
	Wed, 19 Jul 2023 06:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AfYFC820D1pbCMtZYZeXrcP8yknUOsnJ9X0l99RKhzM=; b=SejWfNIypGD+M5IwBgjIwm1T48
	UySmEOtCX470evRTmq2WmhzmbQdFszFvLg2RB1KKhF7lo/QxQ1vTA3qzAgG7fmhSWvuw4nA7GQDed
	pSsdS4GiEkqLiqdWdGxec403z70bf2fKqCo1nB37Hw0k83k0+mSBiZ+5q1bqiJvAbrAZ5FJNo8j+B
	Yfpqs5LfA56XnndeuFA1T66XM6blWWXu7TOxP3lmCKspgNCa3OMuiZseOv30wxOSnQCclq+wefvOF
	az/bxtadtOW4RhJpioPTCjIImhTPwhvMId5N2AKIALe0++0OHhhVtUvC/19up56qePISrDFR5P4k5
	CJZVyefQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnTq-00Bkox-1M;
	Tue, 18 Jul 2023 16:23:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 583146167A;
	Tue, 18 Jul 2023 16:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1FEC433CB;
	Tue, 18 Jul 2023 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689697365;
	bh=LTwHVSHoaSY0tlwADIKNZZi0zXhTwVVUMhY+CaieK9k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tYyRPzjcP/blsFXVIkoMhFfiWwoiKxiqpWe4Q7Ru8t6qZHyBK70jkwM4aOI/VWmi6
	 tzCrBR0K6oN6zG/6g1YLsjNLkVCgxEP6hj95cauURLHV+XpSENn9fWVyYhdQeFAZmM
	 7vJyS+sb6E4/kanecZPhRtT5DK8pQouPIlx8NjXNh0qLTNx0wiHxtPr+cqjmTZNDvY
	 EtEts9aaCRP7QIstsaZShNP6DNG0zNogM1uxdtQIUzxb37C473mA1SjtPnixZhm2Qd
	 WAagwGDbjkVLuqzl3RETia988eJnBp36/QdkDyf2zIpRv5R/sgF6TWZBAdNum3F3LP
	 SEXvXPa5ZiJ/Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b946602d64so32377641fa.0;
        Tue, 18 Jul 2023 09:22:45 -0700 (PDT)
X-Gm-Message-State: ABy/qLYBTgB9zlkzH5R+GSLfPplynArsGYP9xKX5lV9MSbB0UdaZ6TAf
	NYB6NVFRXsHI7fZRlmL7jLs6xJmHjz76WE2Xaw==
X-Google-Smtp-Source: APBJJlErUqDENNI/5mOg1Ib0IoWsKzMqqGjhDh5AeFCFGhdxHxjAXyO701/QGQfWI6nmT6Ma2dedRQR82oM1goiArg8=
X-Received: by 2002:a2e:3618:0:b0:2b6:ddab:506a with SMTP id
 d24-20020a2e3618000000b002b6ddab506amr11118264lja.34.1689697363824; Tue, 18
 Jul 2023 09:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230626221005.3946136-1-robh@kernel.org>
In-Reply-To: <20230626221005.3946136-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Jul 2023 10:22:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGULS8nrzSHGUJhGzEVaMB+hn6_XEHmSWb3tBHmo6tPA@mail.gmail.com>
Message-ID: <CAL_JsqLGULS8nrzSHGUJhGzEVaMB+hn6_XEHmSWb3tBHmo6tPA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Fix "status" values
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_172318_703395_5942E3CF 
X-CRM114-Status: GOOD (  16.26  )
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

On Mon, Jun 26, 2023 at 4:10=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> The defined value for "status" is "disabled", not "disable".
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Ping!

>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/a=
rch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index e4605d23fdc8..86cedb0bf1a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -585,11 +585,11 @@ &pwrap {
>  };
>
>  &sata {
> -       status =3D "disable";
> +       status =3D "disabled";
>  };
>
>  &sata_phy {
> -       status =3D "disable";
> +       status =3D "disabled";
>  };
>
>  &spi0 {
> --
> 2.40.1
>

