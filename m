Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFCEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5X6d8yeHa2+QX5Vku3RVv1vq0hZBOf4rxOn2JvygKU=; b=KHmUM4ZH/T2VUG
	rl2EEjIwD+zhMMKe0Jgc4K2Q1U9dsBH7ZKq3Z9Kin9lIq9bbOFY0ZvHx4RfsvYtZZiK1H/vUUkGwW
	F/unpYEKNp+asCh7u1WzCBUdL+1UlWetY0v9GYJleZVPR2jgzh1WHRuGyJGb3po6Y4gNaaLt1EYZp
	3F/dtfkaICYW5nl2mS4wdD7Umj1ZNaCO60ZiNUMCiVDPoia92InuSYhaimcpu75GHreCfCcghtoQM
	TXV0knZmZL8Kve7/LFIHAX5mg6JP4qOhGPFvXcigUDDUeddiWOaOh6V/g3MsWs4nOnQct7jQd2TGw
	/cRW9DiUWvASE4ZypKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtQc-00Cj6r-5B; Tue, 17 May 2022 09:23:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtQM-00Cj1V-8X; Tue, 17 May 2022 09:23:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso935159wmp.0; 
 Tue, 17 May 2022 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bb8/nB+kmhmFWXO5zVpYOav19fcBlS1D1P8aaZq8+TA=;
 b=NLuQyV1W/2pAV/8qtAsbjvwJT0bp3/m6yP8/qSf4DNkBZWjJ2qSE9Ic+KESK+AZYBD
 8YEie4oWlMR8nMC/+PrzaXDerzR9c1lFCh3BL0dZm7WN+oqSJqVcj7Lk4zHOAy0LhAmb
 JLklEJdmplbSd2ydk6O/obwQazWLkGFoYwdMLrPGhqlAaOaq6bhNTc2crWk/GzOyYI1+
 nSi7ffaNCjsaSz1SLD+6yRcsp42Ea3m1BpOU1mi8qeXcn29E77fvHCiS7tClfy6BmNpT
 asg2VsBo4JEL5yc4L48803bAga1iwd1AJDvDkmI4tZvSn0DccQdt2Wekvfe0Ah4bj7/O
 6n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bb8/nB+kmhmFWXO5zVpYOav19fcBlS1D1P8aaZq8+TA=;
 b=updeIj/Z6dYsvd7cC/mTHckQ2S0dpaYyqQVuGLu+zxi69UV4oKMWIrC04y5NJx6ugk
 ZGqNutBhrZjT/a6ps3ujkBQcwaEkBeMITURoNMPxaU2JnE12i4Kap2LGk/hBBQRSd5St
 ZMZWGog96EJDcbm+CuaI42Nv6fnWVxnc6+sljuG07Hip0X70oxDZ3SG4jMEh351xILlB
 Iu8CTBXJyKTVCO7N+r7JvgvetcvIn8QUy/olCd2C5hd8w38HLJ1W4mmRRDhQ7aF9IIXw
 EqTBPnnL9DAIFYc6ZQ3mXLbZmL8k7vNlRPE3m+VBJQjBx4qLhmUTl2BqYGyF6QqVNgAy
 8/aQ==
X-Gm-Message-State: AOAM531Eeyecj42c7oQ9cVEGaEHvZ1wWsiIHaQ0J62ssUEGxKNFBaeQV
 W1Kbz2WVGlNbFLIKgeBIUsk=
X-Google-Smtp-Source: ABdhPJzPJ0rigZkAme1aN3XhsVvyYFk3+d9ermcQUZyB/s2knhda9Ri1e6wxK/jVN7+UIOAlVEsbYQ==
X-Received: by 2002:a7b:c081:0:b0:394:789b:915 with SMTP id
 r1-20020a7bc081000000b00394789b0915mr20241355wmh.105.1652779402461; 
 Tue, 17 May 2022 02:23:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a7bcf15000000b003942a244ec8sm1409496wmg.13.2022.05.17.02.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:23:21 -0700 (PDT)
Message-ID: <6917bfeb-2f20-dafd-14e9-2dd0dc42ab91@gmail.com>
Date: Tue, 17 May 2022 11:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/5] soc: mediatek: pwrap: Compress of_device_id
 entries to one line
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-6-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220516124659.69484-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_022326_354634_D470A7EC 
X-CRM114-Status: GOOD (  19.18  )
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



