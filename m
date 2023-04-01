Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0968C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 20:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMEGkXCvg7/CGHXH3d3dGgGNTGrxC2XQcGrgCdNoPME=; b=uG9paIq6yD4TNbMZn1sYUxwZ4/
	DkSO3xdO9V38onO914O27opJrf3Jw4/Nexojet54zuEULxU43MtFPRzVyNSO2EzRGWk1Dn5nrWvaj
	bzC4umFCdvvQmWcIxOpZpj88aLrw8WYw2lJ4ceFhyi1SgDCsw+BJnJ7265D6bULz/kDJ2Z79gleHq
	MIc/KEcP+RVFfgUNVAdznxqP/lJtz7faQlvxdx87GV93yCRlQIog8I4Wb+zbFkOTpgkLA0Apwo2yJ
	1jDwjeMJKDf1KxkIDCYrb3D2u4GYhouSQE8EzYHuGtTWkOrkTbv2+w7WkE2Gy5nG9OXgIAQojcFAI
	3WADW2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiCf-00BIOh-2S;
	Sat, 01 Apr 2023 20:52:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piiCc-00BINM-2r
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 20:52:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v6-20020a05600c470600b003f034269c96so5647416wmo.4
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680382317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMEGkXCvg7/CGHXH3d3dGgGNTGrxC2XQcGrgCdNoPME=;
        b=R8Q8NOGOSVBDe/QebqkipZUS+N88Rq/PBjCw4V7x/npzW3GwFWca0J2gO+EdlzOlbi
         efbPSkdAr/+lXSXG9Op9JcPpF1kHBXl8XFM7Bf8FWrs/0EjTwmAElts0Nj9blrIbgVHv
         LMM25G5bwhfh9ADPFG52cABNRf5Las7c6ztSwlxI9Bx5PE09XkQozcT7gV8zQOvWt3qU
         SdxwY9RfYT29A9RkeyPqe4wjuNoaZ20Raqxz5hAjrViECDSivs3UZk55XmXDAfrF6tV9
         b4F7vjA581/JK94Ug3QDvV6gP/akEAIh9x84ZrEVjj+5nfuyozadiyQ/cdR+h6RlaRkT
         C5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680382317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMEGkXCvg7/CGHXH3d3dGgGNTGrxC2XQcGrgCdNoPME=;
        b=yGHD6Gt7Fyn5swW05wEldttO1er+uKultnaGHDke0BFiwtmSGR65Zg/EnQ0P1f1nPp
         D2grWX3AwoEbb/DNJi3xn3qREEyJZmd1NqgjdQi5K16CfebKbJOhQ38MdSAOQ9mlHvnZ
         oM5eKUJDpuFy9Q/ewJhGb24QzOml9sqetUPcvl4W9gPx9Nd8P3kHZezF/0O4u9xgywFP
         BATZ4mlo4P2rKv3ZzPAVi1RUdO/FZ+f/1Rm9oRTRfhNWVe2eqeVwHbIHgsX1/7JOJNzg
         LNOw3ZYToj4eZN2Sz03jhJj0wQ0LI4VFW3glHcEKxdCvvy5utmrPCt0+9JB6jT/5Ra4J
         iQmQ==
X-Gm-Message-State: AO0yUKVOxRwYG2/Hb1IVzwPlaS6yXVJRp1S1VAWoNNVuWEF+6jJbVHln
	XRJv4nW7/ABonh6zfETvtgYusQ==
X-Google-Smtp-Source: AK7set99TkACr0I2jVXwkGkUioKzfXxq2WJuqXn9pqAYA/4kbGZCzC8In0m4IIw4vt8k4LjpmeVgRw==
X-Received: by 2002:a7b:cb93:0:b0:3ee:814b:9c39 with SMTP id m19-20020a7bcb93000000b003ee814b9c39mr23073849wmi.18.1680382317297;
        Sat, 01 Apr 2023 13:51:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id n2-20020a05600c4f8200b003ef5e5f93f5sm14298909wmq.19.2023.04.01.13.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 13:51:56 -0700 (PDT)
Message-ID: <0a86d734-000e-560b-8f47-1c0a113c01ee@linaro.org>
Date: Sat, 1 Apr 2023 22:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain
 for mt8195
Content-Language: en-US
To: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-3-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230307154524.118541-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_135158_923230_89CF99BE 
X-CRM114-Status: UNSURE (   7.57  )
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

On 07/03/2023 16:45, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add MT8195 AP Domain support to LVTS Driver.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---

Applied, thanks

Changed the commit log to reflect the comments change

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


