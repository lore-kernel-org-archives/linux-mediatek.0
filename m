Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD6C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 19:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeirCJAnAvYHJRWOqOsfW1hYyWSjdT+Ia3hbkutfMMQ=; b=IDX2CGRSgSNCsvOgKUcGTk0Axb
	/98MZUgtQPpo3dnxFZb6+4DPjY062AXhlxGS+6EA9RXmsSR+4TFG185jZGZlXFTSAxkfMNtaeU/Qe
	mbTeICTxMEQ5NkHzFhTngIgoEyaoZ8M+ZYt1tLV/jNZY8nsN+O53uTcxulIzJP2+W+UyvtKsf6uWB
	E8vJMcfuj0OM5fp6hWiiEZFnPF0VzfONQIGT8lN1nN3/k9X59qgGESBmXorfNT87UThdy2DRbBZMf
	hQFo2ROafn0GfWvwKB+A2ZTY/SIgz3N7rB8bzyWCuQ58wPmP/AfsvysGFAfFphgZAHIphONsVsZ7E
	LUepw1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIacK-006xkK-KB; Thu, 19 Jan 2023 19:30:32 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIacH-006xit-5C
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 19:30:30 +0000
Received: by mail-yb1-xb30.google.com with SMTP id p141so1168134ybg.12
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 11:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeirCJAnAvYHJRWOqOsfW1hYyWSjdT+Ia3hbkutfMMQ=;
        b=W/jc15KxUCWrRIvEx3elqDdDeiflQ65ZJhZp5RrASRAKLlj4zO58m84Vj+u2t+A+Ub
         LTjFrtDTgJJVd7gYUe/yqMbevOT6+SY5vxKbC7sV8tbxbtrGnJFNe0rIiMVMnvagfgub
         diSVQG+En5UIkmCkzbRWk08gMCztKdMlKAI9UvkF/hmAgrg0797beeT50QqEuEn0RS40
         tm/IcFVo5NUeEC9wdsBVfRhoMpB3tWv36YkrUuG5Gi2AIFAXdIW3wjzmrrB/pXM0V4k5
         Zs9zKCNClN4iHq0g6JAKrnC4ukKpMa1cm6cZSasj4Dk1GA4WDzFW5GPg+SYXEq7L2S4J
         P4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeirCJAnAvYHJRWOqOsfW1hYyWSjdT+Ia3hbkutfMMQ=;
        b=elJFRioKrA5pdc0Yx3LtTohJKOaptGuw7Y/qQMaQ8VerI16cSpvccXzIgXZBlAD1Yl
         Xw10e37FdJxov+Iyaee3f4z1inbusWNs4MJu/2jrfC7dPbmVAgaluSdBeMuZEcneyaSv
         05zN3GXm1QZDy6gqfCGCow5JB0L/0zHd3T5bLh2lMOMbuPpMJGueJ1qauykOc1vt79sP
         hTiwoAsXKIWLHWup7gWZbZdYYFilY9uO0MhS/z7FhVBN6NruZrusrszrH2DW+zgrtqah
         gw69wU1y5uyUW03pdIidUyoXUtzs8q5kAMUHOtQsgZ+meIVJPjUyPMjQe0QOkw2auqfE
         wbOg==
X-Gm-Message-State: AFqh2kqP8+IoiHITrpywfAXVnnmH3WQNbfSuEW1QBACevWmmmNUHo3jw
	u82aIyAD8iCd+v4DNdTPyudDARLTbqZzguHSqE1sKnpvXUF9yAxF
X-Google-Smtp-Source: AMrXdXu2hI6GTxFM6roiARVxtIshJOJfKVdp6j55OgzYw67RgQhhNqIbaKmtFdYvzitjyQsXkdo2ssTrJkJ37MisEbw=
X-Received: by 2002:a25:9291:0:b0:7c0:563:c516 with SMTP id
 y17-20020a259291000000b007c00563c516mr1162358ybl.529.1674156627804; Thu, 19
 Jan 2023 11:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
 <20230118-mt8365-spi-support-v2-2-be3ac97a28c6@baylibre.com> <Y8l/mQjjgKJiE1/F@sirena.org.uk>
In-Reply-To: <Y8l/mQjjgKJiE1/F@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 20:30:15 +0100
Message-ID: <CAFGrd9pZ0Lso6LMKkN=ErujGgRi6t5_C3FvbMYHaV5V_DD0BnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: spidev: add new mediatek support
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-mediatek@lists.infradead.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_113029_259240_53D52319 
X-CRM114-Status: GOOD (  15.39  )
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

Le jeu. 19 janv. 2023 =C3=A0 18:36, Mark Brown <broonie@kernel.org> a =C3=
=A9crit :
>
> On Thu, Jan 19, 2023 at 06:28:20PM +0100, Alexandre Mergnat wrote:
> > Add the "mediatek,genio" compatible string to support Mediatek
> > SPI controller on the genio boards.
>
> All my previous review comments stand, please don't ignore review
> feedback.

Hi Mark,

Yes sorry about that, I wasn't aware that I've some feedback when I
sent V2 for a quickfix.

I will take care about your comment:

> We need a matching update to the binding document.
>
> This does also seem like a terribly generic name - Google
> suggests that this is actually a series of numbered products (eg,
> Genio 700), perhaps we should be using the specific numbers here?
> I guess users would care which they're talking to.  It really
> parses as being "generic I/O" which would be an end run around
> describing the actual product though it's not actually that.

Is there a binding documentation for spidev ? I didn't find it.

My understanding is to have something more specific like:
compatible =3D "mediatek,genio350"
Or maybe use the SoC name, to be aligned with the DTS ?
compatible =3D "mediatek,spi-mt8365"

Regards,
Alex

