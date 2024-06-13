Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40629C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFULYOKQ+TdNqunumaN2eysA8LB0fgCxHV6LlOuWFg8=; b=rRF0Mrlvs+Bz5z4oKUmI0N+x+8
	2RN9OIcQjv3zH1MTOwOp4E8z6NzD+YkgJbDLGKMJvzvUkxenzWh8wZGUZx6wfQkmhQ4i44zgJyTf/
	tjb2buBb/6a9FQ8iDMGwChc2yBGJ2TamSTsycLAInc4/zQs4ERX47bdicvQ8fTjxgeFa6dXmJrQDm
	Ymr/inpsk/CDtS6jtfQdnhkINBhc1wC4eHfAIihviG6uNPb63lq2E20aGOTPsCXSlpJqjud064ltH
	K0MFKy4ZPLgtwfVLDuJ8oMDtf89V+T2aVX6OIU3P+nt78fvmQBNv0Wu9KpgOxNKvOMK7ioJrfDP0V
	+FwnGhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHm6J-0000000H6JH-2yuG;
	Thu, 13 Jun 2024 15:10:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHm6E-0000000H6FM-2Kmr;
	Thu, 13 Jun 2024 15:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718291448;
	bh=C8+7Q95rup1dkVkxvwEADGOn4f1wiUjE8zc+qzXfe+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KLnXcahSEZeK/t/aaFTH9g6LlvAreuAyF7Vdo8TqyJgJo02hdBpdL68O9e1kJxZDG
	 2M49xoEHuYbm8BbzvCqhm4rPXkSTfB5MxYiLIrjONwAowwLW/uniUYmlDtCP0GBYJQ
	 /ue3dtE2/Brkacxf8qdJ2KCb77QH87xi+vwiioByi9skyq+uvIlgZdTFMHvSgn1dyh
	 ZgTmzLk4ENU9+u57Jvw3dWdjGiPobqGin7ShB3k5VsbB5kF9mfSAGBdlgcGSCFBeyZ
	 tzoz2oGGj2hPO4VSNtTXhXkrbXx3W9AGqCtb4OV6ltl4fXIEzfDjvUhL1qkktCbZNx
	 cm3XYdNJHyzIA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 752B937809CE;
	Thu, 13 Jun 2024 15:10:47 +0000 (UTC)
Message-ID: <8ef254cb-ac65-405d-bcee-d0990536fb32@collabora.com>
Date: Thu, 13 Jun 2024 17:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-cmdq: Add unregister mailbox controller in
 cmdq_remove()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240613150626.25280-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240613150626.25280-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_081050_803331_82E12E6B 
X-CRM114-Status: GOOD (  12.07  )
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

Il 13/06/24 17:06, Jason-JH.Lin ha scritto:
> Add unregister mailbox controller in cmdq_remove to fix cmdq unbind
> WARN_ON message from pm_runtime_get_sync() in cmdq_mbox_shutdown().
> 
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Hello,

I think you forgot about...

https://lore.kernel.org/all/6fcd48b14e865c25e6db7559fe6b946537bfa0ce.camel@mediatek.com/

...as that would also resolve this one without any hacks.

Cheers,
Angelo

> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4aa394e91109..1399e18a39a4 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -371,6 +371,8 @@ static void cmdq_remove(struct platform_device *pdev)
>   {
>   	struct cmdq *cmdq = platform_get_drvdata(pdev);
>   
> +	devm_mbox_controller_unregister(&pdev->dev, &cmdq->mbox);
> +
>   	if (cmdq->pdata->sw_ddr_en)
>   		cmdq_sw_ddr_enable(cmdq, false);
>   



