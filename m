Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E7FC001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6m8JY8xlL5lafnW2mrv8zTKCgyIbG7vfy4wiqcsH9M=; b=znw8fGgIShvKyAjwXaB/cwRya+
	FUEJ5hsGnFxhD5ju6zdh0w9s027vnAsW/XG8GCD6xr+ACDvS1OX3HU9Tfr+JcpUVfet9GSzl+0I7U
	HZpgBknqBBvzdAwwwB9ziCkjmFPkCxSAIpugJBSJbjmok9l3yH2VY/jcYshD1jnOdJQwXeDpScG8o
	QRuszXDNQ0/ahm2BYwZ2CT809esSl+jgMFU1K0qWQUoSubvF3UCbV9SxfK6at8sbz7uf/B4nN8bSv
	5ZI7OQC9ZJrwfsdZDnF5KU7mYTqpbApO3NJUP5Ip2NZ2O+Ko0QWGSFhBRyWXomuYZsD+OkLijKqlT
	ZJpdfJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUSZ-00GFJf-2Z;
	Mon, 31 Jul 2023 15:05:23 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUSU-00GFHU-0U;
	Mon, 31 Jul 2023 15:05:19 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1bb7a1c2fe5so3289319fac.2;
        Mon, 31 Jul 2023 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690815910; x=1691420710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6m8JY8xlL5lafnW2mrv8zTKCgyIbG7vfy4wiqcsH9M=;
        b=rUNj22zwZBzunn/Ajoq/i5m40v6g0aCboJZnvwEo4kIsNVkvJS6n+ZjgbTRcq0lBTG
         Q2LbRbSblCWiuDUMnEB8QD9YGEg/47qwm1srgYQGyv0C5kPjkil57PK9O60q+t5o6xRz
         Ias1ysIofuAubayAYm0CDiiGjRpUnsAIEgmhwTgtdpXijeFaehkt4bOiqLVorQnclk05
         sh63gX1w4FwJlt9WhXISfyF3dF8hbphjeWjr4x4q47uu+F3cWue9re/LNjEvFxCtoDnf
         rWgHjkLmuCTxx7lBZRAVzp6Tmx1u44URkRSXjCU5Bm5ZfgtFmHIFTL+m9hhjq3eHr8l0
         QVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690815910; x=1691420710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6m8JY8xlL5lafnW2mrv8zTKCgyIbG7vfy4wiqcsH9M=;
        b=PPRgtWedgvasvwIATEWic87isWT6dqGDljcYDKWTZ72aLv2OGKZ0mt8iTFHhpYhgxd
         9rJIHUmUQrSt1N5egxN787DhcKFAD9doQn9ghr+OxTOzAPPHg3Pr9yZzbt9rook9kkoz
         MzxjKIWKXEVyPNEI5oX9uTuQbQC/aGjXgjFXq23FG7XeYHYx4A3s4Oni4hH4M0Iz99ec
         /BidDPZPeEaA5Skp6Ua3HpFO8pOfsrP/9h87WYcf7MKcKWYUMwR6qc1GGQ+zR2eczMDe
         GePG72CJiy7tGFFg+YfPHxHeCE0lfKt7EaSH8SiONX+VakuqDG1UAWiDDvyoaDZz/DN2
         ipRA==
X-Gm-Message-State: ABy/qLaHPidIiS2MBUpNcvBh4Kj1c91um57MARXSOIvNXRtKky85rT7B
	9+mhdNeAqAUU22R9OIUlRZGndzpvh6k/XtXIc/M=
X-Google-Smtp-Source: APBJJlHzJxErT5OwsIf3L0CIAEkHW1mfa5PTeh4zgx1s2WO25NgFeHjAtK94BgN2qYOHeThl/TN/0rbuvDCCIpD9Zfk=
X-Received: by 2002:a05:6870:148b:b0:1b0:4fc5:2e4b with SMTP id
 k11-20020a056870148b00b001b04fc52e4bmr12603538oab.9.1690815909642; Mon, 31
 Jul 2023 08:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
In-Reply-To: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 31 Jul 2023 17:04:57 +0200
Message-ID: <CAMhs-H-ZES+O07ZbY37xVWqQ0f4YmmR5mz6BGvv43iXz+me2Mg@mail.gmail.com>
Subject: Re: MediaTek Frame Engine Ethernet: does it need any resets?
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Network Development <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_080518_193484_B7CE3DAF 
X-CRM114-Status: GOOD (  15.78  )
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

Hi Rafal,

On Sat, Jul 29, 2023 at 1:55=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> Hi,
>
> I'm trying to understand MediaTek's Ethernet controller resets.
>
> I noticed there is sth fishy when checking dts files. See following
> errors:
>
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: resets: [[2, 6], [2, 23]] is too short
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: reset-names:1: 'gmac' was expected
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: reset-names: ['fe', 'eth'] is too short
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: Unevaluated properties are not allowed ('reset-names', 'resets' were une=
xpected)
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
>
>
> 1. Binding mediatek,net.yaml
> It says that when present, there must be 3 resets: fe, gmac, ppe
>
> 2. mt7621.dtsi
> It specifies 2 resets: fe, eth
>
> 3. mt7622.dtsi
> It doesn't specify any resets
>
> 4. mt7629.dtsi
> It doesn't specify any resets
>
> 5. drivers/net/ethernet/mediatek/
> I don't see any reset_control_* code at all
>
>
> Can someone help me what's the actual case with resets? Are they needed?
> Are they used?

At least for mt7621 bindings have been released after the ethernet
driver. The driver uses directly register offset for reset through the
system controller syscon [1].

Ideally reset_control APIs should be used since there is already a
reset driver for mt7621 [2]. I don't know about the other SoCs.

Hope this helps.

Best regards,
    Sergio Paracuellos

[1]: https://elixir.bootlin.com/linux/v6.5-rc3/source/drivers/net/ethernet/=
mediatek/mtk_eth_soc.h#L495
[2]: https://elixir.bootlin.com/linux/v6.5-rc3/source/drivers/clk/ralink/cl=
k-mt7621.c

