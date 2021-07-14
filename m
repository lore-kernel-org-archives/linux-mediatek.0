Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4293BC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 14:04:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C4A96024A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 14:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C4A96024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEHFIN0weydTubvrOrlEceNlKtT9lHD0KvZc45RveqM=; b=YaW3LdpHSmKgtt
	wgqp6nAVmjRIWCJmS6eQXyUhF/GuoGZfPhBX5u1S2cq2tVHnt2nV7ZP0pDqBVyEb996hlGXHPSli6
	VdanLve5cur6TcIeAzUJLuWekORjWeL5BY70mXdAyoetgU5175tvEzdX0ANYuM2NXXYe0Bu3AhxsC
	CWA2pxF8+JW63xaBFNGbJ+iawZO7TjWNnkwxljwuYHh57RysXbisv2IJlnkbBge4iiNTGpDZJPDU3
	O9OzDXRdcfhtfdCKDbox5jY9w0YBZX3gHpWpVZpM1cmm7OvT+ft8jXqQA3mKRgFtjS+Dv6fbZT/af
	ISXrpvpc7lkTB2jM9c5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fUk-00DnS3-Ea; Wed, 14 Jul 2021 14:04:14 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fUg-00DnPH-Dh
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 14:04:12 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so2546987otp.8
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZziUwL+M2w730ClvqNdJYiu4SC1wJywplU+5JkQfL4=;
 b=HlzOW3cQoA1QoGQZjHbgn4ILjfXFrLzvqmIt2lPaPUucIfYdqUPlzurKfsFEWaeG0H
 5+EfyyfbF1PZPN1SXhX2h94Fre9jQLh4UZC1COm4Gg/EIifu5dB6qKDvODtH4QFB6SOi
 /+l6LPYDm279wnuPv+2XbzoMWRDNkX6IAQZUBQXf5ORWaQV763j3INsNArSLeF+dNgpK
 hq5a0NMqkNlmsIu0eLhPYCp5l/23V+iheToBy2PZWVhz0Bx8JlmLUbXL397vxfrg/L5W
 YoxurOaFc2pUTaV5gtiVGW4xFIs4aYy3LJ2DSLi9dMvQXsWeWG45voxcG8ryAymW27cA
 ZIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZziUwL+M2w730ClvqNdJYiu4SC1wJywplU+5JkQfL4=;
 b=HG/PZ1nH2WUtOxCc7sLALgaWFTh+8epKpx9uEqBTy/FrvuOcT+tskalvhUvMOtnyq+
 ++VhJRR6Nu6hpTLmF3qVebGU/xixeZvhQmKw/aZBMe2FR7AbuMb2S+agPAI8dIyqaC6S
 MznPw3cb1Qwu8P4/Aog9a2D1Bl57iqD1o9S1ia4QOHUynbzgo5p0zpStkvKsdjkAiMrH
 LOH4a0kORtCbKE6Fx4ox3FVJZALn2ep2tX2I5qYiiBGhUzJk0732CgJiFyW9Oo+R6oFL
 RFdTOP1A+nASQbRARBvrcW0CL5uLOnsSMwcTNBHVPswlXD5Ipgmb7kLYjp2JiOSmCk6G
 WClw==
X-Gm-Message-State: AOAM530QtBRzHfizGS/VhzwQXpq8uWN8646cGBazDKLPzFIfDZrGrNLM
 HvK1ieajOGxwx/zgSkwF9Yv/LmMjTegy0BHH/cI=
X-Google-Smtp-Source: ABdhPJyeowY6sKdOkSN1oqD0CTSf04bn/X5iMfBstx2S5hpuYx6gteWjVwa+Om6ZLAm/oHzITr9E8FsJ0sSOcw7R2qc=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr8483724otb.362.1626271448603; 
 Wed, 14 Jul 2021 07:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134850.402-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210714134850.402-1-dafna.hirschfeld@collabora.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 14 Jul 2021 16:03:56 +0200
Message-ID: <CAFqH_52s0qtPT5SE1BUQrsrwg1XB7hLSExeC-ER5nTggKaeeOA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alexandre Courbot <acourbot@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Eizan Miyamoto <eizan@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_070410_519185_273B5EA2 
X-CRM114-Status: GOOD (  27.00  )
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

Hi Dafna,

Thank you for working on this and sending the patch to upstream for
further discussion.

Missatge de Dafna Hirschfeld <dafna.hirschfeld@collabora.com> del dia
dc., 14 de jul. 2021 a les 15:49:
>
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>

Sorry to confuse you, but I'm not the author of this patch, my from is
only here because I shared with you that patch that I really picked
from a discussion that took place here:

  https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2251840

It'd be really nice to continue the discussion here and set a proper
fix and understand better the root cause and the fix. The patch really
fixes an issue in mainline for mtk-vcodec driver on the mt8173
devices, I can confirm that without it doesn't work properly.

Waiting for your thoughts,
  Enric

> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
>
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>
> This patch ensure copy of a multile of 8 size by calling
> round_up(len, 8) when copying
>
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Reported-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..b464d8192119 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
>  {
>         struct mtk_vpu *vpu = platform_get_drvdata(pdev);
>         struct share_obj __iomem *send_obj = vpu->send_buf;
> +       unsigned char data[SHARE_BUF_SIZE];
>         unsigned long timeout;
>         int ret = 0;
>
> @@ -349,7 +350,9 @@ int vpu_ipi_send(struct platform_device *pdev,
>                 }
>         } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>
> -       memcpy_toio(send_obj->share_buf, buf, len);
> +       memset(data, 0, sizeof(data));
> +       memcpy(data, buf, len);
> +       memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
>         writel(len, &send_obj->len);
>         writel(id, &send_obj->id);
>
> --
> 2.17.1
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
