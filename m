Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A4C83F22
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=; b=BQ6QJiDAhyxgb2s7A8i4AN+pHF
	WHRW2RxXngFfrdLJt/PbKEPK7qnSQzzHTNeyu3Fd+5whp/TrF0Dq3Dk8kn6Oux7EbITQ8oC2plMfL
	AhSfcwmk5dKnyGbrqe3TFjDjtxNNmnRv9nsdv9Qkv6IUIqbK7DUrU5uTay/srNiTKd7pAGjOXRM84
	Ek6GvXLTlAqwEhSS4gH/EsumlQV446dW+ireio71AQi5p8bVRv1Ou+6hhIxsVmjdSMF71jcQ8Chi3
	AvBVBNBi68i8GAGxU63lPkpmDNbcH5C86Lb7R6OxrO4lx5TWMpZNWEkfrRWdNzy8IdbQ2N+Ba5UoU
	ecctELFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh0Z-00000005S3g-17zX;
	Tue, 15 Jul 2025 14:51:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubffz-00000005CaM-2fjc
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 13:26:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso3120355f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585990; x=1753190790; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=x1HeYETGAtwXCgwEC8Xm0bUiNtHP77PWUyKqOuRVBruWNm84VsBk1wuodRUc+p91nX
         02mArV9hqnWwU+eVEFnMQwHs5gmIqBSCwmxANMx1D7ZK6wyi5A0mldh+X2arECOOjcK4
         y1qXb4t337wdha6wGc0KUZ05y7JL2RRF81gy8lyDdmoRv11yktNdg655MhKDh7MJX9DZ
         4nDwPnzjRmJ7zYwRGPCBLzGh8+/uyO/1OK0cQ+u+qnzQe9m7TSNILZoTGQGejNher+NX
         jHEqwGV8byKqZHLbI+t7/JbsWV4SS7zbw23YIPI2HuDMs/UJtvJnUgixP/HLlSdPgFVs
         t/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585990; x=1753190790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=AYDdxqIdZPEJXbowft/9V3eVGqFDQMv8WraPfJ7grzzOOogOD97/TYwFQxKAWQ/wwN
         idLXlgPAQfQAgFa6B2ZNLOYNE/WCXgqfP4tcM9elO9+TMAgeRphlOvJqLE+EI6y2D34+
         uRipSjD9CPk80xYLxjlOwGQr1STfvr9ColgiTrHWb4gvxlR3kWETrxFsPNfUALKWEEas
         cr+M4fOI9DOfo+Zrisz3F/ouN2lP6ulPMIBPXKCc1woTEm9DP5mXdnQI1+Pa19+C4z7b
         VPj2ZsaCnOE1YNf4oKOHtYAuImalOrwlIyv411KhsluSEWo87RPpUdi5CZu6P2MUGuA4
         p9nw==
X-Forwarded-Encrypted: i=1; AJvYcCXJe6aWVR2dfsxUwsMo3p2xVvwqNmKmKoluu9si0hthemuQZtFPKm9S94Qv6FYEpu3HMXcb3XOlAwbXn9eeAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YynJkjpcVCNiLaFXc9qlz20HvGVenc/LHfnfnAnNxQ+kNuNiMZa
	5oA6sjdwEuMXtyZvGz/66In6yRu9rmw4phOtzXWTs2DUC7oL2IQAaaHilqv1coy2LWw=
X-Gm-Gg: ASbGncu21aQ1Lj59sTXWoX7weS6ZNRxFCcir1eOwLVm4Sp5DCZY7Anzg078rhU5Q2HR
	hq0nj92wdiFhenv68sVjIkm4k+Prewp9ww78OvgRPrQgjvzetour+u74NIxDrvA6iu3MPxbu00b
	3WjZjWXe6GfjhQt09xXj0AQxHL4V7zJpVpXEOK/sEy993paf7nH1PJQRg25xvbIyFGJj31ubyT0
	/4sG/FoAMCXMlm8Tz/vcPLMXn60P1vvyyU7hdnDwZD54MkWPnjXfJZ9vy1FCIq4DCmSRocm4N85
	cP3io0bx17VKciv0FxEI8C7Ne3+KKXW9qUTGll4w1qzD9wkdkxVFUbel2TnIwsyqnHZktNJ+YEM
	toPOb3l+ouBKaYZZw9GkVrkxezb/tCHrTvUKfjgSXf/yGN6ynAljQ4ml8fbnF
X-Google-Smtp-Source: AGHT+IE407KS8uKPTJWroRm8IILV/e+TMXBeoa0EGQKc6WbP+vL8QbjAW05nEN1glpgEAbE4/IV9fQ==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60463d8eemr6451671f8f.11.1752585989943;
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm15337925f8f.60.2025.07.15.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:26:27 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: Constify struct thermal_zone_device_ops
Message-ID: <aHZXAw08359qCBz2@mai.linaro.org>
References: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062631_674052_3CD89F9D 
X-CRM114-Status: GOOD (  10.83  )
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

On Sun, May 25, 2025 at 11:40:04AM +0200, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   28116	   5168	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   28244	   5040	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

