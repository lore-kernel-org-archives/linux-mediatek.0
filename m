Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3309CC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 22:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063222077B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 22:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EB7hCRIW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymPQwlgo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063222077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHpyj/0RWwVD4hy5yGEjwEH0joI/9Fc3FVkAN8y5sWU=; b=EB7hCRIWVc5ON4
	VuDZFUmqwICbA+UHRf8aYcmTT6e1hve+zg1ZEcy6ClRvW9PBTbKzAQz4bCWPssum7Hsh2APv9dT4Q
	XJ6E0lOmXyaecLyZTOyDLyD9qBeHmG+Bbb4F8RAbj7uvZsABTFdbkyGhCJctaO2afFZRps64+IAn2
	1mzjhUxF/BWURyQsBOQygzxnSeveBo4xcKmLW5WdOsNJ0jn56Zz9gPcICT/JYa1LfGKANpYCM/Eer
	6+B+y04JAKHcYIFRqmLWBlnohxOG6eAiTLEL4uID6+XAoZmrP33M4M+evGh0pdBreZhvHMt7qqLCP
	ybTGZEN7VMihnqiwW6vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifnSP-00042l-2J; Fri, 13 Dec 2019 16:06:21 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifnRB-0001ie-LB
 for linux-mediatek@lists.infradead.org; Fri, 13 Dec 2019 16:05:07 +0000
Received: by mail-lj1-x244.google.com with SMTP id e10so3212025ljj.6
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Dec 2019 08:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbf8k5yJ19A5wSZeXVRUlCPqOm3eyldLxkULlc81AFU=;
 b=ymPQwlgoBu3AuxXxyAS8Pqr3jk0WyzPrXO0bCPOwIOGjnvgBRrGXil4Wbr2ayNyVg0
 5oHwBqXWHlNYU4H4t0AGAUVusSZhkfHiNJjIj3uc5bx4NxoOqz31/r1rWdCvix34S3ZY
 2LTTNgxyQ1bi8H8MZq9m+SG3t+rgn5AEU+AoO5VKhdPwcr7tzMRGFhdW9/jc9cvU1N9p
 yEh3vCXdHeINwcTyiFYrKgZxEzP6mSe5+H8dC7GEWci+dHT6he+jJOMaqoKrHvuaroER
 O8H3WuM0RCU6HzU+YAsXHI4yTGfj4+7zOW1wJoyn1ns5KWkT3b+TjkHMoaPRnN7i7Mnt
 wJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbf8k5yJ19A5wSZeXVRUlCPqOm3eyldLxkULlc81AFU=;
 b=X2HtnorE7ENAtAYeQvGpHTTTa7j+MjooKKrEtCr5QyFYabmuDPq9ve4f0uAmrUs9ZH
 dLQ/HhLe0mrpvJ2BLC/4Oo0o3KHGq5FPve2MbiJVqNaNsu9zMu18OzEONG7A+Kuqc3kU
 CI7CqOwF0XSR4SLw0yhLUw3xRWQC554sofLM7XQ5IEd3XB2KrxHdA4CzkC2L3QFwor7P
 GPN8XqqRXqFoVdt9KTXhZ3TrEzyksJkgQBM2b0UpsosE+RWGoCYYft3q/I5RYooP94q1
 S9pW24ETpxm0hgwKWg3bUvesYgon+wUp0g7IgwPcnlJPevTZcDGqPvjfLOqB3LIwpK3M
 Ax5Q==
X-Gm-Message-State: APjAAAUN/gbiWMs5zDJAIBXONwRXD+jmNWULfYAo2q56S9LrMCFicaeL
 fZUX8wk+MB0NEBMM7hi+RjW/6X/GCCif25RgTUDYRw==
X-Google-Smtp-Source: APXvYqwqvR2JGdbH6+gDLiMiftLZwqMCeGYmrtZEZ9p/3pwbALJms19uoBQteKErH11ha+LVboridg4Lm1ql8BrOASI=
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr9963179ljm.233.1576253102887; 
 Fri, 13 Dec 2019 08:05:02 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191211145104eucas1p1ce04a26eebcd4c22d72f204e7ae0aa5a@eucas1p1.samsung.com>
 <20191211145054.24835-1-m.szyprowski@samsung.com>
In-Reply-To: <20191211145054.24835-1-m.szyprowski@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Dec 2019 17:04:51 +0100
Message-ID: <CACRpkdbBBjXxftu1fw7H9N+hAe_MfkUPJErN6MPJ8Mxirh1w5A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4 RESEND] USB3503: correct GPIOs polarity and update
 the driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_080505_991679_3B68A018 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stefan Agner <stefan@agner.ch>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 3:51 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Marek Szyprowski (3):
>   ARM: dts: exynos: Correct USB3503 GPIOs polarity
>   ARM: dts: qcom: Correct USB3503 GPIOs polarity
>   ARM: dts: sun8i: a83t: Correct USB3503 GPIOs polarity

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

for all these three.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
