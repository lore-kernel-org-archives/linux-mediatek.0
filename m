Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B622DC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxrSISGq+nm987pWEjhCXdxOzzXqLRcFMhyKMBMFxIs=; b=E9DN/sqdIQ6dzWmociYFMENaLQ
	SZAbQ9CHuRPQdmX3jIW1/75TF4uGckzjfEKk4r6TM+s63KbPOxLL2jjPVyoclWWe13hXpk3gUJk1z
	E8BQelhtnsc45XWJxPo/9QW3ZmOHuDLwGU5haa5zQ27NcI/mPS6T9Z7D68cgpXsFGETzw2ClqbgQc
	6Ag6cci1mEk6VgiAgAdqQwkiuSjbgyqY0LR70JMwxAgC5Gr2D9GpPcofU/TDF4eBFBxNN7gdTcvru
	5VPV9XmO3OtR9RIswM9Mj6pf7wmzCx5CqB0S5pNhEiG9I0lXRFc7PYy3s2GENDE9prW/9yK/O8Ug8
	dTkAaIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8Pc-00Amc3-Iv; Wed, 01 Feb 2023 08:24:12 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8PS-00AmYq-2W
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 08:24:03 +0000
Received: by mail-vs1-xe32.google.com with SMTP id h19so17031928vsv.13
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QxrSISGq+nm987pWEjhCXdxOzzXqLRcFMhyKMBMFxIs=;
        b=M7NIH1HYH98LP7pSFAXoZ89ifYgjXxayxeDyr95YBO+LdJYZ3gx4DJGhBeSRPS/3bO
         BEyjEIIjI3GgSyi5sJJHumoQIWNIw+OpJS81aydLD93zjbk7A0r33jy/PsYi5k8FRPJ+
         OIjSnkWY3wAvTGrhpbnK13wF4PxTcRfCvqo+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxrSISGq+nm987pWEjhCXdxOzzXqLRcFMhyKMBMFxIs=;
        b=kJ3pJSU/LsSwmY9B3whCGXTTr9/RWKq2Gncty9b/oslF5koV5RNc7ADD4DYQdb74d/
         nGlmkh7zMlytfqRulwU9jcmgdKaoaOfiZtLX/chj1QoCJumV6IOHFEPxF4BtgvvTGlPx
         Fj6dPma+m6v4gaNk7ktTgorv6Rj9DJAzyCkZFUNqr4HQH+Yrz9uPhEVjaPmEnjeprybw
         lx+ZZEgQHMlNSGdaVYhClPRWfp2nGQHdzrZ3tXS2mgxcjfHGwcJ3G6u0FThp9QY4+ZRq
         oGDp/bEdBOYhMIjwI4sFMypml3WSMFfj28b4xEOsilQzeZuPKws3uUcV8ixb49G7Zx9H
         YiSQ==
X-Gm-Message-State: AO0yUKUxQmmj2zB5eqCNPfoSWqwf+s0auh0UB5CFdbm74RnBsKLSK7yf
	u12FaglRkoSqhoH9I+E88/INbEGVh642upcgbVmCMQ==
X-Google-Smtp-Source: AK7set9FuoQIF0gvgaW2XnYZ7Gcfgt0mCFA74ijOGFQCMA+N2fIYaPkYKfEBXw+x5mqQ5DmuMj693skMwY6aFK0oNVM=
X-Received: by 2002:a67:fc92:0:b0:3f7:93c4:9e56 with SMTP id
 x18-20020a67fc92000000b003f793c49e56mr335385vsp.85.1675239838728; Wed, 01 Feb
 2023 00:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20230130033305.31830-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230130033305.31830-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Feb 2023 16:23:47 +0800
Message-ID: <CAGXv+5E2r5T+Okrsz4biksCRF7DfPkBSbbgeKCsidg1MgOL3FA@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: mediatek: Update video decoder nodes for
 MT8195 and MT8192
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_002402_122485_2336DD45 
X-CRM114-Status: GOOD (  11.21  )
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

Hi,

On Mon, Jan 30, 2023 at 11:33 AM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> This series is based on matthias github, for-next. Since there is a
> dependence in the following series, I send it for them.
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=702423
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=702078
>
> Allen-KH Cheng (3):
>   media: dt-bindings: media: mediatek: Rename child node names for
>     decoder
>   media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
>     decoder
>   arm64: dts: mt8192: Add video-codec nodes
>
> Yunfei Dong (3):
>   media: dt-bindings: media: mediatek: vcodec: adapt to the
>     'clock-names' of different platforms
>   media: dt-bindings: media: mediatek: vcodec: Change the max reg value
>     to 2
>   arm64: dts: mt8195: Add video decoder node

Whole series is:

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

