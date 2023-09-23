Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5477CE7A8B
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Bi321A2drNy6nknQTf7dQWZFXj5dHMNZIqg1+SAX5s=; b=jzPPqcrQcaR7uJKOHi+U2pY2Ks
	M3K94wZMPziSQID5TKECelNZ6YH8rdNpPuWfXYGlDvC8ysQcBgWkfcJVmvaAWu8/whOqXQpd2G3Dw
	dD2u/mtXI+SNOeTMglKPwPJlNiTm6LkvFYR+a5VbiFP/fDWE5BwgmpgW4V4A1fv3/alUp57jkxr5S
	7UExjPDbKf4T9Q6T3lpX+pFWltsR3VZBnnTSFCRkTmvO/t8f7lx12UNddlx9h/7bZ8fTdGW3faNvy
	bk0DMirZXpSOLNWeo/cW9wdXMtr2wqkDlYnNAMj9hptarOF0LArbQEIrm0xfECsWdTJbW8GLXd3fY
	pp2U2TeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxlA-00Ad79-0y;
	Sat, 23 Sep 2023 08:13:04 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxl7-00Ad5p-10
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 08:13:02 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c02e232c48so56593141fa.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695456777; x=1696061577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Bi321A2drNy6nknQTf7dQWZFXj5dHMNZIqg1+SAX5s=;
        b=j+SYRbGDIPMbAJexMOFkZOsnwXp/hXRuKz4/W0zf4hoj7KMCrUrQFitIp9ohB6Xh7d
         //m+aWf/9wk3WNhYSFknWYJ2Zf5EOlAHvuEvezjTiFd+fLz4epene3P0k7HMqvlhrYCP
         Cx3Oho09WfSNGCff9enPwt8vqnpIOoOHV6mvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695456777; x=1696061577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Bi321A2drNy6nknQTf7dQWZFXj5dHMNZIqg1+SAX5s=;
        b=cubWYNsh/GXkmbff6j+RDKLw8KnWNMc1gOii/iKOYH9CMTDHBeqNjmLAp5XaD5O0qX
         rzy8WB5eMYGjH5oZzjN4Z0LjWlgTDKpv5Wwk3jO6AeUxOSjAYx2VlrPxis+J6PQfDtqE
         eAKqoKlv5h/4p9eNfKpnZhn1Mos2PCqtSTxtbnOuzIsyhxa1T1sJ/SNttgD+46hdk3MN
         QDaWrhpeHQm8YKuGvFeD1djmDOzwbS0yRhwGzsLch7os/MWQ6C9OSc48Vm6BLuP/eY9p
         zukFbNCDcawsDhSsaL/Zlnm2SQSqKl/b2+D/Uu9Rv2PSuUkqmfAu5j2yWcTiZyu/aJ/A
         gcJg==
X-Gm-Message-State: AOJu0YwOaFEhrevJzNMc9k6HsTJEop1YtaYRnVz5183fkZ0PzMcj7bny
	miODukJcjSweretFlHDpHVgAk7eGI7MX9pROT1KjAg==
X-Google-Smtp-Source: AGHT+IECnxMKCUchTTGpBiZNHPiRxbAjTm5HGeILQHbyVOU3vKKeQJn06Lqp7XA7vJmj2YNE+ycen3IpeXS+HSyxN2o=
X-Received: by 2002:a19:5002:0:b0:4f8:77db:1d9e with SMTP id
 e2-20020a195002000000b004f877db1d9emr1402093lfb.12.1695456777524; Sat, 23 Sep
 2023 01:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230922095348.22182-1-pablo.sun@mediatek.com>
In-Reply-To: <20230922095348.22182-1-pablo.sun@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sat, 23 Sep 2023 16:12:46 +0800
Message-ID: <CAGXv+5Hi2dem-d-EfAJjGkeb1aPnYBWjgVgyHdgp-RJAV=gRcQ@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: mtk-sd: Use readl_poll_timeout_atomic in msdc_reset_hw
To: Pablo Sun <pablo.sun@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_011301_378698_7D637904 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, Sep 22, 2023 at 6:05=E2=80=AFPM Pablo Sun <pablo.sun@mediatek.com> =
wrote:
>
> Use atomic readl_poll_timeout_atomic, because msdc_reset_hw
> may be invoked in IRQ handler in the following context:
>
>   msdc_irq() -> msdc_cmd_done() -> msdc_reset_hw()
>
> The following kernel BUG stack trace can be observed on
> Genio 1200 EVK after initializing MSDC1 hardware during kernel boot:
>
> [    1.187441] BUG: scheduling while atomic: swapper/0/0/0x00010002
> [    1.189157] Modules linked in:
> [    1.204633] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         =
5.15.42-mtk+modified #1
> [    1.205713] Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
> [    1.206484] Call trace:
> [    1.206796]  dump_backtrace+0x0/0x1ac
> [    1.207266]  show_stack+0x24/0x30
> [    1.207692]  dump_stack_lvl+0x68/0x84
> [    1.208162]  dump_stack+0x1c/0x38
> [    1.208587]  __schedule_bug+0x68/0x80
> [    1.209056]  __schedule+0x6ec/0x7c0
> [    1.209502]  schedule+0x7c/0x110
> [    1.209915]  schedule_hrtimeout_range_clock+0xc4/0x1f0
> [    1.210569]  schedule_hrtimeout_range+0x20/0x30
> [    1.211148]  usleep_range_state+0x84/0xc0
> [    1.211661]  msdc_reset_hw+0xc8/0x1b0
> [    1.212134]  msdc_cmd_done.isra.0+0x4ac/0x5f0
> [    1.212693]  msdc_irq+0x104/0x2d4
> [    1.213121]  __handle_irq_event_percpu+0x68/0x280
> [    1.213725]  handle_irq_event+0x70/0x15c
> [    1.214230]  handle_fasteoi_irq+0xb0/0x1a4
> [    1.214755]  handle_domain_irq+0x6c/0x9c
> [    1.215260]  gic_handle_irq+0xc4/0x180
> [    1.215741]  call_on_irq_stack+0x2c/0x54
> [    1.216245]  do_interrupt_handler+0x5c/0x70
> [    1.216782]  el1_interrupt+0x30/0x80
> [    1.217242]  el1h_64_irq_handler+0x1c/0x2c
> [    1.217769]  el1h_64_irq+0x78/0x7c
> [    1.218206]  cpuidle_enter_state+0xc8/0x600
> [    1.218744]  cpuidle_enter+0x44/0x5c
> [    1.219205]  do_idle+0x224/0x2d0
> [    1.219624]  cpu_startup_entry+0x30/0x80
> [    1.220129]  rest_init+0x108/0x134
> [    1.220568]  arch_call_rest_init+0x1c/0x28
> [    1.221094]  start_kernel+0x6c0/0x700
> [    1.221564]  __primary_switched+0xc0/0xc8
>
> Fixes: ffaea6ebfe9c ("mmc: mtk-sd: Use readl_poll_timeout instead of open=
-coded polling")
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

