Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68ECC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 18:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BDE206D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 18:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WISKB/53";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="SVe+SHYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0BDE206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pQrPQTA1VBx1auBbYN30Nwyn4XIYdwB0qgK9AANs1YI=; b=WISKB/53XZB5GEgzKCtoNI9Wi
	dlIlD10wnmpLO+iI6v/qyBbIS3cuzXYj7a4qvoVQgdkiY5wBiYfubAnWoqciuCZeqnoXjOhdnxAzQ
	gPD/g3RHHeMweKTQXL7AtGW42Ofc9/fESfpzA4VJT1BtY9+Zx6L+AGj2wuVve7rP0IJ5dhAmhumPd
	PnNnuFBLfS1+cgXO6osvRydEYW19cxVQGiDAdQWK+S3zq8rBuroIL54rZb4nTnuho5xITaGFW31aL
	JwmfzEdaZjjJLfO50hgmIMuJT62IGxNEgTYvrtIJphqK2MFipihJZkF6BkXRE8PGT1aj1nualQ8wv
	fFo4vILRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwrvm-0000Ds-Uf; Wed, 29 Jan 2020 18:19:14 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwrvY-0008VX-1u
 for linux-mediatek@lists.infradead.org; Wed, 29 Jan 2020 18:19:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580321941; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rNueugt7+ShJvXDNSBQmIyNMaj5LO03LUNGcC7CqzMg=;
 b=SVe+SHYeUVfcIlZF+MBXjwXo2eeOOWwFdyMrC0OCJBtfAUk9ZM70qJ++TNyFKzCyamgpca7/
 Vi25BUea64QdkJPE/OcLfPPmFqRQ5rqGUBILndNUUSqqXkYjB4P0b5FkbEsWj2H1CdcYRyqu
 ixr1V+TePR8BY2Gnokvfds0pnys=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e31cc8f.7f1bc7e64fb8-smtp-out-n03;
 Wed, 29 Jan 2020 18:18:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8535CC43383; Wed, 29 Jan 2020 18:18:55 +0000 (UTC)
Received: from [10.71.154.194] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 37EFCC43383;
 Wed, 29 Jan 2020 18:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37EFCC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH RESEND v3 3/4] scsi: ufs: fix Auto-Hibern8 error detection
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, beanhuo@micron.com
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
 <20200129105251.12466-4-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <daaf442c-1fad-b6dc-8206-beb535c21ec3@codeaurora.org>
Date: Wed, 29 Jan 2020 10:18:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129105251.12466-4-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_101901_805922_50821A1E 
X-CRM114-Status: GOOD (  20.15  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/29/2020 2:52 AM, Stanley Chu wrote:
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

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>   drivers/scsi/ufs/ufshcd.c | 3 ++-
>   drivers/scsi/ufs/ufshcd.h | 6 ++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index abd0e6b05f79..214a3f373dd8 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -5479,7 +5479,8 @@ static irqreturn_t ufshcd_update_uic_error(struct ufs_hba *hba)
>   static bool ufshcd_is_auto_hibern8_error(struct ufs_hba *hba,
>   					 u32 intr_mask)
>   {
> -	if (!ufshcd_is_auto_hibern8_supported(hba))
> +	if (!ufshcd_is_auto_hibern8_supported(hba) ||
> +	    !ufshcd_is_auto_hibern8_enabled(hba))
>   		return false;
>   
>   	if (!(intr_mask & UFSHCD_UIC_HIBERN8_MASK))
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 2ae6c7c8528c..81c71a3e3474 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -55,6 +55,7 @@
>   #include <linux/clk.h>
>   #include <linux/completion.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/bitfield.h>
>   #include "unipro.h"
>   
>   #include <asm/irq.h>
> @@ -773,6 +774,11 @@ static inline bool ufshcd_is_auto_hibern8_supported(struct ufs_hba *hba)
>   	return (hba->capabilities & MASK_AUTO_HIBERN8_SUPPORT);
>   }
>   
> +static inline bool ufshcd_is_auto_hibern8_enabled(struct ufs_hba *hba)
> +{
> +	return FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK, hba->ahit) ? true : false;
> +}
> +
>   #define ufshcd_writel(hba, val, reg)	\
>   	writel((val), (hba)->mmio_base + (reg))
>   #define ufshcd_readl(hba, reg)	\
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
