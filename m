Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473B9C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlHsZBG0ubyVPIWpEZLCYm37S4hYQYc13Mho9GhdGSQ=; b=otJOf2ZPkkHVJlJ+vslVYT//In
	GzVVsqhfZzDmb1EWOGyPMCUin6RDBngGAhg3CaO+KwlhxE5RQTUqbOR571rdi5Wzlbu59lZ7WWM0I
	nADZTTpFavdaF0/f8NMM+hWWCd2xYGUt0w57igd0knrXJlxfx3I4iTt4fwdGdneyVbT4g0oiTU5QT
	AaH2WrADS76UNEBWQGr0vgPlHlSHIQrS/OPgxEbPzLwR13TL8/IgnesOxDgv9nwdtkdmqBrR8jWdi
	xgmneEbm+7SMWEhBgluP/i7JXmWOHL506I1HS0MESOVUfDcMssx3cQKe5Nqab5XI0YbT4ojvUWwbN
	YLVnq/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLo15-00000000DM3-420k;
	Mon, 24 Jun 2024 18:02:11 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLo12-00000000DLA-2WnK
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 18:02:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W7G4v208Jz6Cnk8y;
	Mon, 24 Jun 2024 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719252117; x=1721844118; bh=BlHsZBG0ubyVPIWpEZLCYm37
	S4hYQYc13Mho9GhdGSQ=; b=Ce/EeXgveArhIBuWatIbDFKbvMh2nLuAHE97TUfi
	o8tlrOjTqhJXjH0D00qXh638iWW92PZznoyHr2pvsh1hcUX8yANtT9PmI8K+Ll5A
	lWmmwje2qbVYT3ygZUSHZJuN7FcxWd0hh34LJybHyMKqw+bonDVaaGExMM9cPvte
	Oe1QUTvebyGkJEUa7q9W1oVsVd454N6U7g7+xUPv5jG1XIthK6bCqzhzWMYAD6Zb
	oEt0c4Q+O9qDQmP/auCUa6QkmG/w1hNSaRPIwC34g+r1jeW3cAouF39hx1V/MHbF
	j6qgdSdICLy99IIbynbkOVrde9aKC5IL/mg3Nj4EZaIH+Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aDG0ypCUIWgA; Mon, 24 Jun 2024 18:01:57 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W7G4b5xckz6Cnk8t;
	Mon, 24 Jun 2024 18:01:51 +0000 (UTC)
Message-ID: <eec48c95-aa1c-4f07-a1f3-fdc3e124f30e@acm.org>
Date: Mon, 24 Jun 2024 11:01:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, quic_nguyenb@quicinc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com,
 stable@vger.kernel.org
References: <20240624121158.21354-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240624121158.21354-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_110208_715761_E5634E3E 
X-CRM114-Status: GOOD (  14.15  )
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

On 6/24/24 5:11 AM, peter.wang@mediatek.com wrote:
 > [ ... ]
In this patch there are two call traces, two fixes tags and two code
changes. Please split this patch into two patches with each one call
trace, one Fixes: tag and one code change. Additionally, please include
a changelog when posting a second or later version.

> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 8944548c30fa..3b2e5bcb08a7 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -512,8 +512,9 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
>   		return -ETIMEDOUT;
>   
>   	if (task_tag != hba->nutrs - UFSHCD_NUM_RESERVED) {
> -		if (!cmd)
> -			return -EINVAL;
> +		/* Should return 0 if cmd is already complete by irq */
> +		if (!cmd || !ufshcd_cmd_inflight(cmd))
> +			return 0;
>   		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
>   	} else {
>   		hwq = hba->dev_cmd_queue;

Does the call trace show that blk_mq_unique_tag() tries to dereference 
address 0x194? If so, how is this possible? There are
only two lrbp->cmd assignments in the UFS driver. These assignments
either assign a valid SCSI command pointer or NULL. Even after a SCSI
command has been completed, the SCSI command pointer remains valid. So
how can an invalid pointer be passed to blk_mq_unique_tag()? Please
root-cause this issue instead of posting a code change that reduces a
race window without closing the race window completely.

Thanks,

Bart.


