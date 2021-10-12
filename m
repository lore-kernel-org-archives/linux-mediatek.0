Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 08:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB92D61050
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 08:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB92D61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKBELH11VLPv/84+bDN9rtGORViOqlr1YgtdZN4UD+c=; b=pBrT8vh9cqk4Me
	GLeosyuao3ToLuNByyNNkwhTwVr0K/vnB08jBZ3HKIGGhixPWZf0w2IAd4ldgI6qd2T8UD+lN4vhJ
	z8c4dAVMMckpw+5r3eFGEr4k61+JX7IOV0ZQW4mYnnLtIfL6BQkxZDVX31/2VeWtZJhwl4NsEkanI
	1AwvqgmyKeFotQqjPgftewkmt3/QHVIL5kQbacjhJ3cXvP8s3W4rYs1yJ1RA73vmxzNUCZynKsYaF
	k6EH3FrsxNvePKGUPsCDDabQ3xD5ST8ig2/+/EHdJ3r0nzCkiMHBEZ9o+gOxSWEbeoCyGpdPWWZhS
	paBPzEBAj88YNUns6vRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maDUb-00C5h9-10; Tue, 12 Oct 2021 08:50:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maDTX-00C55W-IF; Tue, 12 Oct 2021 08:49:33 +0000
X-UUID: 6e0b2a737b6842c591aacebd995b13a5-20211012
X-UUID: 6e0b2a737b6842c591aacebd995b13a5-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1086669574; Tue, 12 Oct 2021 01:49:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 01:39:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Oct 2021 16:39:20 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 12 Oct 2021 16:39:20 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <rdunlap@infradead.org>, <sumit.semwal@linaro.org>,
 <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
Date: Tue, 12 Oct 2021 16:41:09 +0800
Message-ID: <20211012084109.176542-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <eba79a76-413b-570c-aec0-899a5f918d38@amd.com>
References: <eba79a76-413b-570c-aec0-899a5f918d38@amd.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_014931_617153_7253730A 
X-CRM114-Status: GOOD (  33.64  )
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

From: Guangming Cao <Guangming.Cao@mediatek.com>

> Am 09.10.21 um 07:55 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> >
> > If dma-buf don't want userspace users to touch the dmabuf buffer,
> > it seems we should add this restriction into dma_buf_ops.mmap,
> > not in this IOCTL:DMA_BUF_SET_NAME.
> >
> > With this restriction, we can only know the kernel users of the dmabuf
> > by attachments.
> > However, for many userspace users, such as userpsace users of dma_heap,
> > they also need to mark the usage of dma-buf, and they don't care about
> > who attached to this dmabuf, and seems it's no meaning to be waiting for
> > IOCTL:DMA_BUF_SET_NAME rather than mmap.
> 
> Sounds valid to me, but I have no idea why this restriction was added in 
> the first place.
> 
> Can you double check the git history and maybe identify when that was 
> added? Mentioning this change in the commit message then might make 
> things a bit easier to understand.
> 
> Thanks,
> Christian.
It was add in this patch: https://patchwork.freedesktop.org/patch/310349/.
However, there is no illustration about it.
I guess it wants users to set_name when no attachments on the dmabuf,
for case with attachments, we can find owner by device in attachments.
But just I said in commit message, this is might not a good idea.

Do you have any idea?
> 
> >
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > ---
> >   drivers/dma-buf/dma-buf.c | 14 ++------------
> >   1 file changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 511fe0d217a0..db2f4efdec32 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >   
> >   /**
> >    * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
> > - * The name of the dma-buf buffer can only be set when the dma-buf is not
> > - * attached to any devices. It could theoritically support changing the
> > - * name of the dma-buf if the same piece of memory is used for multiple
> > - * purpose between different devices.
> > + * It could theoretically support changing the name of the dma-buf if the same
> > + * piece of memory is used for multiple purpose between different devices.
> >    *
> >    * @dmabuf: [in]     dmabuf buffer that will be renamed.
> >    * @buf:    [in]     A piece of userspace memory that contains the name of
> > @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> >   	if (IS_ERR(name))
> >   		return PTR_ERR(name);
> >   
> > -	dma_resv_lock(dmabuf->resv, NULL);
> > -	if (!list_empty(&dmabuf->attachments)) {
> > -		ret = -EBUSY;
> > -		kfree(name);
> > -		goto out_unlock;
> > -	}
> >   	spin_lock(&dmabuf->name_lock);
> >   	kfree(dmabuf->name);
> >   	dmabuf->name = name;
> >   	spin_unlock(&dmabuf->name_lock);
> >   
> > -out_unlock:
> > -	dma_resv_unlock(dmabuf->resv);
> >   	return ret;
> >   }
> >   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
