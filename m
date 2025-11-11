Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B760CCFA18
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVkOL9QZX3SGwC8VnESzgQr/GWl5l8+eTHtDxUY9Odg=; b=KFKLVig8MvTVtPAn6hsr/91QJv
	yxvNn8m4mAwePbyXbRosWQ8FSLk88aDUhkX3LHKRrFbToRQalSx9FVPV6144TFgBLl/QtYluv3TsC
	+8qMEVpbfGQUd7/D1lo1b4DbgZug8yNtvXB5A2gDZ0sGESTX6nFSjqMTP+zekpWymSoK7TldeUNmc
	782vvgLsdqoDX9i45lz3dTcYVwJ2TfwOYvVHRi21uc88Ut18Uo18LKW769U+AjYlgshXvFtO9WLBv
	4NWys3nRFpRXs3ka5MjAN5GepsMjKC9S0R+sF3CIyngNLxdgYm3aW+i6XYwmVchIchM0DaJXnBw/m
	DbPGX3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsIl-00000007Xn4-4BGU;
	Tue, 11 Nov 2025 17:37:08 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsIk-00000007XlZ-01Uv
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Nov 2025 17:37:06 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-786943affbaso34315297b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Nov 2025 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762882625; x=1763487425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVkOL9QZX3SGwC8VnESzgQr/GWl5l8+eTHtDxUY9Odg=;
        b=FOTeDWtUoX4QbnJgZnNB9ab9Kuf3BdPisGQCf1Y1MzyhODEdIPguKa07qbIO+AEfAx
         IrfXBRI2LF9o4ZU1yisHkMgoHsKHtoWtuO6O0HkT8IS3WmFlSIDpHpyVS+zxsYUMqxvz
         +dI3zAG3Gsk/JRzx3UHr8YlYOfAGa3wYSE3tZidKbpSOBE/WJGPgTf0/0p0SPf6GD83E
         2H5oMI26PLRM99sX2gHaKG7+rrld4mGzpU2+Q4hE9o/XJrgM777nSZRbLRgiPkl6d/Dx
         nsmPjRo6Yztj8wAITdixrMnFIipkQZxZlF8Jc6iedZE+jgLW0BgLzZg5+E8EJEjb2eGE
         VLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882625; x=1763487425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVkOL9QZX3SGwC8VnESzgQr/GWl5l8+eTHtDxUY9Odg=;
        b=JQH45WEu0fbasb6MXEXrP9npRboK/ZsjW9tQgB3xt/Gi8Le6H1ITGwtJMIO1a/TaKj
         SvuNmqp3RGpaP+3r9H8oK3tBM2ZaeOmSsKn3SyuNqz0h9R94SWb3ki1GT6mmH5LmeL12
         +PftNq9FoGt3T3XtOH//DY1ibv1O7aP09xZjRzWqvXWrCA2ota90BmkEdYh0RUQgS+t6
         LKh2oQkN5TpSFBuOPO4c6jDvZU8v4NAtFxw7NrhkayPonJ7L5llp5XeqzBsRkcbMkpaJ
         hWS2H8VMvdx98Q+AW/V/CkHR8QO7QLdo4K9ajkuElv31HP410a5nfKDRQ2sLN9zmTaHC
         9y6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdshs3yOPYlSqGuSHipMoNt7niLkbWgim9EQOBE0AfDNcR3DujP1kDNsSzX+UA5eidMAGEl0ZEr/DX73RsOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUCouxcKaj4PZn1Tf9UsjdKIs8H3OjOldhqSc+kzgwchZbYvao
	vtorCb+ugKBGQ38GR3nAEAsDTq/UPGewkL3PvXyzaqs6hpH+fFpjcWfVrvKzcv+it0HV6nYgx7W
	skbK7ZBPw9PPybWZjsn2ya+5jl+2kEYaCmwFl78h5sg==
X-Gm-Gg: ASbGncuE1gGYN5pRGd9X38lZ42b/GBUexBSqJoi1Up3j18TXPU1wOsSqHDZgW/UNMIf
	/ZtB18flrsWOEurcIpr5djZW3DQnKi/oWIDNqsFxkheLyuGgJk5TsRAfAikHDt4v6viVHKanRjV
	Ze2YiMh+CYEfYmomNkN98bX2DF68ZfcTk66qD2ZdBXzFW3c1I6RRItDuLpcI4n7nqKsHazTZczm
	cNzspT1wNb/nvFe3WrBziAO3bMwEFvxP+IS7suZ5DNMxQIzSosUQyWipeb95Wo1bkZGFCOUWumK
	xX0lwxE=
X-Google-Smtp-Source: AGHT+IE9bOE8QuaDxevERnXGMwxyKuXPLVIGn9fuMsvYZZWVI5o61gMBE7ecmjC3IlvCAc62kGl0QOYlCbs99m4/5oE=
X-Received: by 2002:a05:690c:2021:b0:774:cc25:7f51 with SMTP id
 00721157ae682-787d5400960mr102720837b3.36.1762882625058; Tue, 11 Nov 2025
 09:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20251105145824.239054-1-marco.crivellari@suse.com>
In-Reply-To: <20251105145824.239054-1-marco.crivellari@suse.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 18:36:26 +0100
X-Gm-Features: AWmQ_bnwqubEIg9CpgOv8nmNo9i2Cpu9HPEm5MczRr9wHyBCajECUb_uyu5SNtk
Message-ID: <CAPDyKFpVS9Z86D_QLhjvOYFAbXaa4_Z=ZQnV+x1ZTuXG4x8oXw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: replace use of system_wq with system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_093706_072589_32864DC2 
X-CRM114-Status: GOOD (  19.81  )
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

On Wed, 5 Nov 2025 at 15:58, Marco Crivellari <marco.crivellari@suse.com> wrote:
>
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>
> This lack of consistency cannot be addressed without refactoring the API.
>
> This patch continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues and a new alloc_workqueue flag:
>
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>
> Replace system_wq with system_percpu_wq, keeping the same old behavior.
> The old wq (system_wq) will be kept for a few release cycles.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 79074291e9d2..daed659f63f6 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1214,7 +1214,7 @@ static void msdc_start_data(struct msdc_host *host, struct mmc_command *cmd,
>         host->data = data;
>         read = data->flags & MMC_DATA_READ;
>
> -       mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
> +       mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
>         msdc_dma_setup(host, &host->dma, data);
>         sdr_set_bits(host->base + MSDC_INTEN, data_ints_mask);
>         sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_START, 1);
> @@ -1444,7 +1444,7 @@ static void msdc_start_command(struct msdc_host *host,
>         WARN_ON(host->cmd);
>         host->cmd = cmd;
>
> -       mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
> +       mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
>         if (!msdc_cmd_is_ready(host, mrq, cmd))
>                 return;
>
> --
> 2.51.1
>

