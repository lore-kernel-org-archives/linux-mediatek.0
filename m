Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7466FC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:19:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B016B64EDF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B016B64EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=od/i2asIIikAQmL/opM0k0UvtBLpJV+24U4DqUyyMEM=; b=NouTlRxWqJJg3Eq9piCDfIisI
	JHiZCe9aolkHTYLZy0dLALFvD68jkrUnSwIprgd/lRkXtv865aT4E6PNcxGXXkXLB0ZFacs83sDL8
	Odg/k3oeLPCtHdlWJWzjZyVlE0xBwdpc7o8yvWqawyV1Rxo5SnMCa6dzr53sNpWiZPatsnVDSijMC
	P6j0RchH7Ei18jR5M1jmcFYpNsd4+H3q/LyS8Ui+1NAOh+KNaaHYfBAlfDgczKBgytvIiCdPsPQWE
	hWRF8b8ozphwsEI4uRVsc+bU7HDrwtLAbtYzMWCJyIS1GCr9AZAYq/47mXkNJymTMt1nKL+w8IOD1
	Fl5dtQ73Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHV9Z-005lvv-Fo; Wed, 03 Mar 2021 17:19:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSu2-005FA1-0q
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 14:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TKcFkhM8Mf5DiRPH37Ng7ifpctLWMXPxIAc63q2YCdc=; b=lXmvQ99HvYaS5wdcteNyeO71ag
 jONwJ9IVTUx5ZMf0mbWk0gmq/4TN5Osb5j0VddLLBSzyzdPfuzweARC8fo+4UIiCDM+jE+m5BZSnz
 KIhsqPamPPvGHcPxUEodjC6tyWAI9xORgcTwIgZqr3yEvBa2ijbe8DBYAXZvA5F/50SIQJ8AJiLDT
 APJB6ICJ9VTOFuMYeyvhz0egzZK5ZCpYoKZ4NhoQOocl7Z9NQw1UGeCTEKG3f9hcKR3cSB8QvM2Py
 oEhzioYENHM9OURaqmZc8cYWMnC6B1Lwj/wjyYJkNfvdlDd0t0PR4pHjGGM74Jm1AvoLro7qlf66u
 ilvj0HNQ==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH3FY-00H13D-9A
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 11:31:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id e6so13635198pgk.5
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Mar 2021 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKcFkhM8Mf5DiRPH37Ng7ifpctLWMXPxIAc63q2YCdc=;
 b=STh1OiHiN3RIX3HBgcV9cNh+gyrXDrSjs+yTS/x+kts2F/gPdGop3OxANQsWwz1PTv
 JTnRE9eMpVVbVq9og+Q5gdkjwX+2PuRATcx+sYWgU5KIYCnXmtL52ehxz79ifFORxLgs
 eYUjOtMlD8m+37T0fPp+NqB1Qcq07p8BTq5gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKcFkhM8Mf5DiRPH37Ng7ifpctLWMXPxIAc63q2YCdc=;
 b=QIizxGXTvKbHFiOlkAVRWaN42N7W+1xnOBP3lMqaZ0mzgG1ai70ED/XoQHUafw8PKh
 h2zDvV1OC4VA3uvfwEM3N+F2+TUOibsYrJZALJ3i3paUcZ8tg7ku+KPtwS4hyBmHSRtl
 gcVu2f+UAj+r8d+rarNY3z+Uhz2CqbINAqjmPDtltIshyRMXpuiZ49RbJJhtYP+T3ZMy
 6EnSXzP9iaNj21zeoLTbgUHVSNLNnERULPi5yVb2RewUI8+K6xJd6LGJgZ1WBacNRsG9
 IljTy3823Ssm4F7td+6W/MWET8D3qUBCztKn+e+fu55uOrMoyyRUY4thdF4Dmv/OubSL
 gEqA==
X-Gm-Message-State: AOAM532bAsbVaHAUSe70+2PlOEisYqRgVNq09gXQAb1bL6SCmlkp8x+r
 Tle78mDV4wPg7S8tqQEIVNN+6PQ/cmXqwyT1dgNGXg==
X-Google-Smtp-Source: ABdhPJwBgRaP7xzFKc8KjHOOHQlUJLofabevE4D9pSBMT3XRudmsTh+IeR6puUqZDyGDZajOd3aOQ/x6HgQHHW5CLqc=
X-Received: by 2002:a63:515a:: with SMTP id r26mr17916655pgl.257.1614684632012; 
 Tue, 02 Mar 2021 03:30:32 -0800 (PST)
MIME-Version: 1.0
References: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
In-Reply-To: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 2 Mar 2021 19:30:21 +0800
Message-ID: <CAATdQgCoLB-iOcxN2ptDmqD69FnyUen5XeRTq=LCCfXmWkBeWw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
To: qii.wang@mediatek.com
Cc: wsa@the-dreams.de, srv_heupstream <srv_heupstream@mediatek.com>,
 leilk.liu@mediatek.com, open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-i2c@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_113137_565889_A398DE36 
X-CRM114-Status: GOOD (  18.40  )
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

Hi Qii,

On Wed, Feb 3, 2021 at 6:43 PM <qii.wang@mediatek.com> wrote:
>
> From: Qii Wang <qii.wang@mediatek.com>
>
> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 2ffd2f3..47c7255 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -245,6 +245,7 @@ struct mtk_i2c {
>         u16 irq_stat;                   /* interrupt status */
>         unsigned int clk_src_div;
>         unsigned int speed_hz;          /* The speed in transfer */
> +       unsigned int clock_stretch_ns;
>         enum mtk_trans_op op;
>         u16 timing_reg;
>         u16 high_speed_reg;
> @@ -607,7 +608,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
>         else
>                 clk_ns = sample_ns / 2;
>
> -       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns + i2c->clock_stretch_ns,
> +                                 clk_ns);
>         if (su_sta_cnt > max_sta_cnt)
>                 return -1;
>
> @@ -1171,6 +1173,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>         if (i2c->clk_src_div == 0)
>                 return -EINVAL;
>
> +       of_property_read_u32(np, "clock-stretch-ns", &i2c->clock_stretch_ns);
> +

I think this new property "clock-stretch-ns" is for the same purpose of
"i2c-scl-falling-time-ns" + "i2c-scl-rising-time-ns" defined in
Documentation/devicetree/bindings/i2c/i2c.txt?

>         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
>         i2c->use_push_pull =
>                 of_property_read_bool(np, "mediatek,use-push-pull");
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
