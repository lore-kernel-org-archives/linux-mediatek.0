Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4A3C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1AD360F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1AD360F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jpr9vzIb6aEtlHnJTzGZtJJhnSOw9jkBf8zX0IQitLQ=; b=17lwAilJHMKHJY
	QCbMYUyJqKaTfYZjYb9wUdagc0rFU1WdFGKXNCAh1KulLwNirfRXDUEqDMmTaOkOjJ1t0MZ18pjTg
	dITt9LBeftTqBucDbCkFZBOfaCpb1dluWav2k5nr59ZXFplmEK6RbNyKmawq3Q8pzZhDLZQPsUH8n
	Sl6TshVV/uFoh0wILtMOxymcp0XT2xyegRRUAo0fxbQ4XGE/HNWtico3mqGMLmP0nJE8Q70AVotMj
	nFDF2cFdP0RSPzMONmoeYZGL/FqiFXlnXsqF1SoKEq7cx0KAMaGOwyMhheWTMSkcwjLv48Cri71iO
	44WAn2+oTVGbL9ZyEhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDka1-006JUx-F5; Wed, 11 Aug 2021 09:31:21 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkBS-006BkJ-US
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 09:06:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id m18so3431260ljo.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 02:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WHR5vMYM5Xq0aEUZrFZkJXPDd1LunIEi4v9qS0h1HO0=;
 b=U9Jax0Pz4olLYQJIFk2TzLLCgD1/AgsJjjc1jPyfKN+iHIfSf+sOvIgQ2mOcBufJOe
 dbr669Dfx7xE+7MQXb/jTVZ9PEgd6/3eyXVPGZOoS32v5CEmRvBSJBGOfOGRPUkMz0hr
 Ytp9oJLePRyBugqYenwQeXFNI4dEVGqFCsCV9UzVJQcEW9lrhEZrg4sUfRmNk7ACOHck
 a4a2fqVpcZG274sxyUTFt0N2g+UU5o//7Meh9BOOjDCmzm2tbbJtOrxGrx25r3/4WXhB
 lNP5/JqECXVMx468VZLokXnF9EuF27I4yPLn2YSKV9ndXpW7fCzOgPzKek/fUy820QsH
 bx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WHR5vMYM5Xq0aEUZrFZkJXPDd1LunIEi4v9qS0h1HO0=;
 b=P2Iko96cF5DWIQfNaAQzJkq4tZfxtq5n7A5jM4uqtW94ort7sDME730YJzfbUjWRX6
 xp3WtreeZpQZDwmxx8hEcaFgY0gG6AJog9n5N5gDqdrvlWYebRhKcT31M8Qf9/ejskOf
 hIF1PvXbNzFpg9/Gij7/wH04hvhc4Sz20YcKuOLqFv0NmGa1XDFv4xJUIMF1bb+d0z7i
 fQ4GJocxc5E+6zIlm/ewlEb0qcI4on9JJuBM1wE4HMlKfvj2Y9g4DpVBd5LAfQ9+7LmS
 mCjxVaM0ljI4X47FsN5aMCPz+we9ius8fUSU7zPnRh82Ci6BBX0YbAjHY6Wne07KKmq3
 LLtg==
X-Gm-Message-State: AOAM533buZvqjKCkTRxwKNW8PbQw9g06F2IlxvwNHJ/akUggrriQZuyG
 hpbLI+2tVBHOLIs2cQB4wWo/FZYxj+OpyTvXnVTgkA==
X-Google-Smtp-Source: ABdhPJzJiIAevboqUG5VU4DSPztTjR+dTM5JpLH29JynmMjAv5LJj9eIi3aCBtOUd4vqeU+9At92D/p9hhh83zGz9LA=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr22350417ljo.438.1628672749431; 
 Wed, 11 Aug 2021 02:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210726111941.1447057-1-wenst@chromium.org>
In-Reply-To: <20210726111941.1447057-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Aug 2021 11:05:38 +0200
Message-ID: <CACRpkdYgTeqWz=S+HfLAhd4M3HYESkhvOEBbS6_185PYUzzxWQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use real world values for
 drive-strength arguments
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_020559_014263_B4479320 
X-CRM114-Status: GOOD (  13.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 26, 2021 at 1:19 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

> The original binding submission for MT8195 pinctrl described the
> possible drive strength values in micro-amps in its description, but
> then proceeded to list register values in its device tree binding
> constraints.
>
> However, the macros used with the Mediatek pinctrl bindings directly
> specify the drive strength in micro-amps, instead of hardware register
> values. The current driver implementation in Linux does convert the
> value from micro-amps to hardware register values. This implementation
> is also used with MT7622 and MT8183, which use real world values in
> their device trees.
>
> Given the above, it was likely an oversight to use the raw register
> values in the binding. Correct the values in the binding. Also drop
> the description since the binding combined with its parent,
> pinctrl/pincfg.yaml, the binding is now self-describing.
>
> Fixes: 7f7663899d94 ("dt-bindings: pinctrl: mt8195: add pinctrl file and binding document")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
