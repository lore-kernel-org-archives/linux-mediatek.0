Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E0AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 11:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6AB60EC0
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 11:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C6AB60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pe+lT//Fzbm2Bh7fJOnssSmxCZ/Vakfmy9meHFqphBA=; b=yXYoeznXtqkpPl
	NoZ+T+tcw9ai62OrP2py3wfDgyqzmYvxXNz+2oGbudvkWKOQAxzi49mMiuUM7EH+qhe7XpOAH+bl6
	E0Zwu6JhDWWZWmMCl4IUgDCc+cP//AOKqfwmaYLL3ItObeJ+3kbJwKldWp7YWv0IgruVOTjBf43K/
	g41WaEcr5GtjtqQ9nrviIUQ2fiiC2ZkD5YhqpPcVw6R0nyWO41h4Wk/E0T0M/ct4AWRBQJ08QI+CF
	FITzGFcRk5ORQxalUJJXV+rgJo6SGGhW1hnFnOCm4XqQIUSBGenFqMEAQ8knPFbIzzHC0zo8FpyH3
	HRZAQ0bYV4ZBO03DBX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDPhl-003bl7-03; Tue, 10 Aug 2021 11:13:57 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDPhi-003bk4-W7
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 11:13:56 +0000
Received: by mail-il1-x134.google.com with SMTP id k3so14909586ilu.2
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BOsKHbtULAxcDrxqJDAJDBDyZVhdaKsxydikfZ2cCY=;
 b=le5jpsllsk89jd77pk7klxKwaq6DCVXUZMp+F4J1gkrQMl7VWJ3KdHkPJKe5ZHYwn/
 CT9ld8XxqTbGwtXkgXyRl8EcBOf8HkH4MdbUSlDcVGRHVC/W7ADwJGO1PsavEugYpE/8
 /0O4b7jsrK1uPXXzZinEVKxNoXGV9ueBzh/9yQFm/Pd7smQF94uIeRQuiBlTq4JKnkuk
 lIuLDajRa+ROeCNpYcpfHqgojtrRwjJy7I969VQz1M2UVAzmzlm/fVRmiyiPhXntysyQ
 HVD8lDG1XeS17nXUBZbSSjae0wACMIcGA2k7IztCfTy90GmfayCrXq/+M22hyJxUMcdH
 jkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BOsKHbtULAxcDrxqJDAJDBDyZVhdaKsxydikfZ2cCY=;
 b=ewqRVdCv1hluMHEGp2QtwKW1C+NDgMYK3mkaYXVh6xFQEPFvyE1uKC/PpcbSIB90A8
 6yM0A/HYDQt6VL9osGLlBccr2JQVHOWEdPRa6OQf7svBjBRQO6TJYyTlmcnrQe1p3WVf
 SkQHYpLZvCDzqOyHlBV+9pE+8axiDD14bcG35jgXIaNSn/iYhj4f8Nxpupe1oHvZurPu
 oEDjehsGUAhCMQP8+YkEglPbCq3r+HXdVlutJJDe8Zx1D/CbQu8IoUVMA6txFWCmy3pf
 7SRjgKHhFQpMEr5dvKiI/4Gbr5hxsMLslBQv15oJA0+uk64FaUjXjDx+uAwiGh7xWF/T
 HJ/g==
X-Gm-Message-State: AOAM5315IphBXa86PzRU0QwxLShE6IxAhGgiaw/Q8qcKg6mpYnzwuSh0
 5OPlg187V2p+yjuiqoICSJ7ZFLQpYdvg6VM56eR1sw==
X-Google-Smtp-Source: ABdhPJxwA6MFGfh+hxoslxEDaOewEk8gaU5fvpAXvmlLfB4gy5x9YiXntNg1S3GQ8DFLdtDoCFGkTnzrhz5SvoHeVsc=
X-Received: by 2002:a05:6e02:d03:: with SMTP id
 g3mr121789ilj.127.1628594033707; 
 Tue, 10 Aug 2021 04:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
 <20210810083047.16693-5-yunfei.dong@mediatek.com>
In-Reply-To: <20210810083047.16693-5-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 10 Aug 2021 19:13:42 +0800
Message-ID: <CA+Px+wUbDU8ZD_TOoWRGT2qXh1KS-jh_P6NUDdUA-GuO8CiFiw@mail.gmail.com>
Subject: Re: [PATCH v4, 04/15] media: mtk-vcodec: Use component framework to
 manage each hardware information
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
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_041355_079185_9D56B5CA 
X-CRM114-Status: GOOD (  18.99  )
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

On Tue, Aug 10, 2021 at 04:30:36PM +0800, Yunfei Dong wrote:
>   > Looking up "mediatek,mtk-vcodec-core" to determine if it uses component framwork sounds like...
>   Add prameter in pdata, for all platform will use compoent after mt8183
>
>   >> +     if (dev->is_comp_supported) {
>   >> +             ret = mtk_vcodec_init_master(dev);
>   >> +             if (ret < 0)
>   >> +                     goto err_component_match;
>   >> +     } else {
>   >> +             platform_set_drvdata(pdev, dev);
>   >> +     }
>   > + Has asked the same question in [1].  Why it removes the
>   > +platform_set_drvdata() above?  mtk_vcodec_init_master() also calls platform_set_drvdata().
>   Must call component_master_add_with_match after platform_set_drvdata for component architecture.
I am confused.  The condition "call component_master_add_with_match
after platform_set_drvdata" is already true even if without the
change.  See below.

> +static int mtk_vcodec_init_master(struct mtk_vcodec_dev *dev)
> +{
> +     struct platform_device *pdev = dev->plat_dev;
> +     struct component_match *match;
> +     int ret;
> +
> +     match = mtk_vcodec_match_add(dev);
> +     if (IS_ERR_OR_NULL(match))
> +             return -EINVAL;
> +
> +     platform_set_drvdata(pdev, dev);
> +     ret = component_master_add_with_match(&pdev->dev, &mtk_vdec_ops, match);
Point [1].

> @@ -311,7 +413,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>               MTK_VCODEC_DEC_NAME);
>       video_set_drvdata(vfd_dec, dev);
>       dev->vfd_dec = vfd_dec;
> -     platform_set_drvdata(pdev, dev);
Point [2].

> @@ -362,8 +463,16 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>       mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
>               vfd_dec->num);
>
> -     return 0;
> +     if (dev->vdec_pdata->is_comp_supported) {
> +             ret = mtk_vcodec_init_master(dev);
Point [3].


The calling sequence is: [2] -> component_master_add_with_match() -> [1] -> [3].

Don't understand why it removes the platform_set_drvdata() at point [2].

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
