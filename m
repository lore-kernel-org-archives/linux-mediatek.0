Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFB1C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbZYXU3CwClgETqhdjQoXodTSxGhorbUytRGaBvb6Pg=; b=k1vUC5VSFqe2uNAveQ3j3SncZp
	cR1m11dtX1qERmW78FXMluevT7y1u/r9P1FaKoWW22w1MTZi7ZzdxKOlCav1rG52bREMdiLQu+Kdk
	Ghznf+mNLORb9AWnZh4TCH0QsA/t1k1U0GH3gGAEmJVppZ4tkFKyJLxszidrx5WCPAszwc2UsYN3e
	8HCchD43hlo3rhOpjc6rvb9HSZUl6n6jLonMQmh5Py360rYVmIkiKsyq0msNqZQhxRkM6Sj8R6vcV
	gaYlZ0Hsl45oNWgpUdy2WnROHXBNmDXs4PZuaEtCh9iQBbXGCDVz/cazHLziWDkD7geNscuxkAlKQ
	jUr+aGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3KH-00BDCo-ON; Thu, 26 Jan 2023 14:34:05 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3K4-00BD6L-1a; Thu, 26 Jan 2023 14:33:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y11so2028468edd.6;
        Thu, 26 Jan 2023 06:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbZYXU3CwClgETqhdjQoXodTSxGhorbUytRGaBvb6Pg=;
        b=jwl0p7p76KSN9woc2E/mq1oapHwh5qSFbh/wTvhvka2QqKfJ+5H0Tlmu/Fl9KQHjSt
         CPvoP1EpUY2N5f/yi1Tq/zSAZIbg+hNDw4P3c38hZ+SCllZ1RXj0hIR8MOikf1hkPlxv
         Zvv01k59aHHOxc0b4KorXn6yCPpg6JXWsNkq+C9nX39UoHj4SkyqJz70cIVQ12yXXTxj
         ayhEdz25nXGIPUuO6Bxrp3UrWzX5DFUv/say/qwvuxdgYV7AuyaWDsfgoIqC39aK5xtr
         r+15t6z1lb+khhb2Moo8ibebCdUf2xSDGHdZcjHaxMTnldrTK1PeenzmPedjV3XiOOvL
         l42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbZYXU3CwClgETqhdjQoXodTSxGhorbUytRGaBvb6Pg=;
        b=R9uvST/UbR12cP7Ig2P/ooJkOz2cCMVmghyfWaZlanxJy3Trvw/Mke5seLk0x1F4C+
         aYNki7K4N60+KsyThokC7mzgbKFrVva/AkV9+o2HJHWqrZMVe1kOl5ZcSSxkiahinzXH
         wCgonHT1pMt2/4sPj3gWrPFDvculPbdWt8E9op1JVpvecsUyjsOM2BYfVCfcyJjCpP8B
         hEGm+lvxULte1p6bUHQQzHPLyJoJy1VvxVbdBROvvuukuZrf8CwMv+Nkxbq5BTXGmPuK
         KkYkNIa4FyxtGhOjLanlADoLhhhf+20Q5WqvQb7CslOxA19F2al4KEehEqPSOkqMopKT
         Yy4A==
X-Gm-Message-State: AFqh2krC5l4jzBSuqy87m4WIXkMF6Lhw+jJOzROLbLeWztg7AMhrvBDF
	Xxc8GFXlRrHG52lZczjlznY=
X-Google-Smtp-Source: AMrXdXtZYgaznh9SIO78EDuKzc5nLRuzdrpWmUh499yi8uTaCb+qB4kLDpHqls4b9zKXQZEMpuY+nA==
X-Received: by 2002:aa7:de95:0:b0:497:65e6:f6e4 with SMTP id j21-20020aa7de95000000b0049765e6f6e4mr35683968edv.14.1674743628939;
        Thu, 26 Jan 2023 06:33:48 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d21-20020aa7ce15000000b0046267f8150csm828611edv.19.2023.01.26.06.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 06:33:48 -0800 (PST)
Message-ID: <8eab7134-9d1f-0101-509a-0d664b000a36@gmail.com>
Date: Thu, 26 Jan 2023 15:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Moudy Ho
 <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-2-moudy.ho@mediatek.com>
 <8ae4469e-ed2c-5019-605b-013a49af77ea@gmail.com>
 <124f081819a80482b3bffd8e12d747fc.sboyd@kernel.org>
 <c4633d6a-9aa5-5c43-bfcb-611cd96e1c5b@gmail.com>
In-Reply-To: <c4633d6a-9aa5-5c43-bfcb-611cd96e1c5b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_063352_119645_D8457BBE 
X-CRM114-Status: GOOD (  10.61  )
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



On 26/01/2023 15:32, Matthias Brugger wrote:
> 
> 
> On 26/01/2023 03:05, Stephen Boyd wrote:
>> Quoting Matthias Brugger (2023-01-19 08:08:48)
>>>
>>>
>>> On 18/01/2023 04:15, Moudy Ho wrote:
>>>> MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
>>>> populate device by platform_device_register_data then start
>>>> its own clock driver.
>>>>
>>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>>
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> Stephen, if you want I can take 1/4 and 3/4 through my tree. 3/4 shouldn't be a
>>> problem, not sure about this patch. In any case if you want me to do so, I'd
>>> need a Acked-by from you.
>>
>> Do you need to take them? I'm picking up mediatek patches currently so I
>> can probably just take 1 and 3 if there isn't any build dependency.
> 
> No I don't need to, no build depencies. Ok, I'll take 1 and 3 then.

Argh, 2 and 4 of course. 1 and 3 will go through your tree. Sorry for the confusion.

Matthias

