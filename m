Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A92C35247
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 02:26:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0653F2085B
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 02:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Htbvq3X2";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="sHmoObS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0653F2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aOengKwp3qr+msr+7n8fbIhoW0TqofCDpoHJTluQ7BI=; b=Htbvq3X2pDxi6s4cyNfH00rn3
	fK0fSJDD04kWNulrXH6NmCUuyN49jU8j7rsi7yjieQJw4thFG0Q8ibB1pukbjRnWTOBcf49gRmwJI
	6HyQazaymae4kzDYxLzDY20wdzOdlnBWZbZI836tRWaBaQidbApWUK4dfpdHFPNbrA9Xl0B1qyh0J
	7KzSA3gm1m12vZjevgHtqpgo/dI+hLUbVqSpU3svsSq1YkH0PZw6Y8wMNwKUxe4mGwJOzw6SwlZyy
	UVqkUwNrfr5JHfi2w6RpIUxPqGAiofymjmlQNSpAV119nTyS8YiQGuc/5602fq4s4XnrUvyUPc/Wn
	373CUqvzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izAOr-0003Hz-Rr; Wed, 05 Feb 2020 02:26:45 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izAOk-0003BS-Jd
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 02:26:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580869597; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Pgq9KvjPRshhckyUvQfLK0OTeO6Xr6mnSEYtpz2S3GE=;
 b=sHmoObS4E3jnWjSxplM24CoB0oDzOE35gn2kSG/Bl9DrByLWmoF1ivOPo12KebDZnSIgxpZV
 mMkgJSO1chR9hfig6DO3vE9Htu2+y8ubpAySxTvFRrFp5Affd6rmk/jE6SJZ9BjDLYQK1Pcj
 SVswctkX/V1wHt0nRsReJpZECQY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a27dc.7fb9554cff80-smtp-out-n01;
 Wed, 05 Feb 2020 02:26:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 72E12C447A0; Wed,  5 Feb 2020 02:26:36 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38A01C433CB;
 Wed,  5 Feb 2020 02:26:35 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 05 Feb 2020 10:26:35 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH RESEND v3 3/4] scsi: ufs: fix Auto-Hibern8 error detection
In-Reply-To: <20200129105251.12466-4-stanley.chu@mediatek.com>
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
 <20200129105251.12466-4-stanley.chu@mediatek.com>
Message-ID: <42d40d961663b0a83e4d6bb266fe5ca1@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_182638_703476_B7A4344D 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-01-29 18:52, Stanley Chu wrote:
> Auto-Hibern8 may be disabled by some vendors or sysfs
> in runtime even if Auto-Hibern8 capability is supported
> by host. If Auto-Hibern8 capability is supported by host
> but not actually enabled, Auto-Hibern8 error shall not happen.
> 
> To fix this, provide a way to detect if Auto-Hibern8 is
> actually enabled first, and bypass Auto-Hibern8 disabling
> case in ufshcd_is_auto_hibern8_error().
> 
> Fixes: 821744403913 ("scsi: ufs: Add error-handling of Auto-Hibernate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> ---

Reviewed-by: Can Guo <cang@codeaurora.org>

>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  drivers/scsi/ufs/ufshcd.h | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index abd0e6b05f79..214a3f373dd8 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -5479,7 +5479,8 @@ static irqreturn_t
> ufshcd_update_uic_error(struct ufs_hba *hba)
>  static bool ufshcd_is_auto_hibern8_error(struct ufs_hba *hba,
>  					 u32 intr_mask)
>  {
> -	if (!ufshcd_is_auto_hibern8_supported(hba))
> +	if (!ufshcd_is_auto_hibern8_supported(hba) ||
> +	    !ufshcd_is_auto_hibern8_enabled(hba))
>  		return false;
> 
>  	if (!(intr_mask & UFSHCD_UIC_HIBERN8_MASK))
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 2ae6c7c8528c..81c71a3e3474 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -55,6 +55,7 @@
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/bitfield.h>
>  #include "unipro.h"
> 
>  #include <asm/irq.h>
> @@ -773,6 +774,11 @@ static inline bool
> ufshcd_is_auto_hibern8_supported(struct ufs_hba *hba)
>  	return (hba->capabilities & MASK_AUTO_HIBERN8_SUPPORT);
>  }
> 
> +static inline bool ufshcd_is_auto_hibern8_enabled(struct ufs_hba *hba)
> +{
> +	return FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK, hba->ahit) ? true : 
> false;
> +}
> +
>  #define ufshcd_writel(hba, val, reg)	\
>  	writel((val), (hba)->mmio_base + (reg))
>  #define ufshcd_readl(hba, reg)	\

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
