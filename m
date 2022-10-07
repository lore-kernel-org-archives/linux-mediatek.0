Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ABDC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo2HAOYWApt+uBnXx1ssfbK0iPppR/25ymQTC0xAXAY=; b=3e51OzDNwWFs5fVCt1vBPtqwO1
	EJ3nR/JQwC3Zzi1UnnkdM71cUJ4eCokRKAdVTvOE8O8gHi9dyliG5IuqmarR2AEIizfItakO6839b
	dgE/69giS0f5m8bEpULSH0orTOn2cd/HcLIHNS/ACJOv40X7SVAtS7n75JEXw9TSKr/5Ior6OsEi+
	Z61RUqEhsHNps4LCeSnynzFSrr5sibYKjQdc8RymaeMH/GZxFouOb2zUg56hjG6+bMhIbyyQJkheX
	UIGD+uyLfGzdVBCmyOBYrFj9k7vLxz2NxkyroD7kLZYvlhf+MmPccLrN6u29710E2WAF0lQ7oty3A
	UiP99utA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghFS-007jiu-2A; Fri, 07 Oct 2022 06:54:18 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghFQ-007jZi-C6
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 06:54:17 +0000
Received: by mail-vs1-xe32.google.com with SMTP id 63so4171491vse.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo2HAOYWApt+uBnXx1ssfbK0iPppR/25ymQTC0xAXAY=;
        b=JqjrXPjPsngbq+RcrzuUTIY8ga2SZlf62d7n4LPwSRbYkPOjKdzJVK9Yh05TfEwj/R
         7KU63wO7WquwOHU9t61Rd/PpM3UBv+DLB+aLOD+/9DsZjVcpGunquOEq/NZDL61xnN7w
         yWgX4k1DzhojDIZdZzRyknUNl7EYQi7PgrQE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo2HAOYWApt+uBnXx1ssfbK0iPppR/25ymQTC0xAXAY=;
        b=zDzr6BLGFZfa1mj9r035qdcLvd+L+zg5hNprK09w8pM5K6Rgw5tTQXJXK98vRkb9VX
         ezDMfllgjUW2M/VazlcgoJ5X45nN6DUw0C9+MjfLIVs6hF6KtxsmlYFK6o6r4bDiUL78
         vz1jYl+sUFMNMdCwav3rGI/mXUM5Y3sPYIIyFo/bTaFO8rUtZFs7KTwgHv60F0vG/9h0
         Ha8H/vr1a7n2suBtVL0WLhq2Bdi2HEWjIQciQiS6nIgIXxR3cdChR3aIkVAaQwHcMDCW
         et+1Y2PZ3oZAgmBi22mLGkjqDUfRsnnyy3IOg0qi4jIfheVN/AXm0T7KQ6oQeUnlQe9i
         J/AQ==
X-Gm-Message-State: ACrzQf1/Rk1t7pg9Pq6LFxNEUiWj8rABHk6EFM7OQCd+RU8uCUpTm2mk
	kL1OYo/PbPNVVq1UzaNhan72j1GqsYQvAlBxqOgIDg==
X-Google-Smtp-Source: AMsMyM5Bw7v+A7dz3X1bKXBiH9oshzG1ksFfuTHCWJGnWw050D4ZbNIRgRKapqRJXmh/punzxW+3VR1+ooXCzzsT1Zg=
X-Received: by 2002:a05:6102:3ed5:b0:386:91a5:a246 with SMTP id
 n21-20020a0561023ed500b0038691a5a246mr2272190vsv.26.1665125615320; Thu, 06
 Oct 2022 23:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221006212528.103790-1-nfraprado@collabora.com> <20221006212528.103790-5-nfraprado@collabora.com>
In-Reply-To: <20221006212528.103790-5-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Oct 2022 14:53:24 +0800
Message-ID: <CAGXv+5F684=hFa42vSuN24eBTGjj7LEQNzog9U8dEQffz0JZMw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: mediatek: asurada: Enable audio support
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_235416_450110_3095C96B 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, Oct 7, 2022 at 5:25 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Enable audio support for the Asurada platform. This consists of the
> machine sound card, the rt1015p codec for the speakers, the rt5682 codec
> for the headset, and the dmic codec for the internal microphone.
>
> HDMI audio support is left out for now since the DisplayPort chip
> required isn't enabled yet.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

However the UCM you linked to in the cover letter didn't seem to work
correctly.

