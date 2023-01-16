Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CB7C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRcPPcKl8l6HimLtXqG+dhNtbHx4LXcAEzJ5JUHT+Yo=; b=36G7TNhAsdsI8JlUCas3V0ruIX
	AtzWpqGORL9eOjEMzta7o21CCVvf363ZC5S09K9MeTPrfEs2eyx35C3B+i1GMX5+zcDZDvhxPC4tK
	RT9kiyp22/tQ9uLfcDf/1FzQt2ZK+RYlm5JfZKRFuC7rAeL6O0MVYegZnYrU/uEOGv4nuJuNd55j9
	ddnce5slxiNgK375/TfcspNmq6CuNWBQ0W5+PUFhg1TKXWA2LL3V2Qt/2uuU4w1EziSzaZwnFwkdz
	fL0YPm69M/kABYHPOwkMURti0zqku/2n6In6xcodb784vVbQEtWkFyt3Vhdq1nCV7NfRTYS1N9/1E
	Ui7FLeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKQP-0094sw-Vf; Mon, 16 Jan 2023 08:01:02 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKQN-0094ra-CF
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 08:01:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id m21so39603223edc.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 00:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRcPPcKl8l6HimLtXqG+dhNtbHx4LXcAEzJ5JUHT+Yo=;
        b=CxKc+v8/gkzhMyLtMlUalA9tpB2MR/Fsvd5InjdW1/0FtKK2M/QL6NyHJ5GBu/si0M
         hMTNuIh++CLkEeT1+Jzq8PyjRT9urF8X8/h2vHwpWCN7wPKIjcdypBIXlbXZ6tFbE4xk
         CIijC2ImdntkD3X6UE9mh2VkA9ro1gm+pAxLPHZldoc9H0uRCrjwEIaqXk8HEHP5CSL6
         3UktxtP9n94NAb+9cHwA+pC/hgs8xrIUw9AmaalGTQKqda1QzZnUXIBrWeDGR7Mzvndy
         7RzM4vnqq7J8IXJf/xYpb5rhG1dum67J52KK7PRzpG0xMlVSPGoEpLckuB1mmIAN9FRl
         cAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRcPPcKl8l6HimLtXqG+dhNtbHx4LXcAEzJ5JUHT+Yo=;
        b=MhsEwqPDD2EriGR8r5FXhgLHhgMqFW1vpDZNKfDxNdhWdT5e3QQBktVyEwd0EiKGuw
         CtcET/rWeU9p1UgNuoqi7TkL5OKE01ThzfSDw9Gu6uZSybuMLUN/CJIkQvocDAOqUvvs
         7alNhizBsUnFBz08YuQosuO7l0NNF2NxuGWmbAU83C3e4HszQYyj+L4EM8ekViJJl24x
         FUJ/twPcrlG9LyMbaBqu4vxXb/NG1sOUE6R8KWQTlWAXHx+JdrC+/wK8HK7UESEssTm4
         xdH1Ki+mCUMmfbPsm/FJIUbYl5/6XodO+P4wgvK0PCOJQskr82ndX9R7hrYE9/0KdmRv
         0yow==
X-Gm-Message-State: AFqh2ko74ylfRU73hNxN9CJkZxNjzz/DfiR2K5dau7jFmnCWWK+pErfO
	77wLJhdYNcuBiDTw8LVvd5u0VQ==
X-Google-Smtp-Source: AMrXdXsaXXXEwOyq1RNmSbugZN83uyUrb/G2s/2ksOUaet9ssaySB5n5Qe465BxS1g2zQ/WWrZ+pcQ==
X-Received: by 2002:aa7:d288:0:b0:498:1ca:80d0 with SMTP id w8-20020aa7d288000000b0049801ca80d0mr34933986edq.28.1673856056899;
        Mon, 16 Jan 2023 00:00:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s1-20020aa7cb01000000b00463b9d47e1fsm11096530edt.71.2023.01.16.00.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:00:56 -0800 (PST)
Message-ID: <ce4d2d3b-a826-ac59-e077-2fa452d115a3@linaro.org>
Date: Mon, 16 Jan 2023 09:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 01/10] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20230113054304.21841-1-moudy.ho@mediatek.com>
 <20230113054304.21841-2-moudy.ho@mediatek.com>
 <329aed63-4522-9859-4359-2a450c46dcc0@linaro.org>
 <fa386a3ab2f2ed0c963d5fdec8bbea56ba276169.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fa386a3ab2f2ed0c963d5fdec8bbea56ba276169.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_000059_443346_59A0C5BE 
X-CRM114-Status: GOOD (  14.68  )
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

On 16/01/2023 03:42, Moudy Ho (何宗原) wrote:
> On Fri, 2023-01-13 at 12:58 +0100, Krzysztof Kozlowski wrote:
>> On 13/01/2023 06:42, Moudy Ho wrote:
>>> MT8195 vppsys0/1 should be probed from mtk-mmsys driver to
>>> populate device by platform_device_register_data then start
>>> its own clock driver.
>>
>> Unfortunately I don't understand why this justifies removal of
>> compatibles.
>>
>> How do you propagate or instantiate devices is not really connected
>> with
>>  the hardware description.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> Refer to the comments of 0/8 and 1/8 in the following series:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=702518
> 
> This patch is used in conjunction with another one(Message ID = 
> 20230113054304.21841-7-moudy.ho@mediatek.com/) to fix the binding
> warnings caused by newly added in MMSYS.

The patch should stand on its own. IOW, it should explain everything
needed and it should justify its existence.

Best regards,
Krzysztof


