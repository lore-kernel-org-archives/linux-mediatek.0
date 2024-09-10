Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4542AEDE9AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 18:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRpBILn97hQlAgqu+BPpd8j0wIORp8/sYsHHAPwOHwk=; b=AzVjCMgioGC2Y8d5eQVLGRq9OZ
	WriamGu4FcluLim/1MHD28KpM+XlrEfiCyVtg0Gq9SdTkF0lDEyim/XI3LTM3WKCSnQFWBT2c8fcB
	J0mjELBMH9O6nQpukPf1BvHspd0Zbm2sAMG+bUxZ0Tec855YuRYnnTut9p12+fKybI/d1JNb3lOxX
	J84WLI5LIQPAmD7Nl70hGcehegvQo0oOLkVW20RyoCC5DtMKhYQKtzFiGSehgsyvvdyV+XYRZ+zk5
	bfo/Z/J6qH8iPEELM3w0rdVL4WnvzGIG3FPQignQwxmSyvwBoZSDLJjoL8w5fr+0Y6DnJ7g0ZmDRN
	AURsbLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so5AL-00000006gcw-021P;
	Tue, 10 Sep 2024 18:00:37 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so59W-00000006gSu-2vyv
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 17:59:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X3BL967XNzlgVnf;
	Tue, 10 Sep 2024 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1725991174; x=1728583175; bh=oRpBILn97hQlAgqu+BPpd8j0
	wIORp8/sYsHHAPwOHwk=; b=UD4IcbBkrLSUorg1mwaLj3gCH9px3fa3/cCIWLau
	Yi0TC9URYhFajnf5t4Xx6rkFrNoZk+jsnhvrC0du5Kr6oElQ/ecp8xvGr2gHc2RX
	/h5Kc7V62EB2570/EGWCWP1muZwaPCVoczra9dhbTh11nOSNGTaqnE53/JK5bOUq
	ErWn9eS9qqM/7YbqqjkQcsK43u4BJfvAMtsIv428kC4A3+wTUPlISJD5b+f14JYu
	IZskNUv4U8YkBONQ7QN5aVWi719R+QpO6tMPcCItbqk6H8ncbs6xPLelstjujOdG
	OJVevr8exVNRhq6KTBu5rwT8HR6I88x6sTQg1f26RFXwzw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id IFyM8jt2rizU; Tue, 10 Sep 2024 17:59:34 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X3BKw4H3dzlgTWQ;
	Tue, 10 Sep 2024 17:59:32 +0000 (UTC)
Message-ID: <e42abf07-ba6b-4301-8717-8d5b01d56640@acm.org>
Date: Tue, 10 Sep 2024 10:59:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ufs: core: requeue aborted request
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com, stable@vger.kernel.org
References: <20240910073035.25974-1-peter.wang@mediatek.com>
 <20240910073035.25974-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240910073035.25974-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_105946_800725_AB90F11E 
X-CRM114-Status: GOOD (  25.74  )
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

On 9/10/24 12:30 AM, peter.wang@mediatek.com wrote:
> ufshcd_abort_all froce abort all on-going command and the host
                    ^^^^^ ^^^^^              ^^^^^^^         ^^^^
                forcibly? aborts?            commands?   host controller?
> will automatically fill in the OCS field of the corresponding
> response with OCS_ABORTED based on different working modes.
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The host controller only sets the OCS field to OCS_ABORTED in MCQ mode
if the host controller successfully aborted the command. If the
abort TMF is submitted to the UFS device, the OCS field won't be changed
into OCS_ABORTED. In SDB mode, the host controller does not modify the 
OCS field either.

> SDB mode: aborts a command using UTRLCLR. Task Management response
> which means a Transfer Request was aborted.

Hmm ... my understanding is that clearing a bit from UTRLCLR is only
allowed *after* a command has been aborted and also that clearing a bit
from this register does not abort a command but only frees the resources
in the host controller associated with the command.

> For these two cases, set a flag to notify SCSI to requeue the
> command after receiving response with OCS_ABORTED.

I think there is only one case when the SCSI core needs to be requested
to requeue a command, namely when the UFS driver decided to initiate the
abort (ufshcd_abort_all()).

> @@ -7561,6 +7551,20 @@ int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
>   		goto out;
>   	}
>   
> +	/*
> +	 * When the host software receives a "FUNCTION COMPLETE", set flag
> +	 * to requeue command after receive response with OCS_ABORTED
> +	 * SDB mode: UTRLCLR Task Management response which means a Transfer
> +	 *           Request was aborted.
> +	 * MCQ mode: Host will post to CQ with OCS_ABORTED after SQ cleanup
> +	 * This flag is set because ufshcd_abort_all forcibly aborts all
> +	 * commands, and the host will automatically fill in the OCS field
> +	 * of the corresponding response with OCS_ABORTED.
> +	 * Therefore, upon receiving this response, it needs to be requeued.
> +	 */
> +	if (!err)
> +		lrbp->abort_initiated_by_err = true;
> +
>   	err = ufshcd_clear_cmd(hba, tag);
>   	if (err)
>   		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",

The above change is misplaced. ufshcd_try_to_abort_task() can be called
when the SCSI core decides to abort a command while
abort_initiated_by_err must not be set in that case. Please move the
above code block into ufshcd_abort_one().

Regarding the word "host" in the above comment block: the host is the 
Android device. I think that in the above comment "host" should be
changed into "host controller".

> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 0fd2aebac728..15b357672ca5 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -173,6 +173,8 @@ struct ufs_pm_lvl_states {
>    * @crypto_key_slot: the key slot to use for inline crypto (-1 if none)
>    * @data_unit_num: the data unit number for the first block for inline crypto
>    * @req_abort_skip: skip request abort task flag
> + * @abort_initiated_by_err: The flag is specifically used to handle aborts
> + *                          caused by errors due to host/device communication

The "abort_initiated_by_err" name still seems confusing to me. Please
make it more clear that this flag is only set if the UFS error handler
decides to abort a command. How about "abort_initiated_by_eh"?

Please also make the description of this member variable more clear.

Thanks,

Bart.

