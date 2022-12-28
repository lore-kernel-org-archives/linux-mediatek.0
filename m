Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D526C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szUYv0uneyN7YHYxEv+1bpNF1FTM8iygqyO0FKMlC7o=; b=ifbPcl6Nq20Oxc7GB79ztwXU0z
	GgJaj9G6Hdd4bwW+8jLJEGL8/SCssLTGIMCr9o4blM2nBvBAJRaeSq3vCHNQXRo/fj+1q82MuiU2I
	VA5FUb1tmjhoC4v1UKEwxEEZdBy220d0zX9mQySZ84BgUpmQmmHkUw5UdNfqIaSB/qivqKpI5RQRT
	YFCGnWtrwGkYzSZ8di9uRfPt29AjR7Znci83Lmg+DhQgQfuLcyGgtTWQ2Yphe54uldTXFocfYzQDc
	ejIj1muM3GdjXRx9EMFnyOAJnxtWkcj4cLqJs8KS0FkXHJul9TXSJziUpiIEzM0AX2m2lLUSl4FYg
	NCfCwG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVgc-004rn1-WB; Wed, 28 Dec 2022 12:37:35 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVgK-004ri2-KK
	for linux-mediatek@lists.infradead.org; Wed, 28 Dec 2022 12:37:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id m6so13060442lfj.11
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Dec 2022 04:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szUYv0uneyN7YHYxEv+1bpNF1FTM8iygqyO0FKMlC7o=;
        b=WOVDjahbgzvlWA+I1nfhLWRgkZ9OLauPupQIX9iHFBEbdG8UN1RK9cBk1C1lyT3fTt
         M8sP2kN+ZfEc0G/6RdgTqJ8VY/1ISqEaKr6aGlvBLyAp1z+6nm656TsD+NlwlHqAqUup
         6K1j9LRupJG4y9A3X8omkxFf7AoNQ2HTj5Jq/V8I9J0C+nIOWRdneTA+I4UZ/UiAHjAi
         ahjoVbi51mljf696KPwr8etfQCOeRJYRFbfXjkDtECh+NQiS182weSxvczkUsV01bKTf
         9FbvEHLrlGbTsDPaiqZBZsi68TiUfCAbJejheVLEvaTvdgfLnLO/DxzpGHofAqiqCkej
         I4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szUYv0uneyN7YHYxEv+1bpNF1FTM8iygqyO0FKMlC7o=;
        b=o27ndAZe2cGnzJSIF1zBULchAdUh1nHupVL/WXWH0+EHUySrIw36Na1sI2sbOYxVcw
         POwqI5R0m2Nc2F0ZzV6SW6viDZFqTbmAnLzg+KMcMWT5mOWbpfgseFTDOAFupj5s12eF
         hs3+knEfuU+rwDe/KPf97Eu7k4Ai8PhuTs4/b/92hwRgMJ9WSiigvDYVmfsfnLuLlnom
         V1Fa+8kahAr+SnuSOfqpBnJuLulWcPwgpVgvGJuTQFHncmVz1QiOzzV709AQRbY6QgvD
         R7vQHHLnTOgOztWsuPg0Gd+6wkkecrY0lkRKVps1FVON5ssU4pkBDYo1Ug4rlJQOMyna
         zN7w==
X-Gm-Message-State: AFqh2kqAKDnVo6JqKofH7YTO8pQJXepgDUdz95LRoDBYMtGCDhXIIe3u
	UVd3NzO0pJ3nkWL0L5aOAqFr/A==
X-Google-Smtp-Source: AMrXdXvZp7CP84l0lYhtw+B8zuMLZIv9fPypPu/nFTNLtiVo6H2Eh797Bsi99jc32fqou298yyIzXg==
X-Received: by 2002:a05:6512:228a:b0:4b5:7f79:f8bd with SMTP id f10-20020a056512228a00b004b57f79f8bdmr9812553lfu.22.1672231034559;
        Wed, 28 Dec 2022 04:37:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q21-20020a19a415000000b004a46f92a15bsm2661813lfc.41.2022.12.28.04.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 04:37:13 -0800 (PST)
Message-ID: <cae5273e-aac5-0c4c-6686-fb2cbc5379e3@linaro.org>
Date: Wed, 28 Dec 2022 13:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
Content-Language: en-US
To: tongjian <tongjian@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_043720_228600_8DA67794 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

On 28/12/2022 13:22, tongjian wrote:
> Add support for using the rt5682s codec together with max98360a on
> MT8186-MT6366-RT1019-RT5682S machines.
> 
> Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>

The author and SoB should be full name. Is this correct (full)
transliteration of your name?


Best regards,
Krzysztof


