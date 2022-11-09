Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BC3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7aHBcV/NNodzOnLWHFv0Riu76BmXp6c1Mma1hVG8aM=; b=QgVcEnbwPZY4RdDRPiVt4PmGV9
	MmJSRYNTLlKkFcPq6TocXOWNf8tWXulu6MTtwWJ2t00AeaiFOcsoWIkb7iQyHRozD/nIGqKQ/3DFg
	afEUJ8B+SgQA3wSAMnVEsp9K2KihU5hdehnR9K3TVCXGMc7EtfTwUrA5ZLEtJyHE7ooXKqmszEvUH
	YaHRBMZPr4icuKdUNN8L9UdDim3q09x18dY/g3mqxUJNKcUzx/ARhJZQ8Bpd8FmN6XrR+u3iqHHPX
	9uOfPzbndLTpMx4qLfBa3MXjAeiiCZhsme675zxUJlmR9Qs5BKUE0ggQW260TaohZBwDqYQWtDr80
	Y8GHidAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjD4-00D09B-Qt; Wed, 09 Nov 2022 11:25:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjD2-00D06z-2a; Wed, 09 Nov 2022 11:25:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id w14so25266828wru.8;
        Wed, 09 Nov 2022 03:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7aHBcV/NNodzOnLWHFv0Riu76BmXp6c1Mma1hVG8aM=;
        b=XYam02f3n+s+9rA8MLrmSemGlScqvoMoyF9wLzLKhPcp4FqNR/uN7+e5XwyAviqitk
         cLi0AzRqM8DeNh6XzYcqB3Bjlf0KCgI2pnhMWcqLfCTM3QlDOnyyyQmxA5MgHhrd9kmj
         fT+nY9F1bHt5nyeoQawsO0YiEnLJu4/xWh2P7+joV5gc89rCg20nOlA0zpijWjoByK/Q
         B8ljkLARZUqQmYZ2N/ExbQVrTdgXYj+tQEz3nptPBQPoYbWWRP97/86m8Q889gQFHKEq
         7/aHhW7jEuBZoWCxUnWoOrYFbI0A/E5LoHHTx5cVnBUdnRmF76P/BszM+ef5iQ38pUle
         Xuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7aHBcV/NNodzOnLWHFv0Riu76BmXp6c1Mma1hVG8aM=;
        b=JQFF5IR/FgBM3IBBbca7mRdjreWe4/ApOpZ2YIbDhh5t9LExUeMEHFAGxWRENge1Xv
         iKGNHcXcOsPPWwj96oWB9s80tfxp8/Didv38OVrJ/HKVIUCVu1kHbmRyXPKVeeSJnxm+
         IJRH/b0mm4/x7wbdEyrDbx71eZfpKwFFML3H9Bd1FTnXFzHJ3Ferve/YpcyghiFa9WRB
         DlFRbKsUBRJ89O1pR9Vi96cp3KnrWTbcjzwVzPUSkcF5/J+oHKYsqfkFMONYl4I1VVeE
         JAar2KO3bdAD1cc4H99qJnudOPib/QGg5IIjzcRe4oJp94bk/j/wwWthcW+CDLUo7KUB
         JsHA==
X-Gm-Message-State: ACrzQf07T8GHZhEnLdLNflAhv/WPKBi7OTGPs5hyjIIpC5R+RoB/ts4W
	T+BHzgoiscTdI1DZQ72RZTs=
X-Google-Smtp-Source: AMsMyM7F9beiptQWeU4dn/9YH5JLDFHVU3Fan7jjQBd5F6TMfl1va8bhwzE+wyiUlb6x39jmOAp+9g==
X-Received: by 2002:adf:f8c2:0:b0:236:9cd1:6748 with SMTP id f2-20020adff8c2000000b002369cd16748mr36855017wrq.283.1667993129624;
        Wed, 09 Nov 2022 03:25:29 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p14-20020adff20e000000b0022e344a63c7sm13030211wro.92.2022.11.09.03.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:25:28 -0800 (PST)
Message-ID: <30278e0f-88ec-069b-3469-56b3fb795702@gmail.com>
Date: Wed, 9 Nov 2022 12:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 6/6] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-7-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220927152704.12018-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_032532_193168_E350F9A8 
X-CRM114-Status: GOOD (  14.91  )
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



On 27/09/2022 17:27, Jason-JH.Lin wrote:
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Chun-Kuan, I understand you will take this patch through your tree as it depends 
on DRM changes. We can also sync so that I take it once you merged the rest of 
the series. Having vdosys1 series around maybe that's better to avoid merge 
problems.

Regards,
Matthias

> ---
>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index d2b02bb43768..16ac0e5847f0 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_CCORR,
>   	DDP_COMPONENT_COLOR0,
>   	DDP_COMPONENT_COLOR1,
> -	DDP_COMPONENT_DITHER,
> -	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DITHER0,
>   	DDP_COMPONENT_DITHER1,
>   	DDP_COMPONENT_DP_INTF0,
>   	DDP_COMPONENT_DP_INTF1,

