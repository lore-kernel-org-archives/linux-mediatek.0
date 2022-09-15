Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA150ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFkBesRwfqcj3CX5Iz3LowXdYgUQd9xk42DDWFH6z/U=; b=x+bm0g8flKNPmK/b3g9LFs2+uJ
	65925GNu/rUSaJ9MKnBwXg+5ijmnlsXdJQqO0cuc/QAuhTO2nRmAFaOYQPsTxTpXDNumt0va8yTms
	jBJLRvixF9IOM1XfRg+47uP0gkE7u3ZFvGZfDmnNKZuEzDsscF6O/wo3EWHxjOq4I49iArTU3rCVS
	NXMFTq7AgAwUuQWu76tz66+Nbt02Ryr+n1yrjs3PJviYcueW6n/+jyO+F75KSurIejmHJ5jihPi9g
	FNtaaNhKstZHuOaKvVKEoNJ//T5JsK7JQLdaiUoVliJl5/aaq38+Oa+vX32VCa2f7BUq5tYWg5uUQ
	zF2tyPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYfRi-00GcSe-Sy; Thu, 15 Sep 2022 03:21:46 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYfRY-00Gbyh-7l; Thu, 15 Sep 2022 03:21:37 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1274ec87ad5so45753135fac.0;
        Wed, 14 Sep 2022 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=wFkBesRwfqcj3CX5Iz3LowXdYgUQd9xk42DDWFH6z/U=;
        b=ObM2/plyRnLRqerAadJfngGyddnsH7s6dgOq2cT0ktxpFo0XfRu0J1+0F2FpFWlNxM
         OX/RJnXBuaDizTG9vbIrPbPx/PSZ+SUoL6cJIk4JIV9N04pJT/j6wbYqXVPDMjFF39eb
         oLecX6dZOcRicCm72+/m5DTP6/nU/r2ymbWD/FhVubnFXas5KKyeHYFOiz0v2poAaLAX
         9V5e9Qf74MA6NTXmDkBU5gXxC5m6BNdYP8iYyFukqFAYxhHEBEGP/WS1MyNj3H1EsTcJ
         uymbx+4999P1sIogKfeJPd9GtBCGilv2bfaUdma2YXCFPBIA2BjcJyQ6UAkHkGz317W5
         znrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wFkBesRwfqcj3CX5Iz3LowXdYgUQd9xk42DDWFH6z/U=;
        b=yNFqCI/myq9FFSM02IGLE2iQbcTKJtWZ+birYaYqQdGlVQ5KByi37fVqikZQo374Rx
         0YMlQuF3Kypr7XKsIdwXBO8r0bFYliuAP0iRk/f0jMX+RTlgodRa5ojGk3XoU0CgmI7I
         WKx8cPk8dHpqZb2/srTL0xzRpbyyEpAPY3sdOnHIHUtu9TJXvmt42RcBEpy1vMht/sBK
         j7Z9wzjt2UseIKfR244LzQYEQZErhysQaFCnvJTFj/PeeJ4o6yGK/iUvymy6kT0lPy6w
         zo0oQDjIH9QUnJeCy9kQqaUsnBoA4gxvGfbgZXe/xWAYGEd45cQn9PsQI6YkSf/91ET7
         X0xw==
X-Gm-Message-State: ACgBeo2avbOEriE9lvgvIc+I51rTvJRSn4Zuj16n2RGPq8+g0OeZqKbE
	pN8ZP4scXpsq1K0LxBElq1C482hTWLZ3V7uRFu4=
X-Google-Smtp-Source: AA6agR72umOG1lwIjilq8Z+bXLoz6rwSEVoZDQ4luKpynK6vC6GFvDWBy92K6048ExMF+/eov5V8X4fmSHo++P6n4bw=
X-Received: by 2002:a05:6870:c0c8:b0:101:b3c3:abc3 with SMTP id
 e8-20020a056870c0c800b00101b3c3abc3mr4119832oad.144.1663212093765; Wed, 14
 Sep 2022 20:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-5-arinc.unal@arinc9.com>
 <20220914151414.GA2233841-robh@kernel.org> <44045164-692d-c8f5-3216-b043fb821634@arinc9.com>
In-Reply-To: <44045164-692d-c8f5-3216-b043fb821634@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 15 Sep 2022 05:21:21 +0200
Message-ID: <CAMhs-H-0XV9ocrG3_MuVc3Q=o8HnYso2CqUURjVR3OMc=dAMYg@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: memory: mt7621: add syscon as
 compatible string
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, erkin.bozoglu@xeront.com, 
	netdev <netdev@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_202136_325357_A00AD45D 
X-CRM114-Status: GOOD (  17.63  )
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

On Wed, Sep 14, 2022 at 5:19 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 14.09.2022 18:14, Rob Herring wrote:
> > On Wed, Sep 14, 2022 at 11:54:45AM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wro=
te:
> >> Add syscon as a constant string on the compatible property as it's req=
uired
> >> for the SoC to work. Update the example accordingly.
> >
> > It's not required. It's required to automagically create a regmap. That
> > can be done yourself as well. The downside to adding 'syscon' is it
> > requires a DT update. Maybe that's fine for this platform? I don't know=
.
>
> My GB-PC2 won't boot without syscon on mt7621.dtsi. This string was
> always there on the memory controller node on mt7621.dtsi.

The string was introduced because the mt7621 clock driver needs to
read some registers creating a regmap from the syscon. The bindings
were added before the clock driver was properly mainlined and at first
the clock driver was using ralink architecture dependent operations
rt_memc_* defined in
'arch/mips/include/asm/mach-ralink/ralink_regs.h'. I forgot to update
the mem controller binding when memc became a syscon so I think this
patch is correct. I also think the sample should use 'syscon' in the
node name instead of memory-controller.

Best regards,
    Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7

