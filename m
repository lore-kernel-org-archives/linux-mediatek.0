Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05747EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 08:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fayqxLh/vco+SYInwt83ea7CX6FUWQU2usKrCQ013+k=; b=qfaEFO4gjDKrn6Cg/JeakfRMiy
	0j+rhMdwo60KgAtcmpxLU+DnwAcJC8DBxe7IOyMhUS6sn0QuCwR5mpQoNkRnsk4iLm6WMQyGt9JeM
	wEMHPiz2x+7KuMRnIhvjUTjvRlxzeabetfnD1uyPfHSQOmimyTJ5J+ZywYckqvOdHa4iH9sXxhfd3
	cESYGOWl7GLdvxvYvofeJBHXI28Z2rY8ugEli8vxsuVoJZ1ZiNhGLDVsG9Ytqlehy9e3t/q4pp9YO
	TUyIy6CckBlaGG83C633z41HjKgzpOzM96G3ePGkz34QF9qea4MRvh25OKRrqhUiKMwkxrnYv90cx
	/Ea2js4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKoh-0011Fk-0B;
	Thu, 06 Jul 2023 08:58:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHKob-0011Do-28
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jul 2023 08:58:20 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992ace062f3so54527366b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jul 2023 01:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688633894; x=1691225894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fayqxLh/vco+SYInwt83ea7CX6FUWQU2usKrCQ013+k=;
        b=SUHGYVGhzR4ydLLC3EczqM7/h6WyxuOP9FR5zKpzrxTsJrLh66qKsFCYMxex/QcrLA
         NL1nUlWdl/RfC8wWgtBQ8KNBsAo260fgTZiWgFlMcI87P2w/8QIco1+PtLz/axGfoTm+
         eBfGmx37NrrgCwr5DHiABlwgUon4P+36PgEuG0ZrDSjrWRh1XmZsU76R9A0bQKCd6jPK
         46+5Y2uagL6AOS32r/MpE47o2Yfr0kJF+UPbjFWGtQs9apRKiwsjRvRP8AoCuJirPihn
         5/FRjQH7uPix9qG760X2c+BNfCqk8NyGfgotPYQ3W++7bMUU3RnKKPHZzMHDkioQhZj4
         YL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688633894; x=1691225894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fayqxLh/vco+SYInwt83ea7CX6FUWQU2usKrCQ013+k=;
        b=Ojjiuc9lzU7iK0U55Pugg2M6LS+A6mGPN20271vyvAGqHmP/5AJ49da+WAmMbrm2Yk
         RdTtargyTdTGIRzBeHWeCeL664GuTDCCzmyqhRTdHJeZxD2W9EG+DEtvCqhsaoWIv2mX
         iVIPXD8+gwopd1jnQXdjKzYB91886YeH6rd1eqltxObnCKlbYE7KHx8J43X2qd/A0+QA
         PMNt9cfzokK1ZNAl+8Qc5est2mO9gewxzW0NcMcQvtXptNstgxby9/vWa2dHZTNFxXl5
         QzHsmQZzcLub4Zsz/3IDCM7BQ3GM3gOGMv/UEM7Cl7mPHEYgN5ejAAIL5Q9VhRM8RN49
         VMfA==
X-Gm-Message-State: ABy/qLZnJqNLTFZNEJLj9d8pCPHW5bI6rO5EKjWo259FRGfPIe4ezDpS
	yoFhLx3HmFDNPBg+n5xejSnusQ==
X-Google-Smtp-Source: APBJJlFNHTYQWRHtROnOOty5+ELFvyo8/ZudrjTKHz8SF9FuZHky+aDb2X3o5VvOCjMOU5wiKluKFg==
X-Received: by 2002:a17:906:7a5e:b0:992:b8b6:6bcd with SMTP id i30-20020a1709067a5e00b00992b8b66bcdmr979075ejo.16.1688633894307;
        Thu, 06 Jul 2023 01:58:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e9-20020a1709067e0900b0099236e3f270sm542442ejr.58.2023.07.06.01.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 01:58:13 -0700 (PDT)
Message-ID: <464fdef5-f43c-a7b2-66d2-bf558a6ee2c7@linaro.org>
Date: Thu, 6 Jul 2023 10:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230706021425.31735-1-shuijing.li@mediatek.com>
 <20230706021425.31735-2-shuijing.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230706021425.31735-2-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_015817_723463_BA65970B 
X-CRM114-Status: UNSURE (   7.87  )
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

On 06/07/2023 04:14, Shuijing Li wrote:
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes in v2:
> add a mediatek,mt8188-edp-tx compatible per suggestion from the previous thread:
> https://lore.kernel.org/lkml/c4a4a900-c80d-b110-f10e-7fa2dae8b7b5@collabora.com/
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


