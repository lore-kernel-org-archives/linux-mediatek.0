Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B3CC54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNNA2Bg2H8l2bLuyBCtyD6jA6l2Y0JNnaRMjS+I/nFU=; b=06A9Xm1CjjS90rY8SE4WA8KkZD
	5gYaxcl0Ji72XD+eV4v7oe3SZYol8Ecx6YYuQJE7HWABPhdDsud+Ubnp4WTUcLv+aO0abkLaqD+J4
	6Ue7FPVAyW8AxSqLLgXaAxpdgQNWCM/uwj2hT6F1wCVv8Yz6SGtCbV3SOfcqiyKLT34Z+vo6nSs/+
	ad6TwHthM2ubnN+T1smvQH8gG7GXXQbuYd5AwBzUQwdYU6+NWn/pyO0AuLQlt9MpyS9fKH3ThD029
	ZDFR9owQTOAvzQR0Ly3KgxhW9l43GxYslGVZ4sm9CAMN+LN4PA0V/8q5APgbRHUDtBGxsucYxYjt/
	G/4v55Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEpRg-000pVh-Fp; Mon, 09 Jan 2023 10:32:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEpRc-000pTy-8c
	for linux-mediatek@lists.infradead.org; Mon, 09 Jan 2023 10:31:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso3302096wmq.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jan 2023 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNNA2Bg2H8l2bLuyBCtyD6jA6l2Y0JNnaRMjS+I/nFU=;
        b=TO2d6NkIhQliqQSVJD3GFTooA7F9YByu5IyenUJZSDaCfhy+j/FiqAY6pYVGCMHO6X
         SwPJ30is8h5lgqke0ZpogTV1tAtyZ1+iGf9I/d+vbPmpsLWzrXdQ6fd6aThzis+/NJpY
         x4lC3WBaH5McVsNNPvIOZPcRsdkHKrRXuxJH5X2vLpKIZ8sqVQTax+canncQxaUZ6TQ4
         6CmpVeRySnHrIElJOLsLQeS1ew6SeJTcS0KoSwnQx4qkBioydZJ+niDRbR7G0oTsMaQk
         wQFU7IWVqQPqemiErZKJHT9ey0VtB8f3Sq5pHeW/GwaTBOOMUmVMnoxl7pIJmuzVsOJ9
         MR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNNA2Bg2H8l2bLuyBCtyD6jA6l2Y0JNnaRMjS+I/nFU=;
        b=POmrfHWZORTJ4QJ2D9JksJw1SoWgl2zmGhbb+SMMWI+yvjG8OFosktHIytCDTADdg7
         ldQdjAv5h7tTXqBaI79LMLGiwvuSxBv1FWeEYnWiKZbWTiZWVTli4M0iWm46tNWwBAgs
         e02I5U31ErB1su7tEAs9kmplmuJnObqDemhBpyNqi8MNqTDbIV4kScDhHgfxNa583MDP
         FmrCjEZDlzBw391mNyYGPVD6agstVDeNCaDlhaz4BmWscXvksV7gJ/pwu687PZHT91PP
         ik1saS1BwRLOLcASEs+mPnzd/02ToJ9QE5NcjEpmpx7dc1Rmv+/YJbZHctpkMkZ6LiLS
         E9fA==
X-Gm-Message-State: AFqh2kraEo4yNAn2ValTttEUN274pDMglYoXNlw2tg+saVGrd/T/82VA
	nSzj5St3fkRG4/ZpOxv1uKco5w==
X-Google-Smtp-Source: AMrXdXvV7QzMMAVNSAgTaDAOXLPhGuxIfzaA3mcVl/DChX+GMVorkQShhCP/ZdD7kq9fbtT6HhhoDA==
X-Received: by 2002:a05:600c:4fc5:b0:3d9:ecae:84f2 with SMTP id o5-20020a05600c4fc500b003d9ecae84f2mr3382175wmq.25.1673260313580;
        Mon, 09 Jan 2023 02:31:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003d998412db6sm16546190wmn.28.2023.01.09.02.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 02:31:53 -0800 (PST)
Message-ID: <2e52c0a5-3578-c90f-f54e-8cc29f6699a9@linaro.org>
Date: Mon, 9 Jan 2023 11:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/19] dt-bindings: ARM: MediaTek: Add new document
 bindings of MT8188 clock
Content-Language: en-US
To: =?UTF-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= <Garmin.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
 <20221230073357.18503-2-Garmin.Chang@mediatek.com>
 <33196eef-b1d5-8dd2-7c59-16a73327e8c0@linaro.org>
 <df20ff7bf661b021d5917956af08883f3b9657e0.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df20ff7bf661b021d5917956af08883f3b9657e0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_023156_671097_37ABBD39 
X-CRM114-Status: UNSURE (   8.50  )
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

On 09/01/2023 11:14, Garmin Chang (張家銘) wrote:

>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-
>>> clock.yaml
>>
>> Clock controllers do not go to arm but to clock. It's so suprising
>> directory that I missed to notice it in v1... Why putting it in some
>> totally irrelevant directory?
>>
> Do you mean move to the path below ?
> Documentation\devicetree\bindings\clock
> 
> If yes, I will change it in v4.

Yes.



Best regards,
Krzysztof


