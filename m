Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 06:14:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1C9460F92
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 06:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1C9460F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65TOQKDENzHh+m/GTGDAlkcre3/VEyv4xuuiOZMJbkQ=; b=kqpLKDb+tp/hk3
	vL/13cooGMTc2vgDpLqtysnlzkPKloqPfE0wIfr+IZK2IpYtjLWwW27DdWwghIeVev4QwKqzn0JuN
	chml7jTL/qxNXmkutGh4PJMeI+nLAdyvurIgRH4+BzmueeHeTTbGyxYWqw1GO5jmAt13Gt2B+/yI7
	Sqa+Tyw8P3isMb3nWDm3zptNbF/DAzNu5VxsNMGt/ELyb4ep8kVikrHv/5s4aJdZiesi/tF3/N+fL
	zotSJ1tTCDU/y9yMLgt42XA3iKsih4/saZrk5wz3x09o5CdNSeO5QtRFleuR4YSEZOQmoe6TrvYFD
	7pc8f/+dZ4errounCWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfyg2-006yEh-96; Thu, 28 Oct 2021 06:14:14 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfyfy-006yDs-Qv
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 06:14:13 +0000
Received: by mail-io1-xd34.google.com with SMTP id n67so6644830iod.9
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/CaYgRMivi6E5IrdJQN3VhID0wrYip2MBmQLj5bzn8=;
 b=Aq2N80QZqWuk5rhmqD7SlSuHwXw7X5Xj9MYYbX+VkHfnnnJufBOqYb9gJF4OaEiYOR
 JuqCgXZnsw56MasCxD1UCPwBEADYf4FTAWs1ucK/j7eyDg4KLsC9VDX8pUg2LrTvIBMu
 LluBL6cpWjDIFC5cHIlQBEAbj2544NrYdVLsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/CaYgRMivi6E5IrdJQN3VhID0wrYip2MBmQLj5bzn8=;
 b=awg29cTseb+KVf9X++N2Jpk3dmYdqLG/Dxp2KGZ1WVEbvPHSvoC9a5UGoPOi3M0nS5
 pgbhdjtR5Q6A3L5Nr8D0LmzFvbSgjehVuhPgTAj334821ANJSfYNoLzkZd2nHQVAPHPb
 qKAjjKBtUjKJ96xK3A5WG8RNh9PfwCQyw6ZoIUdiBmIZGxX/AD+fT3/tKAroSS+vMbqi
 L3T/lovxDTUz3+4d8hrl7hrcLOQhJX22d9K6DfA6Fpx5AhU2js62Gz6Lmns7u70O5EW2
 y1d9VRCh3G/slKJi3kD5fzNb2f16A/T66qhYS9cPF9BtbR3ibCNc02LLL1Z1jePYkqlX
 DHDw==
X-Gm-Message-State: AOAM530HHInLGMpyqCV/vcaSwmyvudpn97ZkGcXbrbo++AhewRLQxwjQ
 EOKMqRpIUJT91teMHzoXxkm+R2pn0U2JiiEtSwfTeg==
X-Google-Smtp-Source: ABdhPJzC5EHSvYTWsmMZor72KBYkv+zsEBX+bmiCWVqdyiTSd1OU5sPmnEltvdTsr6xsiuVNtLUjnZF8GSWmTewNAHQ=
X-Received: by 2002:a02:954d:: with SMTP id y71mr1680582jah.83.1635401649146; 
 Wed, 27 Oct 2021 23:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211028055056.26378-1-yong.wu@mediatek.com>
In-Reply-To: <20211028055056.26378-1-yong.wu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Oct 2021 14:13:43 +0800
Message-ID: <CAJMQK-jCuH-EKd1snhtrkFEz0bFN1t8EvsF3Kjua-HVFa_3J9A@mail.gmail.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix a null dereference for the ostd
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, 
 anan.sun@mediatek.com, yi.kuo@mediatek.com, anthony.huang@mediatek.com, 
 Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_231410_917177_0A6C6226 
X-CRM114-Status: GOOD (  24.67  )
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

On Thu, Oct 28, 2021 at 1:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> We add the ostd setting for mt8195. It introduces a abort for the
> previous SoC which doesn't have ostd setting. This is the log:
>
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000080
> ...
> pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> lr : mtk_smi_larb_resume+0x54/0x98
> ...
> Call trace:
>  mtk_smi_larb_config_port_gen2_general+0x64/0x130
>  pm_generic_runtime_resume+0x2c/0x48
>  __genpd_runtime_resume+0x30/0xa8
>  genpd_runtime_resume+0x94/0x2c8
>  __rpm_callback+0x44/0x150
>  rpm_callback+0x6c/0x78
>  rpm_resume+0x310/0x558
>  __pm_runtime_resume+0x3c/0x88
>
> In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
> if "larb->larb_gen->ostd" is null, the "larbostd" is the offset, it is
> also a valid value, thus, use the larb->larb_gen->ostd as the condition
> inside the "for" loop.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

After applying this patch, mt8183 is no longer crashing.

> ---
> Hi Krzysztof,
> Could you help review and conside this as a fix for the mt8195 patchset?
> The mt8195 patchset are not in mainline, thus, I don't know its sha-id,
> and don't add Fixes tag.
> Thanks
> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..0262a59a2d6e 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -257,7 +257,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
>         if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SW_FLAG))
>                 writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base + SMI_LARB_SW_FLAG);
>
> -       for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
> +       for (i = 0; i < SMI_LARB_PORT_NR_MAX && larb->larb_gen->ostd && !!larbostd[i]; i++)
>                 writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
>
>         for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> --
> 2.18.0
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
