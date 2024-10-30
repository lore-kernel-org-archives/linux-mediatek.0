Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3573D5CC82
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGqrgvqdsygpPt5o2JbcWPHpoKlMxM1VXeT/riCMvAU=; b=glzXsI9pU8iP0OHej27HRnuAvA
	dxGo05G+v4FewmiDPEBBk1In1mSEz19keBKOIj/VBGzOXW246F931xz7aLE0fB1pSEE2VE4wiqtM8
	WadXG2CZ6npAuPS4ezPP4hO5g0UQrkSMFkIL2EBVS63TJZFyE2I2fL+1NTQjzXrudJ4jbnpSvtsaV
	CsgLbebCfYC44nFudv64nWGmqD5sJsPFSkvTxpgCf+LhVcRrEQ8s0E1tsUHOPnWwDGzUZExwRUf6j
	L5qJxgk5kbnrAnkbOgM75i2v/Szq6JBtIsJkHBwdgl4lF3KDiQzNxfErmPKLPCAb9jjMFGzBL97Qs
	sEjs2PJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Xa-0000000HUZU-3UAv;
	Wed, 30 Oct 2024 10:03:02 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65UB-0000000HTYt-1gjC
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 09:59:33 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so57949501fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730282369; x=1730887169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGqrgvqdsygpPt5o2JbcWPHpoKlMxM1VXeT/riCMvAU=;
        b=Xx9NFe7+cLGtM/VOOEqsz2eP1NIMPEVeYtIzB1w1AQCfgMbd50D3pMfG1kSxyDdunJ
         qc6pS6fZKqlwm7gSaXThPyZu31ufa9CtLsCYiK/gz23aQTvFLh66uBoCPIw+4aMSKFE2
         UK6m93o0Xe+MbfLZKioev8GTdE7KBF4HBIp1RHI080TD6RvDKli3jj6+z6qtivC0KlfD
         wi6dc+wdtq28CrfBe1jlgkDdbXEovLvdMU4K8ytoVs6Qp4Mx4FY9fTkfRCDKSOha49ZV
         2SkIwdOmpcDg3pCG6KWRT3eFhdp/f4m4X8KnIFNLtLsaNlOOEGrS50vOzjKyiB4xxZsh
         zIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282369; x=1730887169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGqrgvqdsygpPt5o2JbcWPHpoKlMxM1VXeT/riCMvAU=;
        b=fvtkixlchD+TvSgvTJ0jSskzXAZfj9Jw1Vy0VWEn2rpHi8EZyv0VkqGfQju/AfFXro
         OkO/dXGV516fV88a+ZjlVaPp6edS2APqI5LmVS0yppWdpDU2mCWOycQzq9BLm7emTyON
         HeQ6XvG+GHA8r4Ie2yGhKLjGEgeWPRvGSAJbfj5rpDw90OUnnlJXdSwZrN2BrnVVuPJG
         PmXK8ccrU8ovKYttcZvOT9QOIJ8a21QaLd/VClVMDHF4cIxfucLYLkAosPU4zeN+IiHJ
         4/OViNSnc1WUVhjV9wNm0vZrxG8ZyhHYSd+DcWoOKmGFcCT2YriIeOflki1xxoGLfrsF
         oYsw==
X-Forwarded-Encrypted: i=1; AJvYcCX6N4lu8eBxlHeXjQKeR8EiDu42Z0Z6U7lHlMm2UCpCWHMEAthROZWKcHRf5V2q+AdCQmKeWrqhBg8MVsqb4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR2HTzG8ItNxsZuSZDAPUBvWMMuAGC52saHrMicF/0ayy9G0fD
	6372GsuXVA8SCfohumTqLJmxraGPZC1ICkjv5JQw2Rl7YBWcCRsyTIrn7XkkZ83KG2AVxrSfz4s
	8vefLXRNTalb3+10Utc3J9unJl/rMyskoiHml5A==
X-Google-Smtp-Source: AGHT+IFXXru1w4O79YJkokUSqsK/b534bxUSW6ND+qFP6cPz7SAaoo8kaTOyVhT0eJkbzZjAu8dBjmQDQZeoweMx2/g=
X-Received: by 2002:a2e:b895:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fcbddfa6admr66447451fa.0.1730282368618; Wed, 30 Oct 2024
 02:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org> <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
In-Reply-To: <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Oct 2024 10:59:17 +0100
Message-ID: <CACRpkdYshPusdA7bDW2y8H_wp-Fm3N-YCsY1_Qn=dZqRiFy12w@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_025931_591409_0C1D7920 
X-CRM114-Status: GOOD (  13.06  )
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

On Tue, Oct 29, 2024 at 11:03=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
>
> > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers fo=
r
> > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > needs to access the same memory block (gpio memory region) to configure
> > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > childs of a parent mfd driver.
>
> OK someone has to merge this and I suggest that I merge patches 1-5
> (all bindings and the pinctrl driver) since the different bindings have
> dependencies between them.

OK I have now merged patches 1-5 to the pinctrl tree.

Please iterate patch 6 with the PWM people so Uwe can merge
it when finished.

Yours,
Linus Walleij

