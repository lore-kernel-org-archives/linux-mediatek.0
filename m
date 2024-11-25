Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4814CD58D41
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwW5X2yVuOQxgzZYA2AkwTQIodjDxTG3chKlKalzE/A=; b=VpL3kBwcliRkcgKnCUWvkiKbRy
	q9Y5VA2sP1MuR58cZuTyvrOAj4XdbGSyH08eNLj+aS27VEg3IGOUsrUMw0zTbE8SRNw48qoFV0q8e
	YV8ylKN83PENVwUp17gWP5mpBqxrPt+TMShKUqjcSdNPHvql58k1y84riD8AKaBL5LpLtp1dqY5hY
	cSlDdT79K0ro2qzPd2rf6hcKXwsAblWvnV/7oJEJgTwwzaeU1T7j4/LmOp85Da4fSm7Ubx6COdUEU
	NWkwGeSXJaFybi0b88JQBCK9dXrCjhTDdTs7nkk/Zx1TwHxvsN3wDxOtYCPCtm/7UDHf0l1z7iPPg
	lxvRd11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYsC-000000085Il-1DKg;
	Mon, 25 Nov 2024 13:11:28 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYpu-000000084ud-1xNV
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Nov 2024 13:09:08 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e382ed3ee45so3809343276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2024 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732540144; x=1733144944; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwW5X2yVuOQxgzZYA2AkwTQIodjDxTG3chKlKalzE/A=;
        b=b2T1CBcascGf0lWxDtT7VQGKm8iGKkiohSDVmn54ytzyKkxru6+yUCnRSYqiOwvbKm
         IeVaRRQRUQVtTJUbSVDfvY2HzjF/qNY8miA9gkhOvSfAwLmD/s/AAxpQ8uG3DGR5LB9U
         PLp1QhjHGVBRedfxLBFzP4RivPSV06lBdfzSzYHIuXZKCaa8Q+lgwozyz2EFddqK99Gy
         N3e8jnIHplA8yYcdW0Lj8QfGAV54jgspmxPtjIqMFTdU5+Gn6WWK3BKZofJ1G3hNdheF
         UzkMtTYjHDMACgWOijUZuTFYZiWSc8uqpSSEMoaNaP50R6WG5Q17cUNtE4Hi9vpGxTUm
         Oqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732540144; x=1733144944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwW5X2yVuOQxgzZYA2AkwTQIodjDxTG3chKlKalzE/A=;
        b=SPYfkueM0VfmluD67iyG4TpPyIDn7QAjhnnk7ZU10avz1t41zUBbe5k9Rrf/y4TOf9
         ZF/zWlYpa97Bs9wkGE844XfjbosAd7JJ7V+Gt7In+HphaumHv8/RAizDa/IiaFyv1/ML
         68oFVW83+OsuPEqSy4wf05S+HeH9pLUJdiBw6ikVvpnDBlT+xPu1BhhrVKPcbZBZS/Cs
         I9zf5GDYHIVLDXGSXEp7ELmSt+DP9GJQ+ljFN75yaINyohhf3zyys/y8dqmJMqa4qGS6
         xXtW/uFWMRKL3sFr4FTd3Ve8ThnTYXxjvzpaaYIDobBik0iCEFAR8fDcwBC7eTHfXQEM
         QDYA==
X-Forwarded-Encrypted: i=1; AJvYcCVX4S/AtQ3jOj/FyvrLtF4auiATFmB87EiJWCqroLxv2NplyU1Q6r8KgXTfwa2E79hu/958VTHYojeYGMfTdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1AaXIZmlZa/lq6zH83naBm8Rx+iUK2kab89+8Xe7zFMDROTL
	tivpueO9ReAsneEFaUiteV1wePF2hnVJKS6+6ADeimDuLU0yXMJnNaF24WsuAY/OTYvo2bGTCAW
	3zaSzlxkCReqPjHvRbmz+6WeaQoCqKh6vHhKWmw==
X-Gm-Gg: ASbGncuFIey8BnjgC9OBxNlEcbXYrONTVThlkIJmoYqD7bSy6Y872t1mMeMNKOsHWN7
	Nfn5CVX0d1QZD60m5oc37dQsME6Wwu4WX
X-Google-Smtp-Source: AGHT+IEF6uaB71EPxvIZeVbVSPO+NaBbT0xZwtt8FC3so2FjgVG6CW+VGCBir21UFRKHNtvL6RUoiWhliSlp9tWY5cM=
X-Received: by 2002:a05:6902:1106:b0:e2b:cf75:2840 with SMTP id
 3f1490d57ef6-e38f8b0aad8mr10473196276.5.1732540144455; Mon, 25 Nov 2024
 05:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20241123071006.14294-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241123071006.14294-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 25 Nov 2024 14:08:28 +0100
