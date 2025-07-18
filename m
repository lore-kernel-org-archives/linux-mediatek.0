Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC2C83F17
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ8e+i3SVXijO2acStSnOiP7fhcCGCyTomSnYRqHsHc=; b=UpJquO4VELZ0366nr05a0gMUUV
	GMTyG3pkTHwhqT0bpVHnMbDFgyuGwKRaeX0D48LBiwJH+Xx/Lg3V351/XY3k3BBd+RZV6QV4+WP1I
	IkmNA9kaRqQJ8o/7+SSfIR7Jy0cToIDKw2FNrqJ6kvhe0cWOPo7GxCyMSse0aBwLhylAegsyzj5EI
	9OPHexWSHgbhuoGB/5XqMH4345s5qsj/RuOa9mp1VfRZcbijTL0/1a6UGbkS6XxhYhaxrGUPaoQCk
	WWtuZVHml1u5CYaeSTIFKprDSxbu7DFZqokziEgTeTvwQZz7ZmDU+vta0EDdYV/AAXYz6Gy80tO4f
	1LhJVRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmn0-0000000CuWy-3rcX;
	Fri, 18 Jul 2025 15:14:22 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmmz-0000000CuW6-09zc
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 15:14:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bkCxm2bcdzm0yTg;
	Fri, 18 Jul 2025 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752851657; x=1755443658; bh=sZ8e+i3SVXijO2acStSnOiP7
	fhcCGCyTomSnYRqHsHc=; b=CIu3S/uBvt4asIIh+GU6ZFLDaBTvbGLAaI6dSJAt
	m69GbmaiFavH0OPNW7OODBph0eDEINFWhnA1YsnFDDUOiZOk977CJ5BEHlLladOO
	LLeIJ4qVnLcLHlLvXXvzi0PKaTHL1sH7Jf2cqxTg7Tg1e+yKODH667I6ne6i/q1D
	CJvAI1+rzYoSD7pfXJxVg3pm528R2YGGRRhLrVJOCuCFK8Xp94IrDF0QyGJKSzx0
	YetUQ7TGTguQ4zbISL1UYhOoQYjNWQTaAXh4FeUN1HXOcEX2rsF8kbZVM6/jpCwb
	WB5UCpuEtqJC4JmInEhKSw6b9tcWUkRLfmAqwdLp4OTmUQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ECewcsMADdaB; Fri, 18 Jul 2025 15:14:17 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bkCxT3YB6zm0ySb;
	Fri, 18 Jul 2025 15:14:04 +0000 (UTC)
Message-ID: <a2352960-0586-4e34-8f80-446010383778@acm.org>
Date: Fri, 18 Jul 2025 08:14:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] ufs: host: mediatek: Add DDR_EN setting
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250718095524.682599-1-peter.wang@mediatek.com>
 <20250718095524.682599-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250718095524.682599-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_081421_154297_07F698BA 
X-CRM114-Status: GOOD (  11.17  )
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
> diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
> index 05d76a6bd772..474fdec0a880 100644
> --- a/drivers/ufs/host/ufs-mediatek.h
> +++ b/drivers/ufs/host/ufs-mediatek.h
> @@ -192,4 +192,16 @@ struct ufs_mtk_host {
>   /* MTK RTT support number */
>   #define MTK_MAX_NUM_RTT 2
>   
> +/* UFSHCI MTK ip version value */
> +enum {
> +	/* UFS 3.1 */
> +	IP_VER_MT6878    = 0x10420200,
> +
> +	/* UFS 4.0 */
> +	IP_VER_MT6897    = 0x10440000,
> +	IP_VER_MT6989    = 0x10450000,
> +
> +	IP_VER_NONE      = 0xFFFFFFFF
> +};

I still see "UFSHCI" in the comment above the enum and "UFS" in the
comments inside the enum? Is that intentional?

Thanks,

Bart.

