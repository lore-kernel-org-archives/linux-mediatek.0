Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F9AC48BCF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 03:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091206136D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 03:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091206136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzMQtJvalUAqUbW1Ouo5ayNZXTDX1eBw9On/AVhDU14=; b=frrbxtJaKXeH+B
	Y+eW9y13qVEfd1sX8smET3RYtcFzDnC0tGrNEAj1lVdfNHPBg3SpvdYgsXjxmhYaXxfl4KtRhls6H
	3EWgqkqm/VKhQCB1r7mjnhuf/i/VAghTW3L+2M3fj5VhZpeXhk76GVQovU/IvYgGjwBSPJeRdHLQ3
	LA2j0zyZhbn4VUSQFSBqqG0sskw57PUBaOXMhmwoDa1rrtre44JLI+4+7DNLZj5F/hjPDM2wt9+Ud
	TxPkKFQDQDSZmA/xAtLG2jy2QWqMi5qf5j5yM5oSZKZHr23Ga1cdFzwcaWW9Y68hGkgBDIbWW3Eh+
	aJX5dp1WU8P2/2tgCzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrBRk-00GeWt-1u; Thu, 10 Jun 2021 03:33:32 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrBRi-00GeW6-16
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 03:33:31 +0000
Received: by mail-pf1-f180.google.com with SMTP id g6so451580pfq.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xUW1QYivvyjjAgnt50OixHHdXR+qpa5RaoXkpg+0Z1M=;
 b=Ckk34yOiLznSSdYmHluvlvw2OSugkHIAcSI40L06ddrl1WVeu9lXyJKAySZr7I/6lx
 L836XZ32h5BAbCgwQE46EsuxXnQxKGyeSqwD00a0X8Jl9oP+RTO3Mi8P+NnpJGUSpbSN
 7UB4hKaHAkMX/VHG9tiyztZzgqJ5TWFOxM0D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xUW1QYivvyjjAgnt50OixHHdXR+qpa5RaoXkpg+0Z1M=;
 b=FdVgh6HwdfDjujx+inHZSPq8PVMMLGNHdn61pk+HbVixKQztvWP5YxB+LVT0D2gQN0
 v5dnoYCsQ8UpCYjdt0MUhQJ/QFJ7VIF8RweKrn8O8IFmGUVJ9oU/U8MUDaYZzM0I0l4O
 Uux4kDfZwOwM/Y3m7N7zxZrfpss7CvY76NvxOrkWvGQrsGW7i6KNvtTFPazMJyHWYWhJ
 hqdEHLTOmV/Bh6GP3/M06kYC3QvNtlS9DOrhb5VdtHgjniBgIflXHaUvIX1+kCiItTak
 OWI8cOC3CFnATujhRohusn28EuQgvA+V3nq66B9fU6HhMePNHMkoTn4f/y4AqZqzqiU4
 voKw==
X-Gm-Message-State: AOAM532wh2B5TAaLqrltZ/vbWyou7KX7XM02RKc4jmQtjPQPUlSfAPMt
 wJKi3X9WIf3ygmdLg4kOXlENZdtmdHdw1IxKMHwlv1O7qhQ7PQ==
X-Google-Smtp-Source: ABdhPJwe3SJDAt53Ax1wi7DIEJ7gvGIkAxJ9U/9K0Mhis4k/681JzWIKUxqMMmr9kGyLMHjJbzCsDbc5afgxvWOYbpg=
X-Received: by 2002:a63:5d19:: with SMTP id r25mr2802205pgb.317.1623295948478; 
 Wed, 09 Jun 2021 20:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
 <20210507021127.54717-2-chunfeng.yun@mediatek.com>
In-Reply-To: <20210507021127.54717-2-chunfeng.yun@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 10 Jun 2021 11:32:17 +0800
Message-ID: <CAATdQgAr=wwbuJ=0nKKmO6Rb7qcW2BobFAb30DUsMA2s6EOxhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: xhci-mtk: remove unnecessary setting of
 has_ippc
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
X-CRM114-CacheID: sfid-20210609_203330_080329_EDE4881E 
X-CRM114-Status: GOOD (  15.70  )
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
> Due to @has_ippc's default value is 0, no need set it again if fail
> to get ippc base address
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-and-Tested-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> v3: new patch suggested by Greg
>     fix typo suggested by Sergei
> ---
>  drivers/usb/host/xhci-mtk.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index b2058b3bc834..2548976bcf05 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -495,8 +495,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>                         goto put_usb2_hcd;
>                 }
>                 mtk->has_ippc = true;
> -       } else {
> -               mtk->has_ippc = false;
>         }
>
>         device_init_wakeup(dev, true);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
