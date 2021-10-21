Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA2EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 03:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A260561130
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 03:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A260561130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT1kx0JMukqMG3EVbBf72b9WlnOoR/3mrX5etqpVCs8=; b=RUbHzBbc9z3Vyg
	HkrWUyE8DFIuI1bDcLOzJLiXlL/EfIxvkYG6GAkqvl7Jx9wDCJGBTEYxHV28AEaMWkaqV5PAENw+E
	2z4V8FP2dRFGPPejDdmtefUguHUKWCgjYUODhLGGIfECEXQoNts+t5xtBp50PUe9E92DXF1xYX773
	aOF5BprDuz752UmtzeScyfEJQUlzZvmFztwcaAYUcbpBexd23LCd3FR3UT7MhbHkyRjU8k9nmsL2M
	YK3nXNjgmbHmRKUiH6WaTJ23pK9ccfUOx82BinUKkUbVL7cFpm2zOCHeoNlLBYDPfda/CBdqezIuy
	GKi/4Yh2J5UEaTjNF45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdOiK-006JCJ-VC; Thu, 21 Oct 2021 03:25:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdOi8-006JBa-8z; Thu, 21 Oct 2021 03:25:47 +0000
X-UUID: c30c46bdee864c1f9ee756ced23c610a-20211020
X-UUID: c30c46bdee864c1f9ee756ced23c610a-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 970433404; Wed, 20 Oct 2021 20:25:39 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 20:18:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Oct 2021 11:18:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Oct 2021 11:18:25 +0800
Message-ID: <0c5b8562d49c7e81323b8a34a42385440f33f798.camel@mediatek.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: avoid sched_clock() misuse
From: Peter Wang <peter.wang@mediatek.com>
To: Arnd Bergmann <arnd@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
CC: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman <avri.altman@wdc.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bean Huo <beanhuo@micron.com>, Bart Van Assche <bvanassche@acm.org>,
 <linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 21 Oct 2021 11:18:25 +0800
In-Reply-To: <20211018132022.2281589-1-arnd@kernel.org>
References: <20211018132022.2281589-1-arnd@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_202544_353055_D6BFC384 
X-CRM114-Status: GOOD (  22.96  )
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

On Mon, 2021-10-18 at 15:20 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> sched_clock() is not meant to be used in portable driver code,
> and assuming a particular clock frequency is not how this is
> meant to be used. It also causes a build failure because of
> a missing header inclusion:
> 
> drivers/scsi/ufs/ufs-mediatek.c:321:12: error: implicit declaration
> of function 'sched_clock' [-Werror,-Wimplicit-function-declaration]
>         timeout = sched_clock() + retry_ms * 1000000UL;
> 
> A better interface to use here ktime_get_mono_fast_ns(), which
> works mostly like ktime_get() but is safe to use inside of a
> suspend callback.
> 
> Fixes: 9561f58442e4 ("scsi: ufs: mediatek: Support vops pre suspend
> to disable auto-hibern8")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-
> mediatek.c
> index d1696db70ce8..a47241ed0a57 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -318,15 +318,15 @@ static void ufs_mtk_wait_idle_state(struct
> ufs_hba *hba,
>  	u32 val, sm;
>  	bool wait_idle;
>  
> -	timeout = sched_clock() + retry_ms * 1000000UL;
> -
> +	/* cannot use plain ktime_get() in suspend */
> +	timeout = ktime_get_mono_fast_ns() + retry_ms * 1000000UL;

Thanks for this patch.

>  
>  	/* wait a specific time after check base */
>  	udelay(10);
>  	wait_idle = false;
>  
>  	do {
> -		time_checked = sched_clock();
> +		time_checked = ktime_get_mono_fast_ns();
>  		ufs_mtk_dbg_sel(hba);
>  		val = ufshcd_readl(hba, REG_UFS_PROBE);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
