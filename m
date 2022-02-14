Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5153BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss2Zstlfob1KrrIgTpHMn0SH1A8gfZSJcjU0SB1lOz4=; b=JdTgghJGK1x/ou
	/SGcYNPjVza+WitBUWb1T1R3KHTZoPTwOkTXfvu8GOU2gY1AlTLCHV3nTgD865n/iVbTyzUF4hzL0
	iYEvw8R4VAih2Qz2EstxymPFnR1vO/6/pNbWDQTZCkpSBW0JUZhYuc+ndXg02yueKVF3oaJPGXkct
	DvnbHiNleCRgrOnZeSrFsNtkhErsLNBh2G/5PWYa53A6p1beN5+91K98ZJfufXjI/K7A2ib+ensep
	NkTp4iC/oe7CMDLWbi1se/4rEuQZvC4vdK8M0s1Zdzgwq3uLcOUXGrHmmP+FGa9YbsVsqkTOhYag8
	V1YtB5WkaK1/SY2W8ssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJeDz-00G0ig-N2; Mon, 14 Feb 2022 16:29:15 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJeDl-00G0eK-Qw
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 16:29:03 +0000
Received: by mail-qv1-xf33.google.com with SMTP id v10so15221385qvk.7
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JskXaZJX9EqtyU9nDYwhDYopK1GYBeF5QAk0Zlst3K8=;
 b=WFoQIvGxJEbg8UOaiV70tS6PGdyf3qjcG0fNJQKbyHSfj48VnWpT1uPRsHkSjKp4oI
 VyXEAHc0fq+QePjMo/XUxaUdqQMw6JpndQdJRAM+wSSoz81Cj3PoON8L3Dmir1bNHNxO
 JLMBAFjfwqf69spTV2mC/gqt6Gw5T35QWKhp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JskXaZJX9EqtyU9nDYwhDYopK1GYBeF5QAk0Zlst3K8=;
 b=mdkQJm2wuSyAOl/n2Qtpov32C9FD6fjd/Ace9BKCr17BJKe5hcfzcWuPP23kPnwtmn
 BBZRjL+dhweONXz+r5n2MVJaaWnMlDLEez4Cp7bcffi0AgopeeRISwrs9bhNZWHYQEje
 QjJbUd8Ck8k/qTfWQQ6Z4nAaKXvn6kjyi/nIqKmD5qXM4WC4FPdfblyViQRexmqg8FqF
 +94eL6rjvepIli+btGmHdXLNDIL7qf95+YgIPKpeaUZO1lQWkGj/sbeFg3qI0B5ytBEP
 5Nu82MxZ074A7JCX6MAq5aBsrlWBMXvNgtnH0mEaLXCnp5/M8SA76v5poxHWHBA+zDvL
 aq+Q==
X-Gm-Message-State: AOAM533AuzdkWFV3VMXZYck3f8CWiVpelWO+SYrAjB3ADoRovSVUkgUa
 BQDTcLZFxCoAxcm1rwv1tselEKWqpqp7SQ==
X-Google-Smtp-Source: ABdhPJxfmJ1/YFuvtzEZZx2NOcVT0Vfljb8KGv3wq3SH3IMM3iE8b8o8Ds15sekD7JXVbGCoSAviaQ==
X-Received: by 2002:a0c:ea42:: with SMTP id u2mr256932qvp.123.1644856140440;
 Mon, 14 Feb 2022 08:29:00 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176])
 by smtp.gmail.com with ESMTPSA id q139sm4583121qke.104.2022.02.14.08.29.00
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 08:29:00 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id r14so15892246qtt.5
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:29:00 -0800 (PST)
X-Received: by 2002:a02:3b67:: with SMTP id i39mr299652jaf.50.1644855749283;
 Mon, 14 Feb 2022 08:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-5-krzysztof.kozlowski@canonical.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Feb 2022 08:22:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wzr=ra=_mt63Uj2p6PSNoEF1F=zN0-0yg5rcWkBFYkZw@mail.gmail.com>
Message-ID: <CAD=FV=Wzr=ra=_mt63Uj2p6PSNoEF1F=zN0-0yg5rcWkBFYkZw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rk3399: align Google CROS EC PWM node
 name with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, chrome-platform@lists.linux.dev, 
 LKML <linux-kernel@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_082901_883654_DEF24FAB 
X-CRM114-Status: GOOD (  11.05  )
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

Hi,

On Mon, Feb 14, 2022 at 12:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
