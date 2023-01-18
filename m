Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D87C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFxZKl7hCmO0fLuY8+p3+x6sh8BJNlqy9dGBP7VEmYM=; b=QsqB+5VriUNQ1IWUT8dI6Rvg6u
	WrNnEtxW6b/F7mWQNkOIRJ/DycLOFey9NGBf7UBsyorq5lOV3EQFSgJZ9amZDArtHE+wkqAJKSW+/
	Ig31Kj2Gym15sVGM4yhNTG3AJ+us2EeRgLvKZis90+qrGznClfGDHuQB0rMDiyBmLk+8O5oVCrba7
	doZ+yDpAuI7JtkBTccQwHH+NHx4SdXI0049GKrAjwtb74T9QvgTq5ULCNkWzkGs984Jb/Zclf5j2M
	NpcuAGG1E0CJoChZ1JgmxM5e5IdTVmlwd4mVFP4GHJFmCrDPGhdmEJCKf6jQNjzj03rIqFaEbBhJM
	sytt0TVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIFvJ-002iiq-Lc; Wed, 18 Jan 2023 21:24:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIFvF-002ii7-JG
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 21:24:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so2323437wmb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 13:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFxZKl7hCmO0fLuY8+p3+x6sh8BJNlqy9dGBP7VEmYM=;
        b=K0DcXw86hQI0oQltDntbuTDBbjkVifmR5KNpltq/kd60KP3U7DDavClaPBtHg3zXHF
         3A2Jsgf6/5qg8tlO1jnZaHvpswBM5uhyuSRjuFUQ99cjr+/uA4roD8sWC0Z0wWkAsPz6
         YBsxXdcESvVO6NMJvvFXt+FlEeKHte25K7/7g7m26Lq9zF0zm7w4qnmOtU0AYfhRY134
         FPItd2dLcD3E2VBBO0/bOoIXmOj5U/Gid3IBBoC5lB9izmV0drZQJD84b7EgowtGsCR7
         FB6LQFHrgDJ0OTIh8Psj4JHHoNhdQsbJjkgdDgA8cQp2mpcUthTX5vWkEjckj4/2J1e6
         bhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFxZKl7hCmO0fLuY8+p3+x6sh8BJNlqy9dGBP7VEmYM=;
        b=EaJb+0Icgk3w7FE8lk6r2qDsRwIbB+SEU2AP0kI5KqmG61IbE+1e3c99nSq31iis20
         z9RL5mE4IOndjJ++4uhBZNrLXk/mDeGkN9RlQOy2OgRh6F03ezpD56ONysu4YJegTozm
         mXAeo+tKqlQt5J/C/7yS3ktBxLOPiE6ysJ+EQ1Gte0RDtTkFJ8g+tDW+SXOid5ke6njT
         CGtJpcbluXLmET907S9r4pSvzfI477nXAY3MoRb7cTIg/NQNvjJc2SroVPoqQcXfHXnO
         JA0bMJmnlXOY0x8kXU+Sg/oUGK3iUROMXVWABQIZM7PmFJWxvcNHP440caWHcymlZUrP
         /OQQ==
X-Gm-Message-State: AFqh2kpXxjtfK/bDQkJRXoOq42FY8R/0LcZZoWulPZ8gacr2NpYSRlMG
	e1sAhK+ZKX2Um8afBn8VjhNFjA==
X-Google-Smtp-Source: AMrXdXuGoYQ2ipyxKj9qImNlNeIu7/IywGxVLvg5V5HN3V4OIeWY5uR558/S2som56xTlfJPCXek7Q==
X-Received: by 2002:a05:600c:3d19:b0:3db:1810:8c9e with SMTP id bh25-20020a05600c3d1900b003db18108c9emr2851203wmb.38.1674077079858;
        Wed, 18 Jan 2023 13:24:39 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e36-20020a5d5964000000b002be0b1e556esm7594189wri.59.2023.01.18.13.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:24:39 -0800 (PST)
Message-ID: <a88d0ee2-5616-0362-0b8d-a9005176890b@linaro.org>
Date: Wed, 18 Jan 2023 22:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_thermal/drivers/mtk=5fthermal=3a_Use?=
 =?UTF-8?B?wqBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
Content-Language: en-US
To: ye.xingchen@zte.com.cn
Cc: rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <202301181637472073620@zte.com.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <202301181637472073620@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_132441_679454_2D803FE1 
X-CRM114-Status: UNSURE (   6.82  )
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

On 18/01/2023 09:37, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


