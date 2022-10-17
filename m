Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15289C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGtXer83XR+m2IYRg0JLDyRhVdnMRmL22/68B9bdc+s=; b=NfJcRz8Z3TUu51ARr345WuWNVT
	wk8KSMQxEUP5JF/rpmRoX+cN7pPayW7RkUCMg44UK18Xf8DYPlj4gkT8sefNI7VSCXnY/Fu/nmIm4
	gid8kbV4atM0OFam33dMftOEbZBHB+WKgzuQj8go5pX9ajIZLwSuz38i4znm+lKIzp15WvT4WJPuJ
	nMTjqJRr1V1bbNyyuM9xHYM8humgoAoI+RtSooksmHUo/Wt6ttssF69HPqJAdi31mnotx+/1SpRNN
	lUzOlh4CDYKfuYHJvdAwuHjnyqxyOt20CA07GUUwVFpodn5385mKlq184rLJYAZd3cLb4/dxI7h5/
	PCAIXrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okN1r-00ADLE-F9; Mon, 17 Oct 2022 10:07:27 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okN1o-00ADJk-Gm
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 10:07:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id d26so23694088ejc.8
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGtXer83XR+m2IYRg0JLDyRhVdnMRmL22/68B9bdc+s=;
        b=cPSJg29ReL0pEy8WEchjl4Lg6lCgqPtiMCk+uW+iqLI4jXhDtUj723lk2zCkAsVzLi
         9uPFG4e+nqqCn5k3ZJFJfg0NawpRatSOkoGQC37WGlMgF23kUX68RobsD7ItwAahf05X
         /xGF32dXkkwqH0zs7guJV9p8wJquXqpNxLXjDLPOjEcb85PmsY3ZyDwlhwOxdWqcT6C0
         gJ/X0m2F+77qDt4YEQTD7vSZbVJyFXPYgnGO8K4Ffc3q40IM4/tDBh+9IxTSDNFfhHpF
         Y8PzGBphQcIMwnlmGn/WNCeKoHRiB0B//IRp0kqDqlWsUIdsiJs3MkTTBEp64baen8rw
         FHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGtXer83XR+m2IYRg0JLDyRhVdnMRmL22/68B9bdc+s=;
        b=0RO42fPRgnZCrYr7Xwa/nAgETYBNVGb2S4SUdr3JoT19jPf6wWXxLmTt0rnehpqj38
         zysTePznyeDto47b4T4N5oXmD4HqiCmCFQ672O8T6FJrYmi2BGDYSBHgF+OBTNUNdYyd
         Qss+CtyJQVvogwsyvHa5/yjcRsVt0+A5gu47yrfLz1CzSuc4F6hntfoM5uWPu5ICUBJH
         rHDpIIryrdzdXxwcLYzbMd4nLZqamX0I8rUuy5+UAzgFTU4Vhdqq0TzvJ672Zo34dW/v
         pGFUi7RsZ2JrNMFXb7KoFki0NPVT6RPNu0L5AcPyK1ypDvEPKsUtSB3LZmRJaazK6lm+
         c0FA==
X-Gm-Message-State: ACrzQf1OZnaQDCoEmc641DA/e0fFmtM2ezsVuw6jy8KbNi4Rvdrvb+CU
	w7vjobT+ZhlZ03UrqkiAW/cDmMyZoi6a/Zn8/dQ8ow==
X-Google-Smtp-Source: AMsMyM4fCLG9gy4XOGjcE/5EAMi1ayWK6UFqjzahULlxctak1d9v60uUA6Cjl93a8nblOEVSDIstzxhou+9cfXqn7Os=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr4945992ejc.190.1666001242841; Mon, 17
 Oct 2022 03:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com> <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
In-Reply-To: <20221011-gpiolib-quirks-v1-1-e01d9d3e7b29@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 12:07:11 +0200
Message-ID: <CACRpkdbSg-TmaxK4yd2pRHpsg4FD8UR-YfWBFx49cJFq1qJjAw@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Thompson <daniel.thompson@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_030724_570878_43B07E73 
X-CRM114-Status: UNSURE (   9.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 12, 2022 at 12:19 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The driver is using non-standard "i2s1-in-sel-gpio1" and
> "i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
> converting to the standard naming (i2s1-in-sel-gpios) and switching the
> driver to gpiod API add a quirk to gpiolib to keep compatibility with
> existing DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours.
Linus Walleij

