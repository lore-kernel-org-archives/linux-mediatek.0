Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77575C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 00:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9GYL2OEjH2VZQxn/+Psz3kXBkXs6uxVwOL2fKnNqRg=; b=T1YX0lXnr6Ss0g
	rXsexIrL/V5HpRCGeVDwjdewCc5RcQonvTCco0J8AQ+AsbSIBhjMe4SpkD6RFO74u0ioeK9bRgFZG
	rBERFbW3hvi7ng/sjOyQ8MNXAdX5Cbag5wZws7wLUtQs2fSGwHqH1cjfvihuBRTn0Qkmb6G/BxTT9
	Lh5jMjw22DdtZjuwmiTcXH9dIWD41PH9gI5NYZzzeeLjfs/5WOxYfik6ks9qfm7wJhCxsRI+U9Vdh
	7XFWi798FFheN5PR2ot/khMHa0V9MfWym+QSBOmF38q4hZRKW6gyKRopw8GAPyshCvS2Qih4zxr1w
	05k8BaqCbS1vE7L5YsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTv3Y-007LJA-91; Tue, 15 Mar 2022 00:28:56 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTv2f-007KxO-HS
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 00:28:04 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2db569555d6so183935507b3.12
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 17:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zlK3WC1mVUGbQGst6DyMlPxUP/ifBpvAeEOrFJ5i5EQ=;
 b=hMpFLuIiUKAb3llFmhhX49w1UxxcNjaLfZ8iMGuhlrju3bMe6GglIGbQ0olBtgA8jr
 MXCoxFbtDcDoZ30WI4idtFlek3Uz2MfEOI76o7ABc4Y415w6paJXPGC63/mvJlmNLzQ2
 uECj1ZEptDv63LPH0O4v7BdFsOAhEr+miWZAJYv/8us7vdIOVvkoOlBP+FuPKsprrdig
 zJQ/uSY/QnL+EZ7EeaVSjyW2kia+x0WYEd6AUHUxQ/IUOxkfw4Or1IoPkKlBi/DL0ee/
 J9Tjz7BVVzS98nHS6s9i9osF3tUdhnY3UxfLD42L3Ria3l2bAyobprt4rZQODxEFgecR
 oUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zlK3WC1mVUGbQGst6DyMlPxUP/ifBpvAeEOrFJ5i5EQ=;
 b=Eheg2K/AHcJF8bEFPBhSXUJa3tx/hjqz+n0/eRXxiPJmtjALd09YH0G8QhKlkekEsR
 b7T3irc9+kqiXhhcwZPxj4zlRRoBya2OQwdkFr2b1oARtASKelEiLjac8wPkAXDMlGJ6
 8U8ZcBhlSYcKueEN6VhfMfL9qMvnql5PVrblYD+Jf1oPUez2btcu13Oy7JKMCszOZMBv
 vTxLoqlhxHnXUJMaOkwgT+WH3L8/bBYtU+vXk5qIOz3vmUnsr2hysHTX9b2uloI7YJQR
 ADPN2Wa+7wo04/jSN24sp79IZpxZKFpVBWkh0kZlJWglO6TqmBByOUF3+B2mE+vZQfE9
 kg9w==
X-Gm-Message-State: AOAM5312JQGuReF3NmI6DMrW6w7GU/rkrYzMsh1OPWdmN3Uw187P1jON
 Gdf9RBuGvWgqaFRcV6+GRwP52kwWkN3aYrUo+SgkHw==
X-Google-Smtp-Source: ABdhPJwNfXZsGtJ2x5cCSKckQ6t0JFF0cV2XOrXT4oYs4BzyLPgK2ZLbtRnVXVHiksdmvlwK9JGm+1CDCViziCKL4IA=
X-Received: by 2002:a0d:db15:0:b0:2dc:b6e4:cd2f with SMTP id
 d21-20020a0ddb15000000b002dcb6e4cd2fmr22599346ywe.118.1647304080133; Mon, 14
 Mar 2022 17:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-3-tinghan.shen@mediatek.com>
 <8a95a9fb-fede-b2e4-d616-e03c9e6778c8@gmail.com>
In-Reply-To: <8a95a9fb-fede-b2e4-d616-e03c9e6778c8@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 01:27:49 +0100
Message-ID: <CACRpkdax8TCsJTPf6-nWeoDQkm1KVz32NY3+4yWGybL44fDegg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org, 
 wenst@chromium.org, chunfeng.yun@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_172801_611607_BA8F557B 
X-CRM114-Status: GOOD (  11.30  )
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

On Mon, Feb 28, 2022 at 11:13 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:

> Hi Linus,
>
> On 16/02/2022 12:31, Tinghan Shen wrote:
> > Extend driving support for I2C pins on SoC mt8195.
> > This property is already documented in mediatek,mt8183-pinctrl.yaml.
> >
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Will you take this one through your tree or shall I take it. In the latter case
> I'd need an Acked-by from you.

I applied it sorry for being slow.

As it is a DT binding I don't mind if its applied elsewhere as long
as it has Rob's or Mark's ACK.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
