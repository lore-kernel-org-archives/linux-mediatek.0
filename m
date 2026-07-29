Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E76C53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 07:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzGRfIQ3oqtNVAdSdf41s1coB+dfm3JIX+5LmmrnTNE=; b=g9IHnrXTxt2xcsTXGk/TBynq12
	0DyjxAHdNnMHuQnWFdM8uixg8qcMoIKQw4uTdXUk7Vtuu12eJGx9jAsBgz0+pCa23Ox2hNyIFvns8
	8OxojoQ4thaPSw+0+n4t1NXVIEUZ3H1+onpwggxWUo1ngCP52O4BCNNKc7MuFc+EfqNJZjkqrdx+6
	M2ZRQlE5wQMcwAPPg5Hi6PA4SsB+EHQ046GN4RUaLTgH0PH3RVfwfTWDGvwnVJlf5t6UExNP7o+A9
	0clTcXFjXQf9CHsSuBxvEUmAjPMIM7pA9Zmyo4z2KQDeakeCi8d1iybNh1hL9IHeDZYQUnKW/7lEG
	pfeBbn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woysp-000000078uP-3RZi;
	Wed, 29 Jul 2026 07:39:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyso-000000078uI-3Bud
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 07:39:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84FCE43E2C
	for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 07:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8021F00ACA
	for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785310756;
	bh=kzGRfIQ3oqtNVAdSdf41s1coB+dfm3JIX+5LmmrnTNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RNlZlFrf0Rl0AwSI35VT/TysH5id7aAGnWaUKhx6dy9mWBiJ9uKBh2I5uRJGgxSSa
	 Eyj+6sRUBaCosSBNn3zuXTHzXr6ok3wcLPUcaainbzJulhNM3D8SO/dyKQ+tSOrXEO
	 zS4i/qB0FRA4rMKt2xn7HcrSGIDSdkxR7MKHH+eoVR/FOKkZnltzcN3xnR9OTrkSnV
	 M/aWr2n3nZleRgPWwq6bWGZUtdU8c/L/pfCArr59lcwyAbscmPGWb/ZaoNR0twThb2
	 roYSI35tJiKCn5tDLb7aFYXY1vMdfvM2Rbv+fOvdhkJyP/7EdZKGhfdqCoZhWuZ0le
	 EtaxRk1+An4FA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea0fff535so657130e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 00:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKbknhfm+pDWYsMfv45ClescPuXYX8lKEyNNgEV7JGqlguerLT/Rht8xZSVJAFzMvvMqMiIHOxBKjq6frVcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0y00vTlArw+BmAMU3anAEuw6eApuB9Y+lJtK8EyeQ5DQ7DBAM
	EolmPYOKDEZ6IqGupvHGcA9kKS2QGtFJ+K3+P13IYjfSGkb9dY2pmhPM1iEgHeME/aR8rUrOeFz
	D/Zuemn1NATh0aefp8w4iEW1MhlN+zyc=
X-Received: by 2002:a05:6512:3b9a:b0:5ae:bbf1:b9e3 with SMTP id
 2adb3069b0e04-5b2d0224c88mr1209890e87.31.1785310755111; Wed, 29 Jul 2026
 00:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:39:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLkLA5opt5hgc0yh4SpvAm8SRwUi3sijU8tjRk+1aZz8KA@mail.gmail.com>
X-Gm-Features: AUfX_mxASc8M5iyPxZ9LtA0NABJlGeVc6lS2e_-Z06vkwHiInWNGRjdZG92zxjI
Message-ID: <CAD++jLkLA5opt5hgc0yh4SpvAm8SRwUi3sijU8tjRk+1aZz8KA@mail.gmail.com>
Subject: Re: [PATCH v8 00/35] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Mikhail,

thanks for persisting with this patch series!

I take it that these are cleane-up versions of the patches already in OpenWrt?
If so I think they are very well field-proven, so we definitely need
them applied
before the v7.3 merge window starts because we can't have too big diff between
mainline and such a big user base. Sashiko comments about pre-existing
stuff can be ignored or added to some TODO document for later.

As soon as I have the ACKs for the DT bindings I will likely merge them.

Yours,
Linus Walleij

