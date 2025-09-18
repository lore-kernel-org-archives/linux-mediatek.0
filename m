Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522ACAC59A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18F93i41DECTqPUgQ1X9ryaKGagXJ2RY9pp/WFcaWng=; b=Wq8iYsWMvP/XR+zK3g7FvQeV3U
	bfSZqrtJgAodNSzxAQn6rUnNJ5LldkI5rj4CZcIaGvYC8CjANcepznrQdYM4E80sTeueQMpkaMew6
	73APB71E3kxXxoGgt9vGaDgmlNWAz2gcLbhSSwHNq+0/3tiqIJm34X+rFcjpakhCh02EE11xz51e4
	65YrC99UbdhBrBKoAP1aL6r7fmIDAExGXOVE2akufDxvTW8fpdohYA09iEXONLfNeZC/tegQNknAo
	ufKh3uCDwvZXsLKblbIaeAKVfcM2zRblC0eNyNU+2toiDQqWG2ZDujy76BfxcWRsjExB2Kcvf+B5z
	ZMSrlsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJXZ-00000000sdG-2DpA;
	Thu, 18 Sep 2025 18:39:33 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJXW-00000000scd-2Ly4
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 18:39:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cSPYs4JCDzm0yQq;
	Thu, 18 Sep 2025 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758220766; x=1760812767; bh=18F93i41DECTqPUgQ1X9ryaK
	GagXJ2RY9pp/WFcaWng=; b=EaYHxFWxi0sCpUbl0fBUnsDg04dblHAt/YKnRnmd
	ytjOaWdwInRGmm/A/15xKdKd78Xh0RuLfN2ZPKcNM9pxgyKNG18c69aFNdKDhWGD
	x5y0GhR9ClnPV85rwZqCTttRWo2PRATGlOr495kM0LoAR+dV+vZdetd1uvbX5wne
	xihCmWPdnKshJCVq6WQ/yUJ1B9UiS1fm5Le2tS/Wp7Rq5BgSg+I+9scEKMobZsd7
	AZIlp044N8UZaCLSR3XT7APSGm49tmnp9O2bdoDEavJ4XWBzKbhqcm6wzClSG7wQ
	zaCtJpTSwrH6zHC/PvBrA5ne/nn3yhG0VOiUjNOfveCCGw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Y1jNnBRTRRlB; Thu, 18 Sep 2025 18:39:26 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cSPYb0kv9zm0yVJ;
	Thu, 18 Sep 2025 18:39:13 +0000 (UTC)
Message-ID: <6f4f954d-64fe-461e-9c65-6630b0409710@acm.org>
Date: Thu, 18 Sep 2025 11:39:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/10] ufs: host: mediatek: Fix shutdown/suspend race
 condition
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-8-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250918104000.208856-8-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_113930_690223_7A5A9F3D 
X-CRM114-Status: GOOD (  10.32  )
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

On 9/18/25 3:36 AM, peter.wang@mediatek.com wrote:
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 109cbb36c02d..7df475ebd06d 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -1436,6 +1436,11 @@ static inline int ufshcd_disable_host_tx_lcc(struct ufs_hba *hba)
>   	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
>   }
>   
> +static inline bool ufshcd_is_user_access_allowed(struct ufs_hba *hba)
> +{
> +	return !hba->shutting_down;
> +}
> +

Please do not move the ufshcd_is_user_access_allowed() definition - I'd
like to remove this function. Please either use hba->shutting_down
directly or add a .shutdown callback in ufs_mtk_pltform.

Thanks,

Bart.

