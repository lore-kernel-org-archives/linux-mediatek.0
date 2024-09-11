Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630DCEE4991
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMM35HUT7miV6QtJLuFsWwf5iXiMbNclaktulBrMxBI=; b=OPu1cVgp83uSZlr48g8Xgs9DaZ
	rXDKjeFu4WnvoTfFChYFk8XOlUFen6OZ3o5RaK4afBtQnhAFAf+qOFAejorp7hEzVZmzXzf0dKq53
	m9xG+l1TxFJeZ9QV2g30SJLPcSunugCmIM0E3yjlzFhipL5zG7xngIqKgr/WtTFjZS77XfB9MmHBU
	T3+GUwQxfJDiJ1cVBwsAf1yx7COyVt2uy6KVqZABBUmHIbzaWl9VogAU7GJPZYl698ew+QaG7DsIe
	Z8XI8zT9e4fvIKDcTGe83oA5kVxeH5MIVYftupEEaIPXfeqV2pMJhZwJRjFhQfhbHlWiJCa9dI4Tv
	CxcaMeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLFM-00000009EjV-0TOj;
	Wed, 11 Sep 2024 11:10:52 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL1n-00000009C9C-3cjo
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:56:53 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-50108a42fa9so1683105e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726052210; x=1726657010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMM35HUT7miV6QtJLuFsWwf5iXiMbNclaktulBrMxBI=;
        b=oEZnozuaH5UKyzl1uHCN9dak+9CB9EXv5NyGCdoIjqqHdf1QtprCpH64eBTQXpCKmu
         wbrIFNQghKunJ5emRHsOu6FSUnus7AiIHOuQDm5zub67bjw9q+CMJGlbTMZGSzbH5aa7
         BAfGV6eGJC2fFDNKd3Hp6wqKA+l6OwZDnKZhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726052210; x=1726657010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMM35HUT7miV6QtJLuFsWwf5iXiMbNclaktulBrMxBI=;
        b=g5/LyInV/rXZKXdBM/ppuMXCvQ4Fem1BVpLQiYDQlisTw/DG9YriUpl2MLAZVKw+sg
         20P0+DWNdp2zCK71+V8GCbn9yzTcHxY/COfqFe3n/tZHsqBy9yDaXGGa1gPCMhfXLMOU
         cyH+onGIGQOR5nWUrVJqDT7YFF0m7fi11G5qoezMKWarNGlH/uWi1faiXRk1qUJCnC15
         LhooVgM7/Hesag8KeRjLkplPy23+/YKGp8DqfWNz5tJrp0b+lRFuus9QkUBUbHwkgbtL
         uAa/iMNqpsNB16uCv1KDeR+lrMaBnH0/+zTnNSY4qwY9VaE6cxtwe/RdlO3v0V0AIIrH
         mvsg==
X-Forwarded-Encrypted: i=1; AJvYcCWxnusu2B0ZmO9B1L2TT4sBtGikOtQcuBb0bIckYZtFcIrg/UK69OUvDvI6hMh0m6FntJWAopWE4219IDGcbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6r2oxbVMxSzDyr0e5yFTWD/EAJw2dG+uC7kVr9GSFG5WrsSl8
	AmfbVlj1cbUfvRnIuqzcSpzpZmTo2pmNcRu9ZRs3Wpky7luzZQm0FWGr5X8MiY+9hPEEmdn3wmj
	LhA==
X-Google-Smtp-Source: AGHT+IG+hlUez4mHADrPs4Z4xwI+VIclYA4NKG7Nyw+LAKQ93DiTi6l6yuKgsdCKDpjC0czXgiUAWg==
X-Received: by 2002:a05:6102:3586:b0:493:bcae:cd0 with SMTP id ada2fe7eead31-49bde184784mr11890891137.9.1726052209943;
        Wed, 11 Sep 2024 03:56:49 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8489ad44a3asm951485241.25.2024.09.11.03.56.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:56:49 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-49be3d534ffso1549348137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:56:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAhIpV744a12hG67ZfSRWKN/M1+Hsrhs9ZA4IzbcyNNvaqebi0G1zlHDWOPyJV9eEjeWyygpC/9dXLSPa69w==@lists.infradead.org
X-Received: by 2002:a67:ff82:0:b0:49b:f255:1779 with SMTP id
 ada2fe7eead31-49bf2551aa2mr6702532137.12.1726052208866; Wed, 11 Sep 2024
 03:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240909111535.528624-1-fshao@chromium.org> <20240909111535.528624-6-fshao@chromium.org>
 <01020191e0b103c3-00fad6e7-f81f-4a76-a75f-1420574f71df-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020191e0b103c3-00fad6e7-f81f-4a76-a75f-1420574f71df-000000@eu-west-1.amazonses.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 11 Sep 2024 18:56:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng5+K5Rn7b6XVfm6rcJnBH4Ggm8vybSSeRgDX2tdv-VDw@mail.gmail.com>
Message-ID: <CAC=S1ng5+K5Rn7b6XVfm6rcJnBH4Ggm8vybSSeRgDX2tdv-VDw@mail.gmail.com>
Subject: Re: [PATCH 05/13] arm64: dts: mediatek: mt8188: Add missing GCE clock names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035651_927583_24042C84 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, Sep 11, 2024 at 6:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/09/24 13:14, Fei Shao ha scritto:
> > Add the missing clock-names property for GCE nodes to fix errors from
> > `make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb`.
>
> I've sent a patch [1] relaxing the requirement for clock-names in the bin=
ding.
> There's no reason to make clock-names mandatory, as there is and there al=
ways
> will be one single clock for each GCE mailbox - and also the driver is no=
t
> trying to get the clock by name, but rather gets the clock at index 0 any=
way.
>
> Please drop this patch.

Acknowledged. I'll drop this in the next revision.

Thanks,
Fei

