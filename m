Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2945C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgtohfWeywZ5iaLHdRCZwUltQwqi6R7eJSFSt3jFt1A=; b=mkkqY1vhzqTb59aG+MlC/MrOwT
	4ahkqemYdhZPTPVs95jbOuUT4LN6V6ePRdTIqPc3aYK3yqNJtUDff3Gftg+Kvzd9cNGwIicaGUrpi
	cyTiRTgcXts5LkXQvNA+mw4K6zsxpGj3+a5tOEcwhddpizbymUuBRc/bMrj8Vcrlagooa3eSaFFCE
	OxTXO2W0y3NSJedq3m3nltXLQqnbP1MIxfXU0+I7rq2qLWVjezCLp0rToXSrMLlVzQQumiJvMZHuN
	nAZy6vFsCRRBrJWiJWD2ekHf4TjSma7zsGSVZCg8WRpxkTVnfsrj+j6tk9t5MQEsWkSM9tiYZM/vC
	DHfxs1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuVC-001aJp-Cd; Tue, 14 Feb 2023 12:33:42 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuUz-001aHn-5J; Tue, 14 Feb 2023 12:33:33 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-16cc1e43244so14522604fac.12;
        Tue, 14 Feb 2023 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgtohfWeywZ5iaLHdRCZwUltQwqi6R7eJSFSt3jFt1A=;
        b=ahSpfx86XqAtB35bv9vGGoPsTo6tRJw76mR/f9pqZP5h4at93ToHPqfDTyaujxVltZ
         Eaeq4YwGMoMFgq5sBAP6R9uK9FGJCoF5BxbILFUoH9jTSuFba91stliOkUWYSizcriZU
         CcBZyHeZiccpZIfU4+Rslmx+q4x5tRv2OA58BhREFE1JoFGirc1DxCx8NhivzUv/TAek
         ejwkNT8SCa/mmHY5WjC7DuXsXHqujkarTBPdeV83IU1FQfj80u9nvShiVEVPKOm1WA9N
         POLQ43bm4XNDmVLZuUyw3DSxGIGd0NXjQ7DV0fZhYQ1yOjfnL3qFaUzYoLEFqcImKnfT
         JxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgtohfWeywZ5iaLHdRCZwUltQwqi6R7eJSFSt3jFt1A=;
        b=ZbTotQO7t5qrmeJt0YloDLyheyf9FJCPS+V56ZYyQ82f+bHskPDh8HCLo48KeECi7/
         vfqJD6GyQdH4WOCM7K1cYy/4gQBwWf7ZqAnvAD5gVMnO8Kf62PDpRcosVdGM8FJzKM9O
         Xi5+b2534YzIGAXwPPIJOFuJUfo8VTI1+FUlQcovFnq7VXWFbgB8s9vcLuIXK1OR76fz
         qvVHlXs/OVML7skSbX3NNbU9xeneR3uHJ8UhWzJYF3kEi/cudQm6Q3PezjfYdHBm/294
         YE27UelECZB44a0z4NSx2xX0vD0LSWXOjN1zhE76J1koejinEO442zfSRJphSofwnroX
         FGGQ==
X-Gm-Message-State: AO0yUKWyLbqXZMv+/tEoS+5SihCcsMzOX1IWtCQIoHb/FRULwuqGa83E
	VA5nZqswaY0WN8DYhEh/dYn0cMkTT0Yth6IL0d4=
X-Google-Smtp-Source: AK7set9VmI1aC0fo8MVkfJmUvsrhVzrosS4PhPHb5s/dRPxRa4h1Qrdsu5DgtiwOBWMoPGqOsYrPiPeQ2DIJtDuU9bQ=
X-Received: by 2002:a05:6870:9615:b0:169:fabf:b222 with SMTP id
 d21-20020a056870961500b00169fabfb222mr3882911oaq.83.1676378007140; Tue, 14
 Feb 2023 04:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20230211104915.116253-1-arinc.unal@arinc9.com> <20230211104915.116253-2-arinc.unal@arinc9.com>
In-Reply-To: <20230211104915.116253-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 14 Feb 2023 13:33:15 +0100
Message-ID: <CAMhs-H-=Xgv-6OVji13R=kJhQr46cn661nL=Y3DwPc4fwZQxNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mips: dts: ralink: mt7621: add port@5 as CPU port
To: arinc9.unal@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Cercueil <paul@crapouillou.net>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	erkin.bozoglu@xeront.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_043329_261219_7BCEC839 
X-CRM114-Status: GOOD (  11.06  )
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

On Sat, Feb 11, 2023 at 11:50 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> On MT7621AT, MT7621DAT, and MT7621ST SoCs, port 5 of the MT7530 switch is
> connected to the second MAC of the SoC as a CPU port. Add the port and se=
t
> up the second MAC on the bindings. Revert PHY muxing on GB-PC1.
>
> There's an external PHY connected to the second MAC of the SoC on GB-PC2,
> therefore, disable port@5 for this device.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  | 16 +++++-----------
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  |  9 ++++++++-
>  arch/mips/boot/dts/ralink/mt7621.dtsi         | 19 ++++++++++++++++++-
>  3 files changed, 31 insertions(+), 13 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

