Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA40C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SSDnklAW4zgp5oUoZOk9a4gDwfqJ7RXP0Q+J3II0Ts=; b=v7qrKw25j822nq
	lXtaaySU+f/Mzf8G74OP1AmcdL4YLjofZe/v/1dL271ngHv8KPDaB1mgsY5YYslcGdmcTxm4QKDEc
	l6gVxFWu2aYZ2IrK3gbGr5UTi9etBZ7nmWAEFBwxUFb/6YKl1DxwgE7JNchQiVzwHmxITDtP9Nh0S
	hAXs/5cbRvxMP/o+qDMGl/cJfSSXgKZSFz4XJGgyPNiKTcSSiYnlSfJii31L7lylPgUaSdqcaVdQ1
	CFE+Y/YOcDD/PURhxwERwWJJ47ckHlC9o/j4v9xW5jzVC7pHQu4GYUdj6B8uj95nTOdw2ZXFUFfHJ
	pOXaKcTk49TT67M/UKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYn0D-008GI5-QP; Mon, 28 Mar 2022 10:53:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYn00-008GF4-A3; Mon, 28 Mar 2022 10:53:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id u16so19776689wru.4;
 Mon, 28 Mar 2022 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pQvUwgGe2yUxoTgyZUNPtgyDX7Rla1bC9Fp/TydpPrQ=;
 b=EUPsZ0BapwUGRVBvI45LPlGGVpCgTp2IJICaghOpvSgNEI/GIJHLT40ZIDpzkHQipr
 4ApJswcAD8TGMNtTH5OeUgiZJCdBxRhzdIoeK2NG3nAQa+Wb2IpYD0KLhSdYyAjJHp8W
 w3nZyOEngZqaQfu0muA68xymOxEasCLD+auRqe6r/PdfBeXmV9B5f6hCwpO91DqVQVEX
 2JWGA02+1B4DvuIcajRxgVifEunaFgpDOzrezUhWJblsoEpmVA3b61TBKvyBygdp2LuC
 wpePzCRkMalMTKORVbfHkGNQEvcOIDRRiX1CZ68gCz40o1pRznZ+rfJxdGf5UoH9yKL9
 XQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pQvUwgGe2yUxoTgyZUNPtgyDX7Rla1bC9Fp/TydpPrQ=;
 b=Zkhfbq3iV4uYytO6dShOPIAH+pbVXUycZ3UE4yQGz5uhfFMKXuxdZuGFrKbCcaT26T
 7i07v/KN932F9E/m/W+CQ3eMJMWFP9Tfgz/aXB9d4HaaaNR9nTy5XyvzTNErbYkME2WZ
 n1rTpybxEq9ESsJ4MRkDzzuXS5HQnEiBWZ/kUho4i70gUkPcDaCNyzN9uRRDMtiP4cc0
 k8K1ydwJlJ9UbWtduJEv1P855F4r1Lc+p/cD5koHn+1Ujb7nI9Cntm18k0DTA+x4ozM4
 Jq8+tnHdiGbHBHx5YLYF9vI9rc75c1yN8k4V+mVs+53UEFTVoqncPmkG8isAz4jN146L
 KwWw==
X-Gm-Message-State: AOAM531XTJc3ELANRpjqhVRRyNZQLOlnAGd/IrEXkal0pjTps8Exx1gX
 amElKIPT6f8SY7SWz5Wemn4=
X-Google-Smtp-Source: ABdhPJzfW9YDSUoDqPF/6iL0fbw7yC3QCVyS/FFbWHw05MpIh2rYo5I/45yXykhosnFub4goGvtDwg==
X-Received: by 2002:a5d:6d05:0:b0:205:8631:cfae with SMTP id
 e5-20020a5d6d05000000b002058631cfaemr22519718wrq.612.1648464802866; 
 Mon, 28 Mar 2022 03:53:22 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 v4-20020adfa1c4000000b00205c6dfc41esm1776263wrv.18.2022.03.28.03.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 03:53:22 -0700 (PDT)
Message-ID: <fdf68128-b743-2ad5-a4e0-25451c387417@gmail.com>
Date: Mon, 28 Mar 2022 12:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soc: mediatek: mmsys: Add sw0_rst_offset for MT8192
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 rex-bc.chen@mediatek.com
References: <20220323091932.10648-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220323091932.10648-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_035324_404464_6214E9A3 
X-CRM114-Status: GOOD (  16.03  )
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



On 23/03/2022 10:19, AngeloGioacchino Del Regno wrote:
> MT8192 has the same sw0 reset offset as MT8186: add the parameter
> to be able to use mmsys as a reset controller for managing at
> least the DSI reset line.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
> 
> v2: Change the offset to 0x160 (as defined for MT8186). Thanks, Rex-BC!
> 
>   drivers/soc/mediatek/mtk-mmsys.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..f69521fabcce 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -70,6 +70,7 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8192-mm",
>   	.routes = mmsys_mt8192_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> +	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
