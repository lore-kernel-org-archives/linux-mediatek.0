Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55068C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/izUu/eGS9r2GaiJVqf107dzHaDl6UXT2Wyfi46rds=; b=FKyZ4fz8jm734+
	JIRdjmRyfy5VDXiyWlxaXOpdP9GAK1WBHFPqlx1Vlo00mk4EySIa+MZInUxcNuKD43mmRcJHUwm8c
	vAUDERlkL/87dbe0U8zovvqP5uC1lw6nUTPvdkBCYx8+WoRc0RI2DTxfRmQgk2FCTdCuCYAWxwvAP
	0Pi0/iHq5zeuJNrbIS6aLtDZlR1BYGRhgPMpOGf9RGH/mRXST8s9TP+q9wVlA6G2cjsnRitT1uRjY
	Q3GorZjhAEyNB1LCGh9q5ZkI3mKQGd9Of8cVw/pR6pLWEX5C9yRPF5kqKLUm3pa4n+AIFIsVLOCoM
	Ic6CkNnOjVHWUO88S/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na1NZ-003Zlw-D3; Thu, 31 Mar 2022 20:26:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na1NW-003Zk4-Qw
 for linux-mediatek@lists.infradead.org; Thu, 31 Mar 2022 20:26:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bh17so1644167ejb.8
 for <linux-mediatek@lists.infradead.org>; Thu, 31 Mar 2022 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f73Q9p0qBCca26wqwVLG1FDBxAuPXokqsFB4tXzSY4s=;
 b=P1skQxIlyDTPvqcv9bZzPF+oUpOHenY/Gfo0gUL4RedTQ4WTOA22DjejZ964QW9UOd
 bAAY5DyScLh5swcrBUpsuWKxnCByTweeiZ9jTEmsXZ/+QHpPdNOQDXUhIqAhzzag81zB
 MnKxir38ncBHR/4uVJtUpE2SPTnoSlAkaEXYEf/0QJvo18vX65LtePtZOLI8gjeRB5Og
 VoxSi0fs/58Ozvx3++XfoCLAZtIzM6UmHXHVr4pMcq1Rn5tqGjxpC43U0bmsqK1wCOYg
 gCJywvyZ/I1MKiltB4X6f9mhEdTv9/3L0klCkkT/qkF/Opg6WSDJR7/dOhLh1PAgydMS
 ND3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f73Q9p0qBCca26wqwVLG1FDBxAuPXokqsFB4tXzSY4s=;
 b=rT1o4Svnbtb9TVoyBRIu/I1fwbQObRv4zhFk5SLCzEUeB+bz1169V1zgDi/GoWTeiD
 zx23Aex6P9REiA2jg5tOnVkD8xxyNT3hECVuDkjxMK7gXksaiGGx/d2h7F/I6eYc+5+Z
 Yrqx/rSeDFd8cp5pBvyrGL07RmByr39ceSH/7Rhf3aLQd5Vc+gc6981eXOmrqPZJAF02
 mqQhDq8Mw5Phby5nIJpC6VHBH1Qx7/IJbKyHJvJyM8+S+sArX+r7ejszyqx2MtiTBT1+
 l5pnnrP1gsvObYcm7gW4IUpUM2Kd8RLEqpCh9aWK8Aqb1e/uMPPoGQxlYHiMfAXRBj1O
 G8VA==
X-Gm-Message-State: AOAM533/mGbG1zWPrjVnuwIY7ALePhGyg2VsFINygQl+Fx8KjOJokF+4
 9Yv+jvjqED/xshJAjrPIKHEurg==
X-Google-Smtp-Source: ABdhPJyCds3H8JnxYm26h5BcmMiI9/uHrBY5EdQ2TztoTWFjtsUXlKgqLZSrG4ZzrDNPIR7yzNIFmQ==
X-Received: by 2002:a17:907:da0:b0:6df:d4a4:9d0f with SMTP id
 go32-20020a1709070da000b006dfd4a49d0fmr6678791ejc.407.1648758405390; 
 Thu, 31 Mar 2022 13:26:45 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm170876ejd.155.2022.03.31.13.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:26:44 -0700 (PDT)
Message-ID: <00b2d9c7-6052-45f7-6176-e6d7694508ce@linaro.org>
Date: Thu, 31 Mar 2022 22:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/4] dt-bindings: pwm: Add compatible for MediaTek
 MT8186
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
 <1648730873-18505-5-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1648730873-18505-5-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_132646_959143_911730F6 
X-CRM114-Status: UNSURE (   7.13  )
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
> Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---

You could squash all three last patches into one... It's a bit churn
with every compatible. :)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
