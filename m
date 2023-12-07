Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989CC169C2
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqSN2wz/zGfROIqFiurJMPD+/BJpUqBprXGsU0gwv9Q=; b=A+HI9heE87f79Hn9+xdEUSUWzt
	8IhW+PQzE8v1bafnhP1O1CDy9OKuH9xPqXiVxATzmVt2YkvKEe+siwSwtUD3TbSyS6HbLP55lhTpy
	BqSaOE78Oq3zU+UnpjNBwhHzsddPB9Ucx7dFaTa/42icuRHzJa9MsAj+hnOFZOUYiGtbz+rc09x6e
	CrfjckNbW9/N69gtOb6HgcIukwKWnlfmjlY76j+are/JvzSAlC6TRWj8d38MyQP5vLvNSagkuLf/w
	NQjXNtF0l2TWzTKNzXb4Q0z7LD108n9lGGezP0dudlUsnZnaMKhGzxpRtKTVyKbxoPh+ZKyqIb4jZ
	kcaqJD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEx4-00Cy8z-33;
	Thu, 07 Dec 2023 14:02:06 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEx1-00Cy7K-0T
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 14:02:05 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d7346442d4so7588907b3.2
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 06:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701957721; x=1702562521; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqSN2wz/zGfROIqFiurJMPD+/BJpUqBprXGsU0gwv9Q=;
        b=qvIe2KlqgVCm9fUYh1hrE7f1gtjAnq3KYz2EnFuaZRJPe2ePT8HRzsDFDgK5VwTNLs
         sTBvGZVxZUD8ezYl7TvcUUNsSF0A6qD7p3+Ad1zM/jzSmOW6+7OssgE1hJi49lIIHZnv
         /+I++IgbTieYJo0ooytDwcqzCuZF5W2kKaDRk4wp1f/6uK3SgafegiyUeG32VXvgNYXG
         x0x34C4wHdThFI7YlBCDrbivdmjmhh6Sff9nSC48kPhXXxj73lU4sfxGvLnC3dD/S1NT
         jrzM4K3nfTWkgFHW7v+r341yT8zWpUC2cvJtHkdiABBwUbGiIExVOyqppTZee5FbWBoe
         hM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701957721; x=1702562521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqSN2wz/zGfROIqFiurJMPD+/BJpUqBprXGsU0gwv9Q=;
        b=ABHXlKCWi7Hl1RqpXN2WQiIn7GR6RwkJQRS3BzhZ4poLexen+OUorGTeJOO5fnGq5T
         xsYvPH4GikWHOByjCY7LWeqMBLKHjmbhagirUeSYA7eoJFqnXHbq/dxZayehTpZEgA7k
         PQcz/AFmhAcvyFpm67DhUvYVEKlXJ9iyYWz9Hixd/o2Egy2kC0OEdQXxZbC7rb6KmXgx
         srUO1f67YKvBgdKP2FUPJfHDA1dhXpAL1WQvCLKE3TPf33mHKm1YNeMIsBlOwiFi38as
         nSaw+T8vg3qXCR/zll7NUJX5FfJKCxNIb9GwTmyP1QwtZFb/S/QIPJhrtXRe+JFSHiuo
         cwSQ==
X-Gm-Message-State: AOJu0YxhcsgMWFOB110InOCV7lsuWw9KQ6qd4GuZLYMFpQmOjxyX85zB
	j85Tx375DtlyL3xeAQq2sRE/Ow2JiePLVNutKH3obA==
X-Google-Smtp-Source: AGHT+IH3A+kfMVFWXCHHzW1EoiuSi/T1nkVcCCM0Y1P3XBgusQEyXxhBLp9MTbatm83rnaE5ppyGAiBDsLZJiNAzu+I=
X-Received: by 2002:a0d:d88b:0:b0:5d7:1941:3556 with SMTP id
 a133-20020a0dd88b000000b005d719413556mr2618248ywe.61.1701957721714; Thu, 07
 Dec 2023 06:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20231201102747.3854573-1-treapking@chromium.org>
In-Reply-To: <20231201102747.3854573-1-treapking@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 Dec 2023 15:01:25 +0100
Message-ID: <CAPDyKFrAvkzgHUttY_mVAHK3HXCV_eE6=KhQkdQyLq22zstX8A@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: mtk-sd: Increase the verbosity of msdc_track_cmd_data
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ot_shunxi.zhang@mediatek.corp-partner.google.com, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_060203_187242_4FD7A738 
X-CRM114-Status: GOOD (  16.44  )
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

On Fri, 1 Dec 2023 at 11:27, Pin-yen Lin <treapking@chromium.org> wrote:
>
> This log message is necessary for debugging, so enable it by default to
> debug issues that are hard to reproduce locally.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> Changes in v3:
> - Only print the warning when -ETIMEDOUT or not in tuning process
>
> Changes in v2:
> - Use dev_warn() instead of dev_err()
>
>  drivers/mmc/host/mtk-sd.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 97f7c3d4be6e..6ae5e0a9fca9 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1149,9 +1149,11 @@ static void msdc_recheck_sdio_irq(struct msdc_host *host)
>
>  static void msdc_track_cmd_data(struct msdc_host *host, struct mmc_command *cmd)
>  {
> -       if (host->error)
> -               dev_dbg(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
> -                       __func__, cmd->opcode, cmd->arg, host->error);
> +       if (host->error &&
> +           ((!mmc_op_tuning(cmd->opcode) && !host->hs400_tuning) ||
> +            cmd->error == -ETIMEDOUT))
> +               dev_warn(host->dev, "%s: cmd=%d arg=%08X; host->error=0x%08X\n",
> +                        __func__, cmd->opcode, cmd->arg, host->error);
>  }
>
>  static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

