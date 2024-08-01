Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935BDC3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/lBUEuHtZhYH9hMMltxd6FYM94een14SRBxxIIu5uM=; b=ZBr3KPsclw2if90XTQ8EZ1FVV2
	OnsHLUauC7cGPQzHYS8hX08kjy3Qpyz9upsRZ2mQUDiiV85fXSENxh/wmVMeClb++Bqgra0kChi+Z
	n8ivAAOAV0Bi5GrjRGDL4w+AmFL5+UqId4LbaXAFF/78gIqIDq0eLSQzhwTtXkVA4Jvg5Fqr6HrJq
	C4eHjpbDbIL7wvZSTR/Rh3a8CVXnfotEQMaRgq3WnMHezwCpn8LtOdjwnju/Fc7UhCV9SgnokoUl1
	WuYdjiBo6bayS9ZgIbBpMS99BlVjBSnAUI4aDMO1vXfUa2o7RcBbRRiq8EoW0kxO9ty0+ZgUjb8ZF
	thhJT9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZTaY-00000004qhn-2Hds;
	Thu, 01 Aug 2024 11:03:18 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZTZ6-00000004qBM-1MBk
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Aug 2024 11:01:50 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e05eccfcdb3so5214461276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Aug 2024 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722510107; x=1723114907; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/lBUEuHtZhYH9hMMltxd6FYM94een14SRBxxIIu5uM=;
        b=bkI0laL4nGNTmP4B28K5ttU+4RqCFvea8qmWa2B1cXAVwydd++33ROIy51zoS2CT4V
         dZPvIXCCdNFWhuqW7ObOZKAJCVnV4ZEX+gIasNOZfqJRMfxb3RblkIpIDAFS2dnwv42V
         0hCZ9QnBSO2GYeUFWkv/mpK+uUPxM4onS7cHOaRZGPHKfYpQtGgL2ksKXHoTkEExHDoe
         KxfZbx0tXfdS6upBjgMe61zXih8x3hoyJYPLEA3mSP3G+QJNSEOWREFxRiKqFLaFtT3A
         pZ0TnRKLS2xwiNpndkVyK1JxxvwsS4G0Z+2Jq9Yk6xobhBFqFCbCwQjxw75MoTWnnRrY
         NuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510107; x=1723114907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/lBUEuHtZhYH9hMMltxd6FYM94een14SRBxxIIu5uM=;
        b=ct0rZZcazU1KUCGiVxhLkcDP6PLFD7RbPpiCJaq8IDGAj1P7pV1+oiqlFtBzGi5Phe
         0EEgS+7cqk/TzB8EOD7BJy9mTBDgRSHvcoKZOU/Dimofy9GE0rN/oWNosyg+/FJPMglU
         4JC2dEhIbdGjFlMItwu1zkBiaPAigLVT7rwwam9GsbSWkwUZs9ZvVza2Hzu0zgUxvKj1
         JZ9rMtKRn+KdC+p2xbL7wux2a3nOfg2GuMeNJLxu5fuW0PNR94uewzrGBKhevy51R7I7
         JpxrnKQU7WlRrqQAvf2woiorJPz0679ovvGnKUrk6HLFuJdkAbazyQL/0XXLWJwvU/FW
         hSgA==
X-Forwarded-Encrypted: i=1; AJvYcCU4icTZZfSRRDuaGN5tAUjjUBzVTqczedAQaoFMYqBfUHXJbJk0Kam5pS1q4V5WCY+Lma9fr0EmYJCYIFkGuXFSqJSp7S8HRqji4FPcTsyCjMu0
X-Gm-Message-State: AOJu0YzhDbOsu+MFIAtnxRdNrjgK5qUPAKSZ7CwoRVh8hCZD0PL5PbOU
	ZLOXBFRDRZ+WfjqyYOB3hlAourlLfvZApvxnriiSI2JF7U3FPsYFGP4jX0a5Fd+C/Ig/vbD+8gx
	s64igtm0m5PV/N0FP4qyAxuxCABo4hw0JGfxZ2w==
X-Google-Smtp-Source: AGHT+IFNMTUyuraUOe17RSwLCsQl2Heh5eaqrtk7oyS7ocUH1DnCdcUeW8y+TayZq1Ii/rIMs7hczcO3KQE8rJP/Pyk=
X-Received: by 2002:a05:6902:1209:b0:e08:6055:9f3c with SMTP id
 3f1490d57ef6-e0bcd2b587amr2051515276.31.1722510107179; Thu, 01 Aug 2024
 04:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240716013704.10578-1-mengqi.zhang@mediatek.com>
In-Reply-To: <20240716013704.10578-1-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 1 Aug 2024 13:01:11 +0200
Message-ID: <CAPDyKFqK7CwGF2CitFtHUE_8hRxMr92KmWQzdO4kWRa7kYqHuQ@mail.gmail.com>
Subject: Re: [v1, 1/1] mmc: mtk-sd: receive cmd8 data when hs400 tuning fail
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.stable.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_040148_425684_7D4267CF 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, 16 Jul 2024 at 03:37, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> When we use cmd8 as the tuning command in hs400 mode, the command
> response sent back by some eMMC devices cannot be correctly sampled
> by MTK eMMC controller at some weak sample timing. In this case,
> command timeout error may occur. So we must receive the following
> data to make sure the next cmd8 send correctly.
>
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
> Fixes: c4ac38c6539b ("mmc: mtk-sd: Add HS400 online tuning support")
> Cc: stable@vger.stable.com

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a94835b8ab93..e386f78e3267 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1230,7 +1230,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>         }
>
>         if (!sbc_error && !(events & MSDC_INT_CMDRDY)) {
> -               if (events & MSDC_INT_CMDTMO ||
> +               if ((events & MSDC_INT_CMDTMO && !host->hs400_tuning) ||
>                     (!mmc_op_tuning(cmd->opcode) && !host->hs400_tuning))
>                         /*
>                          * should not clear fifo/interrupt as the tune data
> @@ -1323,9 +1323,9 @@ static void msdc_start_command(struct msdc_host *host,
>  static void msdc_cmd_next(struct msdc_host *host,
>                 struct mmc_request *mrq, struct mmc_command *cmd)
>  {
> -       if ((cmd->error &&
> -           !(cmd->error == -EILSEQ &&
> -             (mmc_op_tuning(cmd->opcode) || host->hs400_tuning))) ||
> +       if ((cmd->error && !host->hs400_tuning &&
> +            !(cmd->error == -EILSEQ &&
> +            mmc_op_tuning(cmd->opcode))) ||
>             (mrq->sbc && mrq->sbc->error))
>                 msdc_request_done(host, mrq);
>         else if (cmd == mrq->sbc)
> --
> 2.25.1
>

