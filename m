Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DAEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5jxgBFcv9VMvQgu52nQbyeFMD1EE4bzWmknJvQp3Yk=; b=BTcpPeLdkBbJoJ
	cOMvGPn2PELqug0T7luJ85JJnbEVocl+jyw3rthsNXcLfj4Wst0nUMKelFq+ylOzZDwbBYKaB4Qdu
	BWlEQI+ChyZQl0h31Fn4+NS70TEXtnTvFbT9l34EH/jKdHFr8FnlPCzxlFJg0dWYYLr8YkYL+e5nT
	XBoyCxT5JtVKC3lGe3UKs+6khE4GvkUOcnP+3JyQX+kERHklKO13ZnISR3mN9GounycVXoYLaaMdE
	TXtpNPq+c3WMeMU/aO55SJrwYMM/7I8cL09MC7h2QjpeHO21t6glKvX/R7985kZQ8/F01eLa1w8Pj
	14PYNJpv24qkKRAzuxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAORu-008Z0F-Km; Thu, 20 Jan 2022 03:49:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAORi-008YxC-2y
 for linux-mediatek@lists.infradead.org; Thu, 20 Jan 2022 03:49:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id x11so16652954lfa.2
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Jan 2022 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AZnU5cEeFyaFBnpj/0CbEtA8JHuWrnQecXMIYCnzB/o=;
 b=ErV1kJfadCu1b5wgD6aEviZCSAk41KIjnGh8WYn8aHbrfBmz/Z03LAGBXFW2rQaPAJ
 8nUEBpkWeomoODmY334NhCZOU+o0EljJbg8u2iyiFqhQzZA+efnPNwuXwUbmf0s5v/T1
 kCYeVe9Uk4rKeiAhQV0qJH3LNcIRAZLLfIB4l+8HBTpN2EbhE7OMo9MsZ1jJFtNumTI7
 6nq4zktXZrLgMTkM/3rhi6H2v1j+XohmCPmuRZ67scdSpSHYsD2JZXkUmKHOEB9cL3zx
 lOz0lnwWIRRBoK8mzCl56IReSHCns1DzoysZ5ToPrtmXJlo7ywMjgvALaTMfHs/M01U3
 VAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AZnU5cEeFyaFBnpj/0CbEtA8JHuWrnQecXMIYCnzB/o=;
 b=SaP1N/1tMND60WqsmdExj8BVmnqPJSVtkIkZZwQ67rwF/2m7jcdutdINmHdApMGZ8d
 zW+0ZpbN3xzk2dGV2hIznYCgbgSIXVRF4UCfX6oKC1aMvigZ1ogqzCKyYNLJyCdTeElo
 Tn0C8MkTQyxxkTl0CJDf9r67axd9xwfthcF1RAxgKqOxWxlH+jQ5tG63wnCeY+xQNLWH
 1zdYtpACUzyqDcPI/k7ha18LkpYEWmyep0D4cq9OI1mGv2q+KItlR3z/Gx0qkBkCTEaW
 BtPwT6yuJFqtkneYSv/NR01osWjiHNQZa6Ccr7RzcjLmMx+LS4+39efjWf7sIhY/S1v4
 zfCA==
X-Gm-Message-State: AOAM530lbcypwKqNYbqGqz4+Uo2HPMrTD4qHzDWCVpXJtIIRYPFjZkM/
 81ZdGypAqRXPks5C55Alo6aH1d3usJB4IMvH0usdyA==
X-Google-Smtp-Source: ABdhPJx0/Bt4Fv7Zhtxsw2WH0QARsie3jQTiwGG/ZBJTXsXxHRBXcquj3uP0/ZLAIBtBfzPMkNDAYvLD72ukCtWU1g8=
X-Received: by 2002:a05:6512:3e1f:: with SMTP id
 i31mr25221311lfv.661.1642650547311; 
 Wed, 19 Jan 2022 19:49:07 -0800 (PST)
MIME-Version: 1.0
References: <CALAqxLUtK8V9LgC-DY+tkzFYyWfzF+JhbrLZk6UhEG57HQBDSA@mail.gmail.com>
 <20220120033450.90164-1-guangming.cao@mediatek.com>
In-Reply-To: <20220120033450.90164-1-guangming.cao@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Jan 2022 19:48:55 -0800
Message-ID: <CALAqxLW5uEZCGHGk3rYoiOGzN5XMKb39JzoPB1iEX9k3UsiT-A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Add a size check for allocation
To: guangming.cao@mediatek.com
Cc: benjamin.gaignard@linaro.org, bo.song@mediatek.com, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 jianjiao.zeng@mediatek.com, labbott@redhat.com, libo.kang@mediatek.com, 
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org, 
 matthias.bgg@gmail.com, michael.j.ruhl@intel.com, mingyuan.ma@mediatek.com, 
 sumit.semwal@linaro.org, wsd_upstream@mediatek.com, yf.wang@mediatek.com, 
 caoguangming34@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_194910_139451_96CC0E7C 
X-CRM114-Status: GOOD (  18.83  )
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

On Wed, Jan 19, 2022 at 7:34 PM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>
> Add a size check for allocation since the allocation size should be
> always less than the total DRAM size on system heap.
> And it can prevent consuming too much time for invalid allocations.
>
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..bd6f255620e2 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -347,6 +347,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>         struct page *page, *tmp_page;
>         int i, ret = -ENOMEM;
>
> +       /*
> +        * Size check. The "len" should be less than totalram since system_heap
> +        * memory is comes from system. Adding check here can prevent consuming
> +        * too much time for invalid allocations.
> +        */
> +       if (len >> PAGE_SHIFT > totalram_pages())
> +               return -EINVAL;

Thanks so much for revising and sending this along! It looks good to me.

Acked-by: John Stultz <john.stultz@linaro.org>

thanks again
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
