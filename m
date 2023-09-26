Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ADEE7E649
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeFjiy4HXCSDHqncKbVdy7TDNdv7qqAs1Sfi74FhiwE=; b=rfQMVNB8gics5Y9ceIu4R4BC0f
	QQaP1PK0/Yre9Nap2v24LI/H8wlsIZFWpS0rtwkXCe1i+V5d2Ldmrw1ARxWQRgdm7ttdf1DWJoXIK
	E5BcNTWhnSFzvffuZ5N9WyUv4UKhT3FqPiPb1Xat0BmV2XlF0XMVOUlYbEXTbSIwPYASdDbt8GVFd
	5rtX1KJ9ITbl/9/ze54AK0lZXjUCKW1ebQKN2A6gjepIeJRCtUViKjsgztjqFucqVpdS0+Xbm5rna
	yqVlHIxVs7OiI6AXdU7aMauX18o13gKU6Gc5m0NGtsaL9AojAcBtDoWnNEnu4Fk9jOenctEloMVnl
	MYMjnipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bp-00GbZC-31;
	Tue, 26 Sep 2023 15:04:21 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bo-00GbXZ-04
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 15:04:21 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bf298ef1f5so5586437a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695740659; x=1696345459; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HeFjiy4HXCSDHqncKbVdy7TDNdv7qqAs1Sfi74FhiwE=;
        b=oCMeN4MTTA3xMWOd+7U/mAqlSbfboZhf+m4gR4CWzNwi15llMZj49QhRxjEwbKGUGS
         VMg+OYS/979y2/PQbvqJAT2VKgohywJDm3xQQLvDJH11W7rjsY9cP/wci0KAcJdX7w5b
         wI9OFBd7HjyOROqQgpHKwPg7sXEHbIOsHlJEpEkliCGn+btB5zab1nPJqVB1RUZU04ul
         JxRUlSVRu1ZxE3qQzvjkGXJFdEN7vnt+X/y6vAaGb9Aml5XzKoS18N5I+ro4ShrPZGo/
         pxy+w0cZrTYZKShro6NpRPTaPKqe6dYJp009OK+Y7PhB8D8P/084vCmLPPehySMTkcZ6
         SsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740659; x=1696345459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeFjiy4HXCSDHqncKbVdy7TDNdv7qqAs1Sfi74FhiwE=;
        b=Fy9tHUvUYibPGC5o/clESeb0MeSKI/hWF7i9CyNoJ+zRe2ugX4vH/WrjiQkxO2yP9b
         B6b4EBbQQsLAJHm2IodFB0dV19zvj7yBVSKne9g+nDZ44A5gQgg4n5erHIoQLU1UIOCL
         AyGjDm/O4XEFSGPM9CwKAi/s9L3cuk/LE3UgXkOadm1uL35g/LIe0gBQvTwomyyrxA9T
         H8ANEMSKdCXndPi7XbpAcfp5C+hQ0eIQqldDKgC9MC8GYoPlZxgTwf805ikjWiHPuVLK
         0f2busU+Ws9gxO8iUDCd2w47u20D/lBqODh8g2auWoRxPYsb2jNfwz2bYaSnz3g8pOgc
         lDqw==
X-Gm-Message-State: AOJu0Yy5CCYXCqW4tBf/Y01/HD8jUgRcvPUOKPEzGK9UGMeWOXiIlk93
	rOa84AbwYJb21Rwyz5OZt+o/PW8iA8WOg+vJh7wUaw==
X-Google-Smtp-Source: AGHT+IGdQuvVsg+gmIk0SmA4JMrymCzShro3UtZMccAsP+0p8Rtd1FF4Qge9tx7ZaLRR3USnZ4acnj3DZvpnD5dhoHo=
X-Received: by 2002:a05:6830:22e4:b0:6b9:68fb:5a28 with SMTP id
 t4-20020a05683022e400b006b968fb5a28mr10468019otc.27.1695740658349; Tue, 26
 Sep 2023 08:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230922095348.22182-1-pablo.sun@mediatek.com>
In-Reply-To: <20230922095348.22182-1-pablo.sun@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Sep 2023 17:03:42 +0200
Message-ID: <CAPDyKFo9i-8maLJ=L5re8pe4v2v5vQ8Jy+g-MqtNZH_w6Lb9cg@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: mtk-sd: Use readl_poll_timeout_atomic in msdc_reset_hw
To: Pablo Sun <pablo.sun@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080420_064797_05C1B2A0 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, 22 Sept 2023 at 11:54, Pablo Sun <pablo.sun@mediatek.com> wrote:
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
> [    1.204633] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.15.42-mtk+modified #1
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
> Fixes: ffaea6ebfe9c ("mmc: mtk-sd: Use readl_poll_timeout instead of open-coded polling")
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 5392200cfdf7..97f7c3d4be6e 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -669,11 +669,11 @@ static void msdc_reset_hw(struct msdc_host *host)
>         u32 val;
>
>         sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_RST);
> -       readl_poll_timeout(host->base + MSDC_CFG, val, !(val & MSDC_CFG_RST), 0, 0);
> +       readl_poll_timeout_atomic(host->base + MSDC_CFG, val, !(val & MSDC_CFG_RST), 0, 0);
>
>         sdr_set_bits(host->base + MSDC_FIFOCS, MSDC_FIFOCS_CLR);
> -       readl_poll_timeout(host->base + MSDC_FIFOCS, val,
> -                          !(val & MSDC_FIFOCS_CLR), 0, 0);
> +       readl_poll_timeout_atomic(host->base + MSDC_FIFOCS, val,
> +                                 !(val & MSDC_FIFOCS_CLR), 0, 0);
>
>         val = readl(host->base + MSDC_INT);
>         writel(val, host->base + MSDC_INT);
> --
> 2.18.0
>

