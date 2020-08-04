Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB9DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 10:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225B22070A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 10:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="19lcP7Eo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="fh3cREYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225B22070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vNyz7NCKsKJ4stPHVZunNxRPzHtLlAn8nEWUotQSv7s=; b=19lcP7EouukHW2Tdtiuy7zG51
	Sp7n6bO66plXyfazxFbuvCSQzG769Mb5sgTxWaLy2wcZwyofF9pBASDcXWXswLveOgIljb4Z7i7oo
	YaKxj527CaTTm8y7D/rCZv+/2dJMH8AjOJC492P/EQw1GwlC0bdqtMMCudPGhE5EPsMDIRIlbx3ew
	Mns1hQp68CYhzHrXQgoQPYo2xOyR/A5LCHTCQOKxG7u1WiOKvQ68mrI4oTPiHhvTm6WAflF27xmqV
	j4xb40cNwlBGuwSygTU9Zk87rWaNCrK10C5CppzPj7vTvjZMhSY8TuRqFJNbLN5Gm2VZ6KoGG/LFZ
	J75AOBslw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2tlk-0004QO-BN; Tue, 04 Aug 2020 10:02:04 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2tlZ-0004NR-OL
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 10:02:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596535320; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YAQTCZ79EPZUswUxRse5WYWCeMi7TP/yJqj2ZFCTdds=;
 b=fh3cREYZnKWPXlzhhA4A2TI/JfzutMLvIOj+L/0EdyoHvZu2+xMEwyKCvFRPId4RxbqnevHI
 zWijGHIH9vGDAX8p0Dxa6QtQ+GgLOf+Y/58qGTYMpmJ9wDiCyib00yrabVIWErqxPHEwqJV6
 /q4T5N94lp+KfDpE9gSXtAmkaFo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f2931f014acd1952b1fcfd0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 10:01:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28935C43395; Tue,  4 Aug 2020 10:01:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 15242C433C9;
 Tue,  4 Aug 2020 10:01:19 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 04 Aug 2020 18:01:19 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
In-Reply-To: <20200724140246.19434-1-stanley.chu@mediatek.com>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
Message-ID: <d4a660cc4d9157989fb45b70e7eab0e7@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_060200_276837_2FA0BA1B 
X-CRM114-Status: GOOD (  17.93  )
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

On 2020-07-24 22:02, Stanley Chu wrote:
> If somehow no interrupt notification is raised for a completed request
> and its doorbell bit is cleared by host, UFS driver needs to cleanup
> its outstanding bit in ufshcd_abort(). Otherwise, system may behave
> abnormally by below flow:
> 
> After ufshcd_abort() returns, this request will be requeued by SCSI
> layer with its outstanding bit set. Any future completed request
> will trigger ufshcd_transfer_req_compl() to handle all "completed
> outstanding bits". In this time, the "abnormal outstanding bit"
> will be detected and the "requeued request" will be chosen to execute
> request post-processing flow. This is wrong because this request is
> still "alive".
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 577cc0d7487f..9d180da77488 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6493,7 +6493,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>  			/* command completed already */
>  			dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from 
> DB.\n",
>  				__func__, tag);
> -			goto out;
> +			goto cleanup;
>  		} else {
>  			dev_err(hba->dev,
>  				"%s: no response from device. tag = %d, err %d\n",
> @@ -6527,6 +6527,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>  		goto out;
>  	}
> 
> +cleanup:
>  	scsi_dma_unmap(cmd);
> 
>  	spin_lock_irqsave(host->host_lock, flags);

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
