Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C4C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dDPTo7pAbw38LoN+sVNvkK7XTKAxdrh79eGZjH2+lY=; b=WxHQqNXeosWG9FhTIcQhmXEsCG
	HAee+HXC6SxNa7Sfe5ECzsrXWOr3Px5rPT2+mydJ3+HbYcklnZ+MbkDq+hg0LxNtLUBcHu0HCT/DH
	57HK6XjWVtZb4Bnf0kJpxqM1INbV4MTIAtRte7Sevqodd4Scz/C01TLZ9YKT84IYqXVzZlpiKZj2G
	cXKip8spKsj3nK/1KK9GmHSTYQFbCkyLAGn4kd69kMkFKDz5JnmB8Ly4bM/D6F15mz7SF8eJVNpB/
	jWsU+H90IhlD40Xd2oN63HeR4evhMqAUuqd/gzhWeXLmj9yPapzOE6w3WuXAtaq3SR55GRkt683iz
	nBzyQQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrnU-005Kz4-0E;
	Thu, 13 Apr 2023 07:55:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrnR-005Kx3-2N
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 07:55:10 +0000
Received: by mail-ej1-x62c.google.com with SMTP id jg21so34887482ejc.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681372507; x=1683964507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dDPTo7pAbw38LoN+sVNvkK7XTKAxdrh79eGZjH2+lY=;
        b=Ejrj4R/7xT2a4RYe1Y5T3Rn5KiIwqcfdkD9P5InRpKjPemJx6sQLujgw+qPNi3G70W
         7XUu2f7xAgln3LNKY1dqSmJ0KqJKJbC3KIimV5WiO7DMdnEqfmkMWiAUy54XEtg+/qgs
         9QhWihYI1B4LlFadoA4BVAkmwgIxchPvHsLvktExzF9YwiAxfnEGcWBrCrkhqgEA1qSh
         W7B8HlC6bwb6Ih39FJMODjSVaNwsxPI5CwCyWvcmXmQFdAaSleuPyywY0X7HiMv2PpIh
         0kUGBrv5ZJ49p/UiX6ChfmcATbGl7boAb8dElXFBITzgP7oZWMkC1Ymh/RfgcvWijP2z
         PnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681372507; x=1683964507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dDPTo7pAbw38LoN+sVNvkK7XTKAxdrh79eGZjH2+lY=;
        b=QvJy47qvePAfscrw1Ui/SiuBD0xuKy7cxj/ybT4RUf2RimxIOdK49i1W2Z/ujQvSCO
         rjupy6XL50Sop7ikcrQ6droRvagbBtJigbtKB4fwO8qIgmWKaYRnAQhz7wNUWJg6HoRc
         3d1eFDic4ks2BQeMFm4cK9dzYmcY8IQJM0z6LjekCldEsB1VvpS53+A6TbgGhlTYdfy2
         5+EyQd3RLJW9861lbjEAJAOOO4pBQT94yK5WtD2AL2XuEGpCA8WoMA7xC1S58ByFEq85
         CV9xx+4Ze//nxHxyrKMibcUnXzAzHal0xNUQgAmgARuk5gOgLCkeQPcg0Mu3h/K0pVZB
         W0JQ==
X-Gm-Message-State: AAQBX9chEoM1faObKpN9ytVXVhqr7QLc3pTH/cKxJYH+yIOzUN92Rkq7
	8TqKtI2743w+iggtnozFAQ2sIw==
X-Google-Smtp-Source: AKy350ae1oc34Oyo141xL/55tTpu3GLXnkGlh4IkaGPDqJ6dAQ+jgJtHGhDS5ZdMRwOG6ZGU7zZGNQ==
X-Received: by 2002:a17:907:d306:b0:94d:7e31:e338 with SMTP id vg6-20020a170907d30600b0094d7e31e338mr1730607ejc.52.1681372506860;
        Thu, 13 Apr 2023 00:55:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7? ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id dn19-20020a17090794d300b0094a6a7a56c0sm602189ejc.18.2023.04.13.00.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 00:55:06 -0700 (PDT)
Message-ID: <003e1ff0-591f-3959-ccf9-9fa84cbcc4c4@linaro.org>
Date: Thu, 13 Apr 2023 09:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
 <1681358785-6930-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681358785-6930-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_005509_771025_602CA79E 
X-CRM114-Status: UNSURE (   6.51  )
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

On 13/04/2023 06:06, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


