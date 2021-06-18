Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF15C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 01:16:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61951613BD
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 01:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61951613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp+p3QW4hw01yroDyugyyZt9iF3NdmkxclmIThjKbtE=; b=JjSd35qCJXCjD7
	oes2F42gVEPBPIQNj8z7bL9VXEo2M6ZSq9xJtJpo1XU6bFWeF2Rhw0E2QDmrMXtwUTiKwTRLYWKbl
	DRBRceixCDPVovrtTzFKsJWufMJOROI/H8Nxk9I4APIi4tR0NjIiyFfEADaDjp7z8VWOVxVvO6NgM
	gNPY2icYwRceGDJRSYXENZmAXHbL1wLzK9g1iDLj9KnPhD5VLXbi8YWQ+r1FIHdyhiCnst9AMSPqh
	Hvc+zlppn3uixf3LkdKi8d59lCDKnY2rQZsWHkiCEc6AUKPz/XJoYx8njFo8V0s56VlkJ6SUVfQGE
	0aXqhVQBnkjlnSum12bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu37n-00CGWa-Dr; Fri, 18 Jun 2021 01:16:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu37j-00CGVq-BM; Fri, 18 Jun 2021 01:16:45 +0000
X-UUID: d85f6f7579074e7b9c39081aa9589ff4-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KOzvCy7uxSkX1CX2/k53ocjUMWvU6GOJfwgH1rFZydI=; 
 b=LwtPA6TdfL/56QH4cjL7+yNWaZO/cUxVKVby9TLecGiyoersJvCDBXLCkUOAV5imbcSVNdfEci5ch6+gfg/5XPDEmJolGQjXHO7CKi/JUIsvcvjgD4IAO7qCKEgtZgltTwYQtISWF3NnuiA/4CQEs0j7SRQtKQRic/h+4RSbftc=;
X-UUID: d85f6f7579074e7b9c39081aa9589ff4-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 682135888; Thu, 17 Jun 2021 18:16:37 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 18:16:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 09:16:33 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Jun 2021 09:16:33 +0800
Message-ID: <1623978993.5433.1.camel@mtkswgap22>
Subject: Re: [PATCH -next] scsi: ufs-mediatek: Add missing of_node_put() in
 ufs_mtk_probe()
From: Stanley Chu <stanley.chu@mediatek.com>
To: Zou Wei <zou_wei@huawei.com>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <matthias.bgg@gmail.com>,
 <linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <peter.wang@mediatek.com>
Date: Fri, 18 Jun 2021 09:16:33 +0800
In-Reply-To: <1623929522-4389-1-git-send-email-zou_wei@huawei.com>
References: <1623929522-4389-1-git-send-email-zou_wei@huawei.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_181643_436682_F05674A1 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Zou,

On Thu, 2021-06-17 at 19:32 +0800, Zou Wei wrote:
> The function is missing a of_node_put on node, fix this by adding the call
> before returning.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 1a517c9..d2c2516 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -1120,6 +1120,7 @@ static int ufs_mtk_probe(struct platform_device *pdev)
>  	if (err)
>  		dev_info(dev, "probe failed %d\n", err);
>  
> +	of_node_put(reset_node);
>  	return err;
>  }
>  

Thanks for this fix.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
