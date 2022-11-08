Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8mmJ7J+O8YQhUN9UycA+9IZarr6nsaWtSM+Pmlp3o4=; b=4BBBuyd1ED76RocurMqiZL/hd+
	Evom9if3o7ad9Xhpvl1KJyrCG70BaidFSvDqfac2n+9ujpFr1zBdBgzxgumqCoETLfptrShlvQkGA
	PelkFBS5EAOcL6qvIX2/c+ZFiZvL6AF+yhwYHfYRjxKwqp7dwU4eWPWSrv9FHKzWH4aWpa2tjHeFd
	1Zl/iHSoeU+qZ3ySrB6t/6DmkysMGOeCeOekGSWRHd2J/iSI/eMUPxAUAOIYzIwfBo/pAWKxL58Or
	nxX4O2ddoDcWc1pIR7no47Z7viM+q4OcRY8ghdgz1VLcY2hNiio6yGXwVRoRhrWtHHziolZ5u4f71
	mz7ELucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osU56-007oVV-QH; Tue, 08 Nov 2022 19:16:20 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osU4v-007oSo-2D
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 19:16:10 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.64.218])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id A486F1A0095;
	Tue,  8 Nov 2022 19:16:04 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id D11D2840079;
	Tue,  8 Nov 2022 19:15:51 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 8A91713C2B0;
	Tue,  8 Nov 2022 11:15:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 8A91713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1667934945;
	bh=zLjzH4wetrmd0Mxz9u5DRnW5WpQ6qi3vC3rpLt43BNw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=qKiZaVnRTaLis2cGip9XE2LWUh4Xw5e2L1ptfcAwsy6OL4zObz0bm/aZQ/V79iWoa
	 EBEMv8JqnxWOJ2kpXmBcI3j0M2sggdnYCHzbfRL/pSQjbL+vDS8KkbBjEe3bppnQUW
	 cbSEcpUr982NRzDjBy99iezJoD/IRFnOG4Y4z0r8=
Subject: Re: [PATCH 3/4] wifi: mt76: mt7915: add full system reset into
 debugfs
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 linux-wireless@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek@lists.infradead.org
References: <26aefa69d1002616412c4b00bf2e779f71ca3289.1667929344.git.ryder.lee@mediatek.com>
 <de5e0b76c246926d21c13625310e810584b742c7.1667929344.git.ryder.lee@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <33fcc913-549e-e350-4d2b-1932f2474241@candelatech.com>
Date: Tue, 8 Nov 2022 11:15:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <de5e0b76c246926d21c13625310e810584b742c7.1667929344.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MDID: 1667934965-bKtYdJrTLc5l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_111609_202205_070E3FFD 
X-CRM114-Status: GOOD (  19.18  )
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

On 11/8/22 11:02 AM, Ryder Lee wrote:
> Trigger firmware crash and enable full system recovery through debugfs.
> This also renames knob "fw_ser" to a clear-cut name "sys_recovery".
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>   .../wireless/mediatek/mt76/mt7915/debugfs.c   | 51 +++++++++++++++----
>   .../net/wireless/mediatek/mt76/mt7915/mac.c   |  5 ++
>   .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  2 +
>   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +
>   .../net/wireless/mediatek/mt76/mt7915/regs.h  |  4 ++
>   5 files changed, 55 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> index e1d15394a621..56320c5da499 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> @@ -46,8 +46,8 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
>   
>   /* test knob of system error recovery */
>   static ssize_t
> -mt7915_fw_ser_set(struct file *file, const char __user *user_buf,
> -		  size_t count, loff_t *ppos)
> +mt7915_sys_recovery_set(struct file *file, const char __user *user_buf,
> +			size_t count, loff_t *ppos)
>   {
>   	struct mt7915_phy *phy = file->private_data;
>   	struct mt7915_dev *dev = phy->dev;
> @@ -71,8 +71,18 @@ mt7915_fw_ser_set(struct file *file, const char __user *user_buf,
>   		return -EINVAL;
>   
>   	switch (val) {
> +	/*
> +	 * 0: grab firmware current SER state.
> +	 * 1: trigger & enable system error L1 recovery.
> +	 * 2: trigger & enable system error L2 recovery.
> +	 * 3: trigger & enable system error L3 rx abort.
> +	 * 4: trigger & enable system error L3 tx abort
> +	 * 5: trigger & enable system error L3 tx disable.
> +	 * 6: trigger & enable system error L3 bf recovery.
> +	 * 7: trigger & enable system error full recovery.
> +	 * 8: trigger firmware crash.
> +	 */

[snip]

> +	/* dump firmware SER statistics */
>   	desc += scnprintf(buff + desc, bufsz - desc,
>   			  "::E  R , SER_STATUS        = 0x%08x\n",
>   			  mt76_rr(dev, MT_SWDEF_SER_STATS));
> @@ -139,15 +167,19 @@ mt7915_fw_ser_get(struct file *file, char __user *user_buf,
>   	desc += scnprintf(buff + desc, bufsz - desc,
>   			  "::E  R , SER_LMAC_WISR7_B1 = 0x%08x\n",
>   			  mt76_rr(dev, MT_SWDEF_LAMC_WISR7_BN1_STATS));
> +	desc += scnprintf(buff + desc, bufsz - desc,
> +			  "\nSYS_RESET_COUNT: WM %d, WA %d\n",
> +			  dev->recovery.wm_reset_count,
> +			  dev->recovery.wa_reset_count);

Consider printing out the text for what the various values that can be written to this
debugfs file do (ie, like the comments earlier in this patch)?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


