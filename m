Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 18:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D816135E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 18:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86D816135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+GdZjRKQLhvmZpm7kALbIpkOdwYp8VhaHsar+5BwjU=; b=xPVUarUjzNw+qc
	W7OKDdCx1CfTn1QDINWlYXVJjLd5gNhNiJjdFDA6BsfWwAWLa0l6kelhLeLWqpHQGDDxKoa+NykuK
	0zw9syoG0EQX1ZNm8ObZDtpie2Y+ueV8SwaT1vcqD50J8DlQiBykyO3t8P4hGeyQgbDP8P6qBDn7B
	orLgombdzyWRq5FnmDRV4I0kx1GKEQhbP3u+v79gXF+ysgSIWEYmJ+R8tNhOiXDn9Bq5/MlUqGX0z
	2A81VB2XmfSbHtJs+7qDmGEQvN2UA2MATDkpaGV8AIqpuSgWtplnPdJVN8P0m7id7T3lb0rNy2jYS
	Nb+blZXzMR/kyYORjR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlEer-008YC5-V2; Thu, 11 Nov 2021 18:18:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlEee-008Y9a-97
 for linux-mediatek@lists.infradead.org; Thu, 11 Nov 2021 18:18:34 +0000
Received: by mail-ed1-x531.google.com with SMTP id b15so27360493edd.7
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Nov 2021 10:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vnmxwn/tZeM/AHymk+3atT3H8KaElmrCo0Jws8wvOvA=;
 b=ExqD7I0dtPteyE+rPa5NxBrJ7mWXCX+6K1XnVBIyiRxmjTpjy34M1yZ+ZD7k7I4cX+
 3Kv4LeG1cljOnPaqMNOchb3VsUdPhPadvZlrLJGHAVa8957yvCXygvk5luW7ripmeG0w
 saAdMc0h1DFLV2cBJ8i/Fl5fk4kpkkHxCTZR1OKOw8g4WCD5qMzTPch2VzJpAGzFr59R
 qrK/I5pmFTyRZj7a6hJOqUUE9f6lKnLzx2Bd4fltBrKni+AHa1GQ2KJUJIEc0mVhPxP/
 hXcyFM7WSLBj+CNM73dVat6eZZy+SKKKNGCPfHMIn6EzLvj6PziP2kjslddOiS4hVcvD
 n5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnmxwn/tZeM/AHymk+3atT3H8KaElmrCo0Jws8wvOvA=;
 b=0u5KXHwzni10A86AVYAPuFdk/GcI30xxADT1YeRTA5XuNOM+UF3INIJHGA6miMWVjS
 +MPK1dr3Q0H6q8tft6nQVvSQJd6yeC/VTE0Qfri3MiLUfgIeQzPMOzv3KbwT57b415zW
 xolRZMmtZ6S0tneScKgYwZTWe27YIyVXYp19FCmYCJdL8PbUp3ckTCHINo2RPpmgVkoB
 WGrnUhlYGfse97z/ESDNh+5ftGtdGF8aRrv0XfGYCZZZcQmPGF+PsxENt3VD1TMe0tfN
 RC+Wdj45O4i6l64eg6M/xDdU9IaTUMS8S+reBOg0n5uZdKmtoykWLK+VkB8FzU9v/6Gj
 M4IA==
X-Gm-Message-State: AOAM5305u0Q4TM0jxTLacJNL0rpQHwlDpFZb1WO0+To48PsLHNcXqdnm
 O5icUX/f15FbP3c9uFsW4zxLw9EjEPgqKfYAgX8/wA==
X-Google-Smtp-Source: ABdhPJzba7bVic9RyDyOSTksjvjV62o5u0z5w36iz4HU98btIq1dlbOxkB93U98vp5KpeLHVHkfLQgWCDJugvMeQGGU=
X-Received: by 2002:a17:906:4d4a:: with SMTP id
 b10mr12055937ejv.89.1636654710614; 
 Thu, 11 Nov 2021 10:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 11 Nov 2021 11:18:18 -0700
Message-ID: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, matthias.bgg@gmail.com, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_101832_990788_68DCBE5B 
X-CRM114-Status: GOOD (  17.15  )
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

Hi Mark,

On Tue, 2 Nov 2021 at 08:15, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Use %pe format string to print return error code which
> make the error message easier to understand.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..2242da320368 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>                                            dma_get_mask(rproc->dev.parent));
>         if (ret) {
>                 dev_warn(dev,
> -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -                        dma_get_mask(rproc->dev.parent), ret);
> +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));

Macro ERR_PTR() is used to convert error codes to pointer type when
returning from a function - I fail to see how doing so in a dev_warn()
context can make the message easier to understand.  Can you provide an
example?

Thanks,
Mathieu

>         }
>
>         /* parse the vrings */
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
