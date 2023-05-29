Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC293C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IXsQpfygJCaGC5q2YIhqiT7SfrT6glvTqsb9kR3+tg=; b=CAxAPRJf3HTcUGF6Rew0iM2Uku
	s5pr5xO1ZhAND8L4A08SRVmg1jU4J2JNA8sQypvXVggPR/nIULG6wpgEj26GVum+rydFBPRRBaiMt
	/MumtkaUs0UksT5pyWjiHlmqgH4MSjkupJFc4iw7W6ACtqkpVfPnZ5lBM9HyrwG80pAoBhNbd8KBm
	WQO5lPH4VIQgSqYq48SbYROrtL6+oFC3KvQHj9FEgGz3MLrf/RKVKDUVzTwD/WekAmFh5XsjE7H/T
	iz8vfk7kNK3mMDTqZXbU6+hprWLFUFYynopFCsNnoAQnw4QGK0S7T3QgKgBdA35XtBWl0InwhNi1J
	vz+laBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dV1-00AiF0-03;
	Mon, 29 May 2023 14:05:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dUy-00AiEM-1B;
	Mon, 29 May 2023 14:05:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30ae7cc0e86so1334160f8f.1;
        Mon, 29 May 2023 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685369122; x=1687961122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3IXsQpfygJCaGC5q2YIhqiT7SfrT6glvTqsb9kR3+tg=;
        b=sdpUq6wtbzHzS8CgQpQdkR+hrukqOa0ISmZZ3Wa4z52ZeXjPlFEu2+gBtYJyxRIfXk
         iF+hwNmP4E2q798O+VJ+qnu5RdUL3Usuqf+25mgaOmFQUjw+NrPMwOhbuzTce9yOFYmk
         5oVOjVhSdqxaUI+utRJ1ZBEkYiy4BGUvd7qqfx3be/IBhbeVTynXCun1S40CDXLHBFH2
         e6izo/1qqqx5+qMie+iSMm0zCCCqtww1FXoT76hSDofbssPi0x4a65NBF9S4iUO7kVu1
         ERVfgkpK9LeNqI4EHA0XoK2MwnVEjFUubhoUMSp4p8Zvo83+1NxGu8oAW3nTAdt3+AzQ
         EYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685369122; x=1687961122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IXsQpfygJCaGC5q2YIhqiT7SfrT6glvTqsb9kR3+tg=;
        b=d3VLmsBtnPHTgsjdOEVOXbDH8SQ9jCrhWkvUkC9UzTQSAQWffw4DY7giiJWieMY1cd
         gDffTE0EbGq9VV91ySjzVBF8dJum/UgDSkPywj/R+DdfEVlCdhLN9rpBgyW/vNRy8ROj
         uVBoU0OUzGXh09RKJB7qTAOPyqdsPhjuRzPwDJ2SD59mgckmXeTZvxw49Fn0b64Dirdc
         jWYtiXak5LgYuzZaotG1obxBm5qx36/uvP8yZy1I0Bbt+f+UoqIMnDHhf0B1GjbUwXtK
         BIclsphd0Rmj9nxFB8cHSp064j273SGHYHYQcKBRlKaHJaSCim0M4v6ZAMkMI83LTwt6
         VeHg==
X-Gm-Message-State: AC+VfDzj5QwgwokJJVBLqZbHG3rXCJnGo4W5vRfjFkScCWmf+uskE1nj
	BK3idM3dVuCpBspuPg33tTE=
X-Google-Smtp-Source: ACHHUZ7g9aINh4JUEKppDSWEt//njGKAVDLn3XhohW2qMJr2ADrXZo3WfUHZJbjvujUEDC7TDLkhcw==
X-Received: by 2002:a5d:42c8:0:b0:309:4e37:51ed with SMTP id t8-20020a5d42c8000000b003094e3751edmr10601139wrr.27.1685369122506;
        Mon, 29 May 2023 07:05:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h9-20020a5d5489000000b0030ae6f2e696sm22893wrv.115.2023.05.29.07.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:05:20 -0700 (PDT)
Message-ID: <201842f6-c209-201e-35d7-e9af3ff31080@gmail.com>
Date: Mon, 29 May 2023 16:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek,dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US, ca-ES, es-ES
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <223fcf60-25aa-e45d-159e-6290eeeb6a55@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <223fcf60-25aa-e45d-159e-6290eeeb6a55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_070524_407776_9FFD4E06 
X-CRM114-Status: GOOD (  10.10  )
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



On 14/04/2023 10:22, Krzysztof Kozlowski wrote:
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>> the same DSI PHY as MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

