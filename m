Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17680CE7AA0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRqrbLL/IkYQjEdfxlAqcVOgFpFtctrQ9TMTQ5NK0Ac=; b=w6K7wv2je/oDOHBwRQ9QF7Ercx
	lxxag0QGlksaBdf6tHl4ylcNJWlkwe+ov/mNFDK0HFGL0U9O/LCm+VQX6YDIJjvJTUL+Xjl6Xo7iR
	6XfCJZaz07O2dQoSMYwTXRRhhpskP44W90XrgwxqoEhHkyWdlYlvAoz1PNu3ZGve9u3UHkXkGOFaY
	MPc9zf/6FnARurbkvR041dHbToTqR2dONpYoT1JfIuOg9ruri4izTCEyF7FoXWz2bizOAElOdg8UC
	Z7nkEn13Yytr80mhRzZqHgZYGYyfrVnzqJR+PVxU9JEQCLmqQULR/wetMpUnv0DMmkUMw5K9pZbXb
	w1GDSJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smJrO-00000009rTa-2psl;
	Thu, 05 Sep 2024 21:17:46 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smJqV-00000009rGQ-27kv
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 21:16:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X0Bxt6gV5zlgMVQ;
	Thu,  5 Sep 2024 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1725571003; x=1728163004; bh=zRqrbLL/IkYQjEdfxlAqcVOg
	FpFtctrQ9TMTQ5NK0Ac=; b=IEfSPC+njuqLZi/CcmLZbIT9BMmZ4yCAVYMVbcr3
	AxR0cxhu3HxW4Q3wcFsTfznLZjYWs3oNx5Fgx08Qezq0ZR59Rg1Ki7zzByoqV6sp
	buFoaLDo5fuIQuJpgqtJkpx7oNcUG2dHPg20NXd5FO+VXQ601FJ+sHKC0CfnsvxH
	+8g6sxZj/dzKhcbkbBXTdnGIrVe4AYCfC/HtWHeq1MD/dpRq/+KvP4KN6s9OV79/
	9E8eMDTmNWYCC9M0NE+Nf2OmMLtIefDuI5aKCy6sKeeRBQAvAR9iULGrJlhH3pYS
	9lt2LHAgoJ0E567pvY4MZEb0me02GKTvo1OuES1IFqea2A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MDlJSuh_GfjV; Thu,  5 Sep 2024 21:16:43 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X0Bxh55c2zlgMVL;
	Thu,  5 Sep 2024 21:16:40 +0000 (UTC)
Message-ID: <b31bf24f-588e-43e5-b71f-b4e9edd1b60a@acm.org>
Date: Thu, 5 Sep 2024 14:16:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ufs: core: requeue MCQ abort request
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com, stable@vger.kernel.org
References: <20240902021805.1125-1-peter.wang@mediatek.com>
 <20240902021805.1125-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240902021805.1125-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_141651_680239_E506EA0C 
X-CRM114-Status: GOOD (  15.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/1/24 7:18 PM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index afd9541f4bd8..abdc55a8b960 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -642,6 +642,7 @@ static bool ufshcd_mcq_sqe_search(struct ufs_hba *hba,
>   		match = le64_to_cpu(utrd->command_desc_base_addr) & CQE_UCD_BA;
>   		if (addr == match) {
>   			ufshcd_mcq_nullify_sqe(utrd);
> +			lrbp->host_initiate_abort = true;
>   			ret = true;
>   			goto out;
>   		}

I think this is wrong. The above code is only executed if the SCSI core
decides to abort a SCSI command. It is up to the SCSI core to decide
whether or not to retry an aborted command.

> -	/* Release cmd in MCQ mode if abort succeeds */
> -	if (hba->mcq_enabled && (*ret == 0)) {
> -		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(lrbp->cmd));
> -		if (!hwq)
> -			return 0;
> -		spin_lock_irqsave(&hwq->cq_lock, flags);
> -		if (ufshcd_cmd_inflight(lrbp->cmd))
> -			ufshcd_release_scsi_cmd(hba, lrbp);
> -		spin_unlock_irqrestore(&hwq->cq_lock, flags);
> -	}
> +	/* Host will post to CQ with OCS_ABORTED after SQ cleanup */
> +	if (hba->mcq_enabled && (*ret == 0))
> +		lrbp->host_initiate_abort = true;

I think this code is racy because the UFS host controller may have 
posted a completion before the "lrbp->host_initiate_abort = true"
assignment is executed.

> + * @host_initiate_abort: Abort flag initiated by host

What is "Abort flag"? Please consider renaming "host_initiate_abort"
into "abort_initiated_by_err_handler" since I think that aborted
commands should only be retried if these have been aborted by
ufshcd_err_handler().

Thanks,

Bart.

