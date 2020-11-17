Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7E4C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 11:50:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00972463F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 11:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iv8gOXc8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PACBM1QV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C00972463F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o2Vuz7yz6k3/0Xg26RQdtkWpiakQE4S16XzCDKmqNwk=; b=iv8gOXc82wxYiKRusqmvwxp1b
	J0xQXNYiTXrnUhJKRUfI6m0VT01ulGpKdOFjAr5JU0Fi2gVV0jrLgxt5acnVckEjmlbttZSGTkwaz
	gXS5ig6homJ0roxAKu6/JsOx1WZmRlCCzr2B5I+P6O1Ew3S8gLDuGQBOGxVNuaJlixpQqKdINcbDw
	/9qusu5XpGXZM/TU331n9gEbbuK+y8nzhInUWYak6qyZpGAFHxqx83bnDuRu9xCVM6uuIP3p4A1JU
	ozrByLQgfn5c5/UrUubwhLKcLkjuU18MHtX7XF5pf5CTDESgOZ3GpWrcoDpIwNP9oY3uO9/hrIPnL
	Domfx/Qjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kezVX-0008Vi-UA; Tue, 17 Nov 2020 11:50:47 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kezVU-0008UW-Nx
 for linux-mediatek@lists.infradead.org; Tue, 17 Nov 2020 11:50:47 +0000
Received: by mail-ua1-x943.google.com with SMTP id v16so6403220uat.9
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2020 03:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfroypJl3R2fpj2b0G0IswtRCrcTtn8/jYlHEIZineU=;
 b=PACBM1QVGZiTknW8K3MEjs8d472QS3m8E5G0tfEoqeHb3aLhZx2NzqRaXdesTDoEsx
 DXw/jwQ0Zfh0RoBYxYwacuJBjZ9BI5IxWunJKtKRSyBmnMjGIGzd3R2z70t7AtIFWGON
 L9QJQoHDfuSI4Rytn8I2+S4RjRN0Ax0UMhwg+taqE6iUR7mnw8PPPMNAwfsRQ3ETU0EO
 3L5IbB2N8W8m5mCruw6isDxj3Gq8WMcwrogRXJCS6T28SDGI9RZ9q/9UxRlZGA1gsMKW
 lMqwyLJRzsqXBakB3tFUDlj+I+jvmXBoLNdeFE4cNE0vINzclW6+3IVbP1QYHEp1OHFQ
 DBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfroypJl3R2fpj2b0G0IswtRCrcTtn8/jYlHEIZineU=;
 b=FiB3NLOKSvYYjPgvlptsFbpsZqed0RNOk0RJnQB9fgYXtzRNi2mWTs+CiofjKRu4qS
 gYh/XBfoqxKoDTyggjbVOfS7LvbBf8v3GpLAcDxF9kkJbGmbuEG2ez9dMxKwNQ6X4CIh
 j8b9f89PS6X2ksPyeks41Y9pWAkPreCRtSGbLGEWH4zODxJPy58k5PHS6DsZF658vz8O
 rbCVIkoqymFA37KGZR5LQbwpC/8aSWdW+5LPEOCjIrPWSifgWk7U1S/KDyd9PrAsHoLu
 A6vBlFL+2sOKp6AYjanXHDxn3In2mMrpLzSktMnwmju3X301gCaIjWNOklh+RU+nPG9F
 r9kw==
X-Gm-Message-State: AOAM5326Y4GIQm0eBinxQwwLWThvpKjtGIMCgdb4UJ1kzqLt3k8lI0eS
 Hx5WviIC30/RmUd4sklDnOflLzviMedAEMq0MiuPug==
X-Google-Smtp-Source: ABdhPJwz9Ena8joChwbHYWvfBmyFhe6iOgScEwBkOyjyj+5lbfIPs932xzr5zVGdL9BA1VPForksVwfWJANIgBtzAJQ=
X-Received: by 2002:ab0:c12:: with SMTP id a18mr5178988uak.19.1605613842799;
 Tue, 17 Nov 2020 03:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20201112092530.32446-1-zhengliang6@huawei.com>
In-Reply-To: <20201112092530.32446-1-zhengliang6@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Nov 2020 12:50:06 +0100
Message-ID: <CAPDyKFpSFhgGY19Ud=DpMTKC+mP=hedEGDOmF5i4Mysw4ta0ZA@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: fix mem leak in msdc_drv_probe
To: Zheng Liang <zhengliang6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_065044_855490_2644C74B 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, wangli74@huawei.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, fangwei1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 12 Nov 2020 at 09:27, Zheng Liang <zhengliang6@huawei.com> wrote:
>
> It should use mmc_free_host to free mem in error patch of
> msdc_drv_probe.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Liang <zhengliang6@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index fc5ee5df91ad..eac7838e2dac 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2504,8 +2504,10 @@ static int msdc_drv_probe(struct platform_device *pdev)
>
>         host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
>                                                                 "hrst");
> -       if (IS_ERR(host->reset))
> -               return PTR_ERR(host->reset);
> +       if (IS_ERR(host->reset)) {
> +               ret = PTR_ERR(host->reset);
> +               goto host_free;
> +       }
>
>         host->irq = platform_get_irq(pdev, 0);
>         if (host->irq < 0) {
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
