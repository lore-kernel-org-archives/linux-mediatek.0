Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED7C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5m5UzpJlRLvwZeV0suPAl3MejkzVUOiX3hWF9GgbnY=; b=1ckzThmMg3c8DnVQ1Y+zxucpXa
	MRvpIr903dHD16lt15Z4acnlwK2HU5MAl4R+J/xO8T4/nDrzxJXFU3u/stKxJUiD0H7d4sLcevsxb
	eJ4ZHWnLk5Y8V1ZAdsRJ4Hai857718KoyxzP65xwXK/Qe63JZ6vgKgFfv/CP46HK8/97tW/zZhoEf
	B+GkQw8ued/je26mfouL09ajG3xU90He1nLkpmJDnH6hMKWmqJz9nBJ2CquvGXRfNZoCHWAC6LKdb
	efd/mwKVfDb3KuCCGFq3BN8adkCtHKRouLjbPAFxYnBoMmK3F/43HsOnsuSnYb3yynVd2loX4jGft
	kJhRrwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE5B-003tt3-1j;
	Wed, 16 Aug 2023 10:48:57 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE56-003tqt-1r
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 10:48:55 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6bca857accbso5385968a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182930; x=1692787730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5m5UzpJlRLvwZeV0suPAl3MejkzVUOiX3hWF9GgbnY=;
        b=SIZLCfPs9aH+YpE486zaXOdb61mkGGRDh9Y8KutGAeY79M/EAAssMwEC1dEJFKORid
         aS8a3Nq4ZpKa0X48K9jI3bApIT3qdGNFG7llYR2u7+sipMAY5fnjL83o6jOE/lWM+g+W
         HhSkWp5jOVUkOIpugI9BUetX2MdSzoOqA3U7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182930; x=1692787730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5m5UzpJlRLvwZeV0suPAl3MejkzVUOiX3hWF9GgbnY=;
        b=H66mwTh1HWxl2hWHSvkE59EwAG6AAVIwVHCe8D+gWgpbtcBKGO4TjL83I+LLme7sII
         j9EKQLgjYArzuZissrtge9WWykllNRslNZLp5D7kDMQicTNT2l9PAozYYJUXH63kG0aV
         7zkD28TDhnuu87Em0Q7odVBMw/w+E6AQwpdF2Fr4Wpn36WyWjFJUQtILGHG84PGKxJoh
         vPAvFnE4ZR3Uwi0yxnqG0cSl8kW40q+fu+p5s0jhb8ybt945xrrd1fO8sUPv8mxXoUUq
         wLawZGYSIf9cgmmGWj4C0DT41pYisRuY33TZXvQGbznvVkZde7f9s9pVuvwYDyY0Wk+4
         8ujA==
X-Gm-Message-State: AOJu0YyslhfGjA3LftIQ8+ac9rfksPB2TpuWNgifsJhEtDfof/pTWWHJ
	LUmvqNW2dE/v49/Qh2pK8N/9PVcuo8qcDkcdPQImFw==
X-Google-Smtp-Source: AGHT+IHw+Hn5+HaHJOx4yIHLzCbxLXGJi1570SOwBYj4CutbHBvqVodnckZLDA7MEapvrG2f0e1muho0h/AXY5oEx2o=
X-Received: by 2002:a9d:77c9:0:b0:6b9:1917:b2f3 with SMTP id
 w9-20020a9d77c9000000b006b91917b2f3mr1353972otl.33.1692182930471; Wed, 16 Aug
 2023 03:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230815154412.713846-1-hsinyi@chromium.org> <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
 <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com> <fb85c288-2ea9-3343-ff19-cd58940b44ec@linaro.org>
In-Reply-To: <fb85c288-2ea9-3343-ff19-cd58940b44ec@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 18:48:24 +0800
Message-ID: <CAJMQK-h+j-uFvqqC9-ri_ciTBV=v5F8u2u6SBSArD8m+dONFyg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal )" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger )" <richard@nod.at>, "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034852_626313_032B2804 
X-CRM114-Status: GOOD (  23.08  )
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

On Wed, Aug 16, 2023 at 3:19=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/08/2023 19:21, Hsin-Yi Wang wrote:
> > On Tue, Aug 15, 2023 at 11:59=E2=80=AFPM Michael Walle <michael@walle.c=
c> wrote:
> >>
> >> Hi,
> >>
> >>> On gigadevice gd25lq64c, the quad mode is enabled after BFPT is parse=
d.
> >>> According to datasheet[1], Quad enable (QE) bit needs to be set to 0 =
to
> >>> use write protection (WP) pin. It also recommends setting default val=
ue of
> >>> QE to 0 to avoid a potential short issue.
> >>
> >> So you are using either dual or single io mode. Why can't you use the =
device tree property spi-{tx,rx}-bus-width?
> >
> > I tried setting spi-tx-bus-width and spi-rx-bus-width to either 0 or 1
> > and WP still doesn't work.
> > For this chip, quad_enable will be set to spi_nor_sr2_bit1_quad_enable
> > (QER flag is BFPT_DWORD15_QER_SR2_BIT1_BUGGY)[1]
> >
> > spi_nor_write_sr_and_check() calls
> > spi_nor_write_16bit_sr_and_check()[2] and the function sets QE bit if
> > quad_enable is not NULL.
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/=
sfdp.c#L575
> > [2] https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/=
core.c#L879
> >
> > Setting spi-{tx,rx}-bus-width still falls to this function and cases.
>
> with tx/rx bus width =3D 2, how quad mode is still possible? IOW, why do
> you need new property? You wrote here about driver, but I ask about
> bindings.
>
This may be a bug in the driver that setting spi-{tx,rx}-bus-width
still enables the QE bit. I proposed another method in the chip's
fixup to deal with this issue instead of creating a new binding
property.
v2: https://lore.kernel.org/lkml/20230816104245.2676965-1-hsinyi@chromium.o=
rg/


> Best regards,
> Krzysztof
>

