Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC05C83F17
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewDHWtsj3AFeozR0rjg1tVfn4EXPf5xtbOK1pz0V3m0=; b=b3V7mjTh9uinrcttKMbgf3QpqA
	Hov8R/5JAY4lYKZ2gMaMvUHIn5lo/XTci5+iu+octf2xzeuLxowDhs7ccMmUu1SFdQaxoFMGd7ZlH
	iJRhkv59vIuUNNpjeKf4zBP+v0XgoWvyg1wCrNQvES07nK2L990zdVA1eiORELFQzd8EuGpwaqFya
	sQz3wVoSE711X0W76WWVeCe/nks6bmm0rIt+dwJCXx1xDeYsNXbjR9+a7IUlnSIyn+YaJu/DfyxKv
	Zd0i0hcyLj22lBMo7zlnp/1eD12S7xicwtwG9aLUteO+SkzS+2y5urFyPBBYPQ/tLngxwYeFWEyzt
	sqdmJeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmm4-0000000CuNE-3opH;
	Fri, 18 Jul 2025 15:13:24 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmm2-0000000CuMs-2c3Z
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 15:13:23 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bkCwd2YB1zm174K;
	Fri, 18 Jul 2025 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752851598; x=1755443599; bh=ewDHWtsj3AFeozR0rjg1tVfn
	4EXPf5xtbOK1pz0V3m0=; b=4cIORkKN7DdT0uw0u44dvXDSsopw1fFoWNjvK3SA
	EKt8oOL/RhQzA1Iat8Qm6rPAHu0PTkw4XjP+tVYXvfJJgmKkMEyWsaXoj3wmBtj3
	B4msNZRezgW1oqKGmoWo+3vL+f1pMvtbYxwt66xT6MqL/LRhvVDcO5zwu4FQ1+3Y
	9hlzfxpWYrXmXYVnzKaK0Y6hgQ71OmbpjxFJ1eWF8FsKYSQnHIEpGKPyPVf2Fx5C
	KII+QyhKKkNO/LVDOGviTwldtiAuI+MVsfdHwJduIrgqKI1nmFZDeJKLRAIEbZW3
	H3v75vKM4E61TVlrBwkwjCx0aVyRHkRMp6nqfnnqTzigzw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1Y1LSqAZk1z0; Fri, 18 Jul 2025 15:13:18 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bkCwH4KxTzm0ySb;
	Fri, 18 Jul 2025 15:13:02 +0000 (UTC)
Message-ID: <06cca9bf-e88a-4884-811b-ec103ca6f40f@acm.org>
Date: Fri, 18 Jul 2025 08:13:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] ufs: host: mediatek: Remove unnecessary boolean
 conversion
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250718095524.682599-1-peter.wang@mediatek.com>
 <20250718095524.682599-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250718095524.682599-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_081322_754300_E2D5F965 
X-CRM114-Status: GOOD (  12.46  )
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

On 7/18/25 2:51 AM, peter.wang@mediatek.com wrote:
> This patch removes unnecessary boolean conversions to ensure consistency
> with other usages in ufs-mediatek.c. The changes simplify the code by
> directly returning the result of bitwise operations without converting
> them to boolean values.

Hmm ... the conversion to boolean still happens but now happens 
implicitly (by the compiler) instead of explicitly (via !!).

> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index 182f58d0c9db..14f0130da653 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -96,28 +96,28 @@ static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
>   {
>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>   
> -	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
> +	return (host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
>   }

How about removing the parentheses too since this patch makes the
parentheses unnecessary?

Otherwise this patch looks good to me.

Thanks,

Bart.


