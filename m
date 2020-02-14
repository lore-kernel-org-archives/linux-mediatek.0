Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3668C3B18F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 09:48:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5A142187F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 09:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2JGQOC6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQ5q/ss3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5A142187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gABR1+tAm16OB8ekaWLoWn3TXkyqAK6FDOwuhsqmjNc=; b=Q2JGQOC6eq7r+C
	5ikc37t4kWHHXDhTqIubzCuRtiXHfxowkm9MghR0HYpPkUL1pgsP0AkbL2Q2o3vvvwYQAtK/2qUsq
	a2zKd3qJjEh+I0ve0YAmnx1Hy3V0/I25SrxtqGB1wK+jpoBmvT7TChHkjK5RTGtQCVtLoSGVohc4J
	ZCin/0uLyixElscZ2Ov1MN6I7v32nB370MxG1LBFOFOzSU7qcf8wFBfbWEFNn0VO331UDiA6zJwRo
	MFbGzGJbxNDBBGAMtrNGkshlzp7xPbGZ6vuGLSObEND1rs6Uw5cT8KasIjp/8KaI30wLyU4Q5GAPW
	f18klAkHwLpdNlWQhWXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2XZj-0006ZO-US; Fri, 14 Feb 2020 09:47:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2XZg-0006Z4-7X
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 09:47:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id a5so9265370wmb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Feb 2020 01:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vclc07gFUU3ox1oVeCPLVKCYytkHZTzBxyFOToqsqjs=;
 b=OQ5q/ss37g2NViK/PfYLjzLEhrX5jWkvs8bsZta26CZwC9k/1FZQ8qhA7lZBHnPOG/
 wmsnD2qhB9Rss1nHQbrYL5DK99Btp6ShH3aZe4G2Ugaz4Yb4O0DWT4QGuFHMwpswR81r
 vXQFNkmKX8z37n57zwHBS8tCXzYdo9Jv0So4xIfznG40248jNd5H8LIQqxYs4nuCUsId
 EsyXfYKnVnO8aZl5JZ28G2ZS5WSU+6OA7FsYBGkwUdTs02UdrI5NS9cRBgLfjsVJDZrL
 1E1JOCZsXmK0peg4t9DbUCyW5EGaOkUAHglpnEIKy9+ZrG9lrr4EshLype7scIRmoDoN
 GVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vclc07gFUU3ox1oVeCPLVKCYytkHZTzBxyFOToqsqjs=;
 b=B9S8X+elxNxXmvgyUWev0EcEZxoYlp71tD+doQbvLzTZlGptTPWRNeM9JSzQrv3HAC
 /yxvdLyYSF4GQZz7gHVUZvlxg/RGvDZo3Yw4ddOD3wJU3whrXf8wKlv9DpZ59vhM8D/j
 FbICeHruUYj/w/GdAUBmduGG2nglU1vxDrj6KB13XI0ovLgHzhXj14sDDPII2ikkztiy
 p9tveuW7klRvbklhD3EjWxZvrWe7KCWVzXsPAz6LQnSHwn6OG5khSoNXqirTdcF+teYL
 wv/wECf17fjPJIUuKsn4M13gyuc+EvLmlQrXH4mNV9Nfh8pV5CD8Ls5Af6k4SijRCNIx
 lLsg==
X-Gm-Message-State: APjAAAVqd1SBigWS8j1kO4v0/djpzZrEguXue/MhGCVoJRSWa02z+IeE
 IhlPMD5WekkO6WPLmtcWNCs=
X-Google-Smtp-Source: APXvYqx9P403cuaEK1HAJ5b33nn6XnEsfPDsi2Vej0ERCi2vgX7b7i0yujDHyaZMz7tHgEetI05Xlw==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr3774330wme.181.1581673670390; 
 Fri, 14 Feb 2020 01:47:50 -0800 (PST)
Received: from ziggy.stardust ([37.223.145.31])
 by smtp.gmail.com with ESMTPSA id k10sm6551045wrd.68.2020.02.14.01.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 01:47:49 -0800 (PST)
Subject: Re: [PATCH] clk: mediatek: clk-mt8173: fix potential memory leak
To: qiwuchen55@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
References: <1581651274-5933-1-git-send-email-qiwuchen55@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9a0b730c-1971-ee21-4abb-e324cd733122@gmail.com>
Date: Fri, 14 Feb 2020 10:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581651274-5933-1-git-send-email-qiwuchen55@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_014752_296939_9414D6A3 
X-CRM114-Status: GOOD (  17.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: kstewart@linuxfoundation.org, seiya.wang@mediatek.com,
 gregkh@linuxfoundation.org, linux-mediatek@lists.infradead.org,
 tglx@linutronix.de, chenqiwu <chenqiwu@xiaomi.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/02/2020 04:34, qiwuchen55@gmail.com wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> Free clk_data or iomem resources if init is not successful.
> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
>  drivers/clk/mediatek/clk-mt8173.c | 43 +++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 537a7f4..eaf4e70 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
> @@ -941,9 +942,13 @@ static void __init mtk_topckgen_init(struct device_node *node)
>  			&mt8173_clk_lock, clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);

we have to free clk_data->clks as well, don't we?
This holds for all the other hunks in this patch as well.

Actually a better solution would be to change mtk_alloc_clk_data to pass it a
struct device and do devm_kzalloc etc. This way we won't need to deal with
freeing data in case of error. This is an API change and includes changes to all
clock drivers of MediaTek though.

Regards,
Matthias

> +		clk_data = NULL;
> +		iounmap(base);
> +	}
>  
>  	mtk_clk_enable_critical();
>  }
> @@ -964,9 +969,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
>  				  clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +	}
>  
>  	mtk_register_reset_controller(node, 2, 0x30);
>  }
> @@ -992,9 +999,12 @@ static void __init mtk_pericfg_init(struct device_node *node)
>  			&mt8173_clk_lock, clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +		iounmap(base);
> +	}
>  
>  	mtk_register_reset_controller(node, 2, 0);
>  }
> @@ -1117,9 +1127,14 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
>  	clk_data->clks[CLK_APMIXED_HDMI_REF] = clk;
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		clk_unregister_divider(clk);
> +		kfree(clk_data);
> +		clk_data = NULL;
> +		iounmap(base);
> +	}
>  
>  	mtk_clk_enable_critical();
>  }
> @@ -1138,9 +1153,11 @@ static void __init mtk_imgsys_init(struct device_node *node)
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>  
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +	}
>  }
>  CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
>  
> @@ -1155,9 +1172,11 @@ static void __init mtk_mmsys_init(struct device_node *node)
>  						clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +	}
>  }
>  CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
>  
> @@ -1172,9 +1191,11 @@ static void __init mtk_vdecsys_init(struct device_node *node)
>  						clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +	}
>  }
>  CLK_OF_DECLARE(mtk_vdecsys, "mediatek,mt8173-vdecsys", mtk_vdecsys_init);
>  
> @@ -1189,9 +1210,11 @@ static void __init mtk_vencsys_init(struct device_node *node)
>  						clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +	}
>  }
>  CLK_OF_DECLARE(mtk_vencsys, "mediatek,mt8173-vencsys", mtk_vencsys_init);
>  
> @@ -1206,8 +1229,10 @@ static void __init mtk_vencltsys_init(struct device_node *node)
>  						clk_data);
>  
>  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> -	if (r)
> +	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> +		kfree(clk_data);
> +	}
>  }
>  CLK_OF_DECLARE(mtk_vencltsys, "mediatek,mt8173-vencltsys", mtk_vencltsys_init);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