On 16/05/2022 14:46, AngeloGioacchino Del Regno wrote:
> Compress each entry of the of_device_id tables in this driver to one
> line instead of three, as they fit just fine in a single line.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 90 ++++++++--------------------
>   1 file changed, 24 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 7d02e1d4faf4..c018092e6cbe 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1960,33 +1960,17 @@ static const struct pwrap_slv_type pmic_mt6397 = {
>   };
>   
>   static const struct of_device_id of_slave_match_tbl[] = {
> -	{
> -		.compatible = "mediatek,mt6323",
> -		.data = &pmic_mt6323,
> -	}, {
> -		.compatible = "mediatek,mt6351",
> -		.data = &pmic_mt6351,
> -	}, {
> -		.compatible = "mediatek,mt6357",
> -		.data = &pmic_mt6357,
> -	}, {
> -		.compatible = "mediatek,mt6358",
> -		.data = &pmic_mt6358,
> -	}, {
> -		.compatible = "mediatek,mt6359",
> -		.data = &pmic_mt6359,
> -	}, {
> -		/* The MT6380 PMIC only implements a regulator, so we bind it
> -		 * directly instead of using a MFD.
> -		 */
> -		.compatible = "mediatek,mt6380-regulator",
> -		.data = &pmic_mt6380,
> -	}, {
> -		.compatible = "mediatek,mt6397",
> -		.data = &pmic_mt6397,
> -	}, {
> -		/* sentinel */
> -	}
> +	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
> +	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
> +	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
> +	{ .compatible = "mediatek,mt6358", .data = &pmic_mt6358 },
> +	{ .compatible = "mediatek,mt6359", .data = &pmic_mt6359 },
> +	/* The MT6380 PMIC only implements a regulator, so we bind it

Nit-pick alert: new line here for readability.

Regards,
Matthias

> +	 * directly instead of using a MFD.
> +	 */
> +	{ .compatible = "mediatek,mt6380-regulator", .data = &pmic_mt6380 },
> +	{ .compatible = "mediatek,mt6397", .data = &pmic_mt6397 },
> +	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_slave_match_tbl);
>   
> @@ -2145,45 +2129,19 @@ static struct pmic_wrapper_type pwrap_mt8186 = {
>   };
>   
>   static const struct of_device_id of_pwrap_match_tbl[] = {
> -	{
> -		.compatible = "mediatek,mt2701-pwrap",
> -		.data = &pwrap_mt2701,
> -	}, {
> -		.compatible = "mediatek,mt6765-pwrap",
> -		.data = &pwrap_mt6765,
> -	}, {
> -		.compatible = "mediatek,mt6779-pwrap",
> -		.data = &pwrap_mt6779,
> -	}, {
> -		.compatible = "mediatek,mt6797-pwrap",
> -		.data = &pwrap_mt6797,
> -	}, {
> -		.compatible = "mediatek,mt6873-pwrap",
> -		.data = &pwrap_mt6873,
> -	}, {
> -		.compatible = "mediatek,mt7622-pwrap",
> -		.data = &pwrap_mt7622,
> -	}, {
> -		.compatible = "mediatek,mt8135-pwrap",
> -		.data = &pwrap_mt8135,
> -	}, {
> -		.compatible = "mediatek,mt8173-pwrap",
> -		.data = &pwrap_mt8173,
> -	}, {
> -		.compatible = "mediatek,mt8183-pwrap",
> -		.data = &pwrap_mt8183,
> -	}, {
> -		.compatible = "mediatek,mt8186-pwrap",
> -		.data = &pwrap_mt8186,
> -	}, {
> -		.compatible = "mediatek,mt8195-pwrap",
> -		.data = &pwrap_mt8195,
> -	}, {
> -		.compatible = "mediatek,mt8516-pwrap",
> -		.data = &pwrap_mt8516,
> -	}, {
> -		/* sentinel */
> -	}
> +	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
> +	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
> +	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
> +	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
> +	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
> +	{ .compatible = "mediatek,mt7622-pwrap", .data = &pwrap_mt7622 },
> +	{ .compatible = "mediatek,mt8135-pwrap", .data = &pwrap_mt8135 },
> +	{ .compatible = "mediatek,mt8173-pwrap", .data = &pwrap_mt8173 },
> +	{ .compatible = "mediatek,mt8183-pwrap", .data = &pwrap_mt8183 },
> +	{ .compatible = "mediatek,mt8186-pwrap", .data = &pwrap_mt8186 },
> +	{ .compatible = "mediatek,mt8195-pwrap", .data = &pwrap_mt8195 },
> +	{ .compatible = "mediatek,mt8516-pwrap", .data = &pwrap_mt8516 },
> +	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
