Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429BCC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 06:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D60F20663
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 06:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PQKoyJbZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="TLdMSbL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D60F20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6xZF+ZN6wQJh/QoC/hFg8sUofkhIvvjpPhjHaFyhhcA=; b=PQKoyJbZNIjYE9wNkQdJ6RTf9
	jmDiK3YkzLgZ5Woe2UHChkm4JYccSmT2pPJzKxAwHYmkm6rRCd4shuPKrhSQCxNdskvy64VdDrgZl
	RroIXfepkCC1VLzNk1Yf8To+KR7v0IGLzgn5odpaShmxCdO7OblC12qRAk2yO72uNZZgYGjs/pOZ6
	UUWDfbTkPL1LvounGGVIe7Mpla3HbwBaHt5eAG0JrS5xsJ8D5tDN3wpC1I9Lt4J4z0fyHRwgYc7Wc
	PyjZK/2zOTdpGhz8CzcVedVLayhXOWgsE+5P8jp7J1OQA5bzxYy3O67V96wJjRGcL9/oPWcVIVoX/
	RKbzwFvCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDjLF-0002qN-3t; Mon, 16 Mar 2020 06:35:13 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDjLA-0002bt-LT
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 06:35:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584340510; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OwErceFW23ZNn6eud/cydjRhiFjDFARC1CNzkO9VKPQ=;
 b=TLdMSbL1DP+O3mwK9v/WaFAqKuGoYz1fiaVEitNFTRIMZazCJwk7d6DQcexLRqc1QtDQ5T5B
 Euvf3R2ITT1IS9ySrYSZKQ2vwiCbibzPW0x5z0KiKB8OeB8q0uAG2URQ8QUtFchs81k70o5m
 KGS2Mn5n/vSeoGAg39sPXgWVVP4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6f1e09.7f25e78b03b0-smtp-out-n01;
 Mon, 16 Mar 2020 06:34:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D356C4478C; Mon, 16 Mar 2020 06:34:48 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F0662C433D2;
 Mon, 16 Mar 2020 06:34:41 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 16 Mar 2020 14:34:41 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v5 7/8] scsi: ufs: make HCE polling more compact to
 improve initialization latency
In-Reply-To: <20200316034218.11914-8-stanley.chu@mediatek.com>
References: <20200316034218.11914-1-stanley.chu@mediatek.com>
 <20200316034218.11914-8-stanley.chu@mediatek.com>
Message-ID: <b25d211adfe0f14c729dbf4e6eb5e159@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_233511_011793_1F787551 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, martin.peter~sen@oracle.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-03-16 11:42, Stanley Chu wrote:
> Reduce the waiting period between each HCE (Host Controller Enable)
> polling from 5 ms to 1 ms. In the same time, increase the maximum 
> polling
> times to make "total polling time" unchanged approximately.
> 
> This change could make HCE initializatoin faster to improve latency of
> ufshcd initialization, error recovery, and resume behaviors.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Avri Altman <avri.altman@wdc.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufshcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index dcbf45d547d8..cd33d07c56cf 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4301,7 +4301,7 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
>  	ufshcd_wait_us(hba->hba_enable_delay_us, 100, true);
> 
>  	/* wait for the host controller to complete initialization */
> -	retry = 10;
> +	retry = 50;
>  	while (ufshcd_is_hba_active(hba)) {
>  		if (retry) {
>  			retry--;
> @@ -4310,7 +4310,7 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
>  				"Controller enable failed\n");
>  			return -EIO;
>  		}
> -		ufshcd_wait_us(5000, 100, true);
> +		ufshcd_wait_us(1000, 100, true);
>  	}
> 
>  	/* enable UIC related interrupts */

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
