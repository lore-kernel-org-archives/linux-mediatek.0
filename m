Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 01:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A9D061179
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 01:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A9D061179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZMWDXENFtSnUjELuLZ11Vkp+iOTSb5aJF1rbQX4it4=; b=Q2uk3VEsZcYh2K
	HPWOigVO3A/XjOAQuMFVNVkfIpY/xhzx8d4Yb1y9m48h+z72vjKf30NmW3NWtbwA686XY9fRkNMfV
	EJgLbjdhvGqtnPNefeOSXZ7udGcMbO1qublKHAwqr22bw7Z0qVyReJMEBRymzqeIbSM4K/CdN3w+m
	7NsAGw+fEd4B6LhSDJtw9hqUzPMEmW9kv7+wUP2gS7LQ911rQ1lw8zcMIl3U4+GyY1A5tD9p19L5a
	658Iyk9iR+VqZVKkd4CuAAcFxlCSsaHA6guQfTULn44jGEELUSgw0gO/OVBiMv8sgJIq0zuN89yrX
	1bt5tu4y/vjAUJW4zLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcHHD-00DcLb-FT; Mon, 18 Oct 2021 01:17:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcHH6-00DcJR-My
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 01:17:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id i20so63310705edj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 17 Oct 2021 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnqEn1CtLr/NiyhAgmO/8MRbeaoY3H6FysR0WE07eMI=;
 b=CAzzpQc8d6pvPmR8WujIwnG/8mp9OOfW/GJEz0cHJFQGuE8vZAdGMpq7oD2rT8f2jD
 el8GQzh6RWyx9yp8C3agLrBlGNRm/6mrCWeM085GlIU6LOuzzZIXL67R2Ocri5EBx/kW
 jaf4Qk9+6r5KuIqpO7H/L3MXKgoxk+ZJQs65w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnqEn1CtLr/NiyhAgmO/8MRbeaoY3H6FysR0WE07eMI=;
 b=xzfD1CeV+J04uKvk6B+5j3VWuwOHFpo9HHLAXxOGbROp1BHlYMGSWIle0HqgUScAGa
 i5q2J9Tg7Q5r0c/zGPXR95i+yrx9ZMvAO8HzwoFpb0cYVJYhBWn+03kpC29sQAfaMT+D
 R9s6YnxFOUNAxGWfwOVK7TCvzuqr+8SrUKFhtJ5PU34/v9Ktert6Nf4YkT5ovsEBd7d8
 Lah6TUOc/Lje5W4SdYnO15YtIYD9HAd1GrnWsUnOe7LTSVOM7FFP+bQ6PWuuqDNELAl5
 pFWf6QX0qK39gLoqcF9n9K3Kle49ZdM8p1/kKRYhQ9AwIhFmj/Tlx6o0nynLe0s3R4Ue
 82iA==
X-Gm-Message-State: AOAM53050oNfUHgEN6dZDkMrLaalN3YSwEyI6FBh4WgwPM6HMM6MT1RF
 m88a0vJzQQlg85gvVZyZCxyV9Pr2UaOv/w==
X-Google-Smtp-Source: ABdhPJzBbBP+gfNLIecdqlKZMX/M3decmZS7bxsZin36LraytTcM4lm3UrIv99tL+HuJzfWcGX1V/g==
X-Received: by 2002:a17:906:27cb:: with SMTP id
 k11mr25416066ejc.140.1634519827537; 
 Sun, 17 Oct 2021 18:17:07 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47])
 by smtp.gmail.com with ESMTPSA id jg21sm4896605ejc.14.2021.10.17.18.17.05
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 18:17:06 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id d3so64007720edp.3
 for <linux-mediatek@lists.infradead.org>; Sun, 17 Oct 2021 18:17:05 -0700 (PDT)
X-Received: by 2002:a17:906:912:: with SMTP id
 i18mr25269308ejd.131.1634519824911; 
 Sun, 17 Oct 2021 18:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
In-Reply-To: <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 18 Oct 2021 10:16:54 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
Message-ID: <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 kernel@collabora.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Dafna Hirschfeld <dafna3@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, minghsiu.tsai@mediatek.com, 
 houlong.wei@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_181712_762336_EBFA3303 
X-CRM114-Status: GOOD (  29.97  )
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

Hi Hans!

On Mon, Oct 4, 2021 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 20/09/2021 19:04, Dafna Hirschfeld wrote:
> > From: Alexandre Courbot <acourbot@chromium.org>
> >
> > When running memcpy_toio:
> > memcpy_toio(send_obj->share_buf, buf, len);
> > it was found that errors appear if len is not a multiple of 8:
> >
> > [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>
> Why do errors appear? Is that due to a HW bug? Some other reason?

MTK folks would be the best placed to answer this, but since the
failure is reported by the firmware I'd suspect either a firmware or
hardware limitation.

>
> >
> > This patch ensures the copy of a multiple of 8 size by calling
> > round_up(len, 8) when copying
> >
> > Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> > ---
> > changes since v3:
> > 1. multile -> multiple
> > 2. add inline doc
> >
> > changes since v2:
> > 1. do the extra copy only if len is not multiple of 8
> >
> > changes since v1:
> > 1. change sign-off-by tags
> > 2. change values to memset
> >
> >  drivers/media/platform/mtk-vpu/mtk_vpu.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > index ec290dde59cf..1df031716c8f 100644
> > --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device *pdev,
> >               }
> >       } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
> >
> > -     memcpy_toio(send_obj->share_buf, buf, len);
> > +     /*
> > +      * when copying data to the vpu hardware, the memcpy_toio operation must copy
> > +      * a multiple of 8. Otherwise the processing fails
>
> Same here: it needs to explain why the processing fails.
>
> > +      */
> > +     if (len % 8 != 0) {
> > +             unsigned char data[SHARE_BUF_SIZE];
>
> Wouldn't it be more robust if you say:
>
>                 unsigned char data[sizeof(send_obj->share_buf)];

Definitely yes.

>
> I also think that the SHARE_BUF_SIZE define needs a comment stating that it must be a
> multiple of 8, otherwise unexpected things can happen.
>
> You also noticed that the current SHARE_BUF_SIZE define is too low, but I saw
> no patch correcting this. Shouldn't that be fixed as well?

AFAICT the firmware expects this exact size on its end, so I don't
believe it can be changed that easily. But maybe someone from MTK can
prove me wrong.

Cheers,
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