Message-ID: <CAPDyKFpr9KZxx4_-jW8ovqcr4BCfDcm4teHEVOgZ69GrUddJ2g@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Add support for ignoring cmd response CRC
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_050906_515573_A7F93E5A 
X-CRM114-Status: GOOD (  26.83  )
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

On Sat, 23 Nov 2024 at 08:10, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> The current process flow does not handle MMC requests that are indicated
> to ignore the command response CRC. For instance, cmd12 and cmd48 from
> mmc_cqe_recovery() are marked to ignore CRC, but they are not matched to
> the appropriate response type in msdc_cmd_find_resp(). As a result, they
> are defaulted to 'MMC_RSP_NONE', which means no response is expected.
>
> This commit adds a new flag 'MMC_RSP_R1B_NO_CRC' to work alongside the
> existing 'MMC_RSP_R1_NO_CRC' for the following process flow. It fixes the
> response type setting in msdc_cmd_find_resp() and adds the logic to ignore
> CRC in msdc_cmd_done().

In fact, MMC_RSP_R1_NO_CRC is not being used by the MMC core. So, host
drivers that check this flag shouldn't need to. In other words, we
should remove that flag entirely.

That said, introducing MMC_RSP_R1B_NO_CRC as the $subject patch
suggests, makes sense to me. However, I prefer if we can make it used
by the mmc core, so please change mmc_cqe_recovery() to use it too.

Kind regards
Uffe

>
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 11 +++++++++--
>  include/linux/mmc/core.h  |  1 +
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index efb0d2d5716b..5d669f985a82 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1097,11 +1097,13 @@ static inline u32 msdc_cmd_find_resp(struct msdc_host *host,
>         u32 resp;
>
>         switch (mmc_resp_type(cmd)) {
> -               /* Actually, R1, R5, R6, R7 are the same */
> +       /* Actually, R1, R5, R6, R7 are the same */
>         case MMC_RSP_R1:
> +       case MMC_RSP_R1_NO_CRC:
>                 resp = 0x1;
>                 break;
>         case MMC_RSP_R1B:
> +       case MMC_RSP_R1B_NO_CRC:
>                 resp = 0x7;
>                 break;
>         case MMC_RSP_R2:
> @@ -1305,6 +1307,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>  {
>         bool done = false;
>         bool sbc_error;
> +       bool ignore_crc = false;
>         unsigned long flags;
>         u32 *rsp;
>
> @@ -1329,6 +1332,10 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>                 return true;
>         rsp = cmd->resp;
>
> +       if (mmc_resp_type(cmd) == MMC_RSP_R1_NO_CRC ||
> +           mmc_resp_type(cmd) == MMC_RSP_R1B_NO_CRC)
> +               ignore_crc = true;
> +
>         sdr_clr_bits(host->base + MSDC_INTEN, cmd_ints_mask);
>
>         if (cmd->flags & MMC_RSP_PRESENT) {
> @@ -1351,7 +1358,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
>                          * CRC error.
>                          */
>                         msdc_reset_hw(host);
> -               if (events & MSDC_INT_RSPCRCERR) {
> +               if (events & MSDC_INT_RSPCRCERR && !ignore_crc) {
>                         cmd->error = -EILSEQ;
>                         host->error |= REQ_CMD_EIO;
>                 } else if (events & MSDC_INT_CMDTMO) {
> diff --git a/include/linux/mmc/core.h b/include/linux/mmc/core.h
> index 56972bd78462..076e1c71a07e 100644
> --- a/include/linux/mmc/core.h
> +++ b/include/linux/mmc/core.h
> @@ -66,6 +66,7 @@ struct mmc_command {
>
>  /* Can be used by core to poll after switch to MMC HS mode */
>  #define MMC_RSP_R1_NO_CRC      (MMC_RSP_PRESENT|MMC_RSP_OPCODE)
> +#define MMC_RSP_R1B_NO_CRC     (MMC_RSP_PRESENT|MMC_RSP_OPCODE|MMC_RSP_BUSY)
>
>  #define mmc_resp_type(cmd)     ((cmd)->flags & (MMC_RSP_PRESENT|MMC_RSP_136|MMC_RSP_CRC|MMC_RSP_BUSY|MMC_RSP_OPCODE))
>
> --
> 2.34.1
>

