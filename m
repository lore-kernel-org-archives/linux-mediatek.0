Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503C9EC1114
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPpFcSeau7Gf5T+AlcnvIXzzk2Xfytp8JNl+DHgmVgg=; b=JFbVyNc/XmugLlAcoUDZpUCcQK
	X95a+yOWuJ4ViARPROvmPid+U6IoudRgWge6hOZTy6czJBro0SLSk8yAcT3S1rm+j6zB3DFqYfUU+
	OBuDscBp4ey3XeA/Fg19uUcFxFsIjov+AaIENVKOtK0CWlXyHelFjJhS8JoQ1HsbRJ2W9gL2vBuBE
	uPQe1BvVtmR7P8yErW++Z7a7B+Mb2UKkwXpKisSZCh6eHtNCBstzo+/dbnMIOeoIUpr13UjDms/jK
	gaCB4sDuTiJS6evTZ81XaMBK15qx+gNSIHJUPH7sLA+oNklN2B6m/5S4524CoUCXS4fS987NA5rnA
	YZeKxUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZV3-00000000jYH-10BP;
	Mon, 23 Feb 2026 17:13:37 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZV0-00000000jXv-2J40
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:13:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fKS9p04ldz1XLyhN;
	Mon, 23 Feb 2026 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1771866811; x=1774458812; bh=oPpFcSeau7Gf5T+AlcnvIXzz
	k2Xfytp8JNl+DHgmVgg=; b=dXfWs53vD0knK4w3w5yRjw2N0JQjKPpT+emD3JSw
	tn2PVNYOSXvf2Z/phY/tPI7RbCXvyEZCOYGLK745TDliTAAyTTMAG1qtA0HtdVuJ
	S0MD6kRSSPUK/baZd7evIdwW1Etyi+2+zD5ZuNtzSqxiATOEfLHXkLsQdYzxkS4F
	WLuC2TBK6UXToIPdVzfPgCdaJs6o0D1FOczByZhEsVNRyR1VxrvoIznnX5EpOfua
	N/LOHpoXLYL00Jb5QWDj7po49T9/O5N6RJhC2/AGqhOb9CcfA9uKFJC90hLWRstH
	vPuhDJlyrDQWfKnPJ3l52tD+WAh3/1YhyLVGPvplmnn5JA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id F1Eg1G2IcSFi; Mon, 23 Feb 2026 17:13:31 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fKS9f6vcsz1XLyhM;
	Mon, 23 Feb 2026 17:13:26 +0000 (UTC)
Message-ID: <5017b907-16de-4d7f-a7c6-dbc504ffd1eb@acm.org>
Date: Mon, 23 Feb 2026 09:13:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix possible NULL pointer dereference in
 ufshcd_add_command_trace()
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260223065657.2432447-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260223065657.2432447-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091334_607263_3055B669 
X-CRM114-Status: GOOD (  11.96  )
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

On 2/22/26 10:56 PM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index ec175a099459..44efb03765b9 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -515,8 +515,8 @@ static void ufshcd_add_command_trace(struct ufs_hba *hba, struct scsi_cmnd *cmd,
>   
>   	if (hba->mcq_enabled) {
>   		struct ufs_hw_queue *hwq = ufshcd_mcq_req_to_hwq(hba, rq);
> -
> -		hwq_id = hwq->id;
> +		if (hwq)
> +			hwq_id = hwq->id;
>   	} else {
>   		doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
>   	}

This will cause "-1" to be assigned to hwq_id instead of a queue number
if a request has already been completed. Wouldn't it be better to
introduce a new helper function that returns READ_ONCE(req->mq_hctx)
->queue_num instead of making the above change?

Thanks,

Bart.

