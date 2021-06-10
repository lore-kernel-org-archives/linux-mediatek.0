Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207F3C47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 03:44:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EFD61403
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 03:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4EFD61403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNp/kgb9/Mp4JI2WzvOj6c5Y+Wr0admutuB/Q4tR31w=; b=e3ZrC0lzlDJ0eD
	IclBsMNQgSceC9ReRIFmzjYVxuNNky034e943fQUgtEwvT3jtshszYiD6KkoUgy1Je5KfEAFBp5R3
	zwV+N9fo0p/zoNCUJkskl8kGISZooOey68OKCtdvAREMpB6OiCIZQVh14/NtL943yE7Z8IvM402rN
	Svo0xgOph1E+vIHbljMcqsCRSA03H1Qx0RHmKWJtEHVAtfl6G+9pfeXLFl8InCdpfyte91COfbwW8
	FzdRp/TcHRAem41dUK8RDmiwL43BBSGecxcvJPvpSBo/muuwcDpUQJqebkx966LBl1rHzB2D4262A
	cN+n0P9xUS657TT7ttuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrBa1-00Gfcy-LU; Thu, 10 Jun 2021 03:42:05 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrBZz-00GfcJ-2C
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 03:42:04 +0000
Received: by mail-pl1-f169.google.com with SMTP id 11so233646plk.12
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 20:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94pKNGw6aDmClK5qtz94uwCrVTPu2QawOX0eEueaQtw=;
 b=hgdu2EGMeJKw7Zqbcjnq4JgrvciYatqrsvp/Hq38+r3dbFHb3YEZhBI4aQP80VcU84
 XTI2zxdzIwKN0fntEi2P4wfCt1Sjc2W6QvJ2Ge6+EzN69HFwWHdVZa7c5odI7eC4fmbY
 fXfkc4SQl0zDWr1xTXh6Mrc+hVLODwK88TSjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94pKNGw6aDmClK5qtz94uwCrVTPu2QawOX0eEueaQtw=;
 b=NFpNqNJFBhgxa58nuHVO8YZBJ1PQ/Xo5AisdYcJl9rpq9KQVaCGexqed0YWiFBVFlx
 Z/tyqm62Xi+CkA1vt735u0q0RuJge5yJbPBiKkkgESG+Zyv4SbHjx8aq7E19ARgKd8yO
 nD1u7e5/5eMVInaxAU2Lo68Nf21a/l4YQ96DVHWxHp8SvGGS67qRsaXoQVVQWM37qpPg
 BBoI5WXIiU8i4pQSsj+jEbH0AgUJ/MrOYqqBSTGvs4NpJWbR9uR4SELLRQ5EloDYnxpj
 ngK57xmLFwT7Q4z5Dq7WTaWrFf0gWtccBehDj+aOdjdpsH12NuBAiTQ2VcCe7qhhLaUZ
 6Zqw==
X-Gm-Message-State: AOAM533sGGMxQDI1Ax6Oj/lnt5hC0cFsQj+YRNYck9dY2E+Wo/N5J3LI
 2xG9HGHUv4rBdU1x82nnpKWYspsxd01OK5xISXfW1A==
X-Google-Smtp-Source: ABdhPJxfhXQZP1C7d97G/hx7Snn+K2LH9xusJE2FA5qGXcVH1gpUQP62dNOS5MgnxVxXRcpVPneWdOueRi+vrJScXkw=
X-Received: by 2002:a17:902:fe83:b029:106:2e:97b6 with SMTP id
 x3-20020a170902fe83b0290106002e97b6mr2950199plm.49.1623296462349; Wed, 09 Jun
 2021 20:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
 <20210507021127.54717-4-chunfeng.yun@mediatek.com>
In-Reply-To: <20210507021127.54717-4-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 10 Jun 2021 11:40:50 +0800
Message-ID: <CAATdQgAmms=x=go7TBy9WRTGT05rtc82pBH4NxYdM5d-ohN5MA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: xhci-mtk: use first-fit for LS/FS
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_204203_119717_B51CFEA8 
X-CRM114-Status: GOOD (  16.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 7, 2021 at 10:11 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use first-fit instead of best-fit for LS/FS devices under TT,
> we found that best-fit will consume more bandwidth for some
> cases.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> v3: no changes
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index 9fb75085e40f..c07411d9b16f 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -634,6 +634,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
>                         min_bw = worst_bw;
>                         min_index = offset;
>                 }
> +
> +               /* use first-fit for LS/FS */
> +               if (sch_ep->sch_tt && min_index >= 0)
> +                       break;
> +
>                 if (min_bw == 0)
>                         break;
>         }
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
