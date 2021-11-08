Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E3761265
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73E3761265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6K0cmOwfvJKqKKNmMkmBzJsCZq60ddno2l84DVU0tlw=; b=BRz3Su9NZeVDNX
	xxqHgF7uQbGAL5QEDNYXgSUPHa2CSdTLqKXz4xOfXKsHQa20yRU1fdbv6QfrMWnCcY/1ZJgfmI8io
	vBT4x+z6AI/FIC4vLhwe4L6+ur+yiWy3U0VVjqiAaOHZmwQySFSH9kDCRQIeuGHdCQlTUDxAHqRa3
	UgvX0XdC4QiZPOaUh36qh3CvvtmFzKwM5cMPyBk/jH2qjhyiz6VhtwTmMzVGWYVyRg5Ydalra2ekG
	gb4w1y05yElgu/GX25UI6lyZBVeKsvbKRKlyz9jWkuhLN6IhICiIfpoPgi2PkMs9wNzxyZDBYR8Is
	pJD6FdCr5fUluC5H/ItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk05l-00FkdY-UR; Mon, 08 Nov 2021 08:33:25 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk05Y-00FkZt-4Q
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 08:33:15 +0000
Received: by mail-ua1-x929.google.com with SMTP id p37so28804199uae.8
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 00:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXgMKC9k7dVBPc7GXJ0i9A3v0PLbEQVurYRUswXeJ14=;
 b=GMUrD9cF4ys0Ne5QeiY1boHEUmgLrJKogjRUJYv+JOiOlCLwsHPpus6RLIpS1aTKEc
 b9ZmfolezMysdzYltsRvw38VDRkFvWSASXeRyimw2zzvCQX6337hJfcOxyKjscOpct5F
 NZItoB+PrucYaFhbhqzaHmjIndbDJdCCLj4j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXgMKC9k7dVBPc7GXJ0i9A3v0PLbEQVurYRUswXeJ14=;
 b=N9u3V1+cPrr9NL5OXgFnhiLv/vMTi+HziisVj7bi57CM+HXxYN8Ou6OUJaD2BcC9RO
 lWqf1Vz3H9fd5fWh89iNsp7I3wSnDwJ5BSfBwvM58atkWzsjVizvq6hxoxXNXomAv2mM
 1v812GI3CH98sOWUHy+t1mnpnnyUGNBJRk0HAJiuBenQzwiElo8aFw/TrxCA8qeJUlU5
 L7H/YvnitwkpdEAf/bOg8nhS7u+AoskdHqQdDo/K44k15yOFyuEavfq6q1CJ3PDnnU3W
 2Dyix8I3IlbDuHiFUewGzQj3dS4qm+9yLgiJ0w2b19HDtLmAliDnfwtBLgGnmifaV+I+
 Owgw==
X-Gm-Message-State: AOAM533fDxojkfK6HnReeFrN6XDcRuf6mvfz2+YkgirYyKCp3kPavr0J
 Od+cnW1xVgNWnY3K8iwBsjNtNyC/u6SRXmglCJHa+g==
X-Google-Smtp-Source: ABdhPJxwvn1gZ+jImt6Emh1mXxnrYYIBQQzRFhinEsRuVwhdIgr19u7Y2YDFSD1M4Tpw0lPsAeAjgdJjgrfOjizmG1U=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr101092748vsh.7.1636360390609; 
 Mon, 08 Nov 2021 00:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20211104112329.8446-1-zhiyong.tao@mediatek.com>
 <20211104112329.8446-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20211104112329.8446-2-zhiyong.tao@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 Nov 2021 16:32:59 +0800
Message-ID: <CAGXv+5EWCkcC51nNF4k1FgEsVhuiQADCiOcdSLtU9yMb-8Q0GA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: fix global-out-of-bounds issue
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, srv_heupstream@mediatek.com, 
 hui.liu@mediatek.com, light.hsieh@mediatek.com, sean.wang@mediatek.com, 
 seiya.wang@mediatek.com, rex-bc.chen@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_003312_211978_65F59830 
X-CRM114-Status: GOOD (  20.80  )
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

On Thu, Nov 4, 2021 at 7:24 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

This should be tagged as v2. Your first submission, not tagged with any
version or RFC/RFT, is v1.

> When eint virtual eint number is greater than gpio number,
> it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

Guodong's Signed-off-by here is confusing, as they are not the author nor
the submitter, and as far as the mailing list is concerned they have not
handled this patch either.

Looks like the original patch is from https://crrev.com/c/3233623 ?

It's customary to preserve the authorship and append your Signed-off-by
when submitting patches written by others.

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 45ebdeba985a..12163d3c4bcb 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
>         desc = (const struct mtk_pin_desc *)hw->soc->pins;
>         *gpio_chip = &hw->chip;
>
> -       /* Be greedy to guess first gpio_n is equal to eint_n */
> -       if (desc[eint_n].eint.eint_n == eint_n)
> +       /*
> +        * Be greedy to guess first gpio_n is equal to eint_n.
> +        * Only eint virtual eint number is greater than gpio number.
> +        */
> +       if (hw->soc->npins > eint_n &&

Nit: I believe it's more common to have the variable on the left, and the
invariable on the right, but maybe it's just me:

    if (eint_n < hw->soc->npins && ...

Either way is OK I guess.


ChenYu

> +           desc[eint_n].eint.eint_n == eint_n)
>                 *gpio_n = eint_n;
>         else
>                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
