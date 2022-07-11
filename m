Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ED9C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb9KHIuo4IosRBw4fXiFNpYBgAtjRiuQdEYMHy61dYk=; b=aXSieVnqN/++AgqcoO4EkN6Pwi
	LQvOncBwwNDUd24VSBdRUUCYTVe/MdJzQ8HQFgfK9trOT73Gs+6fwRyoUMhluD/q7dmjDKgXqdtgh
	Bo9WqCpwYV5TgF9WgdzDu+rFkixXrzAkCzlpx5HfD8McrjQMZmD85krm289VNTtlYfts00vN4hN8C
	c/9x+TwGP1ykxL7HYUaUR4Ohi1f6EsUOyASWECER7c/38fCtWtY9FsO7CBCobSbCYFDPHwVGcrK6U
	avNRtGz4cRGngIo0N3CROZhbW6Iu1thbB3ETkbuYbKl340UpoeqK0fg2vekrKC0wW1yJi8haFMraQ
	x/5R7pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAs3d-001E8p-1u; Mon, 11 Jul 2022 11:58:33 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAs3S-001E4n-SI
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 11:58:24 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2ef5380669cso46013437b3.9
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Jul 2022 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kb9KHIuo4IosRBw4fXiFNpYBgAtjRiuQdEYMHy61dYk=;
        b=uuzucqYoJK9QyuGI60SrzoVpti+2eBlJqaCC6sB9ZZJd08dlBVmeCukV4HfC6zZVhe
         1/X/qe6RzkOA/Q+PuOEA0auY09gTuarB3qd9dqHvZTDV3zFz2f++mKS7gh0uMHZz/QaB
         rrdn12qHtkuMmBtsPJc3r1Ohad2owVw1j4OQI2HRw1CbbNkim870g3cUO6VQ9Lvgm8Zp
         QTDX/2jmvmoB/kKzXTbrY19GS92XKmd/rAkm/4WYpC3ZXPJ+fS5EnaXEMj1SdT6sBWP8
         9j3WF8jB6rdPDEHdldwClYu2VKbdZQ6i0P2XBLQgjXq3lg+CzUXaBSMaFuhDmOqlGYB1
         yZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kb9KHIuo4IosRBw4fXiFNpYBgAtjRiuQdEYMHy61dYk=;
        b=PraMk3ouMZ/Foh6qUS6iRzXP54iMyFadKm+cfkre1w8hEG6EaJhWt2Wtouw8a/44Ve
         PAADei9dUmzbciUhIWgzrTeDEnnu1k4umsHogQ3/PMf3/IF1AmWygPacKygsuyDqjitS
         uEmb5e6+BewVtvJs56ACwx6JOGmdD1XYpPLMY5a/e1gDerbyp/wNPz8LCDupVi/lM56N
         ZTAgmhA8Ev9IEQxqT38cuBVvWi9Oot7F54nZxaXABMoaHP17ZDkE2owo9yVLdyW8XpPz
         rNnMCya+UaaU/EASJloPE3fMGK1McluPeELieSTVuQOynfYrTADSt+XjZafF03l0/IaO
         1kXw==
X-Gm-Message-State: AJIora8XN+vKAxTy9APHrD5KKv9rb2cLLBhg3bbcpQCM0/6vUThZdM3a
	/3sqQKn2iw5tkiHXFAbwb/OPkaPuzn2WuwRWgJSX6g==
X-Google-Smtp-Source: AGRyM1s/a3hRCOR5r59cRwkAhmMUw0kBr01CcqkFmETfUZZ7ZH7MngwVHzji1O6LK5sxiEbLLw+AGGSOXnjRa4RncAA=
X-Received: by 2002:a81:34c:0:b0:31c:8b37:6595 with SMTP id
 73-20020a81034c000000b0031c8b376595mr19493629ywd.126.1657540701119; Mon, 11
 Jul 2022 04:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 13:58:10 +0200
Message-ID: <CACRpkdbkpBwABmj31yY0GN++gvbaaox6=i7GkrRYu6ESROZzGg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Fix name for mediatek,rsel-resistance-in-si-unit
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nfraprado@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_045822_931739_01BC8FCC 
X-CRM114-Status: UNSURE (   8.62  )
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

On Thu, Jun 30, 2022 at 2:23 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> When this property was introduced, it contained underscores, but
> the actual code wants dashes.
>
> Change it from mediatek,rsel_resistance_in_si_unit to
> mediatek,rsel-resistance-in-si-unit.
>
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied!
Yours,
Linus Walleij

