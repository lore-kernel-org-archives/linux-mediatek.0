Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C31C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 18:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+nxhLmPT6t4AY10TSurP4vTyy21I9tRsQ7s0eYmz7A=; b=1ddaRL4RBUtqrJGBEEUbGRsNpU
	RhhIcLiJCuGMC6furzUp1fveomF+fb1oAnrXg0hOI+xnZlGWkfMl6qKdkzAXIbEsaWI/rrhCANcVc
	s+OeXTsKjuTuQ041LS2Sq08nk9kwlRO+oI6oRMKznAETFFECA3Nm+tK4L3r/R5GfcSJmEXrQiNJcI
	TnmiRo+rNzsHFDdDIOmm/YpEETu5rAQs5dQgChuU/rAqOG5WbA1XKa0GJ843jwFLxYFD76cjnK5A4
	OFcV9aO66fhrdTJ4Ah9tnGJGuaInyDWs840NQ/4NWprlSs6hGhJiFNj+wBLN+Or1+mpnrsDQchA+6
	FMkGdhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzkO-0036xo-Ou; Tue, 14 Feb 2023 18:09:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzkE-0036vI-US; Tue, 14 Feb 2023 18:09:36 +0000
Received: by mail-ed1-x52a.google.com with SMTP id fi26so18629528edb.7;
        Tue, 14 Feb 2023 10:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+nxhLmPT6t4AY10TSurP4vTyy21I9tRsQ7s0eYmz7A=;
        b=pxwExbQHI3IvXxpy4HLqrfnXfnbHU3154XSircVEIiX9lIQ56U6snohu4lPyv52BYY
         07O1AlehgwywDnckGWW2wySJT8UnKjKGGy2IHm/KIbxIZ9fRrlK5NFtVWnjvKU/uNo//
         wn5GndkkKnoILxPouX6EkWYXdfSMgUhGK00HornmStoEi3Znai3u7GGMbF17WzozwunB
         E1gx58CSJmLDoEYb3fqzdzenYaWHN7E9rYIMNg5XMBawSx4i2vYp+HDcIeJk6WtUVp0l
         UE3w5RPKm4Wsi3yZhwq6D16QNvKzAXE/6xF3FP/ubPzgehmMszrJZ1XF5HavR3P98VeM
         XlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+nxhLmPT6t4AY10TSurP4vTyy21I9tRsQ7s0eYmz7A=;
        b=ZCadeM1pALDsXAfKfLN8t5AcR5POpANEdWgjPxixBcKyLVTy2lztuD+UwY3GfVq/bD
         WD91ibss6A1tKUmwpb14xeAwWz0CU/myN9yMVTSm+iJ7R4ayHG/r/CxUP4sbZALiIz/F
         M6O/MAZ+JrczSvUk37EuT8cGXrGEzd/oiq0StYgqBcmpVaPW2iq9Qacfls7HznOVs92R
         01nRlTrsqGuTG5RUMUuK2aJmiF0zfFgWXXD/c9unD1eukxBiMSbAfXexrM25iZzJqoVd
         BNtBLTq7pD+lyVnU1p7bcUo3gEgQSbqDtKvTqptHIibZ4BikDq0fNJh0y4i/Lb5tvTMX
         eu2Q==
X-Gm-Message-State: AO0yUKUHNc8h/a70jOh0kpsLHWA3h067lRM8swnMXK0sYQ3YYYutDFO8
	+gij48Ne/6PTTQ7kfU2hT74=
X-Google-Smtp-Source: AK7set/g2pCFum1SdyPR2iQChO9O6QLQMO/jCsZ359IiOTcRmu1s+3AuulXszCw2ypKWqrevymuTGg==
X-Received: by 2002:a50:8ad4:0:b0:4ac:6ad5:413d with SMTP id k20-20020a508ad4000000b004ac6ad5413dmr3750077edk.15.1676398168652;
        Tue, 14 Feb 2023 10:09:28 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g20-20020a50d0d4000000b004acc1374849sm4067140edf.82.2023.02.14.10.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 10:09:28 -0800 (PST)
Message-ID: <fbc7cb4e-0424-f9c7-aa99-d8d9f7674175@gmail.com>
Date: Tue, 14 Feb 2023 19:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm: dts: mt7623: disable home key on Bananapi BPI-R2
To: Frank Wunderlich <frank-w@public-files.de>, arinc9.unal@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erkin.bozoglu@xeront.com
References: <20230212121354.44590-1-arinc.unal@arinc9.com>
 <C18B89E3-7B54-47B4-98B3-B2D74AB29A54@public-files.de>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <C18B89E3-7B54-47B4-98B3-B2D74AB29A54@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_100934_999342_B2A0533D 
X-CRM114-Status: UNSURE (   8.87  )
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



On 12/02/2023 13:33, Frank Wunderlich wrote:
> Am 12. Februar 2023 13:13:54 MEZ schrieb arinc9.unal@gmail.com:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> There's no home key on Bananapi BPI-R2. Disable it.
> 
>>
>> +&mt6323keys {
>> +	home {
>> +		status = "disabled";
>> +	};
>> +};
>>
> 
> Acked-by: Frank Wunderlich <frank-w@public-files.de>
> regards Frank


Applied, thanks!

