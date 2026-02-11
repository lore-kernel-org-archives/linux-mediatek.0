Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99013EB5954
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNM7+dqYol6CvwW/AICqCR+k1WexBtc5up187PR4V6U=; b=IXY43+mU9kV8JcO/QCudszgscV
	pqxOwiHfELLvwJT4N+zbmf0Y25ZCG1lcFDAG7WmWRus6VoJp7pgY90e2fXaKJU8L/kr/K6qmFdhFt
	2JdKXN55+9nyumQ9tpH0EgnWiIE1CMXX44gcgU+Rk+ZNBzy6aUaI3nXm96E2rfqM4M+D6lyTuSp1f
	TnE+03ZaNFhetkwodq7bXnlMuSB0QlKC3X1x3LKwFCRLVts7Az0lYa/r49sUhVusPRLQmv8VemJoL
	bYSSr8R4j1lJKYMENtYc/LnRCMAxru8qUySHuaJnSV5tVFHaTaUxOy/QYFFoxaWFh6/ZQfh9axwCe
	68027esA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6te-00000000SXT-27nR;
	Wed, 11 Feb 2026 09:52:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6tc-00000000SWz-0fp0
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 09:52:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59ddf02b00aso7709108e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 01:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770803550; cv=none;
        d=google.com; s=arc-20240605;
        b=hiGgT352TLwtFlhtXFNa94UTctqI5zopVJinz7j52wt4QPLnP5GmzsSpPw+IbBTnvp
         AV72kYKX+6p6x5jF54zzD4HcCXHVT6KhR5IO8WBWIdQeGFLbCokXhpRymJPle1L2A7yv
         MOs5cV274l7iGaCtSqMb9wiFgjPLXG9Xm9fULrC82QcAYIEtdBs2kcbBFaNs06IvEeL9
         V8mtmik4Na6sk8jPjOXyNtFd41qQETHYXfto4mLgYsXDzecaYK9C8IBiuwAKy1K1/FSj
         mzwHjjRZKSTztWVYL6bD9Kv10mx8NzYZ9ROvzvipK5Qp4sCcBRmTV7V7zyyWHiEf+Kw0
         nk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNM7+dqYol6CvwW/AICqCR+k1WexBtc5up187PR4V6U=;
        fh=BN0cDRJxUf8QfMSDyLM7CtrQZsjAIxI+yYePzxt99Us=;
        b=dBEZlTp0P8Dm9oGJN1M95jhsaflb31QV9/hoD8kj2QXHqE16f41iUNb6WfdYluFcs0
         6kznJeQ7cTqq+EOp4QYJP6FqZYiu/Q4X2LSUOj2OlTPgzK8alc/uA6c88YOqt1av0CZh
         k9XyKyHZTSsf3pRI2NJnZ+xoegHBALkAi3/eHYbXZ+vbAh8+bCNJRUU0GY/gc49DNSB9
         aUrFQSJicqXVz1l7Q5tsIQ+iaL2RCLoKO7LCoYLw6mjkossbwP9i/f3OrsQs0Q0M6DTZ
         EKnmmmA9HG3xzbPANtoJwJpRTVRGNcnEDRKFmwkJ2VwYGCt85FpWLkw5jGmDFD6mFGTz
         IDvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770803550; x=1771408350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNM7+dqYol6CvwW/AICqCR+k1WexBtc5up187PR4V6U=;
        b=KVuqZ4qvd68YzFt8eWZVDgUf2YcyvAazuT6uFiFsspriGzuGUWMDbj4c5vpNsSYUHX
         nnQ0ch9IE6ej1PvC2T1jvZiAlk+4m2Q8/0aa41jZJxd5HzTPggECvww/JIPWDVZr0Iwh
         iWYXws6y23R8SJCcejiUMnh69YfIQXzbXiJdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803550; x=1771408350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNM7+dqYol6CvwW/AICqCR+k1WexBtc5up187PR4V6U=;
        b=beZuryhPfjvTpb4zqdOzMXcSG1cypbjJZPLTCjUjfaHgQhgoAhNy/joSN+33t6/o8I
         X89J6kYECoablBNj33gc1gWy4LLJJ5l4MPdoHZWW+xemqxg00sMo/ZcUXl5XeoX+9rNA
         pQv+BENTBYHsuzgIyBFfEIgskaObFTqQp40EaiEuzvSNFiEjP9Du+dI0mOuWEFUF+5fh
         KK2tgUxt+nfu2zwm4H+PtnEICCAHO8EvP6LWZhDL1a/L6QqFU9MzapWnFpRBkm/4XSBI
         nk/sxnCxEUX2LXe/awZm75rqQ9LiaQAXItFOAK2sEDfPK7BeeTnXHVNqO+WEzqvj3zyB
         HrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhCPibCk/AtUpqzgI6c/CVSigvBVwaNpwA1A4vJfJdvrWnffV26iWwRHMNC5JCRNOpnLrsWE/akVciAX96MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFZfEoEWVxh71u+Kx+bjR/l1YokWl5yPjl2FC/pN5LOtrGDc5H
	AsSWh03QXRBDjReg2hlRtpE1JE6WKM0WCNL0D7skKv1Y/55YOzhA6muZSmU3JUoa+aA65COJTvc
	PZtU8eLtU2DZ0QCco2Hb2OUm7+CUuHk2F+lPCOmSF
