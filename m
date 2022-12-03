Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C80C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQEVpJWky6tIJ89XqczxI7S0ZUfSn6CIT0hg/X+OSlY=; b=1TuqJ8S6c/sgKgGx4AnNMe+bpW
	l7crV4UQvMr0fyEWfk6hd1dHL/U9DsD5fo+kNWVkaG2XYUEXrRyhCYzcsenB6N3g9kyTX8vAUllZt
	GdocRsalswxpcSbC6hJ0eCNBwAjafqg41kGvndtPT7qv7hv3KRnBNcQbjwpEvYTyTyK26rX4YUypz
	3TzDBuODFGbEDy/gtz6b9Grq4iAinNW4t1qzMRaBlMzFIl4nied/Ww9DQ6IO/XALWqhz2OPEgG36x
	R96fDy5XfuLyV0i3j7xq/p3x/g79d+QziJcghr94TRjmmy160WWAFwbWu57AeyoZHsXMEMyA6YKws
	iU3f5Ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Ojj-002x6I-Bw; Sat, 03 Dec 2022 09:23:07 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Ojc-002x43-7r
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 09:23:01 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id z192so8818147yba.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Dec 2022 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQEVpJWky6tIJ89XqczxI7S0ZUfSn6CIT0hg/X+OSlY=;
        b=Rgbj5fbB+ubXc5lxB75411Bq0YmdYG16G6Y4s8Bew+CQGHNAiOQfiXNuLqe7UTm8rJ
         DOZ9Pa8SlSBOucCgI358McADb8KVdwQOPUXPEmJInzjAs5sghOG1QuDuAsaDlEPn/f29
         oOAov/y1c9gnUiqembRyjEXpk47JHllvwX4bxUcXP3YAfbG+ji8sqfi9v8ZiZaOgZhMK
         Ez1ejr1CKCwK1iGF+dRePOkFRuQsU971NosoDjxupXHgb5WdafzCOLqNkATzIo5/nbeY
         xZBo0BhSHDTV5YdM/on3vlA+1/WnKfbvvCU1xkHiRMN7bEQ93FmQLnsZKxYLYGgIkIle
         qWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQEVpJWky6tIJ89XqczxI7S0ZUfSn6CIT0hg/X+OSlY=;
        b=QupzqyEFy7e1fYUrSJPtsnsoZoQoPu66crqIku24ONwI4pQSQXNp7dev12mr8Idony
         989XR8RgXoB3TfNFD0y/IDkGLuywwyH2Bo6Tdi5RrMwjRX2dLbXolIxphqptLlZHhX8l
         iYQPoLk3qAJKLrhziLqjnDM7ki+Q3MJTycsUc1shQQBg31kTs7j99Jr8iIquLXuY/OVV
         xbbjXv/Uiv2Cc+ruMIr+LSb93Q+9mb5KtsAMg+3izehZ2kkH2wsnRvy+p2zJhI+pxp08
         A/TLuBQ8NHfVEngJOBUb8tCPkKoHVEJ/kHjjDRzzZRlp8Nmrq0SeHF+IXB5KKBS9HPQm
         BhtA==
X-Gm-Message-State: ANoB5plE+4ZzE0EzY/c3Fy7iGijivvO3fk3HuEiGXiNhiOShIWJNOOBK
	h15blrQ5OifkCAmNMUkC1QTkhDwd1JM4cO10leaYpg==
X-Google-Smtp-Source: AA0mqf5ZQfNSD0/07kd5VFeFh5McEsaO3GSOFBR7Nh6mdhMxqXu71Xyg3wJZ63scyLjajbGzBwDjWGjBa0hVSp8aKBc=
X-Received: by 2002:a25:bc8a:0:b0:6ee:e865:c2e2 with SMTP id
 e10-20020a25bc8a000000b006eee865c2e2mr8564584ybk.206.1670059377999; Sat, 03
 Dec 2022 01:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20221129023401.278780-1-bero@baylibre.com>
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 10:22:47 +0100
Message-ID: <CACRpkda75U=b50rK=WecNvaEoTdN2UzGyEwfPRaO6jG9FGyWhw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Remove the pins-are-numbered DT property
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	khilman@baylibre.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_012300_310295_EC30DC8C 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi Bero,

long time no see!

On Tue, Nov 29, 2022 at 3:34 AM Bernhard Rosenkr=C3=A4nzer <bero@baylibre.c=
om> wrote:

> During the review of my MT8365 support patchset
> (https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@bay=
libre.com/),
> the issue of the "pins-are-numbered" DeviceTree property has come up.

(...)
> This patchset removes all uses of pins-are-numbered and marks the
> property as deprecated.

I don't remember any more why this property was introduced, but
I am happy to see it go.

> Bernhard Rosenkr=C3=A4nzer (7):
>   pinctrl: mediatek: common: Remove check for pins-are-numbered
>   pinctrl: stm32: Remove check for pins-are-numbered
>   dt-bindings: pinctrl: mediatek,mt65xx: Deprecate pins-are-numbered
>   dt-bindings: pinctrl: st,stm32: Deprecate pins-are-numbered

I applied patches 1-4 to the pin control tree for v6.2,
please funnel the rest through mediatek/stm32 and
SoC trees!

Yours,
Linus Walleij

