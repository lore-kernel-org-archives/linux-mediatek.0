Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063CBCA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQC/JKHgtGrsJiCNW2Z3p+nWgYJUS6k58RGfZfgsCq8=; b=gokHwSYpxis+5gGF5x/iaI+tOg
	v9cD8Dfd7tl6sebZrA7TxiN8vLhK9e+vjIoU/FZ4x6j2jjYdSgmGY9iViDmiqE8SzXJXyH/PwYu64
	dxw4ZoycKBPs4jJsW+XgMAuX0IWMjISTMqn83E/OPfdt7roQHjamXEWd/hK8vcbPGbit6ckwU2J8G
	i9+UXTh4GcitdUyk6CD5zohFAzOJwAtVtmHTLJ+KSNKxHKyt2teRsGI/QM/jbEt0udKpF5xDWkaK3
	BrI+l6xpQfv4w69pPBr/aG6Czf+Q0J13VHwv4pXJ/g90p+zxCJ6AHVK4lSL8pRaZ3WmPZX0AxvA/I
	0H5uMVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa9B-00000008h7f-32oA;
	Mon, 25 Aug 2025 16:34:17 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZPM-00000008Z0g-3yQA
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 15:46:58 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4c9Zsn6Qmxzm1748;
	Mon, 25 Aug 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756136810; x=1758728811; bh=WQC/JKHgtGrsJiCNW2Z3p+nW
	gYJUS6k58RGfZfgsCq8=; b=syCfV9lXN1voBKvfmmoAfYUBjEZenHWnvrgLx8tN
	gG5uu6EaKG+kE4A19d6zhGf/HzJrTvRkw6DHOLc7szPnw8Li/QYOCoJUVi1TSnWB
	F0ml0/72p6/RsUgq0INkIYsHKkoGCWC3Qx4nMAA+7H0+yb2cvEnxMdF6XoFxUZ2c
	LSvoMpNa8ARbaFxemVl9pUVLhz1wgaQU3QIDvXCnrDi4ZXXDJQ+jYfHc9eRS6/jK
	G9T/BU94o7/lytO/qX6YrAme0qLr6MjGWV+gbHnAbTqNygs/nsN870xxCtBupkck
	xxgQObuNmHp5V58MvAmV99Qcz9bixByYJVWWqbDoPVGJxA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ErtzJIO4oFjW; Mon, 25 Aug 2025 15:46:50 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4c9ZsR0SHVzm0yVB;
	Mon, 25 Aug 2025 15:46:33 +0000 (UTC)
Message-ID: <5f3c62fb-ed35-428c-8862-ad1fe607daa0@acm.org>
Date: Mon, 25 Aug 2025 08:46:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] ufs: host: mediatek: Enhance recovery on
 hibernation exit failure
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, sanjeev.y@mediatek.com
References: <20250825101815.2891905-1-peter.wang@mediatek.com>
 <20250825101815.2891905-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250825101815.2891905-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_084657_073395_BBBC5A2E 
X-CRM114-Status: UNSURE (   9.22  )
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

On 8/25/25 3:10 AM, peter.wang@mediatek.com wrote:
> @@ -1697,8 +1698,20 @@ static void ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
>   	ufs_mtk_wait_idle_state(hba, 5);
>   
>   	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
> -	if (ret)
> +	if (ret) {
>   		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
> +
> +		spin_lock_irqsave(hba->host->host_lock, flags);
> +		hba->force_reset = true;
> +		hba->ufshcd_state = UFSHCD_STATE_EH_SCHEDULED_FATAL;
> +		schedule_work(&hba->eh_work);
> +		spin_unlock_irqrestore(hba->host->host_lock, flags);
> +
> +		/* trigger error handler and break suspend */
> +		ret = -EBUSY;
> +	}
> +
> +	return ret;
>   }

Hi Peter,

UFS host drivers shouldn't touch hba->force_reset, hba->ufshcd_state nor 
hba->eh_work. Please add a helper function in the UFS driver core and 
export it.

Thanks,

Bart.

