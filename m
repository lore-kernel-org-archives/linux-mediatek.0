Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3882C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 12:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnWhNZTqJ339LCYKiDiCe7UX3Rth/XD7Bjs/XWj/9Fo=; b=GJhEII+6sebP05
	Ub1pd0CCAmKVL++j02d/qDdrBGN7OphsLBjbTQXeMaCKjv0i4hCS5gnydNhmoRnhheNAxbfAro/Qf
	Ab0JWxMVIkISGl2Z9GoWQHr6uW96q8Xg7xNANXR86P/ZqhBuj9LoiuLDRUWjhcQJvnaawmOFvL1k/
	A6B6IhyEuVt9vpdcEgrsX50nV4w16qL4nms8BYMYhVf4y3aq7PpiDuUleU+jkGBggivD2xC8FrVA9
	VNdBkVol7GE6Mm5SIbT4X7QHyeDPhvnFVhlGGRY7HR+p42VUS4zDSxbhb8+MbaPsqk+68qZu8pIlP
	1AQSFBi7DXdGaqyKlx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8M19-0096ds-69; Fri, 14 Jan 2022 12:49:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8M0x-0096bX-3l; Fri, 14 Jan 2022 12:49:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id v6so15412053wra.8;
 Fri, 14 Jan 2022 04:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Abw46UALerxLsOmPP7C+wt8VRbuUvbjsYrXsJ3w0t5c=;
 b=MeKHaejy0QtUUqCztMf3ob7n3XvMH/3w+xXtQmf02LV7ZaNDwigUfJWPzL4qwGdle1
 8tkQBWlfE3fN/aTqlFxcA5KM6qlh6Zwbxg2jdiKrSQ22OA7xUkCC96cX1+qfg2Qg3djr
 +Y7LLdPNkCRswSc1M6zVTBBcRBTzZl738w4IYUmzDPI+8yGrqUMyLG14KoEHx728JSGI
 9Wi8hYiELCgZWiv9p17KMgCJmNUrCUFRIvpHilaR1E0b4jwA+US+PA+UMCMfPY2HtPOM
 hb570ojMTpFgox2Z9ZdnL8GgGUM8sPFrxZDerxkVqMzWLwwQV7HL0wnfAzTfoHBKtV9S
 yLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Abw46UALerxLsOmPP7C+wt8VRbuUvbjsYrXsJ3w0t5c=;
 b=7obHrbNpInHYs5IYVfsVO3rcXvag4DYbTzvU6kWgfXtbjNM3HfQgoiCRH+p8VZHxBM
 OhVnS4YyR4IcbQYcu5Zad+T2ROQE4bywULb1ckjaiPRTEnCyrQuZnILU24s2AY3KaphX
 nkbVqGm65F9AvCmTSSXTkzDjepSjkaXAGff081Dnhl01fQe7QxnLv9GL6UfoFrvy54ro
 vMJaynFaH8L61RuuL1+Cvx6WE6VWcmzgV5CCjNmUB9krY3vf2fGAPzMyIRuzhmLTfxLK
 dqxXH4mdxXJOvjYbWQgZxlvVEb2w7BKU/2S/I9sVqrKVRyCquNk8rwnDmr0wXWu4yan8
 56QA==
X-Gm-Message-State: AOAM530iW4nmF7IUzCpHBZ+4nr75aoCvd3Glk5lbfSvoE03x/auwznNZ
 nmoZGGs/N1qFA09tnOkIevk=
X-Google-Smtp-Source: ABdhPJzN1iStMrlaWrjW6Yw96OxXnti/SKJXgawksZJN6YpUIg0QPKmcFSJe8rRFAgN4+ke5fGtnxg==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr8504210wry.150.1642164545786; 
 Fri, 14 Jan 2022 04:49:05 -0800 (PST)
Received: from [192.168.0.22] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id ay39sm5203745wmb.29.2022.01.14.04.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:49:05 -0800 (PST)
Message-ID: <ae307028-979b-7e58-dd6f-f1d52520859b@gmail.com>
Date: Fri, 14 Jan 2022 13:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [v1 1/2] dt-bindings: power: Add MT8186 power domains
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
 <20220108131953.16744-2-chun-jie.chen@mediatek.com>
 <Yd43V1woRMAcXOfS@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <Yd43V1woRMAcXOfS@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_044907_194404_5C5C62D5 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/01/2022 03:05, Rob Herring wrote:
> On Sat, Jan 08, 2022 at 09:19:52PM +0800, Chun-Jie Chen wrote:
>> Add power domains dt-bindings for MT8186.
>>
>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>> ---
>>   .../power/mediatek,power-controller.yaml      |  1 +
>>   include/dt-bindings/power/mt8186-power.h      | 32 +++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>   create mode 100644 include/dt-bindings/power/mt8186-power.h
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> index d6ebd77d28a7..135c6f722091 100644
>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -26,6 +26,7 @@ properties:
>>         - mediatek,mt8167-power-controller
>>         - mediatek,mt8173-power-controller
>>         - mediatek,mt8183-power-controller
>> +      - mediatek,mt8186-power-controller
>>         - mediatek,mt8192-power-controller
>>         - mediatek,mt8195-power-controller
>>   
>> diff --git a/include/dt-bindings/power/mt8186-power.h b/include/dt-bindings/power/mt8186-power.h
>> new file mode 100644
>> index 000000000000..ca8ea2d24801
>> --- /dev/null
>> +++ b/include/dt-bindings/power/mt8186-power.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Dual license please.
> 

Other then that series looks good.

Regards,
Matthias

>> +/*
>> + * Copyright (c) 2022 MediaTek Inc.
>> + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_POWER_MT8186_POWER_H
>> +#define _DT_BINDINGS_POWER_MT8186_POWER_H
>> +
>> +#define MT8186_POWER_DOMAIN_MFG0			0
>> +#define MT8186_POWER_DOMAIN_MFG1			1
>> +#define MT8186_POWER_DOMAIN_MFG2			2
>> +#define MT8186_POWER_DOMAIN_MFG3			3
>> +#define MT8186_POWER_DOMAIN_SSUSB			4
>> +#define MT8186_POWER_DOMAIN_SSUSB_P1			5
>> +#define MT8186_POWER_DOMAIN_DIS				6
>> +#define MT8186_POWER_DOMAIN_IMG				7
>> +#define MT8186_POWER_DOMAIN_IMG2			8
>> +#define MT8186_POWER_DOMAIN_IPE				9
>> +#define MT8186_POWER_DOMAIN_CAM				10
>> +#define MT8186_POWER_DOMAIN_CAM_RAWA			11
>> +#define MT8186_POWER_DOMAIN_CAM_RAWB			12
>> +#define MT8186_POWER_DOMAIN_VENC			13
>> +#define MT8186_POWER_DOMAIN_VDEC			14
>> +#define MT8186_POWER_DOMAIN_WPE				15
>> +#define MT8186_POWER_DOMAIN_CONN_ON			16
>> +#define MT8186_POWER_DOMAIN_CSIRX_TOP			17
>> +#define MT8186_POWER_DOMAIN_ADSP_AO			18
>> +#define MT8186_POWER_DOMAIN_ADSP_INFRA			19
>> +#define MT8186_POWER_DOMAIN_ADSP_TOP			20
>> +
>> +#endif /* _DT_BINDINGS_POWER_MT8186_POWER_H */
>> -- 
>> 2.18.0
>>
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
