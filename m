Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733AEC77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgpZO9AIe8VGZCUKnUlH/UpTwMfShkzNFnZzlAbDLio=; b=bvwers8OfCnP+15LRG4X9nukC7
	dDE3ITEDrSmmhs/5rDE4aloKycF9/MfXfL3+Zul2ZGDUaYN3X+kz/GNEWjKbCAMsc32+RHeAs4GZ1
	Xc5zZIe+WcCigMokAlbM8kChytW9w8cBPuRgj/Tnl6yCeesGx6qpZXGlQ9h3H/hPmwiFDH0ybYH24
	XWZpxmYzs9M2gIKAp7AQfDjjqaLVkTitsnJCNH6hXaoq0NbGq9LPRkv0srULO+IGYe1mKPUYq1Fsf
	Vzgc2/BZH0Qc37q5aFWnDuGw5jmd8yFU1DNzWf68Be6RN5Af11xQ/S1Saos8ZtEPXONWRx4QJIDgN
	06hKdJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsQF-005QbA-1j;
	Thu, 13 Apr 2023 08:35:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsQA-005QZj-2M
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 08:35:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id l16so7520432wms.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681374906; x=1683966906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgpZO9AIe8VGZCUKnUlH/UpTwMfShkzNFnZzlAbDLio=;
        b=ByBF+Pah2Cf9Dw7TTELtEmi4QeLJUvfUQwiZWnhovu38hGZVegX3B8g0TQYPDqTWV/
         Zfu53nju26Z+aw9vrigaoL3FNPNvf2t/hqxRcavJffON7yb/Z+RDgjSIwwr2Gv0g7hYT
         9FOjlaDuvpSZpmIWYaDET1uDFRpmbeYIxxH2SpeHWO2mtxffwwVOPcsN7MU+Hs2MHbH1
         uOXeR5foBmzEOk5l1VYxRu+KeMsOfKesYF+GBBQg6bWatvKNh0fA70YvPYxBa18aLRiE
         QaZBfzFaSF3xH7oVE6AFCKYjqEbbeiD4rbUQgnorOXSaSlL6emOYNklczk4IyHNsqfEm
         t2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681374906; x=1683966906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgpZO9AIe8VGZCUKnUlH/UpTwMfShkzNFnZzlAbDLio=;
        b=Ub1NxKTCmKbtNBKXf9xYdGTyzpCmDwGepll1C+NPeNyh+Hh8igj2GX6HdvLT48XbfH
         Y+ie5vDQI6fqg+LOxcLXLjQ2ah1lygv4AlUs1lnYAEtUgyTsQdleH0szyjavXg0Oe7Fu
         c5rrjzql5hI4H6Cahf+FKgHkFGbLQ5C7s1ldDUjHBITyJiu5DM/voPU+FnSutVbcsl68
         vh5J0U/j/ax6zm5d2sFfDau0oGHjJ2n4HRI78+2JNVugmlF4KVQtHbtwZ57AT/TpU4EG
         /KKF5JQLRlLe52vRmSnJHafLvlL+uWR0RuCvDcc/ePxAVC1y9UxbvuxlOrwzjk9b1E9B
         Vzbg==
X-Gm-Message-State: AAQBX9eo/SFCElHuegAQGHM7CHRa69DJXqHh39WxDdayvTK0uoVHHHbk
	2BfHrrunbjnx+hEI1sgONtZucQ==
X-Google-Smtp-Source: AKy350YyIRH/26Jq8AL749rYqtIOUqj06Hs2snEnIripo+iwHCpV8X7IlqPvWdD8xla04mFPT4eT3A==
X-Received: by 2002:a05:600c:348e:b0:3ee:93d2:c915 with SMTP id a14-20020a05600c348e00b003ee93d2c915mr821131wmq.6.1681374906602;
        Thu, 13 Apr 2023 01:35:06 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c028700b003f09a9503b5sm1182407wmk.23.2023.04.13.01.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 01:35:06 -0700 (PDT)
Message-ID: <470d8376-6232-66a7-30f4-561245cf0c07@baylibre.com>
Date: Thu, 13 Apr 2023 10:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/7] dt-bindings: leds: leds-mt6323: Document mt6331
 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_013510_987847_C169B94D 
X-CRM114-Status: UNSURE (   6.31  )
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

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> Add mediatek,mt6331-led compatible for the LED controller found
> in the MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


