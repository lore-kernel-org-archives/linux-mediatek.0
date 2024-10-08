Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B99CEFC39
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaCy1d6oT42CbA25Y6wFA1tHoxNRupG+1o0LjdZp+XY=; b=geqOMJ6XR0GoceDUKuiJdny2X3
	JCo4Jy40DqEzhfY2eHGLG+LUE1li386IivevXyf2BUwA9zsAnHotaxhC6+2ikTxNKNCI4/kDkovgD
	I0lLnqu7VQPFvwDQeTMZwJyDPiOisaPnCfMXgGDzQ+hfG7jSrXvu5IXjIO82RM2CF2H+9ijzrWPoX
	b8p7I4kUq/BIXLIHTizj4Wy0vvrxrt/H94PMDNtAa1zd9OmwFxlyqk8oy458MTaVzB+XMNtrAxVpr
	OUT5q9TivJ3xLD8cnDCjTT+iteACVk5OXofFe14Sfq3CyJkg8Bod1VempsbHX5GHocw1lyrBmR18m
	sJlNQpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syEJ4-00000006hdz-2rvU;
	Tue, 08 Oct 2024 17:47:34 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syEAq-00000006fjL-3IUg;
	Tue, 08 Oct 2024 17:39:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XNNYL56WLzlgTWP;
	Tue,  8 Oct 2024 17:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1728409138; x=1731001139; bh=VaCy1d6oT42CbA25Y6wFA1tH
	oxNRupG+1o0LjdZp+XY=; b=wG+lyD59i/sC8Kk0iQQFuI8i8rNant2FyKuJpUIA
	JdCVSEvTQsusxvuvtfqN7NkPd5ZSIITRDy6LjpWLJ0xTzUdf9zmdYlADhqUyDpTQ
	hvDLBrLGjtM+IXXD4aQSc5RiWg1u6JqQmWdbKu9ZxNbIgHN4LljFiAySyE1ZkY4p
	NMr/WGyLAKclUHjidpq52Ki36vSW82suWiHXY6oWcKGS0lTghQKzzi97nCaZNAvF
	hhKKsc/u0osQ7fDjA52OrwYD7wLej6bIkWXu4uaEMlXEWQn7AjfS0RYrRLRGOY3p
	2qvNsipIf3CnjQ1gf0wImqn7XH6UxhAH2eNq4eI0yOZURw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id XdEfBOYOx29x; Tue,  8 Oct 2024 17:38:58 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XNNYB1SGJzlgTWK;
	Tue,  8 Oct 2024 17:38:53 +0000 (UTC)
Message-ID: <7b3b29ee-8e2d-476b-8edd-290c3f00dc85@acm.org>
Date: Tue, 8 Oct 2024 10:38:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: configure individual LU queue
 flags
To: ed.tsai@mediatek.com, peter.wang@mediatek.com,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stanley Jhu <chu.stanley@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, chun-hung.wu@mediatek.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241008065950.23431-1-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241008065950.23431-1-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_103904_888428_6FE45165 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On 10/7/24 11:59 PM, ed.tsai@mediatek.com wrote:
> +static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
> +{
> +	struct ufs_hba *hba = shost_priv(sdev->host);
> +
> +	dev_dbg(hba->dev, "lu %llu scsi device configured", sdev->lun);
> +	if (sdev->lun == 2)
> +		blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
> +}

There are no block drivers in the upstream kernel that set
QUEUE_FLAG_SAME_FORCE. An explanation is missing from the patch
description why this flag is set from the UFS driver instead of by
writing the value "2" into /sys/class/block/$bdev/queue/rq_affinity.
Additionally, an explanation is missing why QUEUE_FLAG_SAME_FORCE is
set but QUEUE_FLAG_SAME_COMP not.

Bart.

