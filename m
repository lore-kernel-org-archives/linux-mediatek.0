Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACECCED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h80cpJbTKY9snEXjb48T6TTGldHGobiLvAdg9ndyJE=; b=vqNZFhDkdfBfKx7zhsh+Ukep2Z
	5Ribzm7NMtrOz03B9PzGfpo5o+3C7Lz1afoAcPB3jQjEDKex9vScl6TGxk0vOf5SW92NmpItk0V1r
	obzeryhQFBAZViimreeGVGHWXP/Gmqp9Cvaz1aTkAvIHmH4K1vDnmN0ZS0VCcdMJQZfpLJWD1GIiy
	Lx+4n8gR4tihCgc/ikvHru/zzZiFaBtdHYY3kVgSdlYjZush/1sdA5wmDZ1nvbYDGxcQUTb2OQ+j8
	4KeoFERDal6EiJnv6a5tSopWosll9ExWx8jIa+WfzNlq/EwM1BuVXefPpFJa/GBNtKi5xVpRyJnnC
	vccS0GOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5OA-00000004yeN-0HIS;
	Tue, 08 Oct 2024 08:16:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Mo-00000004yG9-45Xm
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 08:14:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c593d6b1cso2748965ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728375290; x=1728980090; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0h80cpJbTKY9snEXjb48T6TTGldHGobiLvAdg9ndyJE=;
        b=nbu2ev0o7HwfUkakh29o123YT5ZqJ1iT0cqN2sZEDpzMMZJb7O9HTOAJGBag+qJVIM
         L+fLRNaXoc6eeqhz0o5cqJj+KRtEZeEJCmmPkz08nF+Q3lK/s9pBlxfaGM8oqx5JLleQ
         gllUxjpIDnDDSQbej0Bz5wBSo4Wcudm5Jx6mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375290; x=1728980090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h80cpJbTKY9snEXjb48T6TTGldHGobiLvAdg9ndyJE=;
        b=caKPJgZYQHzKIpRczjkIGZv8uR+OhyScIVH0QsjE6t/VcTHz8sKJqGBExgQ/8XeqwR
         p2ObM/AHsmfzYfG/aaWp3mQsvUn3YU010FmT6KTTNOKfJ9EOHzcz3aJeU7+wCfBsTKE3
         xq3GExVUyDGUkAfrQR+DeZC8/2QHz4RuuxTdAKWCCfueqSU9n8koUDB2k4+1b45i47Yd
         A23j/f3pahSTt3VERzGxaFgacmCBiOSAEdlPbJYPb6PeZmGsob4JnCl6doRcYF9N5fS5
         1ipBvQ2XVqzp5Tof/diil1shS/9PfLFpQv3j0qH4KktR7lsRSUyZ1+g7cCrCylF773kf
         N0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRmmi5htzC7X3tMp9avfRE6AX4lWxKHkwTSgwgELOpd6mXUoA5G0RCB+kK/hbglvaNgg6596N7t3E/FiLfDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2T1Yy6OnyhZ5CkwNto3C2Ujy9Mboe71PflQA2mET/QaScUV3i
	7ii60qMm0TWIFA91y+LIWTac4e9MIxer1bqZiAHIm1DmvZud16Zv0vRXImftDA==
X-Google-Smtp-Source: AGHT+IGtu1645imzPCSgJdgHdyAJGDlUUwPsS55faURj/n0zsXWGqvLNNPizXP2mkdPY9fimKxH55A==
X-Received: by 2002:a17:902:e550:b0:201:f83e:c25c with SMTP id d9443c01a7336-20bfdf6ae9cmr25646925ad.9.1728375290013;
        Tue, 08 Oct 2024 01:14:50 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138b137fsm51168505ad.12.2024.10.08.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:14:49 -0700 (PDT)
Date: Tue, 8 Oct 2024 16:14:45 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 0/4] arm64: dts: mt8183: Add i2c-scl-internal-delay-ns
Message-ID: <20241008081445.GA3999626@google.com>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
 <01020191d6992288-f834e61d-ad1d-4de7-90b4-77525530532c-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01020191d6992288-f834e61d-ad1d-4de7-90b4-77525530532c-000000@eu-west-1.amazonses.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_011451_022839_E6452114 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, Sep 09, 2024 at 11:44:05AM +0000, AngeloGioacchino Del Regno wrote:
> Il 09/09/24 09:29, Hsin-Te Yuan ha scritto:
> > Add i2c-scl-internal-delay-ns for each device.
> > 
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> > Daolong Zhu (4):
> >        arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
> >        arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
> >        arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
> >        arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
> > 
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 3 +++
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts   | 2 ++
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts    | 3 +++
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
> >   4 files changed, 11 insertions(+)
> > ---
> > base-commit: ee9a43b7cfe2d8a3520335fea7d8ce71b8cabd9d
> > change-id: 20240909-i2c-delay-6d202918ee0f
> > 
> > Best regards,
> 
> 
> For the entire series:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

I guess this can be applied now?

ChenYu

