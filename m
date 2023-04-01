Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2C5C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBtzpYqnxJz8Ov7OLA9QfA6nDlEApgePZYUvczv9mRc=; b=aSda2DjdliCTBQhq76n6aE/BSS
	tH0FPFiTG6KyYHkvqH6zHjqW9KvZvemOXfiiJEgzqtye0BjFPHhHShZmN9Ail20rceLhz+QWudFNv
	rLIs5RjSessWz3Lj7gCkyNET7OOnBkWXHDRRIE+66tYHewqNbK8dfUhH2FLMpsbxdEohpVsLl3IoG
	CaUJPU6NArcJjQSdViDa5ZbsvQnWBg+3G8dIKVY+JldAgONr+z40uWeIQnOrFm62HsUSUvjsIzG49
	i+cQcT2sdqOfs5rJflTwb++p6uuYmEyY++jH3QB+/oTui1xUb/Wfep9zsqQxdtWQlUmaN5AIVpStM
	Wr93Lo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piPUx-009OBJ-1I;
	Sat, 01 Apr 2023 00:53:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piPUu-009OAV-0G;
	Sat, 01 Apr 2023 00:53:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3747B8321E;
	Sat,  1 Apr 2023 00:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E05C433D2;
	Sat,  1 Apr 2023 00:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680310412;
	bh=tjj1t2PTYkZFmbtF1kyMqydk62CVEgDkZgmOGSTAPhM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8k6O9jpxq+f4XQI/SnWJhczCG4eHTK8BxXQ2hirUpQf7vYHBO4O4/dTdcXotCGhO
	 0/Ba8QBDcEUhB0y8O1hY6KcqQWAV28h7H3ow2X/X3cr88D21K5ajedCoDqwTij6IfC
	 YC49epT+pGYkWmkbFvthWkrgMYDeTkpem2Gx5exh/IfAf4HvYkI5eCJqouWIehQb0d
	 mWyoo0brrvrJwnyYMwMh16J1vM+7Ve7pGq7VHQilU+3rDe0BwDfU2C4TyyzLYO3JNl
	 NkaRMuF67VgNyZaS8taJUy+4PMuCHYGDKAxZsW10Lf/6TTRn2kRytLEjtAT0lCmwOi
	 yNoUSAGh/vDoA==
Message-ID: <203ef118-30ca-0ce9-f73e-c5ee45f61369@kernel.org>
Date: Sat, 1 Apr 2023 08:53:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] f2fs: fix iostat lock protection
To: Bo Ye <bo.ye@mediatek.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yongdong.zhang@mediatek.com, peng.zhou@mediatek.com,
 browse.zhang@mediatek.com, light.hsieh@mediatek.com,
 Qilin Tan <qilin.tan@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230331092658.72386-1-bo.ye@mediatek.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230331092658.72386-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_175336_289188_A9E692D7 
X-CRM114-Status: GOOD (  12.45  )
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

On 2023/3/31 17:26, Bo Ye wrote:
> From: Qilin Tan <qilin.tan@mediatek.com>
> 
> Made iostat lock irq safe to avoid potentinal deadlock.
> 
> Deadlock scenario:
> f2fs_attr_store
>    -> f2fs_sbi_store
>    -> _sbi_store
>    -> spin_lock(sbi->iostat_lock)
>      <interrupt request>
>      -> scsi_end_request
>      -> bio_endio
>      -> f2fs_dio_read_end_io
>      -> f2fs_update_iostat
>      -> spin_lock_irqsave(sbi->iostat_lock)  ===> Dead lock here
> 

Fixes: 61803e984307 ("f2fs: fix iostat related lock protection")
Fixes: a1e09b03e6f5 ("f2fs: use iomap for direct I/O")

> Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/sysfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 0b19163c90d4..fd238a68017e 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -575,9 +575,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	if (!strcmp(a->attr.name, "iostat_period_ms")) {
>   		if (t < MIN_IOSTAT_PERIOD_MS || t > MAX_IOSTAT_PERIOD_MS)
>   			return -EINVAL;
> -		spin_lock(&sbi->iostat_lock);
> +		spin_lock_irq(&sbi->iostat_lock);
>   		sbi->iostat_period_ms = (unsigned int)t;
> -		spin_unlock(&sbi->iostat_lock);
> +		spin_unlock_irq(&sbi->iostat_lock);
>   		return count;
>   	}
>   #endif

