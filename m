Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKzl6/SCRNXRtMPSyxszqvnQ88mmyT4lZNuCPZD//E4=; b=aFSjzRYLrPer2S
	iu3pknYVfjgxr5ynpHd7dVg28/YaVq2opPF7p3YJQsx+0qRM63I6qSQuPfuNDjhDday9mx3wyJCk7
	aWUB44pbqZKa//l1TbweahcnjXBxsYedN6Zs8AVvvDQUH+ia8QsqwnjQI5BHTStvqxrB8UCrAZCFX
	RA0UrsRJKNn34MF430ItcE5bsCPEZLPGcEsi9DO8n8KEuH1rF4tpj+Dys/eSxI06s/TmFm2hQi3pv
	a/OJw8U+UrvrdMSSD+bXZMqxs6XXE/oq4mZKWsYCyXCsOEzfiw5npHVegAnTDvBZ2e3HPcwyi3JWj
	jzyd4Fy/w5dcpgk3Vg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na1MQ-003ZLn-3E; Thu, 31 Mar 2022 20:25:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na1MM-003ZJo-KW
 for linux-mediatek@lists.infradead.org; Thu, 31 Mar 2022 20:25:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bg10so1676565ejb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 31 Mar 2022 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EnDTCNJ+7XU4ln4xyk+2CVy4Rghf4UHAtu/NaCOKaBw=;
 b=JjMKEBcrX7m9SwYbSuUNE9FeMNTF0HKQRWR7m4rnjwg0CugqGEiVkTz49KWmhsD+Pt
 DQFcJWQpiouy4sd/+3AMtRgy3AfPM1hz0jKgR6xnBZxOVy0cx/j+WQPWCRDYK8BM1dpQ
 BXUUmmUY4dCPCjkebnVvsUB/jwMde9ZLABKuwn9ANjdhyghM+V2+tt1xq6KNVfneoc65
 C4AUVQGb65ENqT9sO5nR6ME075xaY0fifaf3ph+kzzROF+T3nV9jHZzV+BC2vPf+K1e3
 oUqO/59TmJ8zDeKFHNqzOl2tm3otQyj0pesutRdiwDO2pJdv/ewPt9iScOOoG9KF0vcP
 Jo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EnDTCNJ+7XU4ln4xyk+2CVy4Rghf4UHAtu/NaCOKaBw=;
 b=aqgwNdwMrLNYJ+2KD1up+dhRZO4J4xuIjMzUZ0M4M4aEC3HSZUMoe9WQfDpatGpbtE
 czeggQ//3Xi6H3UYneTyf4c0Pj1Hhm53aA25EpAdPv3UAz20WlMNfhq9cgE4zxCCIi9b
 mmdEiHC8K3Ke6sZ6ZpMdSTzXxnO/axMh4CyfV5Tw6X+rDUr9OnvxCCYgAhZiU5yE6cGP
 3LqrzctSmxokvk63+1j0ldOA4YNIDIj6wo/HvCb24DZzYefBGifqHy5i0dyQal2p9Zt6
 eEgaHnHd5W0DRspc+erHFBSYPlK/ZKvom74fkZvTk31n8RbY0Sf0DytwhtISOSTVk6at
 Vrrg==
X-Gm-Message-State: AOAM531v7z24Gwre3RUaYtpNyiGc6765VH0rr22CJOd1wYb1S5f3Tt73
 ORWy/FU308M85NDBrMPwim84Lg==
X-Google-Smtp-Source: ABdhPJypNYgpGQOMm7TyLEDGxO2W5njStEgyvsioj1MkvFKTEWNVFi1MFwPb0ZXBrqnEMm1OubfDnA==
X-Received: by 2002:a17:906:1153:b0:6df:d816:264a with SMTP id
 i19-20020a170906115300b006dfd816264amr6259674eja.546.1648758331416; 
 Thu, 31 Mar 2022 13:25:31 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 wj1-20020a170907050100b006e0f9bc719bsm168499ejb.72.2022.03.31.13.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:25:31 -0700 (PDT)
Message-ID: <3eb287ae-3eb7-604a-ed5d-8b71e8315323@linaro.org>
Date: Thu, 31 Mar 2022 22:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5,2/4] dt-bindings: pwm: Add compatible for MediaTek
 MT8192
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
 <1648730873-18505-3-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648730873-18505-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_132534_724509_4AA67E91 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/03/2022 14:47, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8192 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
