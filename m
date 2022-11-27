Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823BEC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 21:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khJGEcAxyToyXETE8fU9rz9l1LFJBw/cIsJPkm/f/PU=; b=07CdLK2t5HYnIFpApzkfCjXNmz
	zC7/fy/X4snz42taleQM8gnWBYilua+wDwqmYjR9e4FMbAxpAV6QlaYhu8mbs9fgaqz5hWndZM3C7
	NH51/KZu68pMnI/U2QD5JCKymLjuhmHafSw4B0GoxFhstoRLDzv0H+sHkYxIkKExBM41qsS8DONSS
	a2Jh44+5qlfalWAK5Z0Ti/MMzPHzPwHNBIU4Pr+AGpd1Kd/An0RV0sJIim8akQSbz1FImWWaLV9DJ
	/t+viAVZjAaM/36fvapZZf8ij9fiXKDtBzxJoTx1eKXHzaBvOJVOv+OmKR/GTPAzeg1SNoTn0TpPp
	n9tNnOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozP7X-00Dj3O-9m; Sun, 27 Nov 2022 21:23:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozP7I-00Dixl-0o
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 21:23:13 +0000
Received: by mail-lf1-x130.google.com with SMTP id bp15so14583181lfb.13
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 13:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khJGEcAxyToyXETE8fU9rz9l1LFJBw/cIsJPkm/f/PU=;
        b=tLOxS5Ju0F/5+WAGQpUjWLEhmoDnhhu4trZ5hwg/h6q/sdO7f5BoEFQKt4NZbsUE/P
         s+IMrtCQA6vniP29VFQ613uyVWf4e2YSqN44zj5mseK4rAqXh9p7r9TaTrSn6dczDfll
         hHg4TohE1h9BekBlgAdO8SOPsTKbrLib7ydnXqrDNBGgFshx6mxojYyeo+odYq1AV2KO
         GDiOZ9HRb6vxcVhE0eTSgEJEkqRvReaFisfwASY1iEq/+rOU1gqgtQIuPj0gwVXCt97m
         y8Mov2PpnqdZvC58gBmf5NvhKHjo/EegpxWFVkzAI8xkAQbpmMclskHktdR2rKJgfDMv
         V/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khJGEcAxyToyXETE8fU9rz9l1LFJBw/cIsJPkm/f/PU=;
        b=1nxwC2x7wlWG40khnm+1Fi25gDngFjT/SECzSbXyV9482xOmMbk87+bwOQXijHsQmE
         j4w7C3AFNLi32YadUG0JzlXF1Fck5jTX89UV6AgdfRFZ5FSwTeCLUpCk0qfTT4jRk0I6
         Zv1FVJXuxL4szY9ZgQ1E+9D2GQk02xgSNUbvWOpYjYrtS8GNsiEJ8VDv/lcqI1UPmDtR
         l8DHuJ1YiYG2bwRM/1Z8LD0kwOZVhyat6e7aeb//B1dzaaeK1+MOKEefd8RAtQwjR2DJ
         37JGEs4yijhN2yj+bSxOctdo9O2yFh06Sc1kvJYpNNanMJjfEJEYla3JX42p1+kRfRwV
         WZ4w==
X-Gm-Message-State: ANoB5plWsa6XYWfyJZx2wk2pfrn5HzAFH/RlQ8VyhS0beLGcb9GhH84I
	H3bOCQBkmT48Xg3ZzsloD/Zp5g==
X-Google-Smtp-Source: AA0mqf6t6lVqGBUM3fhphf9PXX1lLQmeOhZsQx3OSGUmf9QN4gv7d0jST0PrcyJpl5QvhovvFvlyiA==
X-Received: by 2002:ac2:58d7:0:b0:4b4:fbce:606b with SMTP id u23-20020ac258d7000000b004b4fbce606bmr4678034lfo.27.1669584190487;
        Sun, 27 Nov 2022 13:23:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z14-20020a056512308e00b004abc977ad7fsm1413012lfd.294.2022.11.27.13.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:23:10 -0800 (PST)
Message-ID: <0c021610-6b3c-f6fb-915c-dcdab47fdcf0@linaro.org>
Date: Sun, 27 Nov 2022 22:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add
 mt8188 compatible name
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20221124075516.1669-1-Elvis.Wang@mediatek.com>
 <20221124075516.1669-3-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124075516.1669-3-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_132312_090490_04AF4FB0 
X-CRM114-Status: UNSURE (   6.94  )
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

On 24/11/2022 08:55, Elvis.Wang wrote:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> Add mt8188 compatible name.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


