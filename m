Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF49C83000
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=; b=EpAdUWmyGl/LJvgmh4jt2Qd8iY
	VhIkRFMgNSINwBx/zhpHZBGDt6JRJuomJ+ZfVaRaxikbUjAGW0MbMBz/JJCNcSpNIKPA05WIDXvYk
	O2mhwCLqB72BQWcI2Dk/LgEsssLD9u4rUXrTIcAhDhMp7oXPUgaZCLjoKT8yY4NNdkwSqKIrTvlFZ
	U8APoCoTHpDBM2MMasvJYCLhdLq6IucCWb9FyHjvwEDGd33rPggL86PVjDZZKis88FXAn2joPrUlC
	NCI+4hutnA+ax80257woDKP/P/M+fRJ5saFFkaEweVxCMd4Q93ksLHDkDOtidzLSkfeZ6ZTd6TYEo
	n0eyh2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU36-00000009T78-3vs7;
	Wed, 25 Jun 2025 17:36:40 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPWH-00000008faC-1SqZ
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jun 2025 12:46:30 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e8273504c67so5816006276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jun 2025 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750855588; x=1751460388; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=;
        b=gDOgyx4/j/bnnwAWpzp4ZrIbz7I+00Mn4e/gRx38Ok/5NHcCgzqWtbguW4aS2nlU6a
         6Wv3mAaWhdUeIHQtmmu97kdMF1O6WjxxEW7dwNnkZIeETD/fa+0Dt5HSm622CTv85hfO
         CMywBf7B5BuFVFWoQG/WhfXceHE95e5d1wsGnPmauHuyjHuKvw/7raszVovm069HLr7e
         5BPmj6Wdfl97v3ndAL6zjHGq2hMwGelN1Wivac4hbQpd6j2XJZwK8vWwtAQLPMVMRzNz
         QFCp9sWmdQyFg9Pm4Q8x5afaFfNd9dl6aDkqSx2HamePOZw8zAbVeFdhxqqbWoQya/1w
         BCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855588; x=1751460388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj4jAhuCkHLc0MKXkhpZy35x/RLjZn6KIWkW8s4y+Y4=;
        b=Oqx3dIKuOc3Ct0CNxhH76VqRdlC7GhsjcgJsNSggxVqYIVwzc4gNRavCxrWken0k/6
         GlPy+vdLFiAMAkTmRPlkn57gYby0Cjh8eQDgnmLmHWj8kC2/sLPcDX+XjrTI2KzjAK9f
         q9I9ScAc+WBpDFx/E7fliVrJmjBAk+beba6rmFnjF7qVE4+R1e7Yh++Q8klHa68HEICh
         IRCZ6D10wD1adXB3imhP4v4l8lwy2B7BOc/uiIqfNCD/fzZ6cMwg3SeUAYGa8HsP8WTP
         SdIk3pASPTTYfvDb7sP5aB1MsduNK9r+/ZD86mtEo76joow7wC5RMhTxgm9jCuFyXPbB
         3SfA==
X-Forwarded-Encrypted: i=1; AJvYcCU8HavnMqtctkZVotD7Goyid3xD1ykX6MsAg/Nan2fCG1D812eVAxGleF/QQNdnCyX68POYkFUcX7TF6S3Z2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAztv0KFi75xU9XCsePaJYu0Oax5pxmefXWUIZclrTZ5xT+Y41
	3SJDfCNLp09EgyajTEAg08ImWbHDO7bW0no9CDx35gvjMF2ueD2NnExt5h9f2yYnIj03/Nvd7NQ
	rL/MB0ffSN1PC1iDsed6CPCVoypxwSZ26DYKFMXKFuA==
X-Gm-Gg: ASbGncsJSRlojlty1Fi4tL4qcN5A+K3H3PoCfGb5sT2MDsRQmjrzzIP9NdvTqZ0CgPA
	lBRCX25zVxdQEw6/qWAlHh79QEMCagNZCu08HOpHLTXSKgKoK0sU3NCmWcIhM/yOxdJ0L/Gd6EO
	DobV9csDfyuL8MHMFChl6KJ5dmqQgLLZ0xpz4j31DjXYU=
X-Google-Smtp-Source: AGHT+IHuqbs3+ZWuZkWAAPqD4OwhWYQ4/+DMgIxw4fLXOlRsaFo0LQlpSx2p1DV+41IMvrV599rDMZdlt1nY1Sc/mtw=
X-Received: by 2002:a05:6902:2782:b0:e84:2cbd:3212 with SMTP id
 3f1490d57ef6-e86018cf6afmr3027295276.20.1750855588294; Wed, 25 Jun 2025
 05:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
 <20250625052106.584905-1-senozhatsky@chromium.org>
In-Reply-To: <20250625052106.584905-1-senozhatsky@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 14:45:52 +0200
X-Gm-Features: Ac12FXwFOrEcUFEsusjn1MoQ84IvAh5xPRaGYt6omrx5SZ03KEKKj6Opk4VwAGk
Message-ID: <CAPDyKFoYgi3bauUQ8xrc+0KtwmmXi9jNNzcOt_fmyP2pFQ9Jbw@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: reset host->mrq on prepare_data() error
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Tomasz Figa <tfiga@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_054629_391021_8FD6BC21 
X-CRM114-Status: GOOD (  13.93  )
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

On Wed, 25 Jun 2025 at 07:21, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Do not leave host with dangling ->mrq pointer if we hit
> the msdc_prepare_data() error out path.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b12cfb9a5e5f..d7020e06dd55 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1492,6 +1492,7 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         if (mrq->data) {
>                 msdc_prepare_data(host, mrq->data);
>                 if (!msdc_data_prepared(mrq->data)) {
> +                       host->mrq = NULL;
>                         /*
>                          * Failed to prepare DMA area, fail fast before
>                          * starting any commands.
> --
> 2.50.0.714.g196bf9f422-goog
>

