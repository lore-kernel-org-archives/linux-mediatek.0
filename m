Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BBDC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJL5K69YJwMyRvtOMJi4GxbKjX0eSbFmhEkg7WKURnU=; b=af0BIDILHsgCUVSGbbFZslt6BN
	tWdcS84qImmlqgHL6nMNzMOpbY0zh6rwPIyrhcAhZ4kFDrG13v46jTo2LCbFI83bwVTBDLgy9nSGW
	wDdvnmdJjGq9nOhSgSM/afXGoeL6tgNlAwjY/fTH3Bsj2oH/SDeFsng4e5sL9B0LnSERdhyB3GQgo
	gIv/Vuiro7A97cDgKWssiR6S81hSgH36Z3SW29ZAFjXD35sDJs1Ihtq7IHGC97CINX/UHJPnyJ6ZU
	6LvKYdqWGYllTopu7m4SE75pm2qvvHccaZqOlVh8cv94+OGR2iN8nTFxqo3saWtxz7o6L/pmSwERS
	fxzvAwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuYM-001apm-R8; Tue, 14 Feb 2023 12:36:58 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuYC-001amg-2R; Tue, 14 Feb 2023 12:36:49 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-169ba826189so18819755fac.2;
        Tue, 14 Feb 2023 04:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJL5K69YJwMyRvtOMJi4GxbKjX0eSbFmhEkg7WKURnU=;
        b=HiWiW+1FNLvngvHXGPGTTyQReRlpi5+VmnxdX2fOjA7JhT+goe4q94ikaxLYW3Wxlp
         oA6/PHSvCxL27z2GcbTzWv0yu4pvpBjws2slq0c1qSZ5ASJwGmoMuxj3qiYZS2hV0a/B
         +amExfxMxtiSQtDPjEg31NlCpeMoPBJMzsl6ResWSONUIDrcjY6iR9HoAnoqn1C0/dSe
         w9Mazep/7nEI2zNAwZ9a2CZ2hCdjW1IpvdQXj4RwUhXyiF+xtJi8tPIHHshVaRwR/U5k
         Kgti70Pke7DYzYndmGMz7tx2a2T9wydYM9gHBZcgSA2TOF9fIU3YEHVAMzOcRKskE+t2
         yvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJL5K69YJwMyRvtOMJi4GxbKjX0eSbFmhEkg7WKURnU=;
        b=1CVanPV06x9lM1KBeHe99rOEU+lyQY2pe8QWeIRUiHRGUQNuNV/TIvYWXS0ngbH0uy
         OiTXZV0BHy9NBXFEQTBNUGQ48dAjO8Qh/B40zKATobBpy3dG128/ao5akOyfhfUxZ6DY
         jcjHD7P3lXCJl1U+DwlMZy41JCP8asqfhn+2+ziBibIgA1lsumTjfgQZns/Wdy9TcG4h
         oIofye515W3SKIVRJWOr4LI6HqHHWh0UMgsQMa8VIrwLBuZAWFoJDlw1ls6E+SNym2/4
         vskgs/NAiAm/Ds3cjtHYqK3IKIQ657mj0LFSHcDaYJP/Is2l0nCMMpjcc63R7uEUwRPG
         M/0g==
X-Gm-Message-State: AO0yUKUymJc1PRDJuTkTCK8Np407uY+u+Thl5DODy2+qlsO5J6e37mgK
	oMDJezkI1OglUbAbJIZ/fKF6ydV/NhibaeN7Ri5n8SkWeSrqbg==
X-Google-Smtp-Source: AK7set/ui73MqjM/LBXHbhjS7LdN5n7I/PH1AsVMONXqx0J/1osuqMLm0+lpnlM6co4pizPFkKG2dwdvt3PaxYfeDNg=
X-Received: by 2002:a05:6870:9615:b0:169:fabf:b222 with SMTP id
 d21-20020a056870961500b00169fabfb222mr3883945oaq.83.1676378206354; Tue, 14
 Feb 2023 04:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20230211104915.116253-1-arinc.unal@arinc9.com>
In-Reply-To: <20230211104915.116253-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 14 Feb 2023 13:36:35 +0100
Message-ID: <CAMhs-H9YCVe9AKQDv0DrdceFmV1SSOdM-twq65uNdj3+gE677A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mips: dts: align LED node names with dtschema
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
X-CRM114-CacheID: sfid-20230214_043648_134019_CA22FA53 
X-CRM114-Status: GOOD (  10.24  )
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
> The node names should be generic and DT schema expects certain pattern:
>
>   mt7621-gnubee-gb-pc1.dtb: gpio-leds: 'power', 'system' do not match any=
 of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  .../dts/cavium-octeon/dlink_dsr-1000n.dts     | 10 ++++-----
>  .../boot/dts/cavium-octeon/dlink_dsr-500n.dts |  6 ++---
>  arch/mips/boot/dts/ingenic/ci20.dts           |  8 +++----
>  arch/mips/boot/dts/pic32/pic32mzda_sk.dts     |  6 ++---
>  .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  8 +++----
>  .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  8 +++----
>  arch/mips/boot/dts/qca/ar9331_omega.dts       |  2 +-
>  arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  8 +++----
>  .../ralink/gardena_smart_gateway_mt7688.dts   | 22 +++++++++----------
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  4 ++--
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  | 12 +++++-----
>  11 files changed, 47 insertions(+), 47 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

