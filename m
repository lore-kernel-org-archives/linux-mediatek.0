Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6076DC48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 17:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34224613CB
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 17:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34224613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iIBetxKJxFKm8Y8jsGACaM3k4adqP9/0oHqH26S0FI=; b=JJahcNTSqg8fiE
	Zp+gZ8+B3x5AbILI5JrPLmGaHUF0jQ4WowRreQrNaCk3xpgV4ArhcWEN0GOK59kgd8offzpDSbS+M
	pkGh/+pKQD4P+UZfyT9jqE4bInN6DAsm1mG4ZeQZT1A9APyO48MnztM90/FI6LgJV6dwV0wetrbEX
	+LIZmXuhNy9HKpniYHO7xF4PoaCrjLc1t21AtdIfTmh9uvXg0DJv2Y4xvLeJ53mwexlx9JgWE5px1
	+p09MBtqGJZxAPc9lkvceD6adIOKKWSUOLHqYSrN9dx+uaaEq4W0whKEoFxqHTGGjwgzinb5VMibb
	aHlU+qM590MQ6kbr0Huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr2Ig-00FPGL-0d; Wed, 09 Jun 2021 17:47:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr1yQ-00FI8O-Aj; Wed, 09 Jun 2021 17:26:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E00A60FF0;
 Wed,  9 Jun 2021 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623259597;
 bh=FpoCLV9AugRc/VDev7vPQc6huezBsa4q91oamgMCi5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLOK9mUD+/TKJsoyTz8L0eBkVX43pGvWLc5FpY6jTYXm9zQH9xDeb8eVBxYr7141D
 oOihLl1UDsYd8WcVKymY7cYRTAlm3IBdGHGVhpv44a485uzGP1mU2iQkVxmZiW6Yrr
 CYpWet4OJByewcGJb/e+Cvsm73g/rtgPybRmUxF8PG+VXeTf6OD/vvfSdsYhqew/B4
 C0t3li6a730oPWMd8/cLa8kLP3IXqdVjxFEe9oxvSmIAfWpXEc7rcRa8D36ghB0lqZ
 Z36gt8FMHm2fGxJbUpKIFxdjCg1lUZChHzTVUM7Jf/XD/gFw/osviQV2csVEl4jxOF
 21rQWy31RN3pg==
Date: Wed, 9 Jun 2021 10:26:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Can Guo <cang@codeaurora.org>
Cc: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Bean Huo <beanhuo@micron.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] scsi: ufs: Fix a possible use before initialization
 case
Message-ID: <YMD5xoeiE7+wrCEK@archlinux-ax161>
References: <1623227044-22635-1-git-send-email-cang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623227044-22635-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_102638_435847_69265E62 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Jun 09, 2021 at 01:24:00AM -0700, Can Guo wrote:
> In ufshcd_exec_dev_cmd(), if error happens before lrpb is initialized,
> then we should bail out instead of letting trace record the error.
> 
> Fixes: a45f937110fa6 ("scsi: ufs: Optimize host lock on transfer requests send/compl paths")
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Can Guo <cang@codeaurora.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Change since V2:
> - Removed unused goto out_put_tag
> 
> Change since V1:
> - Use codeaurora mail in Signed-off-by tag
> 
>  drivers/scsi/ufs/ufshcd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index fe1b5f4..25fe18a 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -2980,7 +2980,7 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
>  	WARN_ON(lrbp->cmd);
>  	err = ufshcd_compose_dev_cmd(hba, lrbp, cmd_type, tag);
>  	if (unlikely(err))
> -		goto out_put_tag;
> +		goto out;
>  
>  	hba->dev_cmd.complete = &wait;
>  
> @@ -2990,11 +2990,10 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
>  
>  	ufshcd_send_command(hba, tag);
>  	err = ufshcd_wait_for_dev_cmd(hba, lrbp, timeout);
> -out:
>  	ufshcd_add_query_upiu_trace(hba, err ? UFS_QUERY_ERR : UFS_QUERY_COMP,
>  				    (struct utp_upiu_req *)lrbp->ucd_rsp_ptr);
>  
> -out_put_tag:
> +out:
>  	blk_put_request(req);
>  out_unlock:
>  	up_read(&hba->clk_scaling_lock);
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
