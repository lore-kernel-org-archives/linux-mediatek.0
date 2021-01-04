Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28754C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 11:17:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC37207BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 11:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC37207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w3JMZK0jIcmD6kpBmYvU2W0iHaizp1sTmJRjemagKt0=; b=KFhqGmYgmqnB/mW95sq1arh0H
	z6TT6DU+RjGhzBQfGk3MgyCh8uNKzSrx4B5lGjgU5BegAzu8C7tUAsoZ9XTMURG9256zd40A43Ybt
	/E9gQAonBTVYGegiyufWd8n+nDCv724l1G4BgeTbWKzwBIuNjEW5YjiDTR6s2RyJqyykjB0A1sSKh
	z/t1qrnzCDFaJmmns+bIx7tHgKLe3HQXroH6wT5PgKfQCetrG4PqnythpijZbDiRInoG3+d5GKszD
	9IUlrfnL5FX30WWVNOJ6O8NbE6x7gQQlFMPYv8E0LXODetemu/DCOSXJfONxym09S35x2MaH3brM3
	bPsboAUtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNr7-0003aE-Mb; Mon, 04 Jan 2021 11:16:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNr3-0003Wj-CY; Mon, 04 Jan 2021 11:16:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0DB0221F9;
 Mon,  4 Jan 2021 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609759011;
 bh=uMBEM1sBct3RdywsmPonApX/v+gWFaKH66WhG0tYHo0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rKCA3FxFwVrkONJGWdD30YVr8xvJ6+8FM5PJBOqETMPAkaO4uLxDQ5TBvptn7bW29
 uKeVaD6XwKGA3IGegC4XAu91TOSOudhULm/IXI8VFXsUSsP/5oFOGoD/fHw7Kq5ViK
 NoSVc5E/2OCw1bW5NzUAlG6AYRjUOSWI1JYVOjT6sIcq6Mbl0aflWQkk3cP1mdcWcA
 3wFzee3cmEkd6AagD39M2h1nhcIn/4F/Gecr1niZRZ/gPYxe+4nnjFiFqeG2SizDVF
 hbki3Gif3ki3V4ybA5dGH8x8mjYzx+FRbUna/wnT0617S5PJitl9PWRIXN26+3S0jO
 Jqmw9DGAX89QQ==
Received: by mail-ed1-f46.google.com with SMTP id i24so26920345edj.8;
 Mon, 04 Jan 2021 03:16:50 -0800 (PST)
X-Gm-Message-State: AOAM532GSGcVEjejLttGnMSobtdvlGwCxPdvPPi1ACJ2JWm578LtXqlt
 8iyXBjxmKylqdssfPZGUClEVkqlMugqbLai5O7I=
X-Google-Smtp-Source: ABdhPJyPIH882GUu/EUWEx2AKmMDKuflMAHIUbwC22Baw4r62pz5lztcMLZKWa93i6Qqm2usbqJ76cllwrXrlKQOX6c=
X-Received: by 2002:a05:6402:1d3b:: with SMTP id
 dh27mr71532550edb.238.1609759009492; 
 Mon, 04 Jan 2021 03:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20201228090425.2130569-1-hsinyi@chromium.org>
In-Reply-To: <20201228090425.2130569-1-hsinyi@chromium.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 4 Jan 2021 19:16:38 +0800
X-Gmail-Original-Message-ID: <CAGp9LzqEaBNBzd2DhtWZ=Dv9C1u1MZzpFFofGGEprMOJCdUXHQ@mail.gmail.com>
Message-ID: <CAGp9LzqEaBNBzd2DhtWZ=Dv9C1u1MZzpFFofGGEprMOJCdUXHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback call path
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_061653_962206_FA1CD7CD 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Light Hsieh <light.hsieh@mediatek.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 28, 2020 at 5:04 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some SoCs, eg. mt8183, are using a pinconfig operation bias_set_combo.
> The fallback path in mtk_pinconf_adv_pull_set() should also try this
> operation.
>
> Fixes: cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous Mediatek's bias-pull usage")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 7aeb552d16ce9..72f17f26acd80 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -920,6 +920,10 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                         err = hw->soc->bias_set(hw, desc, pullup);
>                         if (err)
>                                 return err;
> +               } else if (hw->soc->bias_set_combo) {
> +                       err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
> +                       if (err)
> +                               return err;
>                 } else {
>                         return -ENOTSUPP;
>                 }
> --
> 2.29.2.729.g45daf8777d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
