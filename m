Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F87C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 06:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30507611C4
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 06:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30507611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Av/auskHd86nc0r9t8HMpqT/T0szUbtJgFB2ldYcunQ=; b=435cMTerT0sWx0
	F1WWssVzwH81jR5MMseX8G3vqk+2sTYF/7OaPn+0CDpkx9RzLC/YcebCkD8cOafLPHyhRJ7gSDuxv
	nmLG2b3C739PfS/oEEidEdB6iZDXXsr09i+vesz4wcDw6/kC11GyqzGyrkjEFx7aSqpwUV161kk0l
	fL6WxYO3kXCVd5IpCOqsR++oev0kVCY4n+Frj7FcHUGEncRQqf4u7Z+wDnQwIu7JXhMmmz+IAiOAJ
	R+oWMY2sw3c8FSHjGIjPwdVdxE1CGHsXW20DzWGMl5FvW/SpBhwmQ2ZWYLbAUBdSqQc6QVcEMpCev
	Z4LpRtPoBNiGRSmJNRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miVvB-007yvw-Dd; Thu, 04 Nov 2021 06:08:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miVuy-007yuC-PG; Thu, 04 Nov 2021 06:08:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE5DB611AE;
 Thu,  4 Nov 2021 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636006087;
 bh=u78YSZDJYfigsy7GL5G4yNXKMBMaWKzma9S8XVynMwU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IfwmvxhgW5ygKsNG9ghm67gSI+9in4oE7VZi3M9NdBRTc7q7OKEc/v9JxqqreH519
 2FgObB627O+Vd4jwdfJjO+vKq6HIQ1097QFpWEgz7T3mJtq1yn/zcLC5L3r7oFb0uY
 i0K9/lkCxsDNYzEy/5aKapx0UOzDqPa2MKAwCWPKaupiAxQzmJVXPaGAe0fl/HATd6
 XTeA4CgrxElzaF7mL/u2mVC3dk8EwlFUf1IvUrIxBoD8M9b81zZU21V2OdgCHVricw
 DQwL36KZEUr2jTz3eD2ZHvydn6x7uzu633WI34AZjYV38KfCuGkm5syr1MYN23ozmH
 h8vxWyWrUh1hg==
Received: by mail-ed1-f54.google.com with SMTP id o8so17442734edc.3;
 Wed, 03 Nov 2021 23:08:07 -0700 (PDT)
X-Gm-Message-State: AOAM533b1STskLocwkj/SSHtPu1ayRrn+kLQ1inmc1do9xecJVLJsQKA
 45WoIPrZwciIpHgw63GwyYvNL9LgycIFX024LK0=
X-Google-Smtp-Source: ABdhPJyBVxTLTZ4b6DuU6NgWddxlcUlTiORn1PjxDqGqHxAT4Fs7BTZ9YjXfyqWgfOtH18SsScYUNl5vcRMqFHPTJCI=
X-Received: by 2002:a50:bf48:: with SMTP id g8mr67634296edk.10.1636006086162; 
 Wed, 03 Nov 2021 23:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211104014039.26772-1-zhiyong.tao@mediatek.com>
 <20211104014039.26772-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20211104014039.26772-2-zhiyong.tao@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 3 Nov 2021 23:07:55 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpEG_6w6fvmjaBAW3ihKQZm4uMEy9-5MaLLWkeu+QFqeQ@mail.gmail.com>
Message-ID: <CAGp9LzpEG_6w6fvmjaBAW3ihKQZm4uMEy9-5MaLLWkeu+QFqeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix global-out-of-bounds issue
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>,
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, rex-bc.chen@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_230808_866621_19B3571A 
X-CRM114-Status: GOOD (  17.18  )
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

HI, Zhiyong

On Wed, Nov 3, 2021 at 6:40 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> When eint virtual eint number is greater than gpio number,
> it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 45ebdeba985a..9d57c897835c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -286,7 +286,8 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
>         *gpio_chip = &hw->chip;
>
>         /* Be greedy to guess first gpio_n is equal to eint_n */
> -       if (desc[eint_n].eint.eint_n == eint_n)
> +       if (((*gpio_chip)->ngpio > eint_n) &&

please use "hw->soc->npins > eint_n" to perform the boundary check to
be consistent with the other places for the same purpose

> +           desc[eint_n].eint.eint_n == eint_n)
>                 *gpio_n = eint_n;
>         else
>                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
