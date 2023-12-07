Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837A7C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtRAp/Zuzq7fGbpcbPcumzgHdraAjC7L39RpTXDHPvw=; b=OrSJseSE1Tfz3Fot+LSGlhr0H2
	QK3o4c9i1YCx/Ai0Sn7gN+DCzCAq87/nEr+FF9cHiJXZvTnHablSTAKpZn3JpN9dlgpoK1JqBT7yd
	MdSqLq5S2ywUbCoOXL+m+MvsMe6xfb4ZY1PfB/sIhq1eUMqAHbOrB/QJoWkVppduTTrYI5id2Cotq
	30WXaLtBNpkgHHLrpE4vLNn1PbSgyZMuIDBO9pRIyE/FYdvARwujHOHtN8r2igjQl7WSP0VeliQZE
	rPAC1lAFnW5E8AhwTWoQd2fpwypeVky2u1vAXD6ZjJ4MIiAzqN3DqIou0S5MKoInG5tHxIFvVuB/o
	o1CZw3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCOy-00Ca3h-1A;
	Thu, 07 Dec 2023 11:18:44 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCOv-00CZzF-0r
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 11:18:42 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4b2d64a368aso325765e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701947917; x=1702552717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtRAp/Zuzq7fGbpcbPcumzgHdraAjC7L39RpTXDHPvw=;
        b=h+YNijauItZ2slHNRd45xWbwP0s/dADAkxYrQY19WfSDKKj3j/HSNS/vdz5KBpUbcj
         mebq4AFnPR+vQNMb+kS/TQHtnP8sHvlz0lGXzHWgtnvzDTlsXGkeD7X2w96K09HaSxU2
         y9DbBTwd7+JcwesNzBZ9Z3ux58uP740jeVZMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947917; x=1702552717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtRAp/Zuzq7fGbpcbPcumzgHdraAjC7L39RpTXDHPvw=;
        b=Z/O94ivVmbxOKHjXP/g3XNWm+FZUOdjSkxCFEpn1kleD0CNB8QWjp+29QIvb7jY2jG
         VC9ryBHIX6uJQPYt95tnGnTLuwEpFAjPbr40DZuz2Ky+m5p9s4rZ55RymGmeuOEw1jZd
         szQZVJEcyRmutR7fqd+KPrWJRsxC4CqzLJbin6cSW9z1St3/LeguUvdQS4MRz2mKIoTL
         2uXAJ+C1pFP2hsavU6YxcYO9YObyF7gP6EjyZk1chv7xnMaZ7ISQwqYhWBx5drXJ91uU
         aFawdHHBoaAjJ4l9JoSrUusgyjU4fNA/OSloUZGTLxrE3kHFCVjBvFBEoDbNftKS4jW7
         ZP/A==
X-Gm-Message-State: AOJu0YzGYowjFjSTwNiDZun8KOB2v6updoVQFr4Wltv/fHEHqI1ogI51
	8dr7G3EQfMPs3FOOZ57t+lkfNxYAkR931ltEns0=
X-Google-Smtp-Source: AGHT+IFeJzexnEKMB7DWjzmSZcOoFnxPrJBfkiiYFZtVNUzMndrprJUCfTD3OzkBHzTblil89EIsXA==
X-Received: by 2002:a1f:6681:0:b0:4ab:ebf3:e518 with SMTP id a123-20020a1f6681000000b004abebf3e518mr1811768vkc.1.1701947916833;
        Thu, 07 Dec 2023 03:18:36 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id r15-20020ac5cb0f000000b004b2f352e740sm46383vkl.43.2023.12.07.03.18.35
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 03:18:35 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4b2ceee07e5so329185e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 03:18:35 -0800 (PST)
X-Received: by 2002:a1f:c401:0:b0:4b2:c554:ccfd with SMTP id
 u1-20020a1fc401000000b004b2c554ccfdmr1880286vkf.9.1701947914936; Thu, 07 Dec
 2023 03:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20231113123049.4117280-1-fshao@chromium.org> <20231113123049.4117280-4-fshao@chromium.org>
 <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com>
In-Reply-To: <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 7 Dec 2023 19:17:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhp3HoKGQr1UgKtZJ9SLMqvm-G_YZi9dEWWF3tj2d=OFQ@mail.gmail.com>
Message-ID: <CAC=S1nhp3HoKGQr1UgKtZJ9SLMqvm-G_YZi9dEWWF3tj2d=OFQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free()
 error log criteria
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_031841_305221_A96F12A6 
X-CRM114-Status: GOOD (  29.14  )
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

Hi Angelo,

On Wed, Dec 6, 2023 at 6:19=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/11/23 13:26, Fei Shao ha scritto:
> > mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer ha=
s
> > never been allocated or was freed properly in the previous call. That
> > makes log confusing.
> >
> > Update the error path to print log only when the caller attempts to fre=
e
> > nonzero-size buffer with VA being NULL, which indicates something indee=
d
> > went wrong.
> >
> > This brings another benefit that the callers no more need to check
> > mem->va explicitly to avoid the error, which can make the code more
> > compact and neat.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> I think that this error is supposed to catch two issues in one:
>   - We're called to free no memory (something that does make no sense),
>     this may happen for example when calling xxx_free() twice, and it
>     is a mistake that *must* be fixed;
When I made the change, I was thinking of kfree() that doesn't warn
against a NULL pointer.
I imagine mtk_vcodec_mem_free() calls with NULL VA and mem size 0
probably have the similar nuance (if the buffer exists, free it; never
mind otherwise), but I could have missed some important differences
specific to the MTK vcodec driver.

Looking at the mtk_vcodec_mem_free() usages, almost every one of those
checks VA beforehand, but nothing else - they don't warn or do
anything special when they encounter a NULL VA, and they should if
that's a concern.
Some even don't check at all (and I think that's why I ended up seeing
the errors mentioned in the cover letter). As for that, I think
there's nothing else we can fix except prepending "if (mem->va)".
So from all this, I feel perhaps we don't need to worry much about
those NULL VA, and we can further remove the checks (or at least move
it into mtk_vcodec_mem_free()) to trim the lines in the driver. That's
the reason for patch [4/4].

Not sure if that makes sense to you.

>   - We're failing to free memory for real (which you covered)
>
> ....that said, I think that if you want to clarify the error messages
> in this function, it should look something like this:
>
> if (!mem->va) {
>         mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func__);
>         if (mem->size)
>                 mtk_v4l2_err(plat_dev, "Failed to free %lu bytes", mem->s=
ize);
>         return;
> }
Sure, I can revise the patch with this, but I also want to make sure
if the NULL VA print needs to be an error.
If you still think it should, I guess I'll drop the current patch
[4/4] and instead add the check before every mtk_vcodec_mem_free()
calls. This should also work for the issue I want to address in the
first place.

And thanks for the review.  :)

Regards,
Fei

> Cheers,
> Angelo
>

