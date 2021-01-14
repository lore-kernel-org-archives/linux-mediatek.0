Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2ECC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 04:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614152389F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 04:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 614152389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SqGW9URtkbN8UFoZeJ6DSsXdwsnoGCRFE8uRFkiFrT4=; b=CLhrKmd9vvzMa4FoAF0Q6ypDf
	th/J48Z6YlQ4wdhDyHoTdtoTrjB6yuS3X2Zg2lnGwzcDwJRjdho94qcgwjTuMBisD5Cu1zmzxvAmi
	d6omdqhJnxk5BbmWt1cvr7QSzMcKGTDNVLpl7r5MeUvETRcwNhfQsTZdx7kMLY24rcHknAYHM+b8C
	q6M0wfBTJqSIgIgrkknrqVGIApcUYElYgd0q/0Y99hD6q7LB/6LNdFuv4su2rRL3B3G/Djre1X/Tl
	6jQhhO/5ZRZEp+dtHg5CMVFYctqZ5XaSr2/jakc3n1vCLVh6NtdLkv2VyxEpDZENR2f2RIiwhIQQN
	YqiqRn5kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kztoa-0008Cp-D7; Thu, 14 Jan 2021 04:00:52 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kztoW-00087z-3Y
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 04:00:49 +0000
Received: by mail-io1-xd2d.google.com with SMTP id r9so8680027ioo.7
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 20:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bUNuOV0lkiudcY9ujl7cqtrWI85/vQQ/w9o9Luh5OXQ=;
 b=OyQLLjSoCSU30wkyILOqVYSYkdZDAE4iZo8dV3fBtK5svrkgBBBgZmaVaqCebhQSH1
 cyM55Uf4fD3dLEUbr3bJWJQrGkPjfWhGtJYT2OZ7CkIc0n/jbsRxn88nHoCO96rXe6Gc
 Tk5/LNCtj5fW3Z+iUC98dk8iw02tynmkneYLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bUNuOV0lkiudcY9ujl7cqtrWI85/vQQ/w9o9Luh5OXQ=;
 b=K2F+ywDgxOSTlXI/yUKuwJyW3Mnzs7n4QyqdSCBNdrRr78bN6kxnYOI4KzTljR3DVw
 Fdr96C/HQ5q56FabPaG73TIaIVFT9hF71f90vZlDex1sIeY7xhV+v6w/KKpHA4Ts0tcI
 pcQzdgD3nrwXN3FLh4bifWuVmlTeY2k/6FpWEw2t0QsvVdcJijv+ECxjiiBz56kPYZbN
 BopOw8/R8pp/IdwDqS+wCnUqlWQPRDxWSM6CTuVO4XUxVj2pLRytE8IPPUSrR5XLDGAu
 0T/dwF7dRAl0iVrBW5dX6+JWQPJdFQV3jILFcZ7WGTIy3+8XLYA1EgRG+i5SLXp4gE0N
 yjlg==
X-Gm-Message-State: AOAM531NcGx4W6aQfl/+Y1VLrXT6x+2AtC3mNNHS1Mf1N9dsMfTPvVDF
 sCDqZ78mLjAwrGkN4ytBvvzIWOfWZNVmZ/FxIL7wRg==
X-Google-Smtp-Source: ABdhPJzS29RiRBDqwb/rarGXe1c4kC+vlN7yf5p4zUPTQq2hFVDngTqGgKMqxe28CgKZvSlbJRyEG4WM0CtLOO2tzMc=
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr4937766jad.98.1610596844255; 
 Wed, 13 Jan 2021 20:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20210113213012.67643-1-enric.balletbo@collabora.com>
In-Reply-To: <20210113213012.67643-1-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 14 Jan 2021 12:00:18 +0800
Message-ID: <CAJMQK-gvKaiHNWxzq3+NDnoN8kd2u26e6WKZqX=R9dc+aB5xFw@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: pm-domains: Don't print an error if child
 domain is deferred
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_230048_320739_5EE9E051 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 5:30 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Child domains can be deferred by the core because one of its resources
> is not available yet, in such case, it will print an error, but
> later it will succeed to probe. Fix that using the dev_err_probe()
> function so it only prints an error on a real error.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
>  drivers/soc/mediatek/mtk-pm-domains.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index ae255aa7b1a9..8055fb019ba6 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -480,8 +480,8 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>
>                 child_pd = scpsys_add_one_domain(scpsys, child);
>                 if (IS_ERR(child_pd)) {
> -                       ret = PTR_ERR(child_pd);
> -                       dev_err(scpsys->dev, "%pOF: failed to get child domain id\n", child);
> +                       dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
> +                                     "%pOF: failed to get child domain id\n", child);
>                         goto err_put_node;
>                 }
>
> --
> 2.29.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
