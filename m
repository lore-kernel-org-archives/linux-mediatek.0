Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B36CEF15D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g9RTYQmYkbyTBnX+pyVIuZ6tJsrD74oPGtrUdUKnug=; b=x+WvhI1c/PPdZ2Lg55PkJPsFp9
	HbCortYG0TABPddeXlt2FWXxqY0gsI5CNPIgYGXMiJiTzVhVtOuWuBux0y8IYh0nItslR6veaGdpZ
	RUwwdeBNqfc8+5tRUleYEIJupJVtmMl1VeznTyR10UYOES56PdQwBW2GII3Ty4un+sKVNA4srptCo
	ZfL5k4G87B8C2gRqFyw+NiaTJ6/POAdUlZnmxwVLh1kKgG5Dylyyx0RHCyE1raHYBEoRYAwO5mb7R
	qA47fsJSj2lZ2vWkFT9G7VQxeXXqI67XJlp0PzStdrpEc1R4Utemm1pcV2MIrZ5wt1nW78YjokfJj
	A6BHcL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy8rF-00000005isC-3gGR;
	Tue, 08 Oct 2024 11:58:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy8nB-00000005iGG-0mjy;
	Tue, 08 Oct 2024 11:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728388455;
	bh=nc+MQghnyWyZJRvqvPkCeTpAprctMbpI7KvLhPyLhv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IvgaEkbVzoX+XJ3nL3RuiRCbIgObPK5O/gH13jaPjIpiCUeKp7QkLCWtycAbEvpHL
	 igmvTfkgan4NG/NsTZ4IZYL6ZQMYpz5QRDWyPnFxZQ3DgYFHlzLUYX53IF+em4vXw7
	 wU0LUdaeaFP2MIq11/Jq3xLTLsx7wOv3p3/wXho2fiCQeYo00TjQzD64dmVVRed0Bf
	 PRKcTKbASTKrB/qJkGi7+CIig5M2Hx9d7+PGgmpudY1rI4/CmSYMzxp7fIi3u5rH/I
	 Dxte+S1iV+toj7nEBd8zBPZSiUGT2dewBHH1rY8CndUm3GPR9bBjo7RC7gwRswMEj9
	 lVqD9eJmz2qBw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C5C917E1411;
	Tue,  8 Oct 2024 13:54:15 +0200 (CEST)
Message-ID: <6b190912-90e8-49b3-aa0f-b8ef8f47e78d@collabora.com>
Date: Tue, 8 Oct 2024 13:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] soc: mediatek: mtk-cmdq-helper: Various cleanups
To: matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, linux-mediatek@lists.infradead.org
References: <20241008093220.39734-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241008093220.39734-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_045417_441643_448BF00F 
X-CRM114-Status: GOOD (  11.77  )
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

Il 08/10/24 11:32, AngeloGioacchino Del Regno ha scritto:
> Changes in v2:
>   - Dropped patch marking very likely/unlikely branches
>   - Removed useless .mask=0 assignment in patch 2/2.
> 
> This series performs various cleanups to the MediaTek CMDQ Helper lib,
> reducing code duplication and enhancing human readability.
> 
> This also avoids double initialization struct cmdq_instruction as,
> in some cases, it was stack-initialized to zero and then overwritten
> completely anyway a bit later.
> I'd expect compilers to be somehow smart about that, but still, while
> at it ... why not :-)
> 
> Tested on MT8192 Asurada, MT8195 Tomato Chromebooks.
> 

Matthias, just making you aware that I'll wait for your feedback before
replacing v1 with this one in the MTK soc tree.

No hurry, though.

Cheers

> AngeloGioacchino Del Regno (2):
>    soc: mediatek: mtk-cmdq: Move mask build and append to function
>    soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
> 
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 230 ++++++++++++-------------
>   1 file changed, 106 insertions(+), 124 deletions(-)
> 


