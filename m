Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9841AC2D0D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 23:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611AF21582
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 23:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHiqqCSK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="jeProA8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611AF21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bpw2ADT29wWL3CrTRb5k+hrio6VJKKr7Zms+rs9y2RE=; b=fHiqqCSKgBFEJJbJMAD4mA6+Q
	ItSvtGiNK1JhLz6UbWK//XEULpe6cuiuHlaAGczQww6JoCFY4Pech5VXRhWR2ViZFm6WfYtKpucZB
	rY85dw8GGzL9R3RUHZoKm6evFTCO4fJh7LDYY8xmPdKb5KbE39H5W7rkOATC4WxgB/JuNrAa6aY6l
	BdGZFpzMRvRlH11mCGm06Qh0WPIv/y5oD9NGvwq1kUVDSgVKoflOF8Gq5xSZ9r49QYAtvRpMQXHKT
	lb0Oj2cyMcOL1DLDZ1+OQ8HPHNX8MWk2/Wgnh3bgNpK5Z3iccfb0w7TJr+m11wjaIvfRFVpHMTvrs
	WlBlEUP9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihj8U-00054k-J3; Wed, 18 Dec 2019 23:53:46 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihj8R-00053x-D8
 for linux-mediatek@lists.infradead.org; Wed, 18 Dec 2019 23:53:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576713222; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+dFcC2QCZE4EMyWiuaOLbaCWdMrLQF93LI0XXqLXM9Q=;
 b=jeProA8bYxA8/XOzpILgfTJADK1nTsHPbkw6P7Pv8tLFfHjWVfMkdOBf/4EsDWYGTxrNwiCk
 JZh07imb103juxaqeoXCrFi+npcR62HR/V/vzxBb5q0d4OswDoq0rNNrJAjc6q9IO+A0tQof
 ZmX1UuZ41VQ2KFqlJs+4ZDz/0GE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfabc04.7f61c1321a78-smtp-out-n01;
 Wed, 18 Dec 2019 23:53:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DEAF6C447A6; Wed, 18 Dec 2019 23:53:39 +0000 (UTC)
Received: from [10.46.161.159] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 090F0C433A2;
 Wed, 18 Dec 2019 23:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 090F0C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 2/4] scsi: ufs: export ufshcd_auto_hibern8_update for
 vendor usage
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 pedrom.sousa@synopsys.com, jejb@linux.ibm.com, matthias.bgg@gmail.com
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
 <1576224695-22657-3-git-send-email-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <ad0153db-93ad-0ecf-c2f3-1b76dda778d3@codeaurora.org>
Date: Wed, 18 Dec 2019 15:53:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576224695-22657-3-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_155343_507466_D3E0EBEF 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/13/2019 12:11 AM, Stanley Chu wrote:
> Export ufshcd_auto_hibern8_update to allow vendors to use common
> interface to customize auto-hibernate timer.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>   drivers/scsi/ufs/ufs-sysfs.c | 20 --------------------
>   drivers/scsi/ufs/ufshcd.c    | 18 ++++++++++++++++++
>   drivers/scsi/ufs/ufshcd.h    |  1 +
>   3 files changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
> index ad2abc96c0f1..720be3f64be7 100644
> --- a/drivers/scsi/ufs/ufs-sysfs.c
> +++ b/drivers/scsi/ufs/ufs-sysfs.c
> @@ -118,26 +118,6 @@ static ssize_t spm_target_link_state_show(struct device *dev,
>   				ufs_pm_lvl_states[hba->spm_lvl].link_state));
>   }
>   
> -static void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
> -{
> -	unsigned long flags;
> -
> -	if (!ufshcd_is_auto_hibern8_supported(hba))
> -		return;
> -
> -	spin_lock_irqsave(hba->host->host_lock, flags);
> -	if (hba->ahit != ahit)
> -		hba->ahit = ahit;
> -	spin_unlock_irqrestore(hba->host->host_lock, flags);
> -	if (!pm_runtime_suspended(hba->dev)) {
> -		pm_runtime_get_sync(hba->dev);
> -		ufshcd_hold(hba, false);
> -		ufshcd_auto_hibern8_enable(hba);
> -		ufshcd_release(hba);
> -		pm_runtime_put(hba->dev);
> -	}
> -}
> -
>   /* Convert Auto-Hibernate Idle Timer register value to microseconds */
>   static int ufshcd_ahit_to_us(u32 ahit)
>   {
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b5966faf3e98..589f519316aa 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -3956,6 +3956,24 @@ static int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)
>   	return ret;
>   }
>   
> +void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
> +{
> +	unsigned long flags;
> +
> +	if (!(hba->capabilities & MASK_AUTO_HIBERN8_SUPPORT))
> +		return;
> +
> +	spin_lock_irqsave(hba->host->host_lock, flags);
> +	if (hba->ahit == ahit)
> +		goto out_unlock;
> +	hba->ahit = ahit;
> +	if (!pm_runtime_suspended(hba->dev))
> +		ufshcd_writel(hba, hba->ahit, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +out_unlock:
> +	spin_unlock_irqrestore(hba->host->host_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_auto_hibern8_update);
> +
>   void ufshcd_auto_hibern8_enable(struct ufs_hba *hba)
>   {
>   	unsigned long flags;
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 2740f6941ec6..86586a0b9aa5 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -927,6 +927,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
>   	enum flag_idn idn, bool *flag_res);
>   
>   void ufshcd_auto_hibern8_enable(struct ufs_hba *hba);
> +void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
>   
>   #define SD_ASCII_STD true
>   #define SD_RAW false
> 

Looks good to me.

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
