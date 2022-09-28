Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2BDC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 07:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwAW3kmbmDfR1+nb7qnTndxnvmh/2aETOKBevREMWrQ=; b=VVP6k3y2ZXGvDr+nvq1p7P3L2+
	z7QnFlZEmJGj1sNLxVVAgLxEjfRbaIIYM2RT0eUpVFupy1xTDv75lWNG0wdRvPgGx+uSyjxH1v/xa
	Z+8KSsnbdYf6BJkVeigBELYjCwMsJUcIIH5aor13qn6DgENJ49M33bG6yDKYeoPWi/aR/MqtMVIN1
	WEFzE5Rri9X2E1/piU+JyG6F2I6gKSC/3JbaCkL5ptXAmhBsnv3nExS5kUEJ8P4OnjurVv2pj0WOB
	PDSPorS2tqGL8vLNhHlqiUfYVJtp9u4ruLX3oHsEcFwd51Dav9jYG9+4XPYRjd2MRgFpts806qjCD
	PNsDfidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odR7H-00EPt3-84; Wed, 28 Sep 2022 07:04:23 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odR7E-00EPr6-V5
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 07:04:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id t16so9314324ljh.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 00:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mwAW3kmbmDfR1+nb7qnTndxnvmh/2aETOKBevREMWrQ=;
        b=CNGqXtAcaIeBmAxYAJ0byEsnryDhT1j8LXtNEZC89v3C3ZmEx11TlPNXbVbeJLQ0Lb
         xIhneEaU10oxpfk88fXbYcTwQe3hGzB2EYECN/HuP8YBaU1jQWFORx5CmmNBDFkjqEV7
         5XspajX2oseOSGwGSJ5ZnZYOYJ7ABUV+EY7pyV0Chs9zaQVW5Vgb6ICcnGz0LDvqdMKQ
         5TL57IW5VFaGQOXb9yYZ5Ii5MMxWvCQU8BO6TymtTtCOeoZbC3PtqQ/iRQSRcg4ROyc5
         nGphflzOkRin+guhTtojX9Qw2rh42O2/AhWywFWGZi4MY1si46O+oHF25YBAnfHshgJn
         5muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mwAW3kmbmDfR1+nb7qnTndxnvmh/2aETOKBevREMWrQ=;
        b=1iKruxRGv80sSssGdo2oDeZOq2e5+ET0jFhJ7vOrTLslx+hHxGBRfmf4Pg4oSGt4oA
         iLH5knq+29usJCz59kZFgl4n9rLoyL5RKn4PGv91S8fqrzrtcznn1Yau7EL3sIChB7Z9
         xPx+G5I3FsljedYNXd9p48r5N7L20rqMkYhoEEYGQE/dmXQTwb/X/GaW9Vug4gbxkVWC
         uiq1am4K50gm9A6SIyK6BGl3GeSu7Sr9BCnR3FX6WV7MzUAt96Wry0Q9twfmbfssr4Jq
         yaUrpOPBGUMqbx/q4n1rFxLpeFovP0W7HYO88sUP0w6BxV0S0QTHOJnL+RTD1in+8NhK
         ktQg==
X-Gm-Message-State: ACrzQf3scVQfWKePqsWmGp5cni6lAY6qePdcfaiCzxZb/mm0KOr4hWAc
	kslMTvCVmaxOw/0D6IVpZaExGg==
X-Google-Smtp-Source: AMsMyM7Iz+rfJ70a9QQjtzGMPQ27BPaw9Y+gbWPCPlqtyf14Xpi5T4/g+Oohx5FDgMEJ/lkDqJM73w==
X-Received: by 2002:a2e:a7cf:0:b0:26c:541a:e04c with SMTP id x15-20020a2ea7cf000000b0026c541ae04cmr10820108ljp.425.1664348657257;
        Wed, 28 Sep 2022 00:04:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be12-20020a056512250c00b00492ea54beeasm385297lfb.306.2022.09.28.00.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:04:16 -0700 (PDT)
Message-ID: <172e10ee-22fd-ccec-1a5a-7bd0a29dbfc4@linaro.org>
Date: Wed, 28 Sep 2022 09:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220926105047.19419-1-allen-kh.cheng@mediatek.com>
 <4d1e8600-f73d-8d2b-2e7a-1b75be7624bd@collabora.com>
 <d71334b63427df73d01ff1b9fa4d2dec94ad9c95.camel@mediatek.com>
 <05ed341b-2db3-620f-7a70-dcebfaa66f1a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <05ed341b-2db3-620f-7a70-dcebfaa66f1a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_000421_051161_38E5BDF8 
X-CRM114-Status: GOOD (  13.97  )
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

On 27/09/2022 12:17, AngeloGioacchino Del Regno wrote:
>>>
>>
>> Sorry, my bad. I alsways run `make dtbs_check` to confirm dtb with
>> bindings. I just think we didn't limit node names in mtk-vodec
>> bindings. I will pay attention next time.
>>
>>
>> Since currently the vcodec lat and core nodes are absent from the mtk
>> dts, do you think the child node name should be changed to something
>> more general (ex: video-codec) in mediatek,vcodec-subdev-decoder
>> bindings?
> 
> The video codec is mt8192-vcodec-dec, while the other nodes are describing
> the VPU instances (and/or vpu cores)... I'm not sure.
> 
> Krzysztof, please, can you give your opinion on that?
> 

What's the difference between them? I understand parent device is entire
block of consisting of multiple processing units? If so, video-codec
actually could fit in both places. But feel free to call it a bit
different (video-codec-core, video-codec-lat, processing-unit, even
something less generic). Sometimes it's tricky to find nice name, so I
wouldn't worry too much in that case. Just not "mt8192-vcodec" :)

Best regards,
Krzysztof


