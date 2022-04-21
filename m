Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAhNJiFi8MHqWKWEBeLfpdk8Brh4qri+5eXc1TmBpFc=; b=A2gg0biA69jZh/
	Pnw8+FQvg2hd52KD/sGc0UiVnSNXHl51enAcVA6QZiiTrzOv5ofFYd1BbHu1f7zDnfUmj53Q5074x
	0wfo4WlPK5IOGwIWEKqlnrr3t9M0Sx1qb75OgWhYJCGvrz6i4CRFH1HD7l8rM+j5FK2VcG8u+nNQ8
	R78D4UkZPTpGgZ78UrD7s1kU7Fb9pPMSehEUikaJej2qOZkv1pzYD39N3Vun1zl+urvfZ4Dzcqb8t
	6EK8Hk+nyzEXGJTanyqsWcVOsGVzAJe5mSLmeratM/d3MFhcUBmzdyLJzdGK5qyv9tfnYumfL+mtY
	Cly9bTPW3Y/Wu2ROt7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUak-00D82u-Vn; Thu, 21 Apr 2022 11:03:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUaZ-00D80E-16; Thu, 21 Apr 2022 11:03:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 073BB1F4471A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650538985;
 bh=sy+rLNXQIKyW8TFbG6ILeSEG7iS/CKP/Coz25Rxsaxo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cGnzw226WVcrPOtDKpi7ieE4O90YrxM6i8OqPW0jVQeClyXNKGrSfT2+6s7PXpOkO
 4e110iF67BFrPXaLvasAQviKky1wjbwLJi5+XqpeSz/pipobHg0LrwZ2IMShaY8CGI
 2LkBzX4cprcTZJM58VI5QGU7ZvPNggePY7zYW/Blb8IMMXqB0Q580JrSS8sd6XZm/r
 toneZW/LvOIrWOtWs0/doztF+TBek/o9cYpoFtaGnTGL81u+6bjWbzahPNwdXd0RAa
 uZ0UI7lKvqD0Mi09vujcwzbXtL5wls9wS6AXo8nIokQqXHhyYnR4FvtVh4oFvFFdKt
 JTjBaQnnGbIOw==
Message-ID: <7658c8e4-596b-abfc-9255-854c16f920a7@collabora.com>
Date: Thu, 21 Apr 2022 13:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: platform: mtk-mdp: Fix mdp_ipi_comm structure
 alignment
Content-Language: en-US
To: minghsiu.tsai@mediatek.com
Cc: houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, hans.verkuil@cisco.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, acourbot@chromium.org, irui.wang@mediatek.com
References: <20220307155653.460910-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307155653.460910-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_040307_248571_9D210592 
X-CRM114-Status: GOOD (  19.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/03/22 16:56, AngeloGioacchino Del Regno ha scritto:
> The mdp_ipi_comm structure defines a command that is either
> PROCESS (start processing) or DEINIT (destroy instance); we
> are using this one to send PROCESS or DEINIT commands from Linux
> to an MDP instance through a VPU write but, while the first wants
> us to stay 4-bytes aligned, the VPU instead requires an 8-bytes
> data alignment.
> 
> Keeping in mind that these commands are executed immediately
> after sending them (hence not chained with others before the
> VPU/MDP "actually" start executing), it is fine to simply add
> a padding of 4 bytes to this structure: this keeps the same
> performance as before, as we're still stack-allocating it,
> while avoiding hackery inside of mtk-vpu to ensure alignment
> bringing a definitely bigger performance impact.
> 
> Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hello,
is there any issue with this patch?

Regards,
Angelo

> ---
> 
> This patch has been tested on Acer Chromebook R 13 (MT8173 Elm) on Debian Sid.
> 
> This is an alternative solution to the mtk-vpu approach, found here:
> https://lore.kernel.org/all/20210920170408.1561-1-dafna.hirschfeld@collabora.com
> 
>   drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h b/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> index 2cb8cecb3077..b810c96695c8 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> @@ -40,12 +40,14 @@ struct mdp_ipi_init {
>    * @ipi_id        : IPI_MDP
>    * @ap_inst       : AP mtk_mdp_vpu address
>    * @vpu_inst_addr : VPU MDP instance address
> + * @padding       : Alignment padding
>    */
>   struct mdp_ipi_comm {
>   	uint32_t msg_id;
>   	uint32_t ipi_id;
>   	uint64_t ap_inst;
>   	uint32_t vpu_inst_addr;
> +	uint32_t padding;
>   };
>   
>   /**


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
