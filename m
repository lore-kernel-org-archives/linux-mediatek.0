Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6962FC54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkQeQrjxFirNA98ICYKxraGXUpMqPIXkoDOLmYL5f6I=; b=mCpU6Y6wdzkL1IG8uD65yoidsW
	LWZnOQ5bWtEnQvgKMGiw136pCWhw2IWOZ0/J80seR3VUU5dzCiUEVM4yPlxukjvNW5rlSLQbhuYJz
	OKvioPvieXOjdvQm1oeaSLtGsROrs5QBev5j7p/BD00YmKb+130bmZHBNX6X9RRoEDgejLhDZHanr
	tNvx5YZn4vvR1hCZyuNIwlclE+ABTpLHCrQa+59X7hXEo9LgCT3NBLIr201GWgvhKZsPF55abdmTj
	XfjClHU34jZLgVQ5Y9V9Lzbrp+zah2nmMYrHIshXw00bmyHgo66DqVaWhYCGzySNnvIc7nH+lyokz
	71O8kI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKynk-00AJEb-Su; Thu, 26 Jan 2023 09:44:12 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKynU-00AJB4-MZ
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 09:44:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id rl14so3604201ejb.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 01:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkQeQrjxFirNA98ICYKxraGXUpMqPIXkoDOLmYL5f6I=;
        b=Xibvy4IdYxiDWH+gnKHlUpWVPI9wU/B0ZoN0P//fYD4WC+hEwxBPryaGf4s6nAXv5Z
         HMgvfoMK3Wd4k2h6nc0b7AOE4Ze+yp2m6GUtteaXzzYG84/sLRXWS4DvHMPm7oWC9Tio
         7HlljcK/6nvQ5dxdJGiIRfX57jnxmWdforNwP02hQquppkHPehjIVTKwMl/qsDUI0F1+
         OQPRt5N0eRrSzAk/Zs+qdq/zhv3sj0VailSq9os+G0Fg67nf24ItvQIgJT3HGerV4Zt1
         8hq7uXmS4M+84My5CIgcQmSYAnDiAlGshAk8LhJA6qDI4IYsyaMaEoz++gzMy6+slouM
         6TOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkQeQrjxFirNA98ICYKxraGXUpMqPIXkoDOLmYL5f6I=;
        b=it3zr7AxLv6/pFbz9gOzDAff0BxB8yNxeWv5WJp10T6EO0tPNuMQfwYGiR/gLVJZLZ
         JUYySJifs4WEkd07ksDiUglu3+hKpXQmuxk1THvwuL0vfu8YuiQ0/Kigs2OVos9ZdjLT
         kl82OHvcUOOaVGEOKldfQsFacjPtYzfcE26PSD9GIH+FKo1H48oCOOfkD7VM1+JVB9ZL
         QXzwgi2SMht/S58VsNa0XengZZEV/jkBtsV+O6nW752KB2IBR60dVFuXFMOpmAUCz1RS
         4WEopi+fkKy/JYngj4zc97sBV0DQRy1v2hBNxEirDr15R3keWybM8SkyvCEyzWHWipYH
         8tag==
X-Gm-Message-State: AO0yUKUf+lw/YcpkWmifoWJUu/XkuXjgXNhGVvwtiCkkPRNuqTFmS44e
	jZGPQCdTtRkzt9TAfBWN4EJbnPCwdRXR7TYA8VJyog==
X-Google-Smtp-Source: AK7set8wQ5OBxV3pr4cshnfVzFeiOtgXomMd6lzXhm4mJtrNqwdgad4opn6PrAzJm+2VbQdaLtrD8eaK54pDT7f35oY=
X-Received: by 2002:a17:906:eced:b0:878:4ea8:6c2f with SMTP id
 qt13-20020a170906eced00b008784ea86c2fmr650138ejb.115.1674726233044; Thu, 26
 Jan 2023 01:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-1-bchihi@baylibre.com> <20230124131717.128660-6-bchihi@baylibre.com>
 <80ce4ea3-6ebd-c249-45bd-a2f04343690b@collabora.com> <CAGuA+opCcdbPbasadEFbKw1nSy-kbK3WzKG=wXn6dtzynjrY1Q@mail.gmail.com>
 <243ad9f8-76f6-3e60-91ae-21d04ba6f262@gmail.com>
In-Reply-To: <243ad9f8-76f6-3e60-91ae-21d04ba6f262@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 26 Jan 2023 10:43:17 +0100
Message-ID: <CAGuA+ooybKdNdmUqN9xQpuSNFfSnA6+yj-UrmMkU9RZv1KE1qg@mail.gmail.com>
Subject: Re: [PATCH v11 5/6] arm64/dts/mt8195: Add thermal zones and thermal nodes
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, daniel.lezcano@linaro.org, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_014357_039914_C1022302 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Jan 25, 2023 at 8:09 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 25/01/2023 16:10, Balsam CHIHI wrote:
> > On Tue, Jan 24, 2023 at 4:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
> >>> From: Balsam CHIHI <bchihi@baylibre.com>
> >>>
> >>> Add thermal zones and thermal nodes for the mt8195.
> >>>
> >>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> >>
> >> You should change the commit title to reflect the same syntax that you can find
> >> in a `git log --oneline arch/arm64/boot/dts/mediatek/`.
> >>
> >> arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
> >>
> >> or
> >>
> >> arm64: dts: mt8195: Add thermal zones and thermal nodes
> >>
> >
> > Hi Angelo,
> >
> > Thank you for the review.
> > Should I resend with the fix?
> > Or you would fix it when applying it like Matthias did for "[PATCH v11
> > 3/6] arm64/dts/mt8195: Add efuse node to mt8195"?
> >
>
> If you need to send a new version for any reason, then please update. Otherwise
> I'll fix it once I can take it.

Hi Matthias,

OK.
I appreciate it,
thank you.

Best regards,
Balsam

>
> Regards,
> Matthias

