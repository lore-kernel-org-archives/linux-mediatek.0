Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C36C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:36:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4AF20838
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ux5wKIVp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gQDqhM1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4AF20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6h1zkLvZ1WSezukw7g2SzStkGL9D1Cj+ilYc+aJchsg=; b=ux5wKIVp960HNjdBjnBVTlUKJ
	Z7BBuO+IMj3tzbCLOUI3VDDJfMJW4AvKbr1OiOHuqZNDRws52F5pXkcxo6Qe6QBftOEIQsLtXHFya
	9ipzSqv7WYPlli1zHRutiPf9H/Z/BhDAxFKu93zVbyZl3AbTrS1dVIKA1Cxgpv7woQdSUFlZArd7U
	9J9QPCil4Z9ARIRNrpK3zeo4lpaGQib2obZjmPJIcLBu8sDP7TSDB2byHxzRYZW4jKB5Q8+DGIGx8
	4VBgM1b7Zc8bhbQfL55g8z5rqLDTBGHYDLGr94j0BD3C6Mlz9+VTF1M+Ef5Is4tz6uEWr2kV/7j+5
	I3TJLegWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLk9i-0006Qt-JH; Fri, 25 Sep 2020 09:36:42 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLk9P-0006Im-GN
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 09:36:24 +0000
Received: by mail-vs1-xe42.google.com with SMTP id z193so1007425vsz.10
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2020 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CopwlfwvxR6TDA4NEpPReJrXwzQ2YdaVXCfZyj+KeI8=;
 b=gQDqhM1EBxhhdAdupXGC+mi8HP42zIBAb+/5WouwU0pwYgc43PjnSIDyqhNXoJBgwE
 nA9S7PMscej5cgQCrvf55Dp29QyMHvwUDUtmdsjDRjaEHcRFBhd7dmLwMWl9mvoH7sp/
 4lRasNIvYZAFCtIP9ZaogcqOJXzEYU/4iYpzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CopwlfwvxR6TDA4NEpPReJrXwzQ2YdaVXCfZyj+KeI8=;
 b=B4+iSbEhDpfMp3bm/IdI9awPMR2C9Mqf9C6l6xloIWi8FOv4EJNIBc+wwD51iYWA9f
 pGIUrkkWf6Qlfrp4Jo6493K1iz61SDkBbShTVrdS8kwExmCZ2glLwNM0Bg+6tD0VA3yx
 QxUWCs4t69pbAhRAJf+IOYkO/aEH0oe6NzDH7LqiO/SRf2oyp6FvWbhnp3NVEbGBP11X
 BMmtgbbCaQvtu7w1mVWP6rPtT6Ah4cic/O/Xv66MCD5UPrmEaV50EFTFfm0kA+NoFsQ1
 hZOitj9x7dngD0nv9Kv5Qw6NTQHuX5qpM3l+ryo6f/J24cCRrHMhtiTA8yabX7c5XIga
 cpOg==
X-Gm-Message-State: AOAM532VA/XopuJXLmr6ogYJIonyF+RH1sU3WoRLp7itlcdFpYSk+kQq
 ZmTtyPLUQB+Ymp/V7jWRsdcu+GY8R3BsVT5MQ6PKGw==
X-Google-Smtp-Source: ABdhPJxdJedhGCUBzFfJjDuMt5UWKrHFjl71MnBQbIp5LNRnu+DHrChmvGin2RNOLR4c+TakRNBVwDRVvnRZRQt2lqc=
X-Received: by 2002:a67:b917:: with SMTP id q23mr2061999vsn.37.1601026578879; 
 Fri, 25 Sep 2020 02:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.2.I48d59ef5398f3633c6ebbab093da6b4b06495780@changeid>
In-Reply-To: <20200925145255.v3.2.I48d59ef5398f3633c6ebbab093da6b4b06495780@changeid>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 25 Sep 2020 17:36:08 +0800
Message-ID: <CAATdQgB4Z2msO_RuOuVMLaXYrR7WnGsSQbjOWMTFWT7PCjH+PA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] spi: spi-mtk-nor: fix mishandled logics in
 checking SPI memory operation
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-spi@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_053623_566333_1621C6B6 
X-CRM114-Status: GOOD (  18.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 2:54 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Fix a bug which limits its protocol availability in supports_op().
>
> Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---

This is also duplicated work of https://patchwork.kernel.org/patch/11797723/,
I'm going to drop this patch in v4.

>
> (no changes since v1)
>
>  drivers/spi/spi-mtk-nor.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 6e6ca2b8e6c8..0f7d4ec68730 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -211,28 +211,24 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>         if (op->cmd.buswidth != 1)
>                 return false;
>
> +       if (!spi_mem_default_supports_op(mem, op))
> +               return false;
> +
>         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
> -               switch(op->data.dir) {
> -               case SPI_MEM_DATA_IN:
> -                       if (!mtk_nor_match_read(op))
> -                               return false;
> -                       break;
> -               case SPI_MEM_DATA_OUT:
> -                       if ((op->addr.buswidth != 1) ||
> -                           (op->dummy.nbytes != 0) ||
> -                           (op->data.buswidth != 1))
> -                               return false;
> -                       break;
> -               default:
> -                       break;
> -               }
> +               if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
> +                       return true;
> +               else if (op->data.dir == SPI_MEM_DATA_OUT)
> +                       return (op->addr.buswidth == 1) &&
> +                              (op->dummy.nbytes == 0) &&
> +                              (op->data.buswidth == 1);
>         }
> +
>         len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>         if ((len > MTK_NOR_PRG_MAX_SIZE) ||
>             ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
>                 return false;
>
> -       return spi_mem_default_supports_op(mem, op);
> +       return true;
>  }
>
>  static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
> --
> 2.28.0.681.g6f77f65b4e-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
