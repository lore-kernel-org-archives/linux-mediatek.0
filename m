Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnZ0jHoIIhi4SQu9hwtpn6Occu74dFqxMCAOPrpNhO0=; b=yRTY/2uB5geR6h
	KwnMzk1iwbF6f6lzUgvZHrzCtg7PT8kusnTrPtkLCr2WNTofgqmGyE8Ak3zXx8wsvv7FQY7ckm35a
	HExL+WY5nnykDaLsO0xB5/UBpvId5cMeYkzpXw8tz9ePDYmAMTkhvK1JqzDGiB2wakTxsr/ENivo9
	eYmGZYXIORD7X4Jh9zyMZYWiRcV5lqPivtU1fzf+pALeFoQ68+2v41yrCAd/8xDAjM/DeV8qNiXFn
	0oZkVJ93CfY86AYSZBrx79yA1cMmUzcmGqcevy7xw1qqiYN5NEdMCNPeKwVrG2qZ7BsbJgHLRhWHK
	3YtRXaaLZO4J2zQcfrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKQ2-000OP0-No; Tue, 10 May 2022 07:36:30 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKPz-000OLK-0o
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 07:36:28 +0000
Received: by mail-yb1-xb36.google.com with SMTP id x17so8632977ybj.3
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hY6+591F/MlGVcpiW79HiU9PaxG2TVex+7uSdNAfNwU=;
 b=F+/zbLarFdPEvCfE6RK8zuQPQlwASILc7H/dXEH9raiHrJ5nZnJ9L4ajoixPqPuZL8
 JOXEaN8apqfOE91L84yyAq9K0tB7+/Fgym5m4hJUq4GWhkRx0vDZyPBtN8kvmg3bk8+x
 R3/pPqZxzLUV7WehRlX7ch+gWV7aLhr4+NKCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hY6+591F/MlGVcpiW79HiU9PaxG2TVex+7uSdNAfNwU=;
 b=E3xyU1nQUvCJpdDHXiVGgdJPUAsOoFFofIdPseEDlZ86kJj+oSARqH2e2+3mQLYx0b
 tbnUpIGJyJlf81oSDHQ0dBLyTsR1FoxCUM7ms28yNr2l+mfZzFjN3xkfhUb8ii2ylZgy
 Xz3p5MaoSf8/EqvaU8V521TaO7Nlx+D0y3aIre9kaGRX0Ufc500dk01gRJ9yXhbEm3T8
 qkKRiBsKfHOLKx1B8h37z/EiRQC3zyMiDTJtvImFvlbeS8X83nIUPM7XuOkGNjI0p/R4
 rmZDNe+pAHJdDWAoTJc3k5JqIHxOa2MksqZMHtqAjtHfp4FaKy4XmXLFBmwos9/cwuE5
 bYGg==
X-Gm-Message-State: AOAM5315ZzWHYPnXIU9E8mnAgYgKoX5ZN3wy5bnTZ3I/gSUYmXL5WTR1
 kQs0YFAYUcIB3f3xetMfL/TRn0taSUjkNb4hv2rBaA==
X-Google-Smtp-Source: ABdhPJyZ1hqwJRTEoRgqfcQIHd9G1+rLkWX/KBamglxZ36Zz+eyqsXZC6Uao2LgkxJct2f4y9cA68vC0ZT0cCRoyoIM=
X-Received: by 2002:a25:a28f:0:b0:645:db89:4568 with SMTP id
 c15-20020a25a28f000000b00645db894568mr16506227ybi.189.1652168183675; Tue, 10
 May 2022 00:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220510152020.1.I6094f0a935212eabc7d9348d6cb5a2517ccc2514@changeid>
In-Reply-To: <20220510152020.1.I6094f0a935212eabc7d9348d6cb5a2517ccc2514@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 May 2022 15:36:12 +0800
Message-ID: <CAGXv+5FBJScU_-YC=vhPVM0KEO5vtP=KOH_gRnpFivQaHziU_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: add aliases for mt8173 mmc device
 nodes
To: Eizan Miyamoto <eizan@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_003627_102420_9DDE522F 
X-CRM114-Status: GOOD (  18.08  )
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

On Tue, May 10, 2022 at 1:21 PM Eizan Miyamoto <eizan@chromium.org> wrote:
>
> Doing this makes them get enumerated in a deterministic order so that
> the assigned name in /dev that the mmc devices get assigned is
> consistent across reboots.

Arnd, one of the soc maintainers asked folks not to do this:

https://lore.kernel.org/all/CAK8P3a3_uO23Y0tyfdh26tmCVcyp6XM+ur0WUd4khGUoBb32Hw@mail.gmail.com/

and subsequently all mmc aliases for Rockchip were moved to the board level.

> See ead9f7d7ea9 ("arm64: dts: qcom: sc7180: Assign numbers to eMMC and
> SD") for similar work.

I don't know why it didn't happen for Qualcomm though.

ChenYu


> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 6b02cff605fbe..9f3cd54116de9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -55,6 +55,10 @@ aliases {
>                 serial1 = &uart1;
>                 serial2 = &uart2;
>                 serial3 = &uart3;
> +               mmc0 = &mmc0;
> +               mmc1 = &mmc1;
> +               mmc2 = &mmc2;
> +               mmc3 = &mmc3;
>         };
>
>         cluster0_opp: opp_table0 {
> --
> 2.36.0.512.ge40c2bad7a-goog
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
