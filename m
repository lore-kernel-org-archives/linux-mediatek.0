Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBB6C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:19:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC0021D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aCkhqTgw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="YAModGfo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCC0021D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pzqcVIvCdFX1pfbOxJMCPmXhyR59EYH4q5D+e5++2v0=; b=aCkhqTgwELVO0g/d9CHtODOKa
	6n4/nLvCWP0Z/aP1H0XWerm5hO2EnrVCnos+EkNYIyLrVNLF5rY0XnTcNVZBpH5pONnXxVuwkco8j
	oyUbm2HybwkaqWRLJzqWVDaQ/nlBqv8lIQiovXfbNAM+4B06eSphbNlca44rpxoQEj7JNHz1gWjiY
	5xIUXfBfXjyKH13uOAfG4Cn5XK0cGTPfwbbgUzc9cKwR8s7OGq4MEXgDRi+XFwgvPE4k/HxuUN6/0
	Y/EtK8XgLdVtsiiA+KWe6PI1xWkEjR/vxMA7kN68NIowrA+COlJ6Q4LvNy5l9XE19bwNO87+EyA01
	1pKPxBhYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvH5q-0006NY-HT; Tue, 14 Jul 2020 09:19:18 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvH5k-0006LU-3E
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 09:19:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594718355; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=G34pH1+jGv/zjZdCgkbH+kOlOPxiBnKrDKaAW/Rs6CE=;
 b=YAModGfoqDEsTMQG9ww1YFG+SriU+goUEAYM2GqfbSTUpLO1T8PZI2p3KBPk0bz33Vp1HJ6P
 ++0xYarPUA2yHuwRSDWtcA2XomRC5UV5jKy42URWNxtNwmpIV2N7LnLeiE7xlbcuzhpjYNS0
 IKSSJYRZsEgUxQaCB09QYmq9p+Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f0d7883b35196d59dfa515a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 09:18:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AAD32C43391; Tue, 14 Jul 2020 09:18:58 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 82595C433C8;
 Tue, 14 Jul 2020 09:18:56 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 17:18:56 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: Simplify completion timestamp for SCSI
 and query commands
In-Reply-To: <20200706060707.32608-2-stanley.chu@mediatek.com>
References: <20200706060707.32608-1-stanley.chu@mediatek.com>
 <20200706060707.32608-2-stanley.chu@mediatek.com>
Message-ID: <57a4128b5f620c2bac7c55a73074a6a7@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_051915_376419_7D808120 
X-CRM114-Status: GOOD (  13.51  )
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
 asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-06 14:07, Stanley Chu wrote:
> Simplify recording command completion time in
> __ufshcd_transfer_req_compl() by assigning lrbp->compl_time_stamp
> in an unified location.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufshcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 18da2d64f9fa..71e8d7c782bd 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4881,6 +4881,7 @@ static void __ufshcd_transfer_req_compl(struct
> ufs_hba *hba,
> 
>  	for_each_set_bit(index, &completed_reqs, hba->nutrs) {
>  		lrbp = &hba->lrb[index];
> +		lrbp->compl_time_stamp = ktime_get();
>  		cmd = lrbp->cmd;
>  		if (cmd) {
>  			ufshcd_add_command_trace(hba, index, "complete");
> @@ -4889,13 +4890,11 @@ static void __ufshcd_transfer_req_compl(struct
> ufs_hba *hba,
>  			cmd->result = result;
>  			/* Mark completed command as NULL in LRB */
>  			lrbp->cmd = NULL;
> -			lrbp->compl_time_stamp = ktime_get();
>  			/* Do not touch lrbp after scsi done */
>  			cmd->scsi_done(cmd);
>  			__ufshcd_release(hba);
>  		} else if (lrbp->command_type == UTP_CMD_TYPE_DEV_MANAGE ||
>  			lrbp->command_type == UTP_CMD_TYPE_UFS_STORAGE) {
> -			lrbp->compl_time_stamp = ktime_get();
>  			if (hba->dev_cmd.complete) {
>  				ufshcd_add_command_trace(hba, index,
>  						"dev_complete");

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
