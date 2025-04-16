Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF9C369B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 07:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=; b=v4tyywHewimTwctoQqV3IsRZKa
	RvgWvVzH+KubIV7LTkClEcOS/d4zj1YV0BZ/harswc/HLTyw/qJhtu4uHUJTIImEv0MWfz8FjMTiN
	Mx6LkgDdnikqiFsQ6aHzs0AkImeaYY/nlzAjkmhyggseTlAgMLuSqgYlBg8PT0rhpC4KOptsmk9Q8
	iiGwJFlEjO5ols9gIJvNAyURz0Am7mnxVWs1sTIm6S268HdqkJsH1MM8deY5D7SAddrf3yA6EIApH
	6RisQgOmbVDW8MpXaqo8X7jMccmuyGK9daikQcheuCDBYvvZ/Xk+r8tHOoJvEfzygI0/Vr2SLuLxQ
	dIlolgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4x4t-00000008aeC-03aK;
	Wed, 16 Apr 2025 07:20:59 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4x30-00000008aAt-3LTz
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 07:19:04 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso66419601fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744787941; x=1745392741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=O0iq+PeWmcF86l+qtbP3XlqLlE368IaaFH/gBVQx/Svd+9h4G9ltXMAZc0mxWXbhZ0
         pUs/KE1VVQvw4jxTVRPqhp/Fnb7zecxBO3UXInzJyj7MPjy9mQEJUfZAlFtqsFg+9ITu
         +GMiiyORVtkIavCmv4j7kSFEdxcQ+wgaSQifFXJxmzq+BTfE4pykjYBG/BQ+3Oqtv4jz
         FEdK12pdhSd9zSYotEXr4Uryh4WtInBCahVHMaa0yfycoJMMJyeqqvJg9S+9smfZr9K5
         g+2ktD0rzGWFkU1W+2yajv5yyJLRXorURpQDhbQ39Rtrtyafam62WZGYqy15bSFH1NXh
         gxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744787941; x=1745392741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=tnJTezwC+seNWuhz3ujRdBjjXMar117Z1XWsA9SXqyNJ5JKSETIBsBBM2kOABKW29g
         +fRwZ5yl7ixQdXKxNn2ODntaRCB3e7FWx9zlsfQMT0F9kLCreDtupJPvb0z9Q+m/TFAm
         mNr47C4UTKhckY6hWfTvnJbnRh6uIOrKdrljhha5uIPTW9s3zxE3mcaHrkoOMDuIyqhC
         MIZqTUCNIg4S7etbnz0aqfuYPy5a8VXAwBdQI5ng8DBkkIFsFJQlW2lB4MR1K2a+LNC8
         9OQpj73ysq2Oc1mbdtrroY27FTfVqVgxdMSqAg+jjs2LorJlVicwHcwU74fhP4my8895
         B/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcNgzl/aD5+dX5iR4g4l6d16r2XTc6ZIIbJXaJ0jGAnmDRrTvMZ/GUtjo1cg9A409pwl7PHlZ3WOSvS0Wriw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdRwFqGiYnvf3Q1aHgCCotoVeNNqEpJTz3FxWhCkovIpDNI9lh
	ZG39XIYnLIHKOaGsqDvGCXpIPw2dCfS6eVOpCkZm/aFiIIKKAOXRlLNdRkvhZUy7og9AJ5EYQac
	TnN6ZvSN4SgPXOqRIx9Pi+urBym/ZfvJZxw2BHg==
X-Gm-Gg: ASbGncvOhy7o6p9gxf6bEyUXsyb6YLb3zq7gX7GM/6dVBwgdlvNj6kWCQpZT1z3LZ+o
	M0ojOh48G+6t8DC557a2oPpreZkQukV0NCv0iBM07FZznB3+wWOr8Dw0B3NKsUOBdlXA/5pUikv
	GeZjUoA4X3ITmXzChrZwGMrtY/g2gXY3NK
X-Google-Smtp-Source: AGHT+IEwGuf6I9l4WitaTnVvA0VbevlCNH9pw1Uf1YwESFwjIdIWV04UPwa2Rl6g3j8USJoLTzOTQddgM+ExezMBQpQ=
X-Received: by 2002:a05:651c:12c1:b0:30b:ed5a:6f3c with SMTP id
 38308e7fff4ca-3107f6bcf91mr2027921fa.10.1744787940653; Wed, 16 Apr 2025
 00:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:18:49 +0200
X-Gm-Features: ATxdqUHFBx4p6s8-l7d5L0o8ZWLKTNSVqhv1VO0pGzs9J7s5wacyrKjxAz3vpys
Message-ID: <CACRpkdbKXfQVNGm=QoCHE8xeMKDi5Z1jCmk18XAaTzCcWCDjuA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin Controller support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_001902_845150_2C673716 
X-CRM114-Status: GOOD (  10.16  )
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

On Thu, Apr 10, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200

Patches 1 & 2 are clean and simple to understand, so
I applied them to the pinctrl tree!

>   arm64: dts: mediatek: Add MT6893 pinmux macro header file

Please apply this through the SoC tree.

Yours,
Linus Walleij

