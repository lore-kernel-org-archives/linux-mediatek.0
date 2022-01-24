Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B49C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 03:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NfuQ8o0LS0JbQxjnwuyVv4NKG5HynHKZCRRgIxhHrE=; b=I4TE53Bnz/mk84
	OxEWkJcgfDERN8qrmqBHENSxJs7I9Yw/dc2miNlYMpmOraYssv886Cu4lhjBxsexxHRJnnxnau/aa
	b9Ot2SjYoCxU9S/txx/q34T9gHC6K0i8//NtSnhDc7jAdJ7iw5bTNaZckTnu94rkdZkfMamhCgzZn
	a4HKE3SO2NoPQgXL483autgjo65uAoe513Evh/4jYaQ794JmUyFF8f5RoYjPr94MMGN90Zq2Om1uV
	1cCnCYWxnhI6x8Zz7PwLEwURoNZvZSBUFY+WsXynxJsXwFmYslapP1RaoOp4Kd7aFVsh1gMUfQS39
	gnSCQCdVOz1uzSyDi7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBpn9-0029H0-MJ; Mon, 24 Jan 2022 03:13:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBpmw-0029Du-IB
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 03:13:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id a28so16220807lfl.7
 for <linux-mediatek@lists.infradead.org>; Sun, 23 Jan 2022 19:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5qVRM/Y9KnTf5W/OW47uEzjGsZq7YvdI6MDc82La160=;
 b=UlGkxmIGFurpQPQLsy3DHRon2/mDjj7Q9J/DY0DCAhxEg6rtDo79bddPp/YOKubJtC
 /tFIY5HlZAMacqbKHnZQVmNYaH2V6/nYrNDLWnSBq+1jYjZwCpHW8kaLPnpSj9Yzrq8D
 /zTzYAI+oMwUm37NjaYH0/lr9jk8yjSRqwN7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5qVRM/Y9KnTf5W/OW47uEzjGsZq7YvdI6MDc82La160=;
 b=KXXHsStr2K8O85fFJsRy4/WPyWcAkv/wWsV8ezLjhD2MGs/3BXm+jIO5CW561AJ5AX
 FCBVLOIvjF1fSUMecncKbrNEluozAmN9CjIpe1OUMAobzEYk1RJgn35eHyWXYE2eIQrr
 JTreBtXy22dP9kqiHWx5n5AQQKyGiHNFwxsZtLa0iadiTN+fGH0gV0RLr1p45pTfDtYH
 8CkyeMZLPr0GfJlbNBZwSCq7ajy6gIVIjNjlEVW2eKpnNVJ1PtRX8yHyvl4rbxqjHeE2
 MkvsGH/cEROV1j+hY5kWOUDyDfZhVcx+HDpkPqfh348l/zxnU9vISgcwv+HKrtMksXFL
 p/kQ==
X-Gm-Message-State: AOAM530NcEZB0U4Sk4iO7O8kLKsO0JUDf6X023MNA2y2vePj6ksx++cT
 61s+lboH4d57Ljf/h97c/g9PyTWH43FAowZ3oNJAPg==
X-Google-Smtp-Source: ABdhPJzG18l672TgZ/EmECfzrQYf6wq8lGBjSmTvpyYvaqtsPUqWNgNQKmjGEnHknumxN8qo9BV/N9rD/h475wz3Fgo=
X-Received: by 2002:a05:6512:1320:: with SMTP id
 x32mr11937257lfu.597.1642993980077; 
 Sun, 23 Jan 2022 19:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20220123033306.29799-1-qizhong.cheng@mediatek.com>
In-Reply-To: <20220123033306.29799-1-qizhong.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Jan 2022 11:12:49 +0800
Message-ID: <CAGXv+5EcAXFTnjkbeU4f3J2s4Ue5zxrN4QgS=t54BnLX8Gkw2w@mail.gmail.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chuanjia.liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_191302_648512_D84767CD 
X-CRM114-Status: GOOD (  17.53  )
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

Hi,

On Sun, Jan 23, 2022 at 11:34 AM qizhong cheng
<qizhong.cheng@mediatek.com> wrote:
>
> As an edge-triggered interrupts, its interrupt status should be cleared
> before dispatch to the handler of device.

I'm curious, is this just a code correction or are there real world
cases where something fails?

Also, please add a Fixes tag and maybe Cc stable so this gets backported
automatically.

ChenYu

> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 2f3f974977a3..705ea33758b1 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -624,12 +624,12 @@ static void mtk_pcie_intr_handler(struct irq_desc *desc)
>                 if (status & MSI_STATUS){
>                         unsigned long imsi_status;
>
> +                       /* Clear MSI interrupt status */
> +                       writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>                         while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
>                                 for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM)
>                                         generic_handle_domain_irq(port->inner_domain, bit);
>                         }
> -                       /* Clear MSI interrupt status */
> -                       writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>                 }
>         }
>
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
