Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E28C61CE8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jun 2025 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmc+XBP73DggJUv8T7xxNG1d8C/BNb5bhPDGJBM+T0c=; b=HuErWP1dmT2VwFHSgPVhmRlGI4
	wbIYmDVfqTFjgbyA18LEJMD//mx0+ic+HZUjqnbhMXDnJKiBYP9z3PtZ69UKjcx9Z/FAr6KP7mqBz
	8x2aP9kD8OPzMaEGU1N6QEL1JcMHgH2/nqLvD6Kyve9S12aklPqOohlTJrt5sit9GcMqnayOD8M3e
	Qbi2diG9kmgZMsEw58kwZIp3ZW1XTpeGS7d6dIBXKAC+yq+6mk0Fs038cSIEYXOiaUJOjDwYC5ZkE
	jZt6OZCwm+gZ5l4RGvIRT/j/bMeIqQiw2TB1I7+n/JMzYhY2M1B1ERLR5lpOD1ebNtEgkXb10pflj
	qe0CmnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdXn-00000004ODk-3XfQ;
	Mon, 09 Jun 2025 14:32:11 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdRq-00000004Nc6-2I5G
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jun 2025 14:26:03 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7d925ff60bso3455784276.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jun 2025 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479161; x=1750083961; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmc+XBP73DggJUv8T7xxNG1d8C/BNb5bhPDGJBM+T0c=;
        b=pW+kV8QkMKu6kbk83HQUQBYxogDvYbo4y/Px1Vfp6LEkYtOt28Hoh6zprCPnI9pvhV
         7XqEjTDbbi/h19C26KrHLOfm1MMTd9nXfPAhf8WwQzEhR8zeQXb/04Frg5mty2FCOBtY
         q+460YRSjGApcfhY+OyFBE0SRgQGy01CcqZexHTi3xhHOz/jWXiSoFDHewE5uBeGh4pp
         RBk7oeKv4LkcLffC7mCxCZVRuJg2eZIQf1KB6CRILlvNFDwGrXPbP0pae4m8xREvfqCY
         GkIdGRMfSIUgQJGmo4+zkrd4SHDq9szOZHlxL5g2hFP7IYqRvrlV8PYaTo9cJP59pYAH
         Lohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479161; x=1750083961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmc+XBP73DggJUv8T7xxNG1d8C/BNb5bhPDGJBM+T0c=;
        b=iOGZQb7i4P28DLQWiy/jnmibVapqb9U5US9BV9dVlvYaZrvKijUSCYNknHgbo+2uJ2
         wq7c/io1Tn1G/hMeSBf6hh7USzNPotnbexulbrBxathG6/R0pfAyIkHjzflmaQ5EXL65
         o4WCLmEu2Aj8MF2MEx7N/fOOOFwMfXXBiU0t0+Td/TLpWPkLWsJaiclmU/BzpSYIJuI6
         ErMWLtJ8YFiTQEcgjA0tQcpJRdjGCloX0akP1AZDT6rip42i67nsyqstPQc5hNdz4wm3
         33qbY7TLowDE1SU5QMXk9APYIgt6PCBjjcfnsAkzSywNGenxLYa2WS4NBFn4tVbkdQ53
         tCtA==
X-Forwarded-Encrypted: i=1; AJvYcCUSj4X8L3QuBuD3zJcIRYdUw3BlYm0YIyTPVssNgQtiCfbBzzEPeblbVC55X0hB2chMs+7kHwGWdeIJwUahEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8mQZWh29mPOaFVDSgJrfyDYSaZeDc7trxd5X0e5G5Xe6rX3LR
	jL0wSDyeSvJyZe27M+X3lY1mO0fQYLtcs7JQ1fC7zqfg9PDbwd4RKK3Lk8Z9RvEEbhv65Pum8KS
	9YO6UTAhfqnNz3GprKpSHu7f8Sq/VsqoTDSFN++5DaQ==
X-Gm-Gg: ASbGncsVkI8vF5h7/kY3E0Z0UBszAnJXGkMHVpUL0WFlva3VoU243EduFxdEwkFy50A
	UJN2r8enzwYFt6PtWBn1c/wLpLfuDh67a8qj0bwWfpkSYXkP2wT63SWvb+m76yaj0AbLgdJ0Alk
	mF3fqVq2z/NkpXbshTMTkaz4QIa/qvkZya0v7Fd7zec3pZ
X-Google-Smtp-Source: AGHT+IFKLep+oVnJLAdhYlsfnnGURCM0jm5x9XuhkDAOYH3BwxGyY+sHbb4Wkeme1jFAonQLcsi0Q2V0d9n0diMCHJo=
X-Received: by 2002:a05:6902:f84:b0:e81:9aa9:88cd with SMTP id
 3f1490d57ef6-e81a20d40demr18795796276.8.1749479161518; Mon, 09 Jun 2025
 07:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
In-Reply-To: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:24 +0200
X-Gm-Features: AX0GCFvF_id35MOPl_pL8yIz8wUA8Ns9lzvlVE2LmtTNl-drJlr2CqeBViKQxTQ
Message-ID: <CAPDyKFrejbW1d+jSSJE4K8Zb08CeMHiH9pC=Sr=Y51Lyy4Fhow@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072602_586679_32D837A5 
X-CRM114-Status: GOOD (  23.97  )
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

On Thu, 5 Jun 2025 at 03:07, Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> mtk-msdc driver causes a kernel crash after swiotlb buffer is full.
>
> ---
> mtk-msdc 11240000.mmc: swiotlb buffer is full (sz: 16384 bytes), total 32768 (slots), used 32732 (slots)
> mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=18 arg=0397A6F8; host->error=0x00000004
> Unable to handle kernel paging request at virtual address ffffffffc0001fc0
> ---
>
> When swiotlb buffer is full, the dma_map_sg() returns 0 to
> msdc_prepare_data(), but it does not check it and sets the
> MSDC_PREPARE_FLAG.
>
> swiotlb_tbl_map_single() /* prints "swiotlb buffer is full" */
>   <-swiotlb_map()
>     <-dma_direct_map_page()
>       <-dma_direct_map_sg()
>         <-__dma_map_sg_attrs()
>           <-dma_map_sg_attrs()
>             <-dma_map_sg()  /* returns 0 (pages mapped) */
>               <-msdc_prepare_data()
>
> Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
> dma_unmap_sg() with unmapped pages. It causes a page fault.
>
> To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
> fails because this is not prepared.
>
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Applied for fixes and by adding a stable-tag, thanks!

Note that it looked like the patch was not entirely correctly
formatted, but I fixed it up when applying. Please have a look at the
fixes branch to make sure things look okay to you.

Kind regards
Uffe



> ---
>  drivers/mmc/host/mtk-sd.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 345ea91629e0..3594010bc229 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -827,9 +827,10 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
>  static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>         if (!(data->host_cookie & MSDC_PREPARE_FLAG)) {
> -               data->host_cookie |= MSDC_PREPARE_FLAG;
>                 data->sg_count = dma_map_sg(host->dev, data->sg, data->sg_len,
>                                             mmc_get_dma_dir(data));
> +               if (data->sg_count)
> +                       data->host_cookie |= MSDC_PREPARE_FLAG;
>         }
>  }
>
>

