Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CC5C07E9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C244861009
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C244861009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yK8g91nx0mPHfiVUsbLXiqZpcT3eadTD7WJrYHk/FSA=; b=q4t4n2Dkpc8NpU
	lqeK7RzNYLgViQ6lH+ThXiWo/hdNCV/uQl+RgPuw4xf97Tx5HqArg8KNQwWPGRWPO3UOO/C3DSROi
	V1Ky1wgjx8wZRjcZDKIZDXEyIBlbPJfS00lQjmtoPMvSpkkF+M1huO4tTHXCsyOCZrwstM/By4nDj
	YHh8xq2FQszOZ26Qx6vjdIHQzxaununn7ow55RkVo+uyegdJfgVBnfyNro2LrOiBaYwRiFjVxmWHe
	4+EvnMOgR2n7KhJ/WD8sfd0OgY0kKFZ+ve/eqFEp9bhl7kISJImh9IZLm2R2qasWkAdCU5WYQ3Rng
	fk418l0xckTrfNF3bnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69jP-00FHXm-B0; Wed, 21 Jul 2021 10:45:39 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69jM-00FHVn-5H
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 10:45:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id g24so1404789pji.4
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3lABi16nL4MQbRpp+EfVh/1lUieQouz0Mt1Eq3+g03o=;
 b=e1Kye+SB7N4WedVaQMXh+r+XKa4tTEZMwHQLriWWLC4r29k6eiqa6TbO3ygi1pNDw/
 KPESXu1ee6k4rudQCQ4a16OyvOBhEPMAWpvD1pwyncIeyJx+5+Q2MIyDjKLI2HAJ0DR2
 OTMAk4Hr+4D+jMX8+ll/bSXIJHTyOuqNsX2Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3lABi16nL4MQbRpp+EfVh/1lUieQouz0Mt1Eq3+g03o=;
 b=UEmHNuTxtVoODa7S5uEhC0YOJIhR+meWiYE9gDlTl6WYFZI+XBBGcETRX/fCjfMUtX
 G3HOzXtZqQllIEIXnj/XUE+0ekbUx9H3Q7T7YS3vghjey6HNWqnP90wCtdkY4PMI6BLK
 lvSynfkkKGcDW7U3W4gUiOAndzdta6R+KYXwAwQjENP0IEQLR609DON2CJSwYmL8+sTE
 quPXZn8JFgVBh4KRqE1iWpGj1x/1mKi+IY7yb3dmgMmz/U7LcaiXHH9dXIjWYR5S60SO
 8IVnAUwHhkBqIjduB15Y/R1tdBdsq39+kGHNvwsuRs0CUqHf5Ag2Ylv0DL6lS008KfAJ
 xgEQ==
X-Gm-Message-State: AOAM532kN6eT4OfIFoZQgLHCgnbIVkvbxFqJzCaci+blYkRdRXYGfaAG
 kDiSrbv9gM9+Qw4Y7H/g9cFX6V/sgT0e8cSGGfdxOA==
X-Google-Smtp-Source: ABdhPJwseMcBhtA89/xVOfkSjI8Er/1b+WzAHYlvJAI5MGItY7qPIiQanSoTGq6Tkh3CF9f6U0apmV9yj3pMNUucrsU=
X-Received: by 2002:a17:90a:f3cb:: with SMTP id
 ha11mr3173568pjb.144.1626864335082; 
 Wed, 21 Jul 2021 03:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-7-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-7-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 18:45:23 +0800
Message-ID: <CAATdQgCPunSYpxCE4ZfMBtbmyGik-AbxX+yh+F4m9EYDnCMObg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] memory: mtk-smi: Add error handle for smi_probe
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org, 
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com, 
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_034536_252254_4A9C8F3E 
X-CRM114-Status: GOOD (  20.43  )
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

On Thu, Jul 15, 2021 at 8:23 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> Add error handle while component_add fail.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
> It don't have the error handle when v1. it is not a fatal error.
> thus don't add fix tags.
> ---
>  drivers/memory/mtk-smi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 6f8e582bace5..e68cbb51dd12 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -330,7 +330,15 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>
>         pm_runtime_enable(dev);
>         platform_set_drvdata(pdev, larb);
> -       return component_add(dev, &mtk_smi_larb_component_ops);
> +       ret = component_add(dev, &mtk_smi_larb_component_ops);
> +       if (ret)
> +               goto err_pm_disable;
> +       return 0;
> +
> +err_pm_disable:
> +       pm_runtime_disable(dev);
> +       device_link_remove(dev, larb->smi_common_dev);
> +       return ret;
>  }
>
>  static int mtk_smi_larb_remove(struct platform_device *pdev)
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
