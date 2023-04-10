Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEDFC77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB7W0GXP1VzxhOdRLXF0y5oyjgK/ieF8BJXDgGfMNiM=; b=w2w8OoV3XhG0S6pM61nrmSH2FR
	U9Ch59DbXUwdI7yNbIvBf1aFNVhkaybm/y0GQMXjp7xSZT3KXlxslHnZmts5W51zJrl9rOxE0JYRq
	FOXzDGxbyuBCVYTY5t9jPq8IlXDjHuLhEAoFGB4vXP+BS84TbIpeOnA4N4VyDVwnnRfgPTVLyaqdg
	MO7pUUlkfHxZ+nweff1qJxZt0QaQc7YvvMx3aD7/nIvguKPLFK7tZlUcQmBwGFmFyBWOckWOmtBXm
	db090ZhJ4jXhz8bYAiEF4qoAgzRvUtd266UlIEarBMss6xUC5TBSqGwkrFmXfk7ipQqg3m6CGggOw
	JGVpYwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plxP4-00Frbi-1i;
	Mon, 10 Apr 2023 19:42:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plxP1-00FraS-17
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 19:42:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id g5so8774105wrb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Apr 2023 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681155725; x=1683747725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QB7W0GXP1VzxhOdRLXF0y5oyjgK/ieF8BJXDgGfMNiM=;
        b=tTuFtx8K05eMBqFEgo0xW7LwK/ASZJngLvc5VxCb5s3J2/VLac93xFdzLF3NCZAtIm
         Fw/SV0wYMtKQ7KrbeCeNfsdCiwm7pn6h3FAmwAMTUWeEi58Z8fVlDyfP8c8nn40K4u7V
         sZX+ayxtHIDOaxtt4XALJhzVhjt2t+R5Aa5gyFqKCCRZ5gzREFWN85JeSCZgF6h6vQxT
         IqJwZm6fRlNsa7QuA/u0udKcFvyzEHs0rwPxV8flPlqiE5KdGDqeTUT09VyKgnUBSH0J
         xqUaECdiR2GqDIw4XX7omq3W2Z1iC9nvviDwk3mEepeCe9QbzsU3Jl67ThLgVOUYURsp
         b0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681155725; x=1683747725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QB7W0GXP1VzxhOdRLXF0y5oyjgK/ieF8BJXDgGfMNiM=;
        b=s9D12yJyYqgJHQjf6eiUJ/8uT0kQIgI12NHgtNhfR5gwUC/ZIMIxclxGrAucsI3TOI
         Zc6RwfDXDqWG7THxkmwzsAl8UrzigiY5YxEcO5w2oWAemLkFkXXo9yx4NLd07kd+OUjT
         nwZ13CkT4ldFe/UV1xxC4oDkMQMECdFTe2uR62CoRdAUdFtc28dfs2DPRPSonf7n5c1L
         VKKewKRUxaqGym+Iw5PzmhaoF3S4mVsPL1y4ilU/ru05/DyfIhM/746XnhYFbKzPgEon
         EoxPRP/t3GIDO2f4on3n4e/u1t1GNSad6UmlWuuxjKtMJRFkYD9g4kNGth/kTYUIh+c9
         R9xw==
X-Gm-Message-State: AAQBX9eNb2enH6XcnEHMNyk58oSrzlPJxlWxeER+cijGpf1Gk1DH8B7/
	31xdZSX9SlOHB37SwsuOePGOvw==
X-Google-Smtp-Source: AKy350YNT60EVSJ71IQxngPY6jRW+U6UDojuObfwFtal1MwDTVGPJfu8Yn/c4VjxZXCI1e/nab2mGQ==
X-Received: by 2002:adf:e34c:0:b0:2e5:a86c:fe74 with SMTP id n12-20020adfe34c000000b002e5a86cfe74mr4990124wrj.51.1681155724951;
        Mon, 10 Apr 2023 12:42:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2611:592:3b9e:d2ae? ([2a05:6e02:1041:c10:2611:592:3b9e:d2ae])
        by smtp.googlemail.com with ESMTPSA id e17-20020adffc51000000b002ef2e148d59sm11844898wrs.16.2023.04.10.12.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 12:42:04 -0700 (PDT)
Message-ID: <b2e5ef14-9a12-15d5-8016-d0994c1177c3@linaro.org>
Date: Mon, 10 Apr 2023 21:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] thermal: mediatek: change clk_prepare_enable to
 devm_clk_get_enabled in mtk_thermal_probe
Content-Language: en-US
To: =?UTF-8?B?6ZmI5bq3?= <void0red@hust.edu.cn>
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
 bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
 error27@gmail.com, henry.yen@mediatek.com,
 hust-os-kernel-patches@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
 rui.zhang@intel.com, void0red@gmail.com
References: <6e3c59c3-8ad0-9c53-62a4-7be6f55a7c02@linaro.org>
 <20230403164610.3608082-1-void0red@hust.edu.cn>
 <20230403164610.3608082-2-void0red@hust.edu.cn>
 <7b1f01ae.3988f.18769458aaf.Coremail.void0red@hust.edu.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <7b1f01ae.3988f.18769458aaf.Coremail.void0red@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_124211_394601_7F53F7EE 
X-CRM114-Status: UNSURE (   7.68  )
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

On 10/04/2023 05:46, 陈康 wrote:

[ ... ]

>>   static int mtk_thermal_remove(struct platform_device *pdev)
>> -- 
>> 2.34.1
> 
> ping?

Did you check the 'mtk_thermal_remove' function ?



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


