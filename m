Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F855C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE4dxCPLnQRstcdplswZZPEWrYHTl04zyo0o16usTaA=; b=HWsjdXhiBSr+KgZH8ciVPQUQFG
	BASgYrcpMGgz7d0md43DLfA4T/yjJYkycJSjYbGJxaMUof/lIk1LRarkG75aw8Fv/skb9Sv9y54Jv
	/IHof4pL8eI8V6+XZP/QyeW8X/HvNfB4DhYEKXh0uIoMm2eAuf1+py6h7XC1lrLpDMYCeaNfZejCC
	anvMHsz5l1s+Gpou3aSKAVg6sAq2vH1tZusMgkuEW5L6sFrw0x1swjmZWxcf3SEPa5siLaR7JR4Ps
	iuAY4KbqTEOlycrGPuoPs6DWgpb6Sl+xratY+hwufWxNTyTvv4QqLaUIlIXNRUpzl4AMFBNh9vVYD
	XO84cIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRKG-00EUUC-0G; Wed, 28 Sep 2022 07:17:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRK4-00EUOH-CA
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 07:17:37 +0000
Received: by mail-lj1-x22f.google.com with SMTP id b6so13332488ljr.10
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TE4dxCPLnQRstcdplswZZPEWrYHTl04zyo0o16usTaA=;
        b=As/0q82nUum+sJyLoPBd6GtuWJl33qN4O68taKfghJIh7FQcvreh6Gu11qEj8hvGul
         fPEWOM4BF9GuUvQfEJS1gQH3PwuyGEpLTGcjHwHfxYZLsZL90hZftF/CWn0BT3CoMwOE
         eIOtIlq4gnuT1G72keew31h6ZB5F/aKsknGcaK1NUYTiDaCmvRIQ5Kp7tUigCFD7s1Hk
         6dVteyyPIfqTmkagSSXeufu097WmwCxuRI31twbg1vIReTe9XTK8scaDpsHHn+yJBqnP
         JmJ1rQAmuBAf8mhBRcfvDXhHFr3Hq9662lsY5CG/NxErdutSRODVcQtyiOMRFAvvOQX3
         +vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TE4dxCPLnQRstcdplswZZPEWrYHTl04zyo0o16usTaA=;
        b=zVWf2dK/SzVi2DWSuaZBlzFOXvkKzZ7+Pje8ebYLKlVWI1YU3jcbyIbTA1UwJIcHfc
         vGtlfaVEWRiUzTkrLVUzb48cYJkkFVmmBJ7QCf/inLjVhBlMYtP3iHBX2xAn71wzaTkY
         biU47jP5Qx9VDls3k36M93yPWJEEs034yeu/8Syu48QwxA/Y6201J21sarqIf2zIz94V
         Izb2AjiXwUuu+ynyzfLfWf/zDfAid5s1iftmPDY2eUgGvA/iY1sHbD2iFpoApAO8JawU
         ULzKoJnWmVU25BfjV7jP6+ENisVTYQtMDECkFR93yUcbKtSVFxRdHU6fkE5WOI+oxM8T
         y5Cw==
X-Gm-Message-State: ACrzQf0Vku6YMUa1qNBiRsRKsoTCvfSa93J9+EJlYgmpU/FCYfT6zDl+
	WjyQ1KpAHQlMCGcgmfmJWALezw==
X-Google-Smtp-Source: AMsMyM6z76iK8/Qm0pj3jD1AipgrGpEdJt+xFjKYGD79qqx9g2bJoS6FRXYROgJD1rVI1r9QXVPtHA==
X-Received: by 2002:a2e:9b14:0:b0:26c:7f8a:e740 with SMTP id u20-20020a2e9b14000000b0026c7f8ae740mr4578796lji.256.1664349452610;
        Wed, 28 Sep 2022 00:17:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v18-20020a2e9612000000b0026c0158b87csm358913ljh.29.2022.09.28.00.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:17:32 -0700 (PDT)
Message-ID: <ff577b86-44c8-3146-3388-78021bb7edb4@linaro.org>
Date: Wed, 28 Sep 2022 09:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 4/4] net: stmmac: Update the name of property 'clk_csr'
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
 <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
 <80c59c9462955037981a1eab6409ba69fc9b7c34.camel@mediatek.com>
 <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_001736_420429_0FB7AF35 
X-CRM114-Status: UNSURE (   8.32  )
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

On 27/09/2022 12:44, AngeloGioacchino Del Regno wrote:

>>> OTOH, as Angelo pointed out, handling old and new properties is quite
>>> easy to achieve, so... :)
>>>
>> So, the conclusion is as following:
>>
>> 1. add new property 'snps,clk-csr' and document it in binding file.
>> 2. parse new property 'snps,clk-csr' firstly, if failed, fall back to
>> old property 'clk_csr' in driver.
>>
>> Is my understanding correct?
> 
> Yes, please.
> 
> I think that bindings should also get a 'clk_csr' with deprecated: true,
> but that's Krzysztof's call.

The property was never documented, so I think we can skip it as deprecated.

Best regards,
Krzysztof


