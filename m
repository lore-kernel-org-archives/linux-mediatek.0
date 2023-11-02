Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4993DC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCWkZmprVanaX0XgbBNC9xPsyR3lJIRQ7BEnbBwQKDc=; b=U44oq8nOfajnAVEVcjNIFXYMRK
	wnwWpTEdXU6GuXZoQ6TSUkihg1TmvfbE7AtpGQBCglNBPXVlDJbQi1acsmdeVG3aMdC4jcZg9MnmT
	HvuJrOa0OOmMEQSsWHrrtpQcKzYBoz/tsEl2E6/NEgicmZVUVXIZCQF3iotDy+F4V/puUpw2PvmZw
	O4+sAxozGmZP8M4/1IFxLuH9AklYWK9JTuYBEdioIMu6JMucgKvbGn67ay9B/JjO3J/4Aw/XZdB8h
	8Ma/RNI9CwyosdGx5JmB+22XaeTvza002+oYl20+TpSCjat8PodboSDNgCjiC6fQyyuP9v7iUVb1c
	+CfgkKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyaha-009tf0-0r;
	Thu, 02 Nov 2023 16:37:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyahX-009teU-0N;
	Thu, 02 Nov 2023 16:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0728461448;
	Thu,  2 Nov 2023 16:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5709EC433C8;
	Thu,  2 Nov 2023 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698943065;
	bh=qvOVCM5IgQflaA5f7AYT2wFzjqGywSPcCDJvjeJKZc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yc/gvEa51TgPuaboK/BESRlcaeX+G5Fis1TYjltmRS7skKUXyn5SCDo8BgeVcpqH3
	 5e7QJkrrsJ72bnBHvB/7ljY/GSojYQ4korVtZkD4UW3eQ4mKsHhflkPZNgmHGJsV9T
	 qQMihW/BnXwyS5KPz6Y76NR49VItwH8Ulz0rhgcsepOSZlGkYMONGIO1m6oa9Qeakj
	 jCAGUyr+5l+t4YqP/5SppicQEHvFoj47dzkDmFN3F0a6DaMJEnTVeWvAKG3Ag+iAxE
	 hx/ikWexecIQL6g32a/tofRoTt6F1pi2OuiLrO1/qaAIJHaFn+CscP6/Xdvvc2GLhg
	 YfqyBqVr8pykA==
Date: Thu, 2 Nov 2023 22:07:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: naomi.chu@mediatek.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Asutosh Das <quic_asutoshd@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>, wsd_upstream@mediatek.com,
	peter.wang@mediatek.com, casper.li@mediatek.com,
	powen.kao@mediatek.com, alice.chao@mediatek.com,
	chun-hung.wu@mediatek.com, cc.chou@mediatek.com,
	eddie.huang@mediatek.com
Subject: Re: [PATCH v3 1/1] ufs: core: Expand MCQ queue slot to
 DeviceQueueDepth + 1
Message-ID: <20231102163728.GB20943@thinkpad>
References: <20231102052426.12006-1-naomi.chu@mediatek.com>
 <20231102052426.12006-2-naomi.chu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102052426.12006-2-naomi.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093747_222557_960789AB 
X-CRM114-Status: GOOD (  18.51  )
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

On Thu, Nov 02, 2023 at 01:24:24PM +0800, naomi.chu@mediatek.com wrote:
> From: Naomi Chu <naomi.chu@mediatek.com>
> 
> The UFSHCI 4.0 specification mandates that there should always be at
> least one empty slot in each queue for distinguishing between full and
> empty states. Enlarge the `hwq->max_entries` to `DeviceQueueDepth +1`
> to allow UFSHCI 4.0 controllers to fully utilize MCQ queue slots.
> 
> Fixes: 4682abfae2eb ("scsi: ufs: core: mcq: Allocate memory for MCQ mode")
> Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
> ---

Where is the changelog?

- Mani

>  drivers/ufs/core/ufs-mcq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 2ba8ec254dce..5c75ab9d6bb5 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -436,7 +436,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
>  
>  	for (i = 0; i < hba->nr_hw_queues; i++) {
>  		hwq = &hba->uhq[i];
> -		hwq->max_entries = hba->nutrs;
> +		hwq->max_entries = hba->nutrs + 1;
>  		spin_lock_init(&hwq->sq_lock);
>  		spin_lock_init(&hwq->cq_lock);
>  		mutex_init(&hwq->sq_mutex);
> -- 
> 2.18.0
> 

-- 
மணிவண்ணன் சதாசிவம்

