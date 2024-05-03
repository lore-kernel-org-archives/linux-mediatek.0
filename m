Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB0C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 07:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXiT6DCAy/foJvChspPeS9HWJhqsKPTUJeiKjZEGmNw=; b=I6NPARhz8JUNGVDU2VxvqebMHx
	PC4441T9GH1HNlJBbhWL5YKabBT9Bv1Cui1AI8KBTOSWz8DaMpPWVpCw5K01kNvNmP0cuxa715ubE
	zi1wuwDN6G6FfJNNwX4FC4TU4dhoywC+x6cylA4v5ZoBmBpaRL/jgoddzznXoiFbSxP7Y+NvO25oN
	2LtPyo5hPS//5LRea4D+B6L7vIBf78ltHWxDD6UXgwn4Gmqp896CvgnlDc9AEehQZKj1mn6jfWthU
	aa9lyz6MKXVF+3uzZBtt7+/tfPKoYFKkq+OE2l1kJycFNyzVMzp7iJzSvS00ELWfXTDTWYVV57xFq
	IGpZ8dzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nFs-0000000FSBx-2Zhs;
	Fri, 03 May 2024 07:22:52 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nFo-0000000FS88-3Ww8
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 07:22:51 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-61be74097cbso45859797b3.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720960; x=1715325760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXiT6DCAy/foJvChspPeS9HWJhqsKPTUJeiKjZEGmNw=;
        b=eUwwg4xXIHJPDDgPvolAMp75R94kz18QIcP07rfwBFOXAXN4+bribKxuLBzL0Uoejr
         VL2rbeQD7fYLUVva4ZI4Lm4LGY3HRhXtOBUh3VK++bT5/3/uSbmLFM+6f6N3hzDxiWT8
         +8Qeq+J53GbGY2zGm9t5elJmZg3DKIATpgPyT4OM+MK7L5e74dvyNsFMVt1vnWg2zhJH
         RQ9v8QVAzz8p5PywfsE2hPDOMyunNfTrwP8gsRp5mGPUpoHC/h6J7Z4dROnDl4wVfoY7
         dYGHX6LtwpK98jgFbY9t44bIqSbQmkOEym0CAW59l/TpCHEv6h8l8SyPdDB8+mCkeB0e
         GTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720960; x=1715325760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXiT6DCAy/foJvChspPeS9HWJhqsKPTUJeiKjZEGmNw=;
        b=jXH02bQv40BSttHJ1R/p7sqQ8KUlL0l1g3GlduQYwKGUv7Z8U4n+5LBla7EEC8zQna
         PpNbqRQBxdR+aLPalBOD2n3cIz6M/a7xk879z/YZ4VB82dgayZdxExPKgdwnqn8qVz78
         3qqDIlMd3F6WwHejz90h0ce91vI7ZzUpm+FgB4Pzn57OpunLqjlb5e+OXnHF9kFtki2R
         CRMb+64vP8RvHeLNTOupOA6DRiOfwKk32Kj6ioIo+YAycnyVT58UT/8AYSGiAZjAKL22
         yHJakx58VYQWXLpYD4ayuz5dFvdjN8YmdURmMoHV4haXkEitj8Epw9Raq7kTp1SCxW9Y
         Ygzg==
X-Forwarded-Encrypted: i=1; AJvYcCVurTZFUtGKdPeVm4vkkHDEhs2zpaSYRS+SzH5R4hhOLjU0fP87lX/7K1D+RBR+jzwa/pdqnuDE66WNntdZhYUWPGnWA7SmKeaIPn9nRYoWiDYe
X-Gm-Message-State: AOJu0Yy8rdobAQNV5Gm1CxPY7rSQIEUgJmjd+7tKVo9INsNU/GHXcXx6
	zMf5xsq/7tFZfQNGsywkVBr788TkTXn8mT8QU5hNugjm03DBXx/eE8rUAjjy0tNDgJzTMhRkS3o
	U34Su6ixBfvdYarRDFKNX3KD8ZtNy4NBw0iJAzQ==
X-Google-Smtp-Source: AGHT+IF70GUA/nAYgbcBRArz2QcjffD0UeeRjlZvnQVAeEubMTdu99BOh7TpwjSj3+78vjD2hwmUTAgJU1ao3wm1tdU=
X-Received: by 2002:a25:910:0:b0:de6:dcd:20ae with SMTP id 16-20020a250910000000b00de60dcd20aemr2064275ybj.27.1714720960659;
 Fri, 03 May 2024 00:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240423045502.7778-1-zajec5@gmail.com> <20240423045502.7778-2-zajec5@gmail.com>
In-Reply-To: <20240423045502.7778-2-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:22:29 +0200
Message-ID: <CACRpkdZqdivw_ieON-PsT6scF8YUp+LybYxiuGtr4S8eaT=w-A@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] dt-bindings: pinctrl: mediatek: mt7622: add
 "antsel" function
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_002248_917800_1F63D81B 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 23, 2024 at 6:55=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
> the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
> pins/groups"). Include them in binding.
>
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

