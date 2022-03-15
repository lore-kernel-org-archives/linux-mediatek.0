Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 00:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyHNrUnarzeeVSXkWS1zN7puMx7h+AxhFguZwHRdiQM=; b=KswnOwyUxrqDZS
	erUmWwlrLaxdtmX9kQDMf1rSZ8zHc+EB9qUbifm8r9UlcJ2XarFl7CihBUqqd2yJ0Sq1VS6/tdRsI
	27g6ls2mzaoONMvEjvzsENgAyw+BjJAzk93A0amUxW83kgzQzqiDSEE7hDHX0y3boc5JwIVYIAkmq
	BN6pRNH6tVGRp3fApqkLiV+p6SceMWZe4XgYsTzpbOaci3o9ExBcDbxSqWqaaa+1s1wfEAPsFdp6B
	USA0ap65ihdNIfCKxRmQuZFy2O2PlBQKYQov30eEK1T9DADIbeobrcUmh8mMl/3Ot6gdLgQVQa+py
	McnNmCYps0QV1an1gh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTv26-007KcV-Iz; Tue, 15 Mar 2022 00:27:26 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTv1l-007KPn-Rb
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 00:27:07 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id j2so34338668ybu.0
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 17:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6zq46rHunNi7v3K49xKmXhCI5sJtyCz6o2pZoTkjlQ=;
 b=oBVypg+q31LLjPraa0FmLk8b8a/IQ+bLc4AdFUpwXa97vWDI/VwwPNA4ZMvUcIfQMk
 VGMIIWcbjJBUpBG4KCnuasIOpbM/EjA/z6G4OW5lxUodjSiL2OCz0tdO9gZIkRvqfJ8d
 ekLNpaWYEixyNMI/A+xW2xORsYFvSS4DqUPIc0ALOAVUgF3Aq7LcJhvDb7Q3by5kUKD+
 /Ixvipr0jScwivBHQSbgkbhu3rjyJX0OdOynvGGWdHAb1L+SGiqPgUt4ECfzInKhOwAo
 EJ3nPikmUrD7xaACVJwmTlhvRJ1kV+JYG2c5XEiLOeWnKY2OvjMd7DCjW4hfzZnHLHoD
 Jnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6zq46rHunNi7v3K49xKmXhCI5sJtyCz6o2pZoTkjlQ=;
 b=V/lG4kE6UHYs/y3zNOFACXDhRfiF7CRaf/J09WRiXjGBHTWeH6sx0jyIzo7SFGDvpv
 y97OP5lX3bcgKBdIFuE24Ajeq8jtqLDF1d1//qsu8Hmpwj1bWSAZRxnx3goztnNLyfdY
 wL6nIFLeOZCdi9C7Q37HDnm7rjO9bX6lLf9/jnhUlDF/Ze+VQwtH1N65DsiJEjeTh8mB
 EwncAsLg5x0NICtz30iDBK8uPvEWM5mmqKJwBZ1ZI7hjB8t7hdBOgYdpiiBcpsx+BVLW
 A4jGs22aU6byFKUYUdoK25OoBR0rN+FZFPZmAdVtUevGL1gkycVDyT1JQKKK3UW+tR2D
 9C8g==
X-Gm-Message-State: AOAM532KwnPZT+DvzWdpkEl8ZNuSi9RZ+1TaW94DwtU63yJKLTS6Tb92
 UAAACDQDXzNK6dhXc3SjqXfhr/AWPtCr3UaD5SpeQg==
X-Google-Smtp-Source: ABdhPJzhNSBMeH8Wbm5RieTMFPizoex0ebgYgfTJfbTlzcSn/yt9wuadfyo1A6KVLbJC4/hoy217PiYiNj5qfdUXwpY=
X-Received: by 2002:a25:e710:0:b0:633:67d3:7264 with SMTP id
 e16-20020a25e710000000b0063367d37264mr3458356ybh.291.1647304024460; Mon, 14
 Mar 2022 17:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-3-tinghan.shen@mediatek.com>
In-Reply-To: <20220216113131.13145-3-tinghan.shen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 01:26:53 +0100
Message-ID: <CACRpkdYP0RTfPDW3JSjpKHuOkGyVMG1Y0XAOidcespz+qN_7Hg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org, 
 wenst@chromium.org, chunfeng.yun@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_172705_941145_A8C65AE7 
X-CRM114-Status: UNSURE (   8.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 16, 2022 at 12:31 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:

> Extend driving support for I2C pins on SoC mt8195.
> This property is already documented in mediatek,mt8183-pinctrl.yaml.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch applied to the pinctrl tree for v5.18!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
