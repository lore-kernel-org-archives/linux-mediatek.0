Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1DFC64E7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 05:33:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100F220758
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 05:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 100F220758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GQMcR+FwIgBAaLpvkkNTLX1uPgW3kw29QTwxzm3EpgE=; b=t/UaLNBn3FeAeqA/wwlFXEGLR
	94cowSbPMHOs7k8/aHcQtf2tgZKS5R6Uw5ZTdQqJbpwxFJ7HsewEN2uU4SyMZfMxQYg6QeCfr+5hT
	ahhoF9zRMQozLFaqgtZ9h4LMFzQHaZtQR5kCs87b5pKPXwbOZkNj33R+dC+MacXckuabmu0UrcfVv
	GQunCpkk8/iEsEMZREeA+2KkXTshHadVCG3AadV4bCz8RE2wavc3x8z2pDkO7oH8UbyO0ttgnjJmh
	ragYvtBAuv7ibGq23Shf3N6Ot28WxSDVA0II8G14BsNZr7MP6jRQ3z65mPf1FZrJy9e8t1CW6jZgG
	xn5N60+xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhFK-0006jH-JG; Thu, 03 Dec 2020 05:33:38 +0000
Received: from a2.mail.mailgun.net ([198.61.254.61])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhFI-0006it-CC
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 05:33:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606973615; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sqV3wNOA6wV/oHBe9aLAtgMazUTZWFPTZRerFCF5Yc8=;
 b=ETXDEPns0osFwRQRKPEGGlIVUNaj6ejMQdoQ+863dx3xPDkZx0oFFdyZe/mqxMrB/BuOuGux
 mdVvvODrJzRgYe+rZY9m2lojfHA2V/wIsCLz1qEq2+9vI4hidd4c0zhtIoUQHZE64d730o49
 stUwZpx++TBDNuoi1If9ke7Wx94=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fc878ae89b9bc626853ce16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 05:33:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 96FF9C43464; Thu,  3 Dec 2020 05:33:33 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B3D9C433ED;
 Thu,  3 Dec 2020 05:33:32 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 13:33:32 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: Add error history for abort event in
 UFS Device W-LUN
In-Reply-To: <20201126053839.25889-2-stanley.chu@mediatek.com>
References: <20201126053839.25889-1-stanley.chu@mediatek.com>
 <20201126053839.25889-2-stanley.chu@mediatek.com>
Message-ID: <e22b55de9d0b0dd26b26b1425180592c@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_003336_469138_1AC788F3 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-26 13:38, Stanley Chu wrote:
> Add error history for abort event in UFS Device W-LUN.
> Besides, use specified value as parameter of ufshcd_update_reg_hist()
> to identify the aborted tag or LUNs.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 0e5473d4699b..28e4def13f21 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6742,8 +6742,10 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>  	 * To avoid these unnecessary/illegal step we skip to the last error
>  	 * handling stage: reset and restore.
>  	 */
> -	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN)
> +	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN) {
> +		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, lrbp->lun);
>  		return ufshcd_eh_host_reset_handler(cmd);
> +	}
> 
>  	ufshcd_hold(hba, false);
>  	reg = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
> @@ -6767,7 +6769,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>  	 */
>  	scsi_print_command(hba->lrb[tag].cmd);
>  	if (!hba->req_abort_count) {
> -		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, 0);
> +		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, tag);
>  		ufshcd_print_host_regs(hba);
>  		ufshcd_print_host_state(hba);
>  		ufshcd_print_pwr_info(hba);

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
