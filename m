Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94D3C07E9C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A6B613C3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A6B613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pf0aQmz/0mXaVbi3cNqu/ApguxyQBt1zG4C8Puf6Qvw=; b=TOh7aOFeoLkEuJ
	SLP2ADr75phNazYfuXfK3fgnJduGY5QCwcj7lZAXF65GFr1lF40RDx6TvGchyKTHBh9+TDKKD+Uf0
	B4OYPFBntHSoGzdKL+tF0InPd+DxVFFQRPLjI/Bzj3NSouiRFiMGFPLrMi3bPkWF8wS6oF3F8Un6B
	aufX3bSYD2wyXOUlIG/qy/tGvQB1rWWWyIqC1YsQLclzOI8MvcFsCoUKF4UD/UlqCy4+KLdaQ2XpN
	Vy/fMSZdQlXs6XAunywUeAorUkE1Wpy8WeV1VusmGP/xch+fYl3XhcESq+JdH0KhY41VtSNXuHZ7m
	irPN+NfNuqq7Vkr9RTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1lQo-0011Qd-DI; Fri, 09 Jul 2021 08:00:18 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1lQc-0011Oe-Fs
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 08:00:08 +0000
Received: by mail-io1-xd35.google.com with SMTP id b1so11549909ioz.8
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 01:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxeKKZpH8g0VLt4BIsJvm3Kz5ooojk4SyCSTD8gkf4c=;
 b=gdLMz5E1Qi4ptJm5RLn7ul53NR++fF70gLhRdu6l9pYSqnfiMT2JZivjdfT1BFsNLm
 a3/LfUMo34qNFd2VMjt0S+EQeSYQjSo24rJPa2TV0qLq2B/ZlufcZXrKUrlM1Hbhw7Qb
 2Hwfu5SZgdevJCCG8fdUujt+xoL9jsMmuRTymDZC5b4IdTzKPMYuzsyWjA+zDX/LYYKN
 557cCWvjzvqsqLY9Phy9E8W+p8/GiJFOuGsiFCZP2WcpafQ5QGS4xTi7OXoMjeMgvQa1
 YaFaxwoZM8KNrMaTDEr9qbEKEsQRqLLZF4Bf3dfXj8PeUteneMuzi/DcpDT+N61MEZdJ
 SoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxeKKZpH8g0VLt4BIsJvm3Kz5ooojk4SyCSTD8gkf4c=;
 b=PjQpcLgDl6i3wGm84c6WheSyX9AjyFRVTOubaaghf8dAnr1fZm1D5waaZVRnHQkfyA
 0jzhjInzCG5NCzCRQ4qKVbnQEHUrpJUso9irv65rtB8ybNevXDmhbsV1amb0GPqCpoxP
 dV5DK6tzDxh/8ZIS8TeR6QTBnOAPvun+un1rJbH8iPrPHIbFl2tNZDp+eVzroeB7+iOl
 hnHjOe64KTG8+vtFu/+terkOAaUExu9l1jwTnlmODaMr2PMyI3VwdxOlU6Uq8IlqrpB1
 3wMRB8OtydKCYmyklqOH46HVc6qxvu255mZXLBSIMT7Xg+NljfqxJ96INMzOSrDNOB+p
 heLA==
X-Gm-Message-State: AOAM531dfWuMqJ4EHaj2XitSG/vcicjQ//oglau4gvnJ8quFMdk4WVKk
 QKaTeLuLNtHwiPAnVWrCLJHHKulgcfrRBO9uwqR/Kw==
X-Google-Smtp-Source: ABdhPJz/iM1VUuaw+LgfAXMYyWsY+UGkYwPTUISY65c4SEG+BA2wd1yXCYcOUPflwPTX6QbLL3qMvB3MPSOQHZigg2s=
X-Received: by 2002:a02:c73b:: with SMTP id h27mr24131704jao.126.1625817603524; 
 Fri, 09 Jul 2021 01:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-7-yunfei.dong@mediatek.com>
In-Reply-To: <20210707062157.21176-7-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 9 Jul 2021 15:59:52 +0800
Message-ID: <CA+Px+wWRE0DR15GgorZnoN1xdAqoau94gkoF7-x7h2hd21ZGXg@mail.gmail.com>
Subject: Re: [PATCH v1,
 06/14] media: mtk-vcodec: Add irq interface for core hardware
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_010006_557061_07DCD579 
X-CRM114-Status: GOOD (  18.05  )
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

On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> +static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
> +{
> +       if (dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
> +               return 1;
> +       else if (dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE)
> +               return 2;
> +       else
> +               return 0;
> +}
Use a switch .. case .. would be easier to read.

Would it be better to use some macro or enums for the magic numbers?

> @@ -113,8 +114,7 @@ static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
>         }
>
>         ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> -                               mtk_vdec_comp_irq_handler,
> -                               0, pdev->name, dev);
> +                               mtk_vdec_comp_irq_handler, 0, pdev->name, dev);
The change is irrelevant to this patch.

> @@ -154,8 +154,10 @@ static int mtk_vdec_comp_probe(struct platform_device *pdev)
>                 dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
>
>         ret = mtk_vdec_comp_init_irq(dev);
> -       if (ret)
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register irq handler.\n");
>                 goto err;
> +       }
The change shouldn't be in this patch.  Instead, another patch that
adds the mtk_vdec_comp_init_irq() invocation.

> +int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx  *ctx,
Remove the extra space before "*ctx".

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
