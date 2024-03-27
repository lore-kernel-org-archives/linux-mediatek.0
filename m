Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CBDC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJVdvG34sYvSwO7/0JAW7k6N5gwqE3CVqrECWM0Q/jk=; b=DrUhxLQ1lWmj7XsdC9FNgMEm0C
	XB0R4UEF/fpeibdek2dqqc9PB7SQw+TZomAeCz0RTLYWA9mMSlMWwQGamgL7/2HFszF8BmTzW54ns
	DbybvJg+ptfk37k5x7yQ1cRDRi87Ab7HfWU2LbvdvVHzadapcBzK/ndTUtfCvent8KJHEs4C80bV4
	6w5U/g9D89AbLswwG1F9/llZ+kCChvj33bAzWpzpGGa7yYVTQXD2zm/zvYtOEEoeZ+uEOH7UGnIsR
	3z1m7jzK7LIGE6GqdiAwyiPbDbzsJSNWn5Yx7HqIfkvoAXUdHJrDzAn+n0pFWEpB0aA57+EO2Ofa+
	gzvtFLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPQx-00000008CiO-2obj;
	Wed, 27 Mar 2024 09:18:59 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPQu-00000008Ch2-32AP
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 09:18:58 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7e05d68723dso1783265241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711531132; x=1712135932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJVdvG34sYvSwO7/0JAW7k6N5gwqE3CVqrECWM0Q/jk=;
        b=lNIArS90WKPXXOE01rwlIcDkghEmnNj5SUwA8fEBwkLsHuqeRBrUscqqFlSO00BM4E
         qLWhwo3vdTSkFv+yKbL74rpeb5+JKK8pNhEbshzO5ArXLiWOgGshVBVN5cWr4ApXveZh
         eF7fdDZYj2pPTz6GZqAXrhPKSiO9A4SMuqM5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711531132; x=1712135932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJVdvG34sYvSwO7/0JAW7k6N5gwqE3CVqrECWM0Q/jk=;
        b=p3tuigGf9zJO7CtxrFxBdCyR75f5uL+NsflcVUKzwso4JK7aKPCF/TredgRBC+gxHp
         S3LZmJ5zV5R+WM6TzrUTu0C7Q3WeOYPQbHrFUcVF7FJUhi5VGJLlM7vtML591bDzYbJH
         xbCjyKyIHfzxXkveXKA9FKd+G0ZnXfuu6Y7asp0kIwdWgi+eCi7WmXjSQu5RuCZb2CZV
         8FUlXpbtob2PzAfa1nd6tbiyt15++T1UP3zNaQ1jmrq8sdCsfvFU0FtDmAdd0+i2/MfL
         hDgIqm6y3jGYOqOgszoABJ5UhUJmjM5uc0ELORiUU6qUT64PAjIBVZjm0PXrOoHf6gFQ
         7IKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtx1YTr7PnymfCmXW3WgztKEqr8KYf5pypP+EXHPUjn4/6s6aeeI8h7mwGdwxo4uIDoF6uqsuGKwQpiox0gtOf1QNouU4tuO3qrLS4aKBCI71S
X-Gm-Message-State: AOJu0YwVkUosnkfPbDWHeI+hm5BUSdNAqMd2orNH7Wqm8LhO+eMLCulI
	6cpgRTYO96GloyV6hF40I7FdGOxQ+awYk5mYPSUF7XMiQIPU4+gstz6PVF8Jj+sjY/stcPbYakk
	=
X-Google-Smtp-Source: AGHT+IEvkFwPR2XfIYLG3S9sx+tjZWSG4uVwCnMQI4BEC2c9DF+VSBMS9Dz8PYb1hYLXnZG8eIgGJg==
X-Received: by 2002:a05:6122:308c:b0:4d4:1cca:1a72 with SMTP id cd12-20020a056122308c00b004d41cca1a72mr2163962vkb.6.1711531132309;
        Wed, 27 Mar 2024 02:18:52 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id c3-20020ac5ca03000000b004c788a8b71asm1389833vkm.13.2024.03.27.02.18.50
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 02:18:51 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7e05d68723dso1783259241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXU39IbvHq0B/R9x72xOoXlLG9Ig9tRpijDHhxvpGRU0M2E7mHhjFBHdA4Y7jvDAsfRs+G0af0+CvzsAqVNo1Z851nZ9T1Jc+14NBgBHCQ7ZhDz
X-Received: by 2002:a05:6102:93:b0:476:d5c5:4335 with SMTP id
 t19-20020a056102009300b00476d5c54335mr2177798vsp.14.1711531130263; Wed, 27
 Mar 2024 02:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231221092226.1395427-1-fshao@chromium.org>
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Mar 2024 17:18:12 +0800
X-Gmail-Original-Message-ID: <CAC=S1njAtbvjy1KBoVNtsw8WDKL1Zoh76mG3HvcUaOUBprEMkQ@mail.gmail.com>
Message-ID: <CAC=S1njAtbvjy1KBoVNtsw8WDKL1Zoh76mG3HvcUaOUBprEMkQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Improvement around mtk_vcodec_mem_free() logging
 and usage
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_021856_824842_D58014B7 
X-CRM114-Status: GOOD (  21.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 21, 2023 at 5:23=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi,
>
> This series includes some improvements around mtk_vcodec_mem_free() in
> mtk_vcodec_util.c.
>
> I noticed that mtk_vcodec_mem_free() generates a spurious error if the
> target DMA buffer has been freed previously:
>   mtk_vcodec_mem_free(),69: [MTK_V4L2][ERROR] 18000000.video-codec
>   dma_free size=3D0 failed!
>
> The warning is harmless, but it brings some confusion to our developers
> and testing infra, so I sent this series to fix that with some minor
> improvement for the driver alongside.
>
> The first two patches are for aesthetic and style improvements, the
> third tries to make the error logs more informative, and the last adds
> back the missing checks when calling the free function.
>
> Regards,
> Fei
>
> v1: https://lore.kernel.org/all/20231113123049.4117280-1-fshao@chromium.o=
rg/
>
> Changes in v2:
> - rebased on top of next-20231219
> - revise commit message for clearer intention and rationale
> - update the error messages based on the suggestion
>
> Fei Shao (4):
>   media: mediatek: vcodec: Replace dev_name in error string
>   media: mediatek: vcodec: Drop unnecessary variable
>   media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
>   media: mediatek: vcodec: Only free buffer VA that is not NULL
>
>  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 23 +++++++++----------
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 22 ++++++++++++------
>  .../vcodec/encoder/venc/venc_h264_if.c        |  5 ++--
>  3 files changed, 29 insertions(+), 21 deletions(-)

Hi Hans,

I'd like to get some attention for this series in case it has been
overlooked. It still applies to next-20240327 without conflict.
Please let me know if you have any feedback or concerns on this.

Thank you,
Fei
>
> --
> 2.43.0.472.g3155946c3a-goog
>

