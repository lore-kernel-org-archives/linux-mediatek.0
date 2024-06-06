Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABECAC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiGGX/Oay/VU0XDT4cpDvu0KE9AGAzeNX1GhKlwng9Q=; b=oWc3+HMDS0E6vnkKCmelHoNO6h
	umTmTHaW87lLA06iN384VEfTi1TSHom9X8YkdfT0UcGFpY3y0bh+BRS6eamHAp5EyVZTSl/oDBW4g
	XVuP7pYj8j4OErWfhF+k8jdJL+Y5Im+kBZvYF7ZEN8Olgq4GmAOMZzmfAkmfW74gK2iC+FN9jfALh
	xfm0Qg/zBQ3b1C2u3JPAgA2Ho5I+RwUePgmoC3QpxlQfFFO6yxYjXO8KT869dY8RGMjwtqWUebT9H
	mYact87ieeHD+URl0x1DK99fAt2Q9e0CNI/qKcDfdlKmFlf4BO39VZldtR/ocM9XgN4sfAP9RzgTn
	2XMYuj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAqw-00000009T98-1THR;
	Thu, 06 Jun 2024 11:00:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAqs-00000009T8E-2Taq;
	Thu, 06 Jun 2024 11:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717671613;
	bh=JzIE2Q/8PA+vyQON4VFwI2P8T+iJyPY9/E/Fb2Kzq1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0ZmMNiJfCXQNZ6B1t1p8nN0KJbN3Y0lJhaKaOnM2yopq9SmacDqCwiU8+zV7oxQ/G
	 LKkFhKvRkS/2g63MVpQl9pOg7mvmm7QzilHpD0emoMusur0ee4XPB5RuH3peLHPA2+
	 sDAkdrPgB6XjEfnqOEFBZjdEYOLGD0SmlLImdnZPIAytjjtbDpyWSsSKZqfCe+zEJV
	 MZpdwPL5ylCgJHhPnVRbGEw5XdH8+OhCF13Srg8PN7C9JDaDC2dF8JZE8r+GjWtPG9
	 Zi0qA0Sq9DDXUOhV5d23SAa0G1lFYv/0jjYywDb0csSEZgKMe8bPDzgBeqp1ApdJxR
	 /g+6RaZExrYHQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9813C3780627;
	Thu,  6 Jun 2024 11:00:12 +0000 (UTC)
Message-ID: <bc12b046-d2fb-48ae-bd5b-a6ef6cc78c07@collabora.com>
Date: Thu, 6 Jun 2024 13:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM size
To: jason-ch chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jason Chen <Jason-ch.Chen@mediatek.com>
References: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_040014_822159_B2E07B87 
X-CRM114-Status: GOOD (  13.67  )
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

Il 06/06/24 11:06, jason-ch chen ha scritto:
> From: Jason Chen <Jason-ch.Chen@mediatek.com>
> 
> Increase MT8188 SCP core0 DRAM size for HEVC driver.
> 

....so the second core only gets a maximum of 0x200000 of SRAM?
I'm not sure how useful is the secondary SCP core, at this point, with so little
available SRAM but... okay, as you wish.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b885a9a041e4..2119fc62c3f2 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1390,7 +1390,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
>   };
>   
>   static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
> -	.max_dram_size = 0x500000,
> +	.max_dram_size = 0x800000,
>   	.ipi_share_buffer_size = 600,
>   };
>   



