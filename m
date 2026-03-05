Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99579F30955
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pj8ytW+WIlrzqFuOz36nNq1f9KM73Fu6DAdysk2Ty+o=; b=NW1kGySdOrAwdxJWofhLTEZZ0r
	ZG2h5/utCwTmZhSHQ1ogcQb5cW4A6VVcYp+CyE5sN6wVSjVfke2gezO1/4R0Sl+nAq0yGJJiYYzvW
	phD+QIGu6H2Y+iUyE0bq2ZpU8usM2S3mKRtXVTMDalpkUbn4b4ImaQ76Qg7iOLHapTpzmlT6fuMmy
	TP2H7KdkdpnfTy/gy8Mq9UHtpxMEKXXV0Pt40ruh7B5prXvr/BJ4vZQQk0YmOZvptrs1gfCdymEwT
	AmJvXKy735HqpA+lf4TGU6gs5U2HiJYY4t5dQrQzhVimCXGQ7vQ4UZ9HDY9DFRGFdLF9csidX8iZo
	DLBvcxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7l6-00000001lGJ-29nT;
	Thu, 05 Mar 2026 12:24:52 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7l3-00000001lFb-4B8R;
	Thu, 05 Mar 2026 12:24:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fRTJ13csxzlh1TV;
	Thu,  5 Mar 2026 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772713484; x=1775305485; bh=pj8ytW+WIlrzqFuOz36nNq1f
	9KM73Fu6DAdysk2Ty+o=; b=jIPot4CZMnSmOFfj7+NiCBZ5t6W7wbVreUwe3BJ8
	8Q69lA9CGo0xObh3WZm5ThdBtp7j9NfJSmaXwe8BSEa9d09R3jRKiBaqKqpnoaGJ
	2LNdgt598gX/9eZuF6rdEDx/vZ6QKymFpxsVDor4fL4A/o1V7kshWwPY2m3/zSd8
	pGlazVJ8TlRaE4TZc98LBJ0Q8Vi+O2rV1eZiK1zN/Ow1OJFJdpq9NLf0ZNbiyc5u
	dEgI+1dbPDERSbrikOAlvZgkftyQwx/b4JCgft0T8eR2fDZ5hw9qCtlu50sXblCS
	e1saFznxZT6aoaB0NZvt4OmNigI7D+UrUaqZ1w+y8wWMsQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Se8PrpAbekFN; Thu,  5 Mar 2026 12:24:44 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fRTHr5yzNzlgqsK;
	Thu,  5 Mar 2026 12:24:40 +0000 (UTC)
Message-ID: <fd1fb573-6d02-433e-a74a-1a015c64e3be@acm.org>
Date: Thu, 5 Mar 2026 06:24:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ufs: core: Add quriks for VCC ramp-up delay
To: ed.tsai@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260305083610.2672344-1-ed.tsai@mediatek.com>
 <20260305083610.2672344-2-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260305083610.2672344-2-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_042450_060646_B1138599 
X-CRM114-Status: GOOD (  10.30  )
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

On 3/5/26 2:29 AM, ed.tsai@mediatek.com wrote:
> +	/*
> +	 * On platforms with a slow VCC ramp-up, a delay is needed after
> +	 * turning on VCC to ensure the voltage is stable before the
> +	 * reference clock is enabled.
> +	 */
> +	if (hba->quirks & UFSHCD_QUIRK_VCC_ON_DELAY && !ret && vcc_on &&
> +	    hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
> +		usleep_range(1000, 1100);

Since the value of the delay is platform-dependent, has it been
considered to introduce a new vendor operation (vop)?

Thanks,

Bart.

