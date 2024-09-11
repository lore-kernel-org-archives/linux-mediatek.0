Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C91EE57CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9EpBtYvSc90pvHVRZDTNXzNjSD4J58qXNz69nDxiwM=; b=DBY7OEpzQI3nPY2Rgpw7zUa2fe
	v3Yq8cPrvc2WLxOoGzjeOMA/cnwJpbsgOU8U5R9j4skn3IqOFGX0pjc0SvcskLcRbWgK9NoOjQ5Nk
	VGdeFXYx4/CWIr26IsI0R7bEoeffGiueYmWDCVMSJCnUXzs/ZnxYFMX3EIpUs2JdyuI4Z3nEdZ9ch
	NpNktFnMLsgAwOk4cOYE2DlleAQFbmsORS8RsPDtHo9pFYV715hZ33A3Grq31c3r3Fl3aGONw81jH
	6Rp+6r3EtlCxIk8f5K0TXrEUSmQybDbFFzV+ELGHlZvMzL6I1k/ZyYXFej2yvP3vFJNDUKqeCRWZ+
	SVhLm1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soT9j-0000000Almp-1JUR;
	Wed, 11 Sep 2024 19:37:35 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soT9g-0000000AlmM-1YGw
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 19:37:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X3rSW51hBz6CmLxY;
	Wed, 11 Sep 2024 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726083439; x=1728675440; bh=E9EpBtYvSc90pvHVRZDTNXzN
	jSD4J58qXNz69nDxiwM=; b=ou/b4dqVvrr7QJllkAoBXmooxYhnAXyPsxwCdkHr
	csHy2NeWZxuto+RY08gHYjnjYTRqvN5MDdUv7bPIO5dLYNjLhGH55zJTWMxviBaY
	Lk13EpzQOsCYl02Ejxl6fqaZYX+W+eB3HTQ3K2jGH31TaKmc2DmCpNNuFNchx8uA
	aLg+oEUwKNOLh8SccEujFtqjQpGRqVLrhAZ85Z3nPOc2elh/+Bnmy7UzojAPJg6J
	0KKY3uWdFec8a96Lv8A8QRMBKKWZaHECUhpPNDb9knw7AWXALdMvGspgBic4/8Xk
	qWr6t9LKX1eQzPU97UbwfMnHZrwWveax0nQo9aUeKYheAw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jSx--RPVCpcz; Wed, 11 Sep 2024 19:37:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X3rSB1xyxz6ClY9P;
	Wed, 11 Sep 2024 19:37:13 +0000 (UTC)
Message-ID: <55d2cca5-0e30-4734-aa25-d5f5cdfbfd93@acm.org>
Date: Wed, 11 Sep 2024 12:37:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] ufs: core: requeue aborted request
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com, stable@vger.kernel.org
References: <20240911095622.19225-1-peter.wang@mediatek.com>
 <20240911095622.19225-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240911095622.19225-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_123732_464962_FC922359 
X-CRM114-Status: GOOD (  18.24  )
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

On 9/11/24 2:56 AM, peter.wang@mediatek.com wrote:
> ufshcd_abort_all forcibly aborts all on-going commands and the host
> controller will automatically fill in the OCS field of the corresponding
> response with OCS_ABORTED based on different working modes.
> 
> MCQ mode: aborts a command using SQ cleanup, The host controller
> will post a Completion Queue entry with OCS = ABORTED.
> 
> SDB mode: aborts a command using UTRLCLR. Task Management response
> which means a Transfer Request was aborted.

I think this is incorrect. The UFSHCI specification does not require a
host controller to set the OCS field if a SCSI command is aborted by the
ABORT TMF nor if its resources are freed by writing into the UTRLCLR
register.

> @@ -5404,7 +5405,10 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
>   		}
>   		break;
>   	case OCS_ABORTED:
> -		result |= DID_ABORT << 16;
> +		if (lrbp->abort_initiated_by_eh)
> +			result |= DID_REQUEUE << 16;
> +		else
> +			result |= DID_ABORT << 16;
>   		break;

Is the above change necessary? ufshcd_abort_one() aborts commands by
submitting an ABORT TMF. Hence, ufshcd_transfer_rsp_status() won't be
called if aborting the command succeeds.

> @@ -7561,6 +7551,21 @@ int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
>   		goto out;
>   	}
>   
> +	/*
> +	 * When the host software receives a "FUNCTION COMPLETE", set flag
> +	 * to requeue command after receive response with OCS_ABORTED
> +	 * SDB mode: UTRLCLR Task Management response which means a Transfer
> +	 *           Request was aborted.
> +	 * MCQ mode: Host will post to CQ with OCS_ABORTED after SQ cleanup
> +	 *
> +	 * This flag is set because error handler ufshcd_abort_all forcibly
> +	 * aborts all commands, and the host controller will automatically
> +	 * fill in the OCS field of the corresponding response with OCS_ABORTED.
> +	 * Therefore, upon receiving this response, it needs to be requeued.
> +	 */
> +	if (!err && ufshcd_eh_in_progress(hba))
> +		lrbp->abort_initiated_by_eh = true;
> +
>   	err = ufshcd_clear_cmd(hba, tag);
>   	if (err)
>   		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",

The above change will cause lrbp->abort_initiated_by_eh to be set not
only if the UFS error handler decides to abort a command but also if the
SCSI core decides to abort a command. I think this is wrong.

Is this patch 2/2 necessary or is patch 1/2 perhaps sufficient?

Thanks,

Bart.

