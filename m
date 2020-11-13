Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8956FC4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 05:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C098B2137B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 05:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AYZEX97F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GTh3QQk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C098B2137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YvOh3XGqIPPy7p62Xh2d+c2O2RDqstD1yiNJ7bWzr18=; b=AYZEX97FzXViyN7FPjZBIPDZQ
	yTvY3CbVFGWzZeVvLKL1GUpqkXz4jxMAQr64wk4RI9iaZzaaJiDtf5D+zmWKoUgCG/95fPfi8wecC
	9w3VcyDhPl9mpLM+oMGsXbrdiTuRaPF4DgrhECUCVcyvlTUE04P/fshFvuHcysmS3EVlxn42t0bIW
	47ivYv7ji7pRbhkTggYCSxR8P51rXuf2KZ4vp/YWbs4/vcpVjPENrPY5q1V4eDJei7WEYEkxQ9MqP
	C/C0zlmmLkmfr4zy6MhyLm3sdmIPj0155pyZehA2JPvfeo+WpzDcYsfTCXylTSGKV/pnmmIzebSFU
	fHetwyNCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdRdI-0005iz-AU; Fri, 13 Nov 2020 05:28:24 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdRdE-0005hm-1y
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 05:28:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605245297; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Z4CoPUQKb3P3VqbZKi4FCv9J+LRv6YJbMJ76h96Gghk=;
 b=GTh3QQk+uI9ZJnCK/XCc4HNJSbI7EDVkmUjWjA/xC/geBAav24GrC2vFIbiHX/ob/Kprw+ns
 4sVsOuCz/jRjhjTEQ1owAcN/GO3vtsQm5y/j8p9L5J5ts8utbIw1e+ftgYBRs6/HWYEEs07Z
 kiAhA45vkn5RG0yaepVutt9/x74=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fae196e24ba9b3b024b4617 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 05:28:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7B3A3C433CB; Fri, 13 Nov 2020 05:28:14 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C60DC433C6;
 Fri, 13 Nov 2020 05:28:13 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 13:28:13 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH] scsi: ufs: Add retry flow for failed hba enabling
In-Reply-To: <20201112054537.22494-1-stanley.chu@mediatek.com>
References: <20201112054537.22494-1-stanley.chu@mediatek.com>
Message-ID: <473d79ef475169fac15f04c8da8f849e@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_002820_142154_D48806A3 
X-CRM114-Status: GOOD (  19.24  )
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
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-12 13:45, Stanley Chu wrote:
> Once hba enabling is failed, add retry mechanism and in the
> meanwhile allow vendors to apply specific handlings before
> the next retry. For example, vendors can do vendor-specific
> host reset flow in variant function "ufshcd_vops_hce_enable_notify()".
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufshcd.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 8001bbfec5c0..9186ee01379a 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4328,8 +4328,10 @@ static inline void ufshcd_hba_stop(struct 
> ufs_hba *hba)
>   */
>  static int ufshcd_hba_execute_hce(struct ufs_hba *hba)
>  {
> -	int retry;
> +	int retry_outer = 3;
> +	int retry_inner;
> 
> +start:
>  	if (!ufshcd_is_hba_active(hba))
>  		/* change controller state to "reset state" */
>  		ufshcd_hba_stop(hba);
> @@ -4355,13 +4357,17 @@ static int ufshcd_hba_execute_hce(struct 
> ufs_hba *hba)
>  	ufshcd_delay_us(hba->vps->hba_enable_delay_us, 100);
> 
>  	/* wait for the host controller to complete initialization */
> -	retry = 50;
> +	retry_inner = 50;
>  	while (ufshcd_is_hba_active(hba)) {
> -		if (retry) {
> -			retry--;
> +		if (retry_inner) {
> +			retry_inner--;
>  		} else {
>  			dev_err(hba->dev,
>  				"Controller enable failed\n");
> +			if (retry_outer) {
> +				retry_outer--;
> +				goto start;
> +			}
>  			return -EIO;
>  		}
>  		usleep_range(1000, 1100);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
