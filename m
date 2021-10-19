Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 12:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ABA661260
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 12:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ABA661260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iurGlcsqWGAKjc6ITawm7Ottu+ndLHZspunXex8/kVk=; b=zPZqvyJxzQEbJ/
	yZVQYcY1H7TIi5frdkavR71Yr73mwKxlLAynUd1/ZtWyCkl1iQmmL38iNalD2ImWYTx6IfNYjuJhq
	bpJ6OwgmzSkQaPOxpVFd8794qZfv2SQZpEosSLSNejbRTA9ocqF9YuJ4v8zfzzlbT1jkyw6DU9PSj
	sN7KE72ywkN+sg7emsSddsratFRbQv02jVVJOVXyYYOcy2cEhJ4oy0FRM4vsd2GeC1isdYsUTa8H1
	rLQunJjNhr1Ur64S5P9UwQoWsZK3OyqNJuKBHUqY3Yuz9gQwjH3P62n4SFgFJyk3FmLZP8pMWlT40
	FDj+j7PLujOBKEpcOKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcoQl-001GLq-Rc; Tue, 19 Oct 2021 12:41:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcoQh-001GJX-S6
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 12:41:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ec8so12442929edb.6
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 05:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EHf1d6jYC47N493Pv/6pFABfQdMKx4e8O3xhKroDPbE=;
 b=NyuJgkOEqVr2HgSuFzucrmFl6uCC47sSvbC4sO8TJI5tKjSPUp2CuXuUVzlYed/0Wd
 UuwdEFSyvQRiZn4dT7Vi6Yr2OGeienXD0cr3JRJIZxso6VZBlHhPqR4DRBDUcM22HpyY
 aTuV8ClK37PNqKNrFn6vFa4AlhIToFy9MbcfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EHf1d6jYC47N493Pv/6pFABfQdMKx4e8O3xhKroDPbE=;
 b=iU+L+ula66S4v5ejGUC2EOiP2WbKkBYVESx8iwIwi4SO/a9ZlxGnBUYEPFaA6HO94n
 ebrdyTM2GLJdOhT019hKnGFAREVQeptx3Sujl8e2taO7iDpPSu4BsqS5IfNGlqq7EsdO
 8c/grlMSdQa9EbK/ahiueUWjh5B0C+2Icvqf6NJgLtf3gFqbuoB6JBwJWFoyAXqSgk6C
 NjzfMtEph3FSuFtzJgh5haN/dOC7k0NJwkdSXrUbU7qrInW6C6LdmGS1eGJ/57J3uLQB
 ZZc7Ehm4ZnJ4J/c+o3o8R3lZa97yW9Mh3zCMIe9l2E/1vfmOdVuMYzXukGM9fUZGVy6h
 QR5Q==
X-Gm-Message-State: AOAM532mEh4nPMyIUKjmtyQjqXZGtS6q1G4/BSDOFgp9Qay2127JV5MN
 DB/w8F7s5WYjxYJKVHf8kDfz8g==
X-Google-Smtp-Source: ABdhPJx6vSo6OufSaFH9rFLrzmjtgXdXhc8T6jVm1AlxqNyN88YtlQU+itfte1ctjSnqHOIrQwPvAg==
X-Received: by 2002:a05:6402:84d:: with SMTP id
 b13mr54514480edz.110.1634647277354; 
 Tue, 19 Oct 2021 05:41:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p23sm12148807edw.94.2021.10.19.05.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:41:16 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:41:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: guangming.cao@mediatek.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] dma-buf: add attachments empty check for dma_buf_release
Message-ID: <YW686sIZie4xRUQO@phenom.ffwll.local>
Mail-Followup-To: guangming.cao@mediatek.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
References: <20211019122345.160555-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019122345.160555-1-guangming.cao@mediatek.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_054119_975716_EEC38230 
X-CRM114-Status: GOOD (  28.30  )
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

On Tue, Oct 19, 2021 at 08:23:45PM +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> Since there is no mandatory inspection for attachments in dma_buf_release.
> There will be a case that dma_buf already released but attachment is still
> in use, which can points to the dmabuf, and it maybe cause
> some unexpected issues.
> 
> With IOMMU, when this cases occurs, there will have IOMMU address
> translation fault(s) followed by this warning,
> I think it's useful for dma devices to debug issue.
> 
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

This feels a lot like hand-rolling kobject debugging. If you want to do
this then I think adding kobject debug support to
dma_buf/dma_buf_attachment would be better than hand-rolling something
bespoke here.

Also on the patch itself: You don't need the trylock. For correctly
working code non one else can get at the dma-buf, so no locking needed to
iterate through the attachment list. For incorrect code the kernel will be
on fire pretty soon anyway, trying to do locking won't help :-) And
without the trylock we can catch more bugs (e.g. if you also forgot to
unlock and not just forgot to detach).
-Daniel

> ---
>  drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..672404857d6a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
>  	 */
>  	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>  
> +	/* attachment check */
> +	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
> +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
> +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
> +	    dmabuf->name, dmabuf->exp_name,
> +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
> +	    "Release dmabuf before detach all attachments, dump attach:\n")) {
> +		int attach_cnt = 0;
> +		dma_addr_t dma_addr;
> +		struct dma_buf_attachment *attach_obj;
> +		/* dump all attachment info */
> +		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
> +			dma_addr = (dma_addr_t)0;
> +			if (attach_obj->sgt)
> +				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
> +			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
> +			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
> +			attach_cnt++;
> +		}
> +		pr_err("Total %d devices attached\n\n", attach_cnt);
> +		dma_resv_unlock(dmabuf->resv);
> +	}
> +
>  	dmabuf->ops->release(dmabuf);
>  
>  	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
