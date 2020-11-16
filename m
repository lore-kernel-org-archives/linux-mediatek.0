Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D87C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:46:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6BE208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDZHGwsE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofrPYkxt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6BE208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jfwCITCgS8rtDCPUwdYIqDDQi/dRN4za8PoNL6EzegI=; b=KDZHGwsE1i2vnBmbm9O8H4kyu
	MFYZ+Nxvp+RJ+0O5Gpa/XhFUm4ToRo4t6H8WaCHU8JzwOzyZhIX7JYmNly/qsiP7KI9YX8OQZarpM
	tO5LEXoCwVXR+SGgO0XIgqNF8XrZPVJ7NrkeQQm9MlregeDMaUvQyh97Aamd9+91dGE5tF4exb7Nu
	vOy0dgsZWs5380+qN2JzHU2uETL8d8paqPE9zJB32YTDY5lolZitHheGz4N5KhRgwvy4uHmds/Vmz
	Byf2xqtAgp3pA+mCwPtwGsktGjWVX6STbg2yByPi31zrcUYWqEvxmkX/6G0I9+1hlHrH9Y18drMUd
	QFCOLStuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea92-0004Xl-7Y; Mon, 16 Nov 2020 08:45:52 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea8g-0004NW-HX
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:45:32 +0000
Received: by mail-vs1-xe43.google.com with SMTP id v6so2253133vsd.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbKk16NI5p2pQ5Vkp2eQt+oH4jAwfu7+8232QxkCO+U=;
 b=ofrPYkxtv/cs3S+9dJbrlpk9TX68OgaStRCpSdUnu+uY6Bg6fWnfQGEOPO2gXwUXxt
 FelpjVA1Z9q3ZfoBXej1h9RF8cLaDZ7Ow3viO89QU0xD8lFteDvBYsRH+YXw7tos96LQ
 bDTKITx4Ex7UyPy/o2JvF8WpKjN3s2jcxH6qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbKk16NI5p2pQ5Vkp2eQt+oH4jAwfu7+8232QxkCO+U=;
 b=H2lyFke4T2E7VT1v41ON9oEXhE1LB6O5wjN6zAIQnQCCzc4JkCAHPHaE9EJwr1JDB/
 Rq+SnPyrX2XvVC5JVdGgN1lWyQ6YLwh7qwEDwEy1abbpChF5Zo6DzixiDMVDQB1fGJHe
 v8Rc43eSFXGVoKa+ihrROo48vvUpGB9i4LjQ0R/0X441um8+4TDtRFzXgH/TTBaPdc9L
 tJx4ZuVZx0s6tBcsMRD9g1XIKbhjjJ25W5pmPz7USPb3vB+y1D8/BOaZDypcMeRuJ/13
 O+hZqFArST9Vka3QDbYhs9eJPGWE4kBdbPSqCDhGSO5w/vbF2CU9/8GzZJjxBU9d0dEY
 pt/Q==
X-Gm-Message-State: AOAM530QSeBqhSRv3sETfueSRJeBhXCJ/0C0Yyj61571Ls2zddmbqwGq
 dN+r/xrA2vedv52tIy1zx5GM7BiTwL9GmnymCcqR4Q==
X-Google-Smtp-Source: ABdhPJxio4nWE4xVfy3dvuLxspvOAzbqk2ScwGiHgHOJP+QTPiYjy0NzA0YqGWsFq5+QrLpvVibIcJy3fIYfsSZySOo=
X-Received: by 2002:a67:5f05:: with SMTP id t5mr7482385vsb.21.1605516328500;
 Mon, 16 Nov 2020 00:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com>
 <20201116082537.3287009-3-tzungbi@google.com>
In-Reply-To: <20201116082537.3287009-3-tzungbi@google.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Nov 2020 16:45:17 +0800
Message-ID: <CANMq1KAuZ4gsTmYC_kQvhzpg-AEfXhBqypS0bdogv15THQCTiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc/mediatek: fix sparse errors on
 dma_alloc and dma_free
To: Tzung-Bi Shih <tzungbi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034530_829505_9BBCF6B3 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel test robot <lkp@intel.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Guenter Roeck <groeck@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 4:26 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fixes the following sparse errors on dma_alloc_coherent() and
> dma_free_coherent().
>
> On drivers/remoteproc/mtk_scp.c:559:23:
> warning: incorrect type in assignment (different address spaces)
>    expected void [noderef] __iomem *cpu_addr
>    got void *
>
> On drivers/remoteproc/mtk_scp.c:572:56:
> warning: incorrect type in argument 3 (different address spaces)
>    expected void *cpu_addr
>    got void [noderef] __iomem *cpu_addr
>
> The cpu_addr is not a __iomem address.  Removes the marker.
>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_common.h | 2 +-
>  drivers/remoteproc/mtk_scp.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 47b4561443a9..b3397d327786 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -99,7 +99,7 @@ struct mtk_scp {
>         bool ipi_id_ack[SCP_IPI_MAX];
>         wait_queue_head_t ack_wq;
>
> -       void __iomem *cpu_addr;
> +       void *cpu_addr;
>         dma_addr_t dma_addr;
>         size_t dram_size;
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8ed89ea1eb78..a1e23b5f19b9 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -413,7 +413,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>         } else if (scp->dram_size) {
>                 offset = da - scp->dma_addr;
>                 if (offset >= 0 && (offset + len) < scp->dram_size)
> -                       return (void __force *)scp->cpu_addr + offset;
> +                       return scp->cpu_addr + offset;
>         }
>
>         return NULL;
> --
> 2.29.2.299.gdc1121823c-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
