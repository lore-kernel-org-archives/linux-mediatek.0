Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0ADC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suMN4n1BQ2Z7VU4EicsbwuyOBR1pEV+6Sounu4iuM0U=; b=ahIsGQl/r16HWvnVkobvgngsfi
	joGse7MCX+g1r8e6LHW55GZfNYho+lggDH46py5IhBpdOQy5jVVvQ6vv2bNeMz8Z3Yw8PQ17OtDtF
	NX+WHdY1lOjuuizvrGu2J4G0r9bOwsvToJTsFHiTjc6lS2mcwgg2PK8ix5+r9s22cisMTgGzBCH0P
	WaW73hZkgLWJYkSFLohRLCMaCt8cKP/W9xFo5YxhuZAPQDkwRGc3T2Mcl96K234hgMn46w2bFeGEY
	kzky9BzwLakTeqSytt5ZELjCRKzi59mU20Gu/G+8cm4CAVxjWFrBTvY++QF1LL2h33owIAxS2Tltv
	LTGNJd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gen-00GWnf-17;
	Wed, 31 May 2023 07:54:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gej-00GWlA-2G
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 07:54:08 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso7136140a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685519640; x=1688111640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suMN4n1BQ2Z7VU4EicsbwuyOBR1pEV+6Sounu4iuM0U=;
        b=A+dncCJbXSV6kSVPSolkbyxdvYQgh78/2P6Mxm5SwqhtgIwtPGJcWPOCn2HHPS8CZU
         5Wm6uBWJvU48wgmG5ogwKoX1rNY5Z4RvNjhYSfdKVup3NWmYut1ny6EzBC/0KBEdFYZG
         xojVvnM2ROqLlEAcS9yaN4/6x6eWoBszGXQOpJIHAvRGhkMWrxnPPLFGhWYVSsSGeEN9
         2H039xpBhxvO9MhPMs3niA9LdSl3yS9GN3cvnO02PehmLZyf7Z3iF22kZ2fJ0LQ6a+6r
         o7q7EgJVKnuR6VScDRFC0YASfU8S/WZdZZm5f5DystD06dKFWoX6h19/bkbktB7qdXFQ
         NluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519640; x=1688111640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suMN4n1BQ2Z7VU4EicsbwuyOBR1pEV+6Sounu4iuM0U=;
        b=bCjfy9xlgzqJBY6amuOVIJM0ETjrz2BsZcGABZXeceLgo/MYCX4Gl9Q9SxkMZGcXTX
         8tyWCN8wBhGmQHqS+Sr4Zm7kXQ1Pf4pMKQCx/ld66U4MGztG/r1dubnMOSaV7Xz7ICQs
         UgzmBTBaOpfwzhnkAElSzS8mW6d7sfZucxsAokAweW+Af7qzb0ieRxy9p0k3BS6P0hfd
         tqIy79elukyz0cW7Zf4EmT0fK8AVBfEaFkDzkKVpGoxER1kjQvzYPPvEXNFO9G6k+/um
         yTPkjG1guey5+lPUZ5SNztav6u92L39nw7AvStJHEg7gz8TBINsZ9xuptk4flR2aPeO7
         y/fw==
X-Gm-Message-State: AC+VfDyADe/rfXVszI6p4jlszyKM+dwg+iXRgoWyZAP27CPK2EFieaXN
	Gr5ieoi6PFeBHKOXWWHc+c1iJw==
X-Google-Smtp-Source: ACHHUZ7i7M8zh8gh6sQ1ZK5S6VAQvpJeaDVE/ihPO9ya44BVZ1jGFqvdF+9ycji5LoT7N7p0i74PDw==
X-Received: by 2002:a17:907:d8a:b0:973:d1ce:dbe8 with SMTP id go10-20020a1709070d8a00b00973d1cedbe8mr5163876ejc.46.1685519640052;
        Wed, 31 May 2023 00:54:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id ce23-20020a170906b25700b0096f8bb60c96sm8511314ejb.100.2023.05.31.00.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:53:59 -0700 (PDT)
Message-ID: <ecb3728a-575c-942e-ffcb-659f218e0b01@linaro.org>
Date: Wed, 31 May 2023 09:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: thermal: mediatek: Move auxdac binding
 to yaml
To: Conor Dooley <conor@kernel.org>, matthias.bgg@kernel.org
Cc: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230530150413.12918-1-matthias.bgg@kernel.org>
 <20230530-thaw-unpaved-a1708d46eb5a@spud>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530-thaw-unpaved-a1708d46eb5a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_005405_755351_E53B4973 
X-CRM114-Status: GOOD (  14.99  )
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

On 31/05/2023 00:02, Conor Dooley wrote:
> Hey Matthias,
> 
> On Tue, May 30, 2023 at 05:04:12PM +0200, matthias.bgg@kernel.org wrote:
> 
>> +  The MediaTek thermal controller measures the on-SoC temperatures.
>> +  This device does not have its own ADC, instead it directly controls
>> +  the AUXADC via AHB bus accesses. For this reason this device needs
>> +  phandles to the AUXADC. Also it controls a mux in the apmixedsys
>> +  register space via AHB bus accesses, so a phandle to the APMIXEDSYS
>> +  is also needed.
> 
> That double "also" bothers my OCD greatly, but it is a faithful
> conversion.
> 
>> +  "#thermal-sensor-cells":
>> +    const: 1
> 
>> -- #thermal-sensor-cells : Should be 0. See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for a description.
> 
> How come this has changed? I didn't see an explanation for it in either
> of the patches.

Yep. Please mention the deviations from pure conversion and if not
obvious - justify them.

Best regards,
Krzysztof


