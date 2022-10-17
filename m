Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76892C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUk1uQhdbMxD0/T/au1bW4ciWhKciAmc4+RpG6d2heA=; b=wlqrQVL2lBoGQLYF5pJdnUUC20
	XS+ehEIBcZrQJI+/wYjdlPdQFPOtLkpulIyl1MkdAx2Vv2Z1P34PLdeXS0aLYQaV0Ze/kusnDayZA
	5KelloERxKRdQbbqO4rl7cOLQfl0b9r9CHDgUpWus5tsvPqg2LnIcl8aHtgdRBhn5Z9Yv8ykOovGw
	jLrx+HfQuklhDZ0GxFA1w3F6lnGLcZGsTKuADtR5tbeNNwcNPXib98Dl1cfddTZk0dHmmvzbUexzz
	SjIuCYH5v5Im3uTFGf76XfnOzz0lx98HCoqURKcBqJ0iqwwZvK92PYIR6yTzGBQ9/4H7QBunWScmd
	+e6hU1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMCC-009cH4-9T; Mon, 17 Oct 2022 09:14:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMBp-009c5J-0V
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:13:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id b2so23430259eja.6
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qUk1uQhdbMxD0/T/au1bW4ciWhKciAmc4+RpG6d2heA=;
        b=vfbDFYPQeOsjqvmBqlSXKZrnbw9dcBRMtC/z267YLsxGP7mXixqCCr+FChTkCxH2+o
         q3AHwbpjoL8JJpkxbEv/rgopQpF5cvOOK1ZCvu72+2HzXSIqfHPH3tJ8WEvs/yPMGRH8
         qnJbKsMekd6FtUlkPibir5Uw0cccXqTbmDC1b4ArqomJu1rL6mLzqZAksH3TUGP99UOk
         cfbj2n9R7ZH3M6ntyMZKftT9U+7tudK4NdC45uKeF2SH5eLuGtYfHk8QqcKwHw5JdHI3
         qU5QdFL6/bXHhXJ9ZKWumQrA4raDTMkyQdppjDfvAjnairo4MLHq81zqZIWlTNe39XFj
         rbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUk1uQhdbMxD0/T/au1bW4ciWhKciAmc4+RpG6d2heA=;
        b=bLPKw4Hjf1NAlMk8fygXWQw4RsQiQj+1mHn8hDUo8z8xb8JeLoPQp3iku/6ZsL6wec
         BCJVuXFAlfia17DXQ2UmVm0cWvgxsD8xEykn5h7o7VjT5MvzsBxFGGR1K+tmoNciaeVq
         ImpKDGHpE8OY/wkz+DHOM6cwHgNd1OgJhQP2TRi7oZciRh5OLsyVT+ZhgV13+UkJ4Z+i
         0qy1lOMKq8ATswGzYzczP6OjD9e7sXAXjHjMl2epzf4jy92cf6gogBTtKxL9kgh9oX3w
         i65opXPgFOrpq5ZzV737aAjSQ0kqpAvs7s3pvCcP41XQlHgxfgzztUYLWxSB7dkt/Y/P
         4vyg==
X-Gm-Message-State: ACrzQf3m9WNiEu2bqIH4M2Zurwd08/02kgQxpIYLsYCO1Az/Xs36qrCY
	ACgUlRndIetED0b210zZbDmPAsasAoXC1wePaSmCTQ==
X-Google-Smtp-Source: AMsMyM5IcaB+/89z7lKy2GkwDgaJrMZTmiPyWfiVGfk2VKHOuGBwhZczAZ2NNHz84JySZqBRAKhaHChWmfkTPCymXmg=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr7442664ejc.690.1665998019502; Mon, 17
 Oct 2022 02:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:13:28 +0200
Message-ID: <CACRpkdb9b6Vckv3kVRWkB9dfTWetG5u6YkxMb7Re0O+EgH5QtA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] MediaTek pinctrl DT binding cleanup and MT6735
 pinctrl support
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Andy Teng <andy.teng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_021341_173419_48BAEF42 
X-CRM114-Status: GOOD (  14.08  )
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

On Fri, Oct 7, 2022 at 2:59 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> This series adds a driver for the pin controller found on the MediaTek MT6735
> and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
> for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
> to begin with). In preparation to document DT bindings for this pin controller,
> the existing documents for MT67xx SoCs are combined into one in order to
> eliminate duplicate property definitions and standardize pin configuration node
> names. Necessary cleanup is done along the way.
>
> Changes since v2:

v3 is already looking very good!

Please fix up the remaining comments, then rebase on kernel
v6.1-rc1 and resend, I think we can get the final reviews and apply
it after that.

Yours,
Linus Walleij

