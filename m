Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE8CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivYiES9sG14knWzvtjTCoJ1RoaioJgEMHFOyqeNjfZM=; b=DWLU0XasTJ5zjUdb9Zj3UDCNAT
	P0H3UHWklPhQDoo4TrH1rERAVNsOQP16+bgwqZD/UMcuLMEOXFEOMIyGVRPy3R9SOFjbUwRdGMf/0
	kKljK3+/cR8lh/zOMY9F8uxfy6lYomBe/s+IuDFCdOyWyHpg35x167NJldfyFwA3KmNi0ldhPTnVH
	KP0pjTvxP7TFNJmD48gQQ+1iP4MgqMfLyI4wNKvezmPuXQS7fqsLKfUDxdHa3Qxa6uO3TiBYakoDW
	Ll5hr6MiuNlRN2ijB+H5hhKJfBzbCkMAX/YTziQsBhwKU3DtJpEv24iNvSnnmJipWCE4dPwULt8Do
	WFIkPAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVL2-00APML-W2; Tue, 22 Nov 2022 15:37:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVKz-00APKT-9z
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 15:37:31 +0000
Received: by mail-ej1-x631.google.com with SMTP id i10so36630776ejg.6
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivYiES9sG14knWzvtjTCoJ1RoaioJgEMHFOyqeNjfZM=;
        b=naVdW0+iM/irGeY01Hv1M1HkCwp49rOoym6hI1RT3vHD/OSogrNQi1/s9J6qi6CayR
         zdaYyIAwDxLhtMTL7CefzThSXMbU7784fZ8U9cLxWPegw9Imz3oOogKztkxfqWBt0gHW
         eySOyWfPEBPwUhv2k/Fsgyq/f1jy+52wQWqv/P2z7wWNe/KIR3CfT3Ljk3G52+/lOvNn
         B7AG93ZJxenUgcWkV64Im/MT6EQfzii2fQny1jgDbwVAUFllistigQyM4doz+WOO72Py
         58/3jGOI/oFZR+Nv8POqmgkAFh1gS/2XDDU4bqDK1vEt395Balnuwb0Y7tVQ/Y9ZpSDU
         8LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivYiES9sG14knWzvtjTCoJ1RoaioJgEMHFOyqeNjfZM=;
        b=yDahjz1lycgIZ8XID4rBfEF85wpI1IMK9uc03IicJ7fGzGs9zE8xvy/suCWr718AtX
         ubeEDWNIm5yUlXiMlR/Pfb6pzYrEnblDDPjqiYV8tzS9GdpGpmyfLELRkBmaKozGhfpl
         ZdC+6KqC7p662WssgZOEFKi8ClvCa0x0O8SKxeYkaKV91lrVj+N5Dr3merX6RhbW69zV
         6ho3qIJxG/mmH0281gXdlpaYP8ahONoYnaqGPqd562g2cTnMgNgM4cHePfQBQ2ywGD8C
         bH+O+s9x8rkMa3J1hfAe3cdK7T1Y2xIGBqbA4ZocVdl+6/e2jVh+dHV+c7Gtm7EdT9KC
         y6fw==
X-Gm-Message-State: ANoB5pkxbCh/K2rNASZKXTlA9Bru8rsIeQIG412e9yTQrJeStXj0ZWvx
	fND9k7FmTl7BZYQqrU+bOVNw4wN9tovPZNJyOj1zQQ==
X-Google-Smtp-Source: AA0mqf5lVD8Rk2AxeSj7tZ0Ls4Vp26eTLbI5+h+t7YH4u9mCkuwwfrmqgRV3Rsv9A3b2Gl79AHZFVdIXaWEGPf/ipBI=
X-Received: by 2002:a17:906:52c8:b0:7ad:ba1e:1bac with SMTP id
 w8-20020a17090652c800b007adba1e1bacmr20202651ejn.528.1669131447035; Tue, 22
 Nov 2022 07:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-6-8210d955dd3d@baylibre.com> <47ae0770-1cd4-cfea-7222-f91d1d85f133@gmail.com>
In-Reply-To: <47ae0770-1cd4-cfea-7222-f91d1d85f133@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 22 Nov 2022 16:37:15 +0100
Message-ID: <CAFGrd9rhKfMjGMeER4SBsU27qgN8P-axzG=gRtN=szBiV5jhvQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap documentation
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Fabien Parent <fabien.parent@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_073729_540099_6EBE2865 
X-CRM114-Status: UNSURE (   9.88  )
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

Le jeu. 17 nov. 2022 =C3=A0 17:06, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
> On 16/11/2022 13:33, Alexandre Mergnat wrote:
> > - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
> > - MT8365 SoC has 2 additional clock items and a yaml schema for its PMI=
C
>
> Should be an extra commit.

It was explained in pwrap.txt. I've done extra work for the previous
version but removed it for the current one. I think I can remove this
line from the commit message.

