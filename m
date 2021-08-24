Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7A3C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 07:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C4D610FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 07:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9C4D610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbNQ+5yxymN2vcUygS0BLP5mHEV0b2e4n38RNiOyzjE=; b=WRO99oZ2Y3AuFo
	vvab4FRu/BS0WtA4V0wt24x5Bt4nKmplOa71e1iI3taMSVZI9iyQDwZ5dpuGXqh/ihklR96z9MehM
	M22UcfuBc3/9mAFI0p/hLXvxiwsZsg+ZE4k3PrWzpxf9D0ZNayCCu335Ko/rsPBTHEFb7cSHqWf7o
	K2BXQQVlZE9aKGPStqZ4CJphiJnEHAp6nPBWm7u3ObRAYFHmU04mZ2HIjvnF06Z3nfg+jpemTKY20
	Ut8xV158nWkModCFSKtpp/Jo8UFyA7cmXC+/TZLoN8jrL7J+MHZi4XcNlc4x5gs/odT88RH2NeAP8
	TYNvfd4C6U0Gue0pPdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIQyf-0023lu-Hy; Tue, 24 Aug 2021 07:36:09 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIQyE-0023iZ-QD
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 07:35:47 +0000
Received: by mail-io1-xd2d.google.com with SMTP id f6so17605353iox.0
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdn/xtZAvZYiwKwxxhtoDSWZxutSGdv9Zf0EjwepvWk=;
 b=dFmqKGM4M8xwkez/7hO/m5icTM2376t5o0aNOCOsIxs5i4hiT5sr79kQdXWQq4TEDQ
 J/MeqGYzCjKUF5OToXwp6ZB4LNLWm37WAs1DA2MsvaACyMGlWLQz+RR81Uv9YdjMjoG2
 JqhbsZ+4S6XyrncPUOCD08O7+s+aOQbEB5RHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdn/xtZAvZYiwKwxxhtoDSWZxutSGdv9Zf0EjwepvWk=;
 b=Yx25pfXcUsGn44dYSCbIPMBrgOaKaJAwx0ucsRh+Wbbe7Xr7f7Jxy0tutcbAGWpp7M
 7pTwKxapThzp7uBMrJ8uLWuDvzd+KhLcRtUzSrbT8Nfy0C4HAolG5Ep/qrvqB6vbgVkc
 jM5sVWavHmlsxWH3F2boeFLNQzHwaux2/6kRc7hDNAm+vRCuXW6y9lsGI6xpCtQgbjPB
 zsNiHcjV5pjr47P7jzIv+3HfQLUN4PZir9Kv69idNuV5VOU+9j08WWpHobMyRzeXPvwY
 vhlHVWVvtMwA48dNdNppkDxfAHwngzWKbJUYRiIVtfzPiwFHFs3Oc9uVqLGpKUfj+8d1
 ZiaA==
X-Gm-Message-State: AOAM530PV1G5JYWVq8KeSjSC7MuVudDTAxQUG759cqQuc7FhFCAJl7HB
 YPHZ+7Ay9XM+8D1bNsamO1XIN1E2BNerIyN1PpGCEA==
X-Google-Smtp-Source: ABdhPJzCaKQQqFiKu2GYGl51DjDrCHWW0khxqU+TJuIKD2Qiaa6IC9r0Xva1qe+ermS6tmqpaGovvcP+MP7vZ5pGN64=
X-Received: by 2002:a6b:6319:: with SMTP id p25mr30729776iog.100.1629790531099; 
 Tue, 24 Aug 2021 00:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210813065324.29220-1-yong.wu@mediatek.com>
 <20210813065324.29220-17-yong.wu@mediatek.com>
In-Reply-To: <20210813065324.29220-17-yong.wu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 24 Aug 2021 15:35:05 +0800
Message-ID: <CAJMQK-ir-wLy4OHkWEWZf=CZcURMhRvHnOjBLWXaezhukJh2JA@mail.gmail.com>
Subject: Re: [PATCH v2 16/29] iommu/mediatek: Adjust device link when it is
 sub-common
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, 
 Tomasz Figa <tfiga@google.com>, Tomasz Figa <tfiga@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org, 
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 anan.sun@mediatek.com, chao.hao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_003542_901705_258578AC 
X-CRM114-Status: GOOD (  23.22  )
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

On Fri, Aug 13, 2021 at 3:03 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> For MM IOMMU, We always add device link between smi-common and IOMMU HW.
> In mt8195, we add smi-sub-common. Thus, if the node is sub-common, we still
> need find again to get smi-common, then do device link.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index a4479916ad33..a72241724adb 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -845,6 +845,17 @@ static int mtk_iommu_mm_dts_parse(struct device *dev,
>         if (!smicomm_node)
>                 return -EINVAL;
>
> +       /* Find smi-common again if this is smi-sub-common */
> +       if (of_property_read_bool(smicomm_node, "mediatek,smi_sub_common")) {
> +               of_node_put(smicomm_node); /* put the sub common */
> +
> +               smicomm_node = of_parse_phandle(smicomm_node, "mediatek,smi", 0);

This only checks 1 level here, and does not check if the mediatek,smi
of a sub-common node is not another sub-common node.
So maybe add a check that the updated node here doesn't have
mediatek,smi_sub_common property.

> +               if (!smicomm_node) {
> +                       dev_err(dev, "sub-comm has no common.\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
>         plarbdev = of_find_device_by_node(smicomm_node);
>         of_node_put(smicomm_node);
>         data->smicomm_dev = &plarbdev->dev;
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
