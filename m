Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3130AEE644A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toF6qZTra/B5Z0kwFgelNB6BSL6z+IGw9D3BScS60/Y=; b=uBF0av62wxbfwsBne9lqp/ECMn
	icRuquoQA+7DrqVulW6nzMxuHVudkCIJp5refdPtts/5nRncZIZOH+R4AJKaRq/RrZbZHxUii9r1q
	ueYxc+ulxZU/2z38kfnkkm0puydfXr3e34j28H5omk1HUOc2g7mWsQD9pxchgy1mRM1vXPJl9Ff0t
	nqYwFEVgpkxsj5f7AAEIlJsXnZXn8d89MaPygTzOWZUsSeG+8BNquPMnoA04jv2DbIBhvcThzUB/Z
	D6RGZOQ2/0duZqdC9rg6UdSb7l1aqpd/E6ydQW2I5QsKcWXdg9Mrg3cIhtsXgnPbXBOu8smRzpuDR
	6azzUgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4id-00ADNV-12;
	Fri, 15 Sep 2023 09:02:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4iZ-00ADMu-1c;
	Fri, 15 Sep 2023 09:02:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8301E66072BB;
	Fri, 15 Sep 2023 10:02:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694768546;
	bh=SETywAy77nay+2dj9q5+6oCiUOOHaWMn0eTNWs9LtXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L9gnLm0qbJiGA9oC9AGXDP1uhEorCm8fVLop7GIWlAHmBPZzB0TS07CvAkdJS1YEA
	 QjBTqSAnmfYRfweLfY8g8dveRtX5VuHl7c3MLhwBDX5cofBS+uJLJG5b02ftcLVNio
	 322MfICu9U/deVTlVdJJEIfGFOAA3iQsxo9xkLpmiQrzAls2rq2cz7NmmeSpJ0fHTb
	 0Vv9Pzm9RmW6Wj6dk9LOOC5CluO3xOY5YfNmRGx7A9g0OmO+lWpKNxSf6ASBl4w8WV
	 VvxfdWS+bgaCipcUUxqdua2YgEsmUKRFU5IaopqmecFya7JF1/O5t+k65hg4Cd9Quf
	 uRzdbQjcb4IHQ==
Message-ID: <9b0dde15-12e3-713e-a2f9-9b2534691476@collabora.com>
Date: Fri, 15 Sep 2023 11:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EOTp generation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230915075756.263591-1-mwalle@kernel.org>
 <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
 <eb1f4f78be9b2da3ae2d54ec9417f2f7@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <eb1f4f78be9b2da3ae2d54ec9417f2f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_020227_671765_5192B808 
X-CRM114-Status: GOOD (  11.18  )
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

Il 15/09/23 11:01, Michael Walle ha scritto:
> Hi,
> 
> Am 2023-09-15 10:58, schrieb AngeloGioacchino Del Regno:
>> Il 15/09/23 09:57, Michael Walle ha scritto:
>>> The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
>>> definition") inverted the logic of the control bit. Maybe it was because
>>> of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: Add
>>> _NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
>>> wrong and there will be no EOTp on the DSI link by default. Fix it.
>>>
>>> Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition")
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>
>> Hello Michael,
>> your commit is missing a small piece! :-)
>>
>> Besides, I've already sent a fix for what you're trying to do here:
>> https://lore.kernel.org/linux-arm-kernel/07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com/T/
> 
> Ahh thanks, didn't noticed this. If not already applied, I'll send
> a Tested-by: later.
> 

No worries, it happens.

Cheers,
Angelo

> Please disregard this patch then.
> 
> -michael


