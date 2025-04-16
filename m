Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8ACC369B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=; b=HXJjzoUHqUTfdcD+z4HeBEMz3a
	IilnfCf7hHufQt9jEJE54ITK435YSWbIfIQVe7C+PdWZNUaqS4O2m7o+uftZshY8WPT26X/vsogp5
	Ml3VBXjZlcXhjnPjQjwLX74Tle5pCCiHxn+ebtMCnIx48WUZ85uSBh5hVvjW9ktnNCWkxA62S9s5s
	ZNR9TW0AFPNoAJ+xhB7MrxpLGAPyR38uKLxm+UZV9J2hQJdn88YgRrLewsI8TIaBC7oLIFxNGz7RD
	GYwiFIMSzLX2SYDBZd9f5KerAwHRi3z0Fp3kEO0DVlWPPcdZLSLlCs8wcOXT4mJPOXj7EjVqnSdAM
	0vhnXNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xC7-00000008c8S-2Qh4;
	Wed, 16 Apr 2025 07:28:27 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xAd-00000008brt-1M2E
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 07:26:57 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so56705691fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788413; x=1745393213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=QXAoacItrIomB4kiZwHwhJ/yF0K3eW0hcwE2iZ1xM3tflRw403aUX9HzIkeNHqtduO
         L9nrYbZ1xThINl0PhEgTD70D13aAhmTqRfMvaKA7KN1HreY828mhCAAF/Yi/sasQi47f
         nuUvfGP1eXKMxPKNPqrfw5BX5XxOOEIuG6rduznbOvnIusSceebyTQT75CPZ1+pZtclt
         wRnc0iSLdu62rj+gBpJIBwpAmPlCv1e3tv+JOpOqPbUdLeZLpIclRnE6SfMZhPpDolgZ
         8sVMG1uYqqoBNrvDzixPy3IC7apNmM9GH10Nf5esCJOEynYBUUnnjXSqEDXPHx0AUIOc
         HHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788413; x=1745393213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vaofwfGevdxm4fxBlcFaPcuDKOl1lL/bjN1PokEW5s=;
        b=XGjsbm3fB5Q3WxpVZ7XavFrtxtcRNb4Jm4JmW/ij1ZpNqcz88b8FX9oG0+GRUqDL82
         eKsTdfheNbz6x3/3JMxwWiyTd6ebDWKWPmEm3DauYcOEJXKWYNhCJYoqsbnd0buRqYnN
         HLfChwMdd/iC/FsHGghoUtFFHlSKDQ+pAs0Z5GzyD3G7M9qBiIp8NQ6wr6J/jzNT6WQj
         uglMOAmWacUccSSwiBQ0fK31HojH9B0q3L5lVdIPOJjBsoGE+LHweKfoxuvbZMmcSNxY
         5TLRn38QQMMPdBScxWAFvnWYTPkdgiBva/xsTj5DswnDJicykd4+SRduPcIHsHBS4U9R
         qiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2I8L7GlY+aguvUWFeLfvfJrlpSQL0eJJw3h/ZxAsViWhkRMPXvN2uPoJqen2sruCmVgfEysALBackOlpQCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsY3m82rXkyCDgCTFJumZCAfLXj9ds7XeJribGZWj6qi1HWGDt
	AKiTO0eoywCzI1RHPVEgqrt89v9ec7mOUtc+SHs1DXt+FlU2icLRpweROvDYyfn3r4K2cIk1lfS
	GSWS16ElA8/UESdfLMTfPdqBQkvBJ+4mA9k/HPw==
X-Gm-Gg: ASbGncsdONl6eYy4jZ902lI2jjH0JCnjwqmw7bMAgxW5/LgeEs/2evhDujQpb2dbA55
	E7zCjMvDvC10w0rlfJd9PADTfafMJ/d1IofgrfOmCfblYOEGQcKCfDWQe68Lsp34PUoDsDLj+ww
	P56B7a+zKi/0pC9w3jwABjwg==
X-Google-Smtp-Source: AGHT+IGFJYXFDDo/c9HFNj0hqEBV+yqtCpFXburGgG3GtJzyM/i0Julc0Ne5mNBFD3uMq2MVFDEsN5XeZET5w+5UV6E=
X-Received: by 2002:a05:651c:220d:b0:30b:b184:a8ef with SMTP id
 38308e7fff4ca-3107f6bdddamr2202021fa.14.1744788413502; Wed, 16 Apr 2025
 00:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:26:42 +0200
X-Gm-Features: ATxdqUEqi0bEqmx8YQckOZ12kcmNHaSqcTf6fCpAz3VpdY46Sk3RpC-b3QUf-pw
Message-ID: <CACRpkdZ63dWzMg0t96zPFL4+4Ewg1nA=utPJ2QUg2DvmFe0_FQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_002655_374427_F7471B5C 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.
>
> ---
> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

I just merged Cathys patches, can I have a review from Cathy on this
patch so we are all aligned?

> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

I don't see how this patch (which is just code) could cause DT binding
check errors?

> ---
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

This use of --- comments will make stuff disappear when applying the patch
but I can fix it up I guess.

Yours,
Linus Walleij

