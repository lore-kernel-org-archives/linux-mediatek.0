Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E0BC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:27:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F8B6120D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F8B6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tQH2K50tB0mb+1B/lrmqnQwCfpwfzVQgSKqZUek/Bos=; b=c6jwPpQ2/H7TNn+EtcLZHftZ5
	9k5oVSmP+bjtvvXG7wpU9x78L2HcoM5NVdCubkAiBnrEl7xGDInRDCZZYGyCjXQhknOpNwWbsCZnM
	kwpZfBVZXnlah4jKbmHhO0RVTOLy8oeluVY8/G2BCPhZvUx2f9dcNXdoHnuMZ/qVbraLRxs9Ybk07
	9+v993uBhFnY9MIscqYy9MTRaNE276Irk2Az2Z4xr529QBodan3uhvqbDdtWXZS+3udFj1KQ4jhZv
	bkLE2MFToFDdrgX5R1AQjywHhSfsTFvx9p8N1ZDklLlExnr0d2uMuLridi18ggv+MrnZ/XRb2UkgI
	qjhpKrbpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZnP9-000air-BG; Fri, 23 Apr 2021 04:26:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnOj-000afF-LM; Fri, 23 Apr 2021 04:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WgOblXa9DbnM8S+Vs4/QxLo+vFlsBFlZ40B/ibKeUiQ=; b=BKwHOxmIWqyGQya73TY+yD99+j
 xtegSpBwEQkPWkpygNQsBGTkc4lmMXLl+cA8ydJ4iRR4pTnuJ9ij31Es+1RQCaWG2wiyJxi95GS08
 JM55jaQeNHcGKb1AT8H9fN+F3tYIAjpfXXtu3bdx/YugJJtSd9OwXfOV3NFmDEsPmif2rQFxJL6to
 yK3JHeu2I2yQ4nR/fmS9Php7Cjvrtk614eGyl2ECdvlSGLaeuU13VZ59DWOBSELcpatmjbubgBrhA
 kvogiHgJQbWU+nHdplKVZD4hTeo16ww+waXfvr6iQcrYnGB5SFuHDV2e/KiU4s7qW6R1emtXI9+KP
 8OQLStPg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnOh-00E8pY-AD; Fri, 23 Apr 2021 04:26:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B757661263;
 Fri, 23 Apr 2021 04:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619151989;
 bh=558kdhrpDEbvLspTxLwIBCC63e6vd0HtrJuvMY2HIPU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bDi16M67X4iX+mbvIDox+HW5nGhX42ou6wQiJ2ANIbTwtoIWlSCRVLqmklc7bBYsA
 8LSJhy0InMfv17D4hA/wPYuJo/yFe60qNRlKkeMb45n08ErbVkSKfsQWAhnk6bE/E0
 vAKctRe3cZ8K/C/jhZXx9VRG6QSF+CJcjXqCeay4hT/35mmxwRfyUtHmBRmH/NDR1I
 +vZR1T04asAf6v5jQVSQnXeGDyL6Hr3u7mpd+KlUxmIAxOdcMdsSu+8hO0scZhJxR0
 BcAWSyQs0znJxf6XFH4zmD6ciTgWsEjab7HS92ncwnCsaM4/HA2IQHmxWD4O/Mv7vK
 ZNv2cPsq6k9qg==
Received: by mail-ej1-f44.google.com with SMTP id u17so72015663ejk.2;
 Thu, 22 Apr 2021 21:26:29 -0700 (PDT)
X-Gm-Message-State: AOAM531why9uNX6hz1kYqB6GoichfzjRFVVSlFnDGFhF4ZproJJcYtOe
 3Tle1922ZL1aQJVp5mH58LMgTkVkD/b7l0KcVl8=
X-Google-Smtp-Source: ABdhPJwrp2WZp93WF7sn6a4jsARVI9yFWaZqYQT3ZabJv6Vvb4rZ45BPrknhQoO89VEgZCGMB/a8J8P7icMRRRLq0N8=
X-Received: by 2002:a17:906:5248:: with SMTP id
 y8mr2047850ejm.150.1619151988351; 
 Thu, 22 Apr 2021 21:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210422033559.29700-1-zhiyong.tao@mediatek.com>
 <20210422033559.29700-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210422033559.29700-2-zhiyong.tao@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 22 Apr 2021 21:26:16 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzof434sM0amt7q5wqJz79VpUJQchn64wrEX2wXM_zg8CA@mail.gmail.com>
Message-ID: <CAGp9Lzof434sM0amt7q5wqJz79VpUJQchn64wrEX2wXM_zg8CA@mail.gmail.com>
Subject: Re: [PATCH v5] pinctrl: add rsel setting on MT8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
 jg_poxu@mediatek.com, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
 seiya.wang@mediatek.com, sj.huang@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_212631_414285_8A3EA0A4 
X-CRM114-Status: GOOD (  13.69  )
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

HI Zhiyong,

We should insist on using "pinctrl: mediatek" as the prefix.

On Wed, Apr 21, 2021 at 8:36 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch provides rsel setting on MT8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  | 10 +++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c      | 16 ++++++++++++++
>  4 files changed, 62 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> index a7500e18bb1d..66608b8d346a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -779,6 +779,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
>         PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
>  };
>
<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