X-Gm-Gg: AZuq6aLhZG/cSOXPs1DT7oukj+Dl3aNBwIB9m3W/ZuNLNRCLDB9flizUDcswAFj4Vpg
	JWhIoQbN6vvK5Xtj/4FwYrzZ1K5ricjRb8oQJs+yU2Vjl+MixPMn522dS8+BDdo4Aowsy6yGTrT
	qXU9qOhuTTWKFcwQuL2s0hHgFaZunORCHe/fJda8Y7nuyfRuMa3/XhHSvCzZFx/uuMmSlbvMGuV
	J6Rql1JsMFRbCub/2YxZLYcQHp4GvtP3S7c2py2+DH8LLxqpReb9bnUlMpILK3KUlcjHFQqWZ5A
	dulbFRXR6KppFF+VqiOQU51c611iyFjhHjKj
X-Received: by 2002:a05:6512:2244:b0:59e:523:ddc9 with SMTP id
 2adb3069b0e04-59e5e0805ebmr522191e87.46.1770803549951; Wed, 11 Feb 2026
 01:52:29 -0800 (PST)
MIME-Version: 1.0
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770746444.git.ryder.lee@mediatek.com>
 <69521aebefef405bad5117d4d5d5fef4a5dfb7e8.1770746444.git.ryder.lee@mediatek.com>
 <20260211-miniature-chital-of-plenty-1a71df@quoll> <bd4da0a8522db2991ec0844233efe068323c2578.camel@mediatek.com>
 <b00c8c18-930b-4cb9-975d-b15118bfc854@kernel.org> <0dceffe2e1344830c12bc1f6516d13c7bb488b99.camel@mediatek.com>
 <23561f00-9f3f-4d4d-81ae-aab9958bd797@kernel.org> <0572bd6e56ca872e285729ccd4c2201517b66e18.camel@mediatek.com>
 <388e874d-d9ff-43f2-b010-ca7ac29aa065@kernel.org> <0c7b854e342e2047fbc9fc8e8fd80b67a6ec2bec.camel@mediatek.com>
In-Reply-To: <0c7b854e342e2047fbc9fc8e8fd80b67a6ec2bec.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Feb 2026 17:52:18 +0800
X-Gm-Features: AZwV_Qjfx5xbtiM_CvuB9ceKCwswDittQ1fUg0ke-_sxFS_qlXIG8TKjT0xy2K0
Message-ID: <CAGXv+5E=REdz0g8rfi7+KvyC7jLXO0q=yjan3mMTGtxe0NgCDQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: wireless: mt76: clarify backoff
 limit format
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "nbd@nbd.name" <nbd@nbd.name>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_015232_283543_045BDF1A 
X-CRM114-Status: GOOD (  24.86  )
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

On Wed, Feb 11, 2026 at 5:19=E2=80=AFPM Ryder Lee <Ryder.Lee@mediatek.com> =
wrote:
>
> On Wed, 2026-02-11 at 10:08 +0100, Krzysztof Kozlowski wrote:
> > On 11/02/2026 09:59, Ryder Lee wrote:
> > > On Wed, 2026-02-11 at 09:41 +0100, Krzysztof Kozlowski wrote:
> > > > On 11/02/2026 09:33, Ryder Lee wrote:
> > > > > > > > Why this cannot be a schema?
> > > > > > > >
> > > > > > > >
> > > > > > > Well, actually, it's already a schema. This is just an
> > > > > > > expanded
> > > > > >
> > > > > > Where exactly?
> > > > > >
> > > > >
> > > > > How 1T1ss is used across different generations is what my
> > > > > example
> > > > > above
> > > > > was talking about.
> > > >
> > > > Where exactly it is already a schema? Please point me line
> > > > encoding
> > > > this.
> > > >
> > > >
> > > line 243 paths-ru
> > > line 261 paths-ru-bf
> >
> > I do not see there anything like you wrote here. You just list all of
> > them, no device constraints.
> >
> > Best regards,
> > Krzysztof
> >
>
> The original schema is a broad description. Now a reviewer want me to
> describe the differences for various connected devices, but I don=E2=80=
=99t
> know how to add a compatible string for PCIe, USB, or even SDIO devices
> for their constraints. So I used the driver=E2=80=99s generation name... =
can I
> just write =E2=80=9Cmt7996=E2=80=9D? Or do I need a complete and meaningf=
ul compatible
> string?

You can fill in the PCI or USB IDs as the compatible string.

See for example
- Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
- Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
- Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml

There's no equivalent for SDIO, so they just have separate compatibles.
The bcm4329-fmac binding also has examples of these.

If the hardware has something like a chip ID register, then you can
have a common fallback string. At the extreme end of this is the ARM
Mali bindings, which just have one compatible string for the core GPU
as the fallback, and per platform/SoC compatibles to cover the glue
layer:

- Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml


ChenYu

> Or maybe there=E2=80=99s no need to change the documentation at all and j=
ust
> let the driver handle it, so we don=E2=80=99t have to discuss these detai=
ls.
>
> Ryder

