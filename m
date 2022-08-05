Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9D8C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2ieeXn1XYzQEoAXERAtoiuhedMKxc84xGYpfjmziLo=; b=GeQxM8fXrd4uhVRNfn9VGUZlIK
	sqdvr5Yl5whJo4TnwUnaxsQKFz4S22bbQNABI/IiAm+K2B9mUSSU56CYqXTXsl4QzdPu+OKCT1yQN
	qFoaqoopzMAj+ebuBs7Gu9j65vWhAPYBzhHbhhXQ55hy/uSQbXhtFLcvm6zqaM5rfUCXxx9RW+1+J
	9GQoRC3UxaffA4wVjjViu1/G6GAdDta2lJsdkCk6b7vzgJPqV/XPyFjLCSFy7GKETIq45FtGR4LWF
	ijtxaB+4E8Xd0gajDo+RhXAxR6S9b6mVhBvHsK2lfzKlF0Vjb4gEfFECM+vb9o9+UfNQXm+QND+GP
	C/Bk+laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJykG-00G38j-Ai; Fri, 05 Aug 2022 14:56:12 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJyk3-00G349-Ao
	for linux-mediatek@lists.infradead.org; Fri, 05 Aug 2022 14:56:02 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 7so4260422ybw.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Aug 2022 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2ieeXn1XYzQEoAXERAtoiuhedMKxc84xGYpfjmziLo=;
        b=qTsw1eyE64qeAATFcbipfMIn7kY5QX2XulxCrOIU/qTOWxD47vwam7q1mTXJVm86d5
         2TbTud/YX7DLm+9sZMbUnnnGcJXFV1E/yHKCqvL2duhDqnWv4ADVuGpcrPgy2o09/be3
         nwfhocNqiF1S8Pqak4maOt59343+m3BLj4nByhmLZ33FvMPjYHv5lUCkOklPPsJRN0d4
         eDOCxOqn6ZtHmXYMEZjv6R8ogrujeNhT0UleJWvwfeynm1fivenwwyTWDOlp2MLMWn7t
         A+WLggNonuMAaPmKKC71zXnpvLC2NnExygeK04xWS/XKXNMxaEnUPsII7Aj/VfykIS0t
         e8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2ieeXn1XYzQEoAXERAtoiuhedMKxc84xGYpfjmziLo=;
        b=K500nZ9NDBCCgxuEIM1iqe7gBWFI/NwjSgVP0TASaitnGv+LH2UsfxKYkaHoeWnLi6
         d4wkDXJLlMzD1bu6E96Ob0kQqwKHaOKMNY6eaTYz8OdQNEBPanO4x7F0XuydUWN3Tgga
         mROwX0JNAzWmYWnm2ezx+ynhi+5kE5K8Urs6g/m6r57ol/xkru8RZngewMFqoI5zWHCU
         JOJjTzJfK5HEHfjy+Y0qs+S94vgnBv4co3t1tA4S9pv53doDguWIG2MQAyTbEKxBJ7vI
         auy10SyvcqJJSKHIVgMhZABhUyOykyYUz8uYk6XdlRgH4OFJjEAY7jRICPiz8s9fL87T
         vHpQ==
X-Gm-Message-State: ACgBeo0saqquqW2BcBklLi4mB+JftKWPQ2/tKMcCrkscVBvWhV50iAUu
	lqix8HmHTTPjIUHo5c7y0pshwmh8gQ5o90KtjHBd7g==
X-Google-Smtp-Source: AA6agR5xvmSSt0uCcPBxYAIibyKWHGuE9VCu0a2Vm34w2xdcAJLM0zp+g7TXIUlYeFQU4IhbgvyvdVh6xhV4KCbq4nI=
X-Received: by 2002:a25:268d:0:b0:671:7030:f9d7 with SMTP id
 m135-20020a25268d000000b006717030f9d7mr5627753ybm.513.1659711357090; Fri, 05
 Aug 2022 07:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220804130912.676043-1-bchihi@baylibre.com> <20220804130912.676043-6-bchihi@baylibre.com>
 <0991e867-10bd-56e8-c8c1-b5d0cdefbb52@linaro.org>
In-Reply-To: <0991e867-10bd-56e8-c8c1-b5d0cdefbb52@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 5 Aug 2022 16:55:20 +0200
Message-ID: <CAGuA+or9uZjN3wiRtO_3TsOh+U=ekiZWOo1se0VsKTZXgd3kHA@mail.gmail.com>
Subject: Re: [PATCH v8.1, 5/7] arm64: dts: mt8195: Add efuse node to mt8195
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_075559_612821_B6391CEE 
X-CRM114-Status: GOOD (  16.82  )
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

On Thu, Aug 4, 2022 at 5:22 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 04/08/2022 15:09, bchihi@baylibre.com wrote:
> > From: Alexandre Bailon <abailon@baylibre.com>
> >
> > This adds the efuse node. This will be required by the thermal driver
> > to get the calibration data.
> >
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 73a0e2103b83..cbd0401968a2 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >  /*
> > - * Copyright (c) 2021 MediaTek Inc.
> > + * Copyright (c) 2022 MediaTek Inc.
>
> Why changing first copyright release date? This was not explained in
> commit msg.
>
>
>
> Best regards,
> Krzysztof
Hello Krzysztof,

I will drop this change from this commit. There is no reason for that.
Thank you for the review.

Best regards,
Balsam

