Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABA9C636CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 12:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE9161263
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 12:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE9161263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQb4CPHXOMzzbSK1IHxcL+VctVqHYRKcgaD6jPDwKBY=; b=zDcHjzNqiTMLf9
	eWGGKKWF+BM4i3ZjFr4Y1sAX9G9hQknQwm3OtPrqjeeiAb1Vkbgm5D+g0SF+gYbgdB+VIx3+4br/c
	B+H5HUQiBjEgviTJI/moMOpzcRNHIT3yQdO5CDacs8pj9KGdB6U5UIU+I/KaiAopYXpdlzYUvJ/Cq
	/WBwhi0UKIp21gwpZ+AimC3bf5Jw2DMjU5iFjHjPAQo4NX+Xu+/w6yF2P7Hplp2WJMN2cqu149Mxm
	oAJUBsby9qQ2wdeJBW+1Q6WepTF/P1n0sw4ALen5deNMNiDGCKw7MHjDoSpzb1rYFGPGCN2Fhv2+X
	3neorUOG+25ipptmkXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6BVq-00Fe0A-8Y; Wed, 21 Jul 2021 12:39:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6BVn-00FdzX-J1
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 12:39:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id p17so870483plf.12
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QEkEthW7CKgy/or0VKIC3NeiSwizxj3OuVxfIG0VkUM=;
 b=HSwP1Zll/dPKdP3vrbbcEcVkhx/jcMPX3H7ajHXoSwKOPW+SuuBbZWuMjK5d0IvNt6
 bUWR+IarJUShSq8/4Y4ZqPCNqV+Nb9C/YIRUJqW2jpOs8ycmClELT6yzWkawxONQWZYG
 NDq/jPElYJ19nDgdHBtVsnlcLc+P6LA8juEuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QEkEthW7CKgy/or0VKIC3NeiSwizxj3OuVxfIG0VkUM=;
 b=MXpGcHEfLCIwuEuQk6T5G8Du/zcWlYD5IR4XjtrTQgH9zA8BIc3m3XMZ5Sq5qTrD+q
 zGKdTlKtnNxYmUAu1bUqMpv1K5g0CkSjIRMxlmxDNb465rh1fQjMzhQ95N0pDi4QReZk
 QNcfvgtrUPyzHM3iDWFzNVehibWGy9dw4uSI1spwOHfgY2lRw3GxYeo7poBg/MJ/6VBc
 H4oMZbhNeK9bjURMImGKHLx02waxf8f/HJEkPmQYepDKBAF/uwmdzZrab/x7/YfOhTOj
 r9QXtqfXfV0xJ/Yw+yuwXUbw95mFkader5p3xMg0n78A4CdVblJ4eh4Z95x0JgIhfN2K
 qYAA==
X-Gm-Message-State: AOAM5332YWFVAP/BM2dQTv0x4GK76smy/2nPVi7dfYom8j7SUkpPcrP9
 L07p+HaBY0TbqdxITUxlv8ssNrQkaWsc3XZ/mvrdtg==
X-Google-Smtp-Source: ABdhPJyTnNfx5pORTNjVkzxDDgtUXvJakKiVASRPKj5kfSEKa5DHdCM0Rau3Ti5Cohe2pje9E1RCRyGbz9nE8qdnWDg=
X-Received: by 2002:a17:903:22d0:b029:12b:1215:5e73 with SMTP id
 y16-20020a17090322d0b029012b12155e73mr27536794plg.60.1626871181882; Wed, 21
 Jul 2021 05:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-10-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-10-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 20:39:31 +0800
Message-ID: <CAATdQgCwWDp9D-aFHNGVvOuojJeYH=yAq+tce4vUbQ=kiYa59w@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] memory: mtk-smi: mt8195: Add smi support
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
X-CRM114-CacheID: sfid-20210721_053943_690526_44854FAC 
X-CRM114-Status: GOOD (  18.81  )
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

On Thu, Jul 15, 2021 at 8:22 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> MT8195 has two smi-common, their IP are the same. Only the larbs that
> connect with the smi-common are different. thus the bus_sel are different
> for the two smi-common.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/memory/mtk-smi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index e5a34b3952a0..3c288716a378 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -250,6 +250,10 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
>         .config_port                = mtk_smi_larb_config_port_gen2_general,
>  };
>
> +static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
> +       .config_port                = mtk_smi_larb_config_port_gen2_general,
> +};
> +
>  static const struct of_device_id mtk_smi_larb_of_ids[] = {
>         {.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
>         {.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
> @@ -258,6 +262,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
>         {.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
>         {.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
>         {.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
> +       {.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
>         {}
>  };
>
> @@ -430,6 +435,21 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
>                     F_MMU1_LARB(6),
>  };
>
> +static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vdo = {
> +       .type     = MTK_SMI_GEN2,
> +       .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
> +                   F_MMU1_LARB(7),
> +};
> +
> +static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vpp = {
> +       .type     = MTK_SMI_GEN2,
> +       .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
> +};
> +
> +static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
> +       .type     = MTK_SMI_GEN2_SUB_COMM,
> +};
> +
>  static const struct of_device_id mtk_smi_common_of_ids[] = {
>         {.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
>         {.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
> @@ -438,6 +458,9 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
>         {.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
>         {.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
>         {.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
> +       {.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
> +       {.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
> +       {.compatible = "mediatek,mt8195-smi-sub-common", .data = &mtk_smi_sub_common_mt8195},
>         {}
>  };
>
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
