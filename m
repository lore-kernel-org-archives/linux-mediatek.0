Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46EC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnmQHVavlJ01o/uDIc/ZPZA5TT2gu+XlYB48BuLOut8=; b=c0cJtJtufoJ9mjTJpfzWV2fPiz
	RhXDzyFfl+6TN+YBWw1wcS2Hlvb28GR2bQIAqmKfbzyX5vJCeQvzUJ0KCdJXPIriPGWRruo3NEetX
	c5Y/acBDRuFKOl7cNlvgb6sp8ANNi1F7xHsQSXEn+qPFv7iHwH73YOJEMVUL326IxHH/NVdXVjAkA
	8ImakSMW1OCBhe9Flh4WOYvGgWIuGbJlL9Plu2ax+PnRBHVvvarNc4kVNWbAui4li+V/U+xlmf2WZ
	3XSU6DHQ77amVErzQxhgkE65XguqtcNBQnEspwUQF+AAaEPKhe1ZN7AmnURhkpmygyry3wYc9lkAS
	tmO9P0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCiJ8-001yr7-3m; Tue, 03 Jan 2023 14:30:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgjf-001LRe-5v; Tue, 03 Jan 2023 12:49:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2BB56602CF4;
	Tue,  3 Jan 2023 12:49:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672750179;
	bh=8ji9uM0rPrYHIz3P734RsmkYAcXteBVac3pmsXFW90Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6G0SNZjtaBdV/0/2Fd7PbL6pO+oO5JW0vDldxzUZnOI8gHX8lJ/Wx/uX0mxAjmJp
	 OZrxOV6gtRankj1cdmrQ+kKsUDtV2DiWe626RinwkegpPV7iaTicYmbYaUtwd0on3w
	 bXEAzTRbbxZaybjJg0o5JsmAT/He8PPj1HLIM4Pyi/2OV3UeMcQjGsMtN9a62cYSVw
	 Rgi4RkDum2H+Xxrk1TFz+zvBw05dWj/+w7f+sktffPBao72r69/l1GDV72/+ALTyXE
	 6slxPKIpLjNW70nc8hxFwgaIfh7P9IXeqVLkmCQZCjVFQS4gR3sBPuH/rZdc46nuX/
	 OkAls005mxgMg==
Message-ID: <2f4a78f8-9cdd-9e44-20a2-b3bd6abd5cc7@collabora.com>
Date: Tue, 3 Jan 2023 13:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 13/13] soc: mediatek: mtk-svs: keep svs alive even
 though debug cmd create fail
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221226094248.4506-1-roger.lu@mediatek.com>
 <20221226094248.4506-14-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221226094248.4506-14-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_044943_503138_82599CE2 
X-CRM114-Status: GOOD (  16.18  )
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

Il 26/12/22 10:42, Roger Lu ha scritto:
> Some projects might not support DEBUG_FS but still needs svs to be
> supported. Therefore, keep svs alive even though debug cmd create fail.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index af3a12e29e78..c780a115543e 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2390,10 +2390,8 @@ static int svs_probe(struct platform_device *pdev)
>   	}
>   

Instead of ignoring a planned failure, it's sensible to not fail at all:
enclose this call and the svs_create_debug_cmds() function in an ifdef.

#ifdef CONFIG_DEBUG_FS

>   	ret = svs_create_debug_cmds(svsp);
> -	if (ret) {
> +	if (ret)
>   		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
> -		goto svs_probe_iounmap;
> -	}

#endif

>   
>   	return 0;
>   
> 

Regards,
Angelo



