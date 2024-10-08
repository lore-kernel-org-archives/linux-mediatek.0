Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B237CED273
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi3QRDDwcLms1UvC8yNmkM/qLj9SFeO3lw18C6Sbfk8=; b=BNz7t+OC6OpCSDKcKzs6H/4Va6
	dTX7ttKPmBXpl2vWQ86SAhi8YX2wszllqI0L2s52gLGAVJPBattGgRqbh6AW6KH1DXAPsgxyh8Z58
	T++lUIyUrk0tCSJtobvIRZ9lGDSt+xrl1Ocz7bkynun0ckKqg15Jymv7kdtrwz64qX08UGY7T4/Rn
	Q1KnaJHHYMwK9CzuHoUxGluG4QEhAcqShDN+Cp5SqNcV93SBe0r/rMMUFktgmHCFJ4g1HF1U/VHdW
	Ft+OOwyDL4vrfLl7PjiVCdrHMhBquRawQ4dgkLQJT9PSjBq7LTgvOPGStWTUIC/TkGjCzO0EmPz3m
	6grKoP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Mm-00000004l4J-1EGq;
	Tue, 08 Oct 2024 07:10:44 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Mj-00000004l3T-1AlN
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 07:10:42 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-50a87472832so1404141e0c.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728371440; x=1728976240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi3QRDDwcLms1UvC8yNmkM/qLj9SFeO3lw18C6Sbfk8=;
        b=Wx9L27VN/b/k2pYl76k7u0oIA70Mj5DBlD91ieRINeQmk4/NZkqWhpFUMcTQQ2Rw3a
         zALcm7GEzmZhrURK5iOXbeyUVEwmwdCl+iXMURvtNiB+wcH21jlc6kF1e99H1SGrcl8r
         uy663Fs7FUvudGxqGWeTqoZg+ZITdUSrVakE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728371440; x=1728976240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi3QRDDwcLms1UvC8yNmkM/qLj9SFeO3lw18C6Sbfk8=;
        b=OG92bEEBzhk+svP/98eo+Eg61l655Yrtlw0+hSYKXP/zl+vODufdvsfJRKgRxhQnhi
         cDY1bQO0iO5WOYO/0Q/FFlPDyZZ1xb13WYtv5D3db/Mnr/2OvNEfimHlUW5GA4T+fmMC
         2cG3CyglZ2EDBhpbaErfR0xR2bLsuFxx7bnwaLzC7icaEiCJl0ZzCG3vl3+wDq1yR/br
         iBswcBlKsRL0s4+5K297nk/ayHiMnJPDHFUiIahxUL5e/tT2Y3qkH5yyYf2qNEYTHYOT
         f9GwOuzYHKvc8Z76RINn3+T75Igc6WEL3DfcH0X7GzGvWJHEb9Ue/UvBSViODK1Auxyy
         u5PA==
X-Forwarded-Encrypted: i=1; AJvYcCUeQWGLm3AQRKa4aoOtxG40NxXM2pelTkHL0p92Yi0/OtOR8dcwO1f1ozzg3abIldZLLpK4ehhRvrTv03TlrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweS83ACWVpE6erv4xTgfO3FVwNnJAG18X/0+b14qdGaLkaHhyC
	VZQZxIxFrLpzYEnPnyjn0baWI4NeLt1SiZH1I3lPLaXwfvsCNOVXEFoSkcpvY0K7F76B6pKOIpU
	=
X-Google-Smtp-Source: AGHT+IEjzWEcx6xg1l9e1aLd6y9kp85gXvG5syjnGotsZs41LjAJDPwQBxdCoRbnrilXF2tB7CUsig==
X-Received: by 2002:a05:6122:1829:b0:50a:b8c6:b689 with SMTP id 71dfb90a1353d-50c854487abmr8769237e0c.3.1728371439939;
        Tue, 08 Oct 2024 00:10:39 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50c9ae364b3sm1037543e0c.36.2024.10.08.00.10.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:10:39 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4a2ecdad7bcso1543477137.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 00:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWco/L5CfpA80a9wXF5iwS/RR3IsiP8LN1A3Qb+qRRD0B04kO2DxvS9+rQ2pPUNA871LzZSGdCO4deCKtjmw==@lists.infradead.org
X-Received: by 2002:a05:6102:1613:b0:49c:8d2:8ec with SMTP id
 ada2fe7eead31-4a405745478mr7873579137.3.1728371439139; Tue, 08 Oct 2024
 00:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241008053514.6800-1-macpaul.lin@mediatek.com>
In-Reply-To: <20241008053514.6800-1-macpaul.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 8 Oct 2024 15:10:02 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngrsDxQ1Fe9xB_EevGbGB5nDoCB_n2oGb2VTLiv1vSsGA@mail.gmail.com>
Message-ID: <CAC=S1ngrsDxQ1Fe9xB_EevGbGB5nDoCB_n2oGb2VTLiv1vSsGA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix dtbs_check error for tphy
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Seiya Wang <seiya.wang@mediatek.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Sen Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_001041_340306_0D01D516 
X-CRM114-Status: GOOD (  11.05  )
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

On Tue, Oct 8, 2024 at 1:36=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.co=
m> wrote:
>
> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
> The error message was:
>   t-phy@11e30000: 'power-domains' does not match any of the regexes:
>     '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> Fix this issue by dropping 'power-domains' of u3phy1 node.
>
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation =
board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---

Apart from this, can you or Chunfeng confirm if we should make a
similar change for MT8188[1]?

[1]: https://lore.kernel.org/all/20241004081218.55962-3-fshao@chromium.org/

Regards,
Fei

