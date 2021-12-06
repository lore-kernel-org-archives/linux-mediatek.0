Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoE74qo+zpl5lMjlldbx6CZc9Pwi8BjGAbsqzQ0NBnk=; b=FKKq3iZY9EpMzm
	LxQdKLNaZZPCSxlkYsg3RnnJiFTMyKOoj3OKb8xhDsP7tX/h5lMV5q0Kt0hYugmOVW8VoJIH/+vak
	GUXrw3vrnC28Md+/6H/KU8mJ5XfulJsGklYyiCfatKJ1dwE9AU1GjOIg+KbcVLGfvbMV6/uBjIIhD
	T0B5ncpPjmYjVRe/zU3XfyS0AthnXVIhiC15315djbodp+IIThSlGD1qFOhgME3uPbPwauc9gRhx9
	PbHRaZ5GUJoa/+z6ZRU8xYOLTgNz9R4GdIbWYnIqTphnUNlVEL1o7d7uKm4Miqmvz+//BXco2OOdg
	8shPKTh6DzctD416sOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu8Lh-002l2Z-Vg; Mon, 06 Dec 2021 07:23:45 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu8Le-002l1d-6N
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 07:23:43 +0000
Received: by mail-ua1-x92c.google.com with SMTP id p2so17703182uad.11
 for <linux-mediatek@lists.infradead.org>; Sun, 05 Dec 2021 23:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVXIT3QBReTAXMWK2JBRHaKSQvnCkPugoBOMsNBKysg=;
 b=maqLUi5cEmc99xwy3nFbbYAYdHLt75CoLJ0K9WVYMH3Zv6pm7qtoNUklMqOQdvlUbg
 KFavq8DcElKOxy3YRuj+2DUuBN8X7Zj6XwDTHUph2GVpZAvRrxFhD+j8SttjdkpQ+kMy
 BJpE+4wFU/RAIXFGz7Ne4gWhtocENWmibWVHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVXIT3QBReTAXMWK2JBRHaKSQvnCkPugoBOMsNBKysg=;
 b=66W0X+qr+379mPTV4deoxen3/Di1UWrfcs349RHwccExjeAz+ki9IISCbnu0q55dgo
 C1c70o1Qsw52VDhlHEd8fQUxpVA6KCJipD/bi2ZjNn8Dn/ErJ0yWII3WpqD4B0liEGMd
 fIEXKxreT1IjoEpIyxXpEoaDl89gxg3iN7tJFmSE08kDdbeRFUVFoWRdTMcIzwOVTxF3
 uxqD9EOkSbY7srkcBtbf9/KBvtVyvsi3ZmB3jciuVCJpBlxrZ99NfJf1bibtq5YpGgkE
 ovGmLOqB3lUR0ep4uCqn8MzZMsGopFu8TIrE6Q+GDZt48FYeATsPwBGLm6jX3DdUawLo
 JFsQ==
X-Gm-Message-State: AOAM530gOosh/n4xs0IXYs0VlxKlgJsBdvIuV4jzjpdv+EZxuZq8UiNS
 JnJATqpyehGAe+cyNHGKlv5BhD0jPUQ+Nw==
X-Google-Smtp-Source: ABdhPJwJxZtYvbtn//oYgDs/wesTiF1Y8lzXlSWsX0Sjt5ybhzOPGCeQqiL5q5Pn98bjNfOKdKV6XQ==
X-Received: by 2002:a05:6102:304d:: with SMTP id
 w13mr34711167vsa.81.1638775418169; 
 Sun, 05 Dec 2021 23:23:38 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id j126sm3512371vsc.17.2021.12.05.23.23.37
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 23:23:37 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id w23so17728016uao.5
 for <linux-mediatek@lists.infradead.org>; Sun, 05 Dec 2021 23:23:37 -0800 (PST)
X-Received: by 2002:a67:ef4b:: with SMTP id k11mr34003840vsr.74.1638775416913; 
 Sun, 05 Dec 2021 23:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
 <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
 <1d509eea-37ef-bfd1-cfe7-0a204d8c4bd4@collabora.com>
In-Reply-To: <1d509eea-37ef-bfd1-cfe7-0a204d8c4bd4@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 6 Dec 2021 16:23:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MU6KvhwXa=dx+8P1a5gYt4P6W3A2EbfC+6dYfDNSKvATQ@mail.gmail.com>
Message-ID: <CAPBb6MU6KvhwXa=dx+8P1a5gYt4P6W3A2EbfC+6dYfDNSKvATQ@mail.gmail.com>
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 kernel@collabora.com, Dafna Hirschfeld <dafna3@gmail.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_232342_302695_938255C4 
X-CRM114-Status: GOOD (  27.60  )
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

On Mon, Nov 29, 2021 at 11:39 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 18.10.21 04:16, Alexandre Courbot wrote:
> > Hi Hans!
> >
> > On Mon, Oct 4, 2021 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 20/09/2021 19:04, Dafna Hirschfeld wrote:
> >>> From: Alexandre Courbot <acourbot@chromium.org>
> >>>
> >>> When running memcpy_toio:
> >>> memcpy_toio(send_obj->share_buf, buf, len);
> >>> it was found that errors appear if len is not a multiple of 8:
> >>>
> >>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> >>
> >> Why do errors appear? Is that due to a HW bug? Some other reason?
> >
> > MTK folks would be the best placed to answer this, but since the
> > failure is reported by the firmware I'd suspect either a firmware or
> > hardware limitation.
> >
> >>
> >>>
> >>> This patch ensures the copy of a multiple of 8 size by calling
> >>> round_up(len, 8) when copying
> >>>
> >>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> >>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> >>> ---
> >>> changes since v3:
> >>> 1. multile -> multiple
> >>> 2. add inline doc
> >>>
> >>> changes since v2:
> >>> 1. do the extra copy only if len is not multiple of 8
> >>>
> >>> changes since v1:
> >>> 1. change sign-off-by tags
> >>> 2. change values to memset
> >>>
> >>>   drivers/media/platform/mtk-vpu/mtk_vpu.c | 15 ++++++++++++++-
> >>>   1 file changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> >>> index ec290dde59cf..1df031716c8f 100644
> >>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> >>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> >>> @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device *pdev,
> >>>                }
> >>>        } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
> >>>
> >>> -     memcpy_toio(send_obj->share_buf, buf, len);
> >>> +     /*
> >>> +      * when copying data to the vpu hardware, the memcpy_toio operation must copy
> >>> +      * a multiple of 8. Otherwise the processing fails
> >>
> >> Same here: it needs to explain why the processing fails.
> >>
> >>> +      */
> >>> +     if (len % 8 != 0) {
> >>> +             unsigned char data[SHARE_BUF_SIZE];
> >>
> >> Wouldn't it be more robust if you say:
> >>
> >>                  unsigned char data[sizeof(send_obj->share_buf)];
> >
> > Definitely yes.
>
> won't it actually be better to implement it like this:
> (assuming len is always multiply of 4 - which I think it must be since access must be 4 aligned)
>
>         void __iomem *to = obj->share_buf;
>
>          if (len % 8 != 0) {
>                  memcpy_toio(to, buf, len - 4);
>                  to += len - 4;
>                  buf += len - 4;
>                  writel_relaxed(*(u32 *)buf, to);
>          } else {
>                  memcpy_toio(obj->share_buf, buf, len);
>          }

Not sure if avoiding that stack allocation is worth the extra
complexity and requirement for len being a multiple of 4. Also I'd
like to test it on real hardware to confirm it is indeed ok.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
