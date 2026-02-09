Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65126E7E0BC
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dk4BwK/9RO402mwDbbLyYl5dbYCrt0aBAKPtqoxqwm0=; b=x8xISsVw8bewz/vsYNlpPMvi35
	POiZ+XcSMqXw2uaz4120akRuY1hhq8ycflM1gpVTSGriZpy9fTt7wRiWN/xyBMfoTB7FGSgbn4U+3
	iaji/xB9UpAcfcReuSXJxSXhbycEJFxEG0kLT6op0wbgH6luDibgbo2Dx1BDoIVbfch+nmHynvzLR
	2+Dpxc/mSMaO2A8xVzY2KLx7LyDeW5MA4GieJa5jUQjnRrXneGeK2JbEW8j2P009E4Gmo4NYoudIw
	AhWlBzK6smbBezYgxMWA34PC/zPzHSM4nv3XfeCHqtmjRllWeVEAoYNOUifn9GIwGCNEREAOMAQ2T
	WTc4ARmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUSb-0000000Fig6-48Fo;
	Mon, 09 Feb 2026 16:50:06 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUSZ-0000000Fifd-0VTN
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 16:50:04 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4f8rK62kHMzlfddr;
	Mon,  9 Feb 2026 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1770655799; x=1773247800; bh=Dk4BwK/9RO402mwDbbLyYl5d
	bYCrt0aBAKPtqoxqwm0=; b=si1BLDeK8NSOpeykrJ/ZgA5fEX/10zz1KncA0tdj
	5WdhpbQDcbVoLlh3kIMapGNbxZFTmtJ/T9WQJGyAaTyoYemOpAWzctdKtttGb3pl
	HSmq6tww8jxaGHm3BjutAXIYiK9Kw26X8uoMPYXksRUjunuW3Djx48FWZhIbu94M
	j9QtRkPeg4t2uuJSBrDnjIVCrfiNs0sbnSrxJVuNuC2TYs7oSM1I2P8+I1McVwsy
	Ms1ElEfepFw4+hVE7PY9FPtX3WJ1C6dgL/pvpA/fQvccYLgCwfklgQTMiaX4mcGB
	yTdTYAppod82LzWemD2Yl9iPFWeHHh0B8Le/M6y0KNTDjg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jCYjlTVgbSTq; Mon,  9 Feb 2026 16:49:59 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4f8rJz6YLJzlfvq7;
	Mon,  9 Feb 2026 16:49:55 +0000 (UTC)
Message-ID: <19842000-3d35-4585-903b-2c194efce209@acm.org>
Date: Mon, 9 Feb 2026 08:49:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: support UFS 4.1 CQ entry tag
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260209122101.1529379-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260209122101.1529379-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_085003_643542_F2910CD3 
X-CRM114-Status: GOOD (  10.51  )
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

On 2/9/26 4:20 AM, peter.wang@mediatek.com wrote:
> The UFS 4.1 specification introduces a new completion queue(CQ)
> entry format, allowing the tag to be obtained directly.

UFS -> UFSHCI

> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index ad0ada57959a..d8b5cf18a01c 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -273,13 +273,18 @@ void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i)
>   EXPORT_SYMBOL_GPL(ufshcd_mcq_write_cqis);
>   
>   /*
> - * Current MCQ specification doesn't provide a Task Tag or its equivalent in
> + * UFS 4.0 MCQ specification doesn't provide a Task Tag or its equivalent in
>    * the Completion Queue Entry. Find the Task Tag using an indirect method.
> + * UFS 4.1 and above can directly return the Task Tag in the Completion Queue
> + * Entry.
>    */

UFS -> UFSHCI

Otherwise this patch looks good to me.

Thanks,

Bart.

