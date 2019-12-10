Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C95C2D0BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 09:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006642077B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 09:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjWy2AmO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xggK1nB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 006642077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TKu9EA6pYwTQe08mYNuDosS4iNHRGcWBKIXXcmx/Gc=; b=XjWy2AmOK0sCQH
	D6EtlSIBUKr4OuEA4WgA5V0LmaZQU+m4vSWJFE1UDPTrbQcCwTSprEtMyjN8l2YjUv0HJ1TOM9Gy6
	uOzr+MqZniUjhkCHL4GWeYZgcwM1rEJjbroNBTFs8bxKEQsEV9d+qZLyRCXrprotr1NM3GqxvGPoJ
	dOzLEJpL7/si0XSN2rEglr38ICQ45Y+9XpgdMv1oh6DKLOQeA88V1Hh7MvNlD80JannkR3k3biynJ
	2nV4+7wa+5PeQEBPs5l6Xl6xO6DOXVp/wFHSGBKKxaOxWtaWoDrxNYwHld8gF2NB9QdR1BUbmLAy7
	NNmC3jUYV7c3LyxJN3rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecBW-0005bx-Of; Tue, 10 Dec 2019 09:52:02 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecBT-0005ag-Dj
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 09:52:01 +0000
Received: by mail-ua1-x944.google.com with SMTP id v19so6177092uap.0
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2019 01:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xUN3rGfqd0QTJZr6aZxtmVJn1us7qeeluWmJXj0Te7E=;
 b=xggK1nB9ejv8RrFLLP7MF/oV73DlomCcEFt6HG/TCk2YTOnfjzU3+OzQE8gFIrWdVJ
 TtWMwOMAm+lNOHbSBgqqfcWGtcvUCv75lA3LChaXWTTz0IACzZ6lxZQSbnTN3Fb3DP2O
 IJuvDyC789CqjCdgQcDf5UoOTHebBGiol9I8m3u0iIMym5mvaHzTt67ZcXglu22tZM6l
 vj4qeiLkVAYovR5jRIo0hNv66L1NOWtskL6JUwzFKzCajY4uwA3NIaWBXmgWfJSWKlEj
 WWrieoWz89mX714X7EAYQ87oD6/+ERYpjZqPZoyFB1vPFlOGCcfg9yzMlnZJzgMAYDNB
 /0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xUN3rGfqd0QTJZr6aZxtmVJn1us7qeeluWmJXj0Te7E=;
 b=Hicqfh9EqspT7f1QFweCUszJrEKR0mNrlIIiGFM4JmqKb/3xcq2vfYaxPAtpaoDC4Y
 E302UDnUfhBuw5J72SzR33Cl3EN4pyr4boPwIcdGQK913pv6kA0quurNp2v57LkW0ioE
 RYKSor/GckdrZuCXeStf+dUjfmQb4TAdZXLYlUuvz8Sbkp7GXdBF/pyr4G4OITVBNheL
 HxIc1LxIYAnF5qK/cjfUWI0cuWrLlIBAT0GohaV5jtEJej1kAgI0fsF6ZqEF6QFbgd8K
 RrW9CJUvNqtBrMaN5bcDYYIcJnKvKUucsrOOP6BrxB/sNKkF4OsenQF9o2RPavmATMnV
 iugw==
X-Gm-Message-State: APjAAAXAVwdRenu/YVO6U84bxXl7hW6siX6YUKw5udyzWOU2uyO5k6Ze
 eAruKlR4RIs2BdEDCOZn3IGzP3mTvcpYIq6tbpNlDg==
X-Google-Smtp-Source: APXvYqxI9QdLGOMqq6QaCpjOk+V2l3LXtFs7IfnhUjP0TmSsF2jOR5CpH0EuMu4/BYNbPnekTo3AHs1xkdV1CNj9hNE=
X-Received: by 2002:ab0:2759:: with SMTP id c25mr2903677uap.104.1575971518126; 
 Tue, 10 Dec 2019 01:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20191204071958.18553-1-chaotian.jing@mediatek.com>
In-Reply-To: <20191204071958.18553-1-chaotian.jing@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2019 10:51:22 +0100
Message-ID: <CAPDyKFo9Z2yj7zC5VOS-iX_LyavPp1A4n73eAp7VD-Q+dpoqpw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: fix CMD_TA to 2 for MT8173 HS200/HS400 mode
To: Chaotian Jing <chaotian.jing@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_015200_307741_EDA84CED 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@google.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 4 Dec 2019 at 08:20, Chaotian Jing <chaotian.jing@mediatek.com> wrote:
>
> there is a chance that always get response CRC error after HS200 tuning,
> the reason is that need set CMD_TA to 2. this modification is only for
> MT8173.
>
> Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>

I have applied this for fixes, however it seems like this should also
be tagged for stable, right?

Is there a specific commit this fixes or should we just find the
version it applies to?

Kind regards
Uffe



> ---
>  drivers/mmc/host/mtk-sd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 189e42674d85..010fe29a4888 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -228,6 +228,7 @@
>  #define MSDC_PATCH_BIT_SPCPUSH    (0x1 << 29)  /* RW */
>  #define MSDC_PATCH_BIT_DECRCTMO   (0x1 << 30)  /* RW */
>
> +#define MSDC_PATCH_BIT1_CMDTA     (0x7 << 3)    /* RW */
>  #define MSDC_PATCH_BIT1_STOP_DLY  (0xf << 8)    /* RW */
>
>  #define MSDC_PATCH_BIT2_CFGRESP   (0x1 << 15)   /* RW */
> @@ -1881,6 +1882,7 @@ static int hs400_tune_response(struct mmc_host *mmc, u32 opcode)
>
>         /* select EMMC50 PAD CMD tune */
>         sdr_set_bits(host->base + PAD_CMD_TUNE, BIT(0));
> +       sdr_set_field(host->base + MSDC_PATCH_BIT1, MSDC_PATCH_BIT1_CMDTA, 2);
>
>         if (mmc->ios.timing == MMC_TIMING_MMC_HS200 ||
>             mmc->ios.timing == MMC_TIMING_UHS_SDR104)
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
