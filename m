Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC91C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKNwCpnkd4HHouKuRGDnXl3uAXRtD1+lzSL7fC1Un1Y=; b=TjXpa0p1zySTMiluQYoNk34YXU
	la3BMO9TQuqdxrtHYR0QagKKbPPWP9pL8tVqys53hOOkVk5FMbC+MhZxgJjmkv007yr7+epfKBz12
	sXckG0vDqng7OhAPipGoMgf1woYwbiicGGBx4ZfdZ/A/XyYdHYQPkAzBSkv5cKh5e6cJ48vkhQ5ht
	SrzgW8G5FkGFLvoXVj1yPh2llGoQD/jrvgcT5JMZKgxLngJISbqu+f/wizxN9Rc/p7nKHkpqN/mCP
	y3GALCj701q33yEQ7EZ14MXv7sa3zViVrCDdJv7g/XOL2cdLsYKT97FY3W6iJjF7nn5lpsKy5s67z
	aKfeQmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DGw-005NwO-1g;
	Thu, 23 Nov 2023 17:13:50 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DGt-005Nvi-07
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 17:13:48 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-daf4f0e3a0fso1053396276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 09:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700759625; x=1701364425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bKNwCpnkd4HHouKuRGDnXl3uAXRtD1+lzSL7fC1Un1Y=;
        b=r++wz9DDV1Y4BpgRbP0nDkRw2bntujLIn/kaTf0IJHHg8rS6l4EbAXm0As6hrgFZqH
         6gdvwX+j5dH03ZkqqKlxVE+euGaRhQ3Pv+O5yUKnHzjEdEEQA8fIqxoXC4c2/8HbwjDi
         FGkmOw2YQX2u+qvb3qdXgxSGOTYTc7aKWJJJkMVyUWi2DefPO09iRJekLVf//74wdSN4
         BRSf6sw2/jys3QmppJjERAqQ+Qx/2itlDzx21QBAlr3qpAJQ79fPybxv7Uc5hR1PMDMw
         +dzjobnuWuLwx+Xxv9A7uDmYV5lXHvDDyDE4HtU+RMIE7iY+MEO7CHntVdSYn7lnshGp
         YJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759625; x=1701364425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKNwCpnkd4HHouKuRGDnXl3uAXRtD1+lzSL7fC1Un1Y=;
        b=AScpbUivnGPbixAJv8OIW2lp4xarF0vWsAPo0mslCLa5iStuvreFVF/GGpEK4ROToF
         4ebHbxLOtSRj/+L7HU8ArDKqbJEy03YwcqLKmL7kDZCuEiHFWf6+Kp1OzbigbXhUOJhc
         sQZxe/bw0Zy32ZSgY/fV4W7BQGXmCwzu6nC56WboMfCCOhy+BjkRi8KOcjdfv96fL0UQ
         jJNclsKfBQKC072s43k9TCYMKXlUq0nE0fzIIhA+rwg5xPUau0flJUxiRvbhhQ+twkKz
         PXILxwfDYL6AfKTnY1mVuhpaOnSTkPSbr+zIHLawgrCS2mMhvPtGDuZerPtc8989504F
         gMWQ==
X-Gm-Message-State: AOJu0YwVVbz52ocKktNqSNeqDobjQgOSj+CX2xT6xRgj6FslmYDhaVHN
	ctyv56KT/nqCur+7kmRGTE3JtVFfiy29IlGEF8f+tg==
X-Google-Smtp-Source: AGHT+IGFr6g8jlQ3HN+XUNNaKBgc8oVfUM5jYKRK0VWTl7TjhJHxHFo9KjRuS+1jJjO2xdJg2ndmcfoZW2K0mOMBkR4=
X-Received: by 2002:a25:6b06:0:b0:daf:76da:fe2b with SMTP id
 g6-20020a256b06000000b00daf76dafe2bmr6007585ybc.10.1700759624759; Thu, 23 Nov
 2023 09:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20231117095531.1693753-1-treapking@chromium.org>
In-Reply-To: <20231117095531.1693753-1-treapking@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Nov 2023 18:13:09 +0100
Message-ID: <CAPDyKFqjcP2pAH8uo61Yc7wU76NM1aCMN6P1TaAoafCFfZSeWw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Increase the verbosity of msdc_track_cmd_data
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	ot_shunxi.zhang@mediatek.corp-partner.google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_091347_679050_F9E9BEF1 
X-CRM114-Status: GOOD (  14.46  )
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

On Fri, 17 Nov 2023 at 10:55, Pin-yen Lin <treapking@chromium.org> wrote:
>
> This log message is necessary for debugging, so enable it by default to
> debug issues that are hard to reproduce locally.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 97f7c3d4be6e..4469003f571e 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1150,7 +1150,7 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
>  static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_command *cmd)
>  {
>         if (host->error)
> -               dev_dbg(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
> +               dev_err(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
>                         __func__, cmd->opcode, cmd->arg, host->error);

How critical is this? Should we perhaps use a dev_warn instead?

>  }
>

Kind regards
Uffe

