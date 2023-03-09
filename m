Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B42C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqM9tPbk85fkSamrIGtF+aGGKkrU9G+V8TUF+yeEv8A=; b=NLc075ayuou8bc
	DmJODao+7oItrLEjJ10mRnMPRZjppqOewD12UDKhPDi6v3ARJFObgZlphSjhGpHsoHk7pX5feBp2v
	3G96IlSvYo3yzc7Qjo0/R4Fz3Zh8+Ke9M1tX+//nTvQqZ1cFnuSXJG9Fz3hNep140MNI6WHmwKe72
	vL/0fijbUqBgZJgYXV/9m0NTID18SqKTB8/0jl9J+FwINGi1luJgZr1d1apSFl1IeNzqbmBjI/1sR
	mpnx7A6dq+4JkUr59X8tcis4aohxL0W1vLDI9LZAUxp8U6qz6WZvadMQJk4i3y0yr8Mvsdt2+Qvup
	tlkH07O+yeM62fpKy0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCtV-008uXs-FB; Thu, 09 Mar 2023 09:49:05 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCtI-008uRF-I6
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:48:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o12so4539195edb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678355331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqM9tPbk85fkSamrIGtF+aGGKkrU9G+V8TUF+yeEv8A=;
        b=SOGx0RpyMsiXOR6INiKJFbpBvSFe9w7i05zm2lXlR/T2TKa8QylkB7e9C+MQuPWhO/
         Ku/H+APnyg5V/why7CWDcRyCYN1EUTaAy7gUz8MgMug30Oroj1hx2lt4hjJXzJ4L+smS
         Gl9GOre6r+id+4BvTzvCBZiFzsiuWufrylwoWWv1JKjLeRh2ebzdoMrEgZEa/ISGRQCK
         suwRxZsk4QME0pgnBm3ErfIfs5rWuFyHeKyNi+8KHgjZ3KVHYTidsMbkOrKNcU13+CyF
         8dpMQhVRryLJFV3L/NNAJH3yHfPOzd5bizHY4ltfMiJelw/cK3gSw7K/UOYRp0bg2qnj
         +iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KqM9tPbk85fkSamrIGtF+aGGKkrU9G+V8TUF+yeEv8A=;
        b=5MORuuTVVKt4MWZ1X6Q1RGTrZLKlOyL3pnIFIldMX8mpQfvRohO18GhaQqWKeqQhtg
         nJE7RnfG4J9Zo+Zphn7930L1PmG0Qbe9ouka2lJp/jw+XdcVrC+X5MMp9JRjMYu4V2fK
         sCxcDx8J3eEKJuEDF5QgjGmJHqIO3p7nxSVtCw/DRyYfOywk/J4hdo78m1atLt5iJYK3
         3v0hiGZ8PIycgWVYodCmrpsV6fId9EI+9lINAQbNTJvkiFBmxyIw93TH5N3Zg/YvDaCp
         FvYg9N7fpyMODjPxOKuC42dQhwV+5tChtv9niyqAPOX4WszJXDSjNgRkUcIHbppoN6lI
         X5ig==
X-Gm-Message-State: AO0yUKXZcx46X3ZOLvXirSyduCvL2W+bgv0dc6WcWbPnSwH8W4bw2yh+
	FHbN8VTAwMTY8NdAl8PTSnuGFw==
X-Google-Smtp-Source: AK7set+LdAcJf2k76HO3Ko/pAiaiYsVO6swO8CiLqUtf9WOiHED+3AcF+H/mT/wOUS2xwh46rEkt0Q==
X-Received: by 2002:a17:906:da82:b0:88f:9f5e:f40 with SMTP id xh2-20020a170906da8200b0088f9f5e0f40mr30594330ejb.68.1678355330988;
        Thu, 09 Mar 2023 01:48:50 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906005700b008e3e2b6a9adsm8646897ejg.94.2023.03.09.01.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:48:50 -0800 (PST)
Message-ID: <38eaed94-647d-a25b-f1ed-8e2d1b6e8852@linaro.org>
Date: Thu, 9 Mar 2023 10:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/20] dt-bindings: pinctrl: ralink: add new compatible
 strings
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-9-arinc.unal@arinc9.com>
 <20230308210017.GA3744272-robh@kernel.org>
 <1c704ea4-2241-ef21-dc6c-d2d243d3bbad@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1c704ea4-2241-ef21-dc6c-d2d243d3bbad@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014852_622724_51557F78 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/03/2023 22:19, Arınç ÜNAL wrote:
> 
>>
>> If you want to break the ABI (do you??, because the commit message
>> still doesn't say), then you don't need "ralink,mt7620-pinctrl".
> 
> I don't want to break the ABI. But I deprecate ralink,mt7620-pinctrl on 
> later patches.

Deprecation should happen here. Otherwise you have now two valid
compatibles which contradicts previous Rob's comments.


> The driver still has it though, so old DTs will keep 
> working. That keeps the ABI intact regardless of deprecating strings on 
> the dt-binding schema, right?

Yes, but deprecation is missing.


Best regards,
Krzysztof


