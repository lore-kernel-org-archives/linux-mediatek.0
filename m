Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EB7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G34VK3eA0n2fJLdOFB3dPCeL9EVZbJq1/neNwnoatnw=; b=lnEWjy34uQds8m
	tIRT9PAFx79ba5InQ120kz2wlPyvGaL4UygWY+HxM8qjLuIiaNepjdr8TEYjacB3ohtgXu6zX9GQP
	asDGZGq9PbI/tUxf+5TPzJVIcOxFhK0L/lFIalevah50h7KuSKiT/CRrXax/T2Sdie+i+qlqT2Vod
	Xv309Q3WFwADuzlVgkBS3DFTkG9x92FQgmEVo2y3gDSUbKDcrNaLzR1LN3mZFU1svUOQwP623kkta
	ycu6uKCCVotNQy6yY/hAYf7p6eVzOnXsWZe9sHQt8v06dUKZJXEx6KejHBtN/TPBdsBMzm3YCttrG
	CHHpiZfDozS2aTrag4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nek0o-002gKx-LC; Wed, 13 Apr 2022 20:54:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nek0e-002gHo-5n; Wed, 13 Apr 2022 20:54:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso7349167pjb.5; 
 Wed, 13 Apr 2022 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z8n2FKlH4PPLZudd5wmQXBKFzCBNjhBZWi9v/kIPikk=;
 b=SapZ8FRGWZ38OHiXjH2V0nZ1xZ+fof7DG0rpw+atdv7R6rTyBDgBymXUCrK00dZoqS
 UHt7b3BsHtsPUvAV6WzBP18RF7n2S8Yd5L85WtoATnLc9tk4XuBC9GNzARrQdgxLzTYQ
 5br+Ik1swXuR2oVyTa8oXHNgHpjlQCBsC5N5KRMMLLTQ/3tBpI+SK6+UtoaPE/2BmC1z
 JwLOIjv6BWN9FzDqcV6QJuA1NpPyKuwKlEuDNH1eq3IKKGR0e1gHPKSt3mVQk5NGOdsQ
 AqvIETui/UCK2K5epA8zLO20vOQbAmyctvQYlxv4Vbl9/iqS1cB8U9kNHRwQ4ocfr05v
 1GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z8n2FKlH4PPLZudd5wmQXBKFzCBNjhBZWi9v/kIPikk=;
 b=knvAPEizn9Zx/xOkUa6+qUfsU3MNKPxNrLWwSJUxRCNqr6dCDMjJFdsWwyf/9YmbY2
 Vr1PTgW+kLBp0YomTvZgnnCH2mTufjGW56VMbbtBscx2Ftj1TkRfxInPYbYZderaOQRq
 5RARjB80I00kMYoxhl0V9Pjd3JvaLIvgMtW7gbAlTvbpvOzhA9Dtm9GGOoFhhMi9iCO9
 akpChOkh9d/CjcI5wdCM05tFdluAPLd8hKveOeW8E7HP+TqBtAArGGerNbCLb1ArWyOP
 f5tHMN8FX5vmZ3kCtZMTttBo/cer3iuUVosb09jGVtfrseegN4kqxd7XzdEvYAIKH4rY
 D9ug==
X-Gm-Message-State: AOAM530O/gxPNGhSuf1NgRxPIbosqCrKNaNQzePtyV8gSabM+kQYbARl
 y9QMLuA4P5QdfLNsWh8J8SY=
X-Google-Smtp-Source: ABdhPJz9zFqadNRA+ndtin3mKhcwMF1jk+93aKdbtcYAcws109E/nP5a7ElcKU6Bf/j8DS2xCdRhlw==
X-Received: by 2002:a17:902:8644:b0:153:9f01:2090 with SMTP id
 y4-20020a170902864400b001539f012090mr43303158plt.101.1649883277874; 
 Wed, 13 Apr 2022 13:54:37 -0700 (PDT)
Received: from [172.30.1.44] ([14.32.163.5]) by smtp.gmail.com with ESMTPSA id
 l4-20020a056a0016c400b004f79504ef9csm43549529pfc.3.2022.04.13.13.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:54:37 -0700 (PDT)
Message-ID: <924e2208-d939-0243-9780-ae1b8cbd2c49@gmail.com>
Date: Thu, 14 Apr 2022 05:54:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: mediatek: Add mtk cci
 devfreq dt-bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-2-johnson.wang@mediatek.com>
 <855d7daa-45d1-d6d8-32bd-51778cf58392@linaro.org>
 <fe7d2b878c18a42ff36ebd9911ecb562fe29c953.camel@mediatek.com>
 <39152c86-ca11-2792-6b25-ae55ffb47b09@linaro.org>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <39152c86-ca11-2792-6b25-ae55ffb47b09@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_135440_284757_E5D30830 
X-CRM114-Status: GOOD (  13.47  )
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

On 22. 4. 12. 18:17, Krzysztof Kozlowski wrote:
> On 11/04/2022 14:10, Johnson Wang wrote:
>>> Also please put it in the "interconnect" directory.
>>>
>>
>> I don't really know about "interconnect".
>> However, it looks like a Linux framework about data transfer and "NoC".
>>
>> While this cci driver is more like a power managment which is
>> responsible for adjusting voltages and frequencies.
>> In my opinion, "devfreq" should be more suitable.
>>
>> Please correct me if my understanding is wrong.
> 
> devfreq is a Linux mechanism, not a real device/hardware. We try to put
> the bindings in directories/subsystems matching the hardware, therefore
> devfreq is not appropriate.
> 
> Whether interconnect - or other subsystem - is appropriate, I am not
> sure. To me this looks exactly like bus bandwidth management and you
> even use "interconnect" in several places. So interconnect matches.

I think that 'Documentation/devicetree/bindings/arm/mediatek' is proper.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
