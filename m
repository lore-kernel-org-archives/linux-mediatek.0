Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45698C33C8C
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 13:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E2A207E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 13:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0ItQk5P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qehfjqnl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E2A207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TavuGbL7jNmvst92i1/Dekl4IY6A6JnNethTDCGTmvY=; b=b0ItQk5PmzStMh
	ZKf8zX91p4mxoLYTS4xrNcB2r/ZhPxf4EIBxNLArQF3zrqI2saAzzp7BE8QRbTU4rzkIbrla/YVjO
	xTcdIY3HEHNP9rky9lj+GUSfY4A4lChYmXQSfN5mdoDWI0aAIVShIYMCZBQBBnQGMsUYIc1FZpj6g
	0IM0X+dWywr7qWhz6u36OrbXocy8W/QqM1Q6ahgmx7AyFsdxSc8lCIttTtx/FNUIWRY7Q+3gGnOgd
	oeRuXOVQVlnqMIFeKgJnKM2lToWb4TLd2LQS4gEJij8R9ba9V62UKjvXTpxoKF38h7+J3rMcmHi3t
	ksFnILLVxnlWjklma+EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioosI-0001Ss-Tr; Tue, 07 Jan 2020 13:26:22 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioosG-0001SW-00
 for linux-mediatek@lists.infradead.org; Tue, 07 Jan 2020 13:26:22 +0000
Received: by mail-lf1-x142.google.com with SMTP id n25so38882543lfl.0
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2020 05:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9djqwGIJf2I22OzfnRj3IuEtZ6zVvwdwNk4Hj6ZFA70=;
 b=qehfjqnlIKGhemdvcDzaHIWgPnMIKeEq9JYcoVJcdsSy8Wat4sbe4iABBcAk+56lCq
 n/niykJ5zW3gXIkUyKPDN2QY7xguV1vGofNnIaCmEItNPGFPAFKzl6aFKSLFUfGlhEBc
 h83Je2A3rbiMS+3FWD3mF39kdkdMn9H0hF4C91J4sYY3P9vSbioZkYKUH/HwI8hRXNdg
 dUWKMOcIYgJ6ExKWgP4K1ESqWNneUFp7hc00BfWmQzYO9XUdON/YZbPX4w2Ecr6ckL1J
 j+Q4ONZ5p8qiSABW176nzeVQOcpfF9kkhO5Kr12axgHB4S9HbTwYXs7drtn3eD4Heeu/
 UmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9djqwGIJf2I22OzfnRj3IuEtZ6zVvwdwNk4Hj6ZFA70=;
 b=gH/HXhbUZxhUxKUFnIbFc/fIgYas0YlzbwSr3lvo8m3hqBYdvPmGnbEcItqhDFNtny
 vZkNmUabO3lqKQKiGcqOgyh0qYuMBBLwx/8ghKPxD8DhGD+pn3amcGpE21zv5nSDs1vH
 +PtTvY0T43nadU4GC5Qnj7kfJXJCcy7b/cF1zDMUcRFilIxisHwPrOtzsl91YjcH2rHf
 bh1wBDyzkEzG8sAGyGgPQmTCe5QhI9Dk05Bvq8SUEtqRlKBFPYo3qla6r+2teoicAI9y
 pT5S1k1HInUexgRp5RIR6HmRUFMxTMg5PqVWy2iPJiHggmaJROQGGYnSoNElIeOzDB9R
 4T/A==
X-Gm-Message-State: APjAAAXcSHhqPwKMebrpWdzF8mzlfUk0Rmhun6UZDsvSronm9gePWQ3X
 yk7NHfbLVfr20riOaimTJ/d5WQFpSGpXb7rT57bXcoV+H5Y=
X-Google-Smtp-Source: APXvYqzkfn0LApP777P/NTsWuXQs9WqemFpwgDX6Y8xe92X1MAhfleO+4i8GW0Pi/uidnD4K7AZauJF4tdGd9SZmZZc=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr58785651lfp.133.1578403577691; 
 Tue, 07 Jan 2020 05:26:17 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
 <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
 <1578399400.16092.14.camel@mtkswgap22>
In-Reply-To: <1578399400.16092.14.camel@mtkswgap22>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 14:26:06 +0100
Message-ID: <CACRpkdYEq4FR07LyUSXRzPuQ=HXox7FJm+ABww0hvCYbHmQGkA@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_052620_038119_6F5A6D89 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 kuohong.wang@mediatek.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2020 at 1:16 PM Light Hsieh <light.hsieh@mediatek.com> wrote:

> Use of "bias-pull-down = <MTK_PUPD_SET_R1R0_XX>" had already been
> described in
> Documentation/devicetree/binding/pinctrl/pinctrl-mt65xx.txt.
> Previous MediaTek chips using pinctrl-mtk-common.c had already use such
> binding. This is so-called backward compatibility.
>
> Besides, according to
> Documentation/devicetree/binding/pinctrl/pincfg-node.yaml, bias-pull-up
> and bias-pull-down can have an optional argument to select pull strength
> when supported by hardware.

That's right, I was wrong about this. This should be fine to use.

> So, I think the propose of using "mediatek,pull-up-adv" and
> "mediatek,pull-down-adv" is not necessary. However, I fail to stop
> upstream of using "mediatek,pull-up-adv" and "mediatek,pull-down-adv" in
> pinctrl-mtk-common-v2.c.

Let's see what Sean says, I am fine with the patch set in general.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
