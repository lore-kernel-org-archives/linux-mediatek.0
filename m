Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB43EC3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDFJAyxdwlXAceDq2HEyYot6ddhmeIhv2ZNqpa+nXCY=; b=xv58tviNl5hvs6RPZXRdNGvEaf
	Il6Nl0RvLU9ypq5j+ctK+3BYEKRZ3Nzen2QIvMcRWTycO25bw6cMZoFg4hMY5jsz9bBbJ8W9taPJP
	GN4/Mdy2iROxvqJcjjivdzQqCZ9JFrajtVvEDGME3k94l2ZBjPd0fXa56bb2BfdwBYRlNriYkJiSZ
	2skE6V1/nSbfMym8dyRJCTKTacq5p2ggCiaMmiTvc3MofPMIUR5sA01Gg9gB4NCJbggbNGodni7qf
	nOTli/KBKSQ3llKi8EsPU9pREjD+HOZWfAOWvcQV1i1+SSQIoXQ4Rh/boX5yZ/GnOc3go2RpPj6FN
	1S39F8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjS4-00DpA8-0T; Tue, 17 Jan 2023 10:44:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjS1-00Dp8h-IW
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 10:44:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id b7so4119667wrt.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 02:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDFJAyxdwlXAceDq2HEyYot6ddhmeIhv2ZNqpa+nXCY=;
        b=mejaY73R9K8EQWWiawJO1bS1S6I4yHsgrohDuS2fhH8cueOsSYZi42eZLXw2ZhqfBj
         VIdfM3A2WiHmJi7wglW2fcZkPTPCRHfzFakebE0hzRReQV2L7HsuxA2i34ae1WWZMxEj
         EGS2JQ+ZG+kG2WmARA0PqObGq5tHf7RJAHgYOF2Vbsd95qaBGg6YCWwCGWiaLPq3+q/a
         QJyxBskSEfe06Z1XJm87x5j8m4UP5stOlFmg0xJ/j5aa1rttQdPDMY90q3XVVu0k7kKi
         gYwlkW123cPMsiJAJFT6JbsNlUip9QDE9CrBkKfQwt5TTVbCKBSgTa7kvMIijQLLb+Hw
         RlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDFJAyxdwlXAceDq2HEyYot6ddhmeIhv2ZNqpa+nXCY=;
        b=dXDuzhhc3+/HWbGkbEUIx3UcO/Efm2Jf7rTCJaFujMNFqsunjTIK4trPmrC9mN2got
         43AGBnD9tQbV2pqoWmus5h67OUQl17ZHK4Ykzrl2DUwONUgnx/S2AZ98HVleKA8p8HiD
         s3Qf5UqrfLKjLdcC3/0an63Rz4fsIWI1HZP/brFQZTViGu5CDytVPPXweDMub8prYGC9
         B+LJv0SWS+4YDNLCgpapGCboR04JlKlVUDUPpOXHPInPUh8YTbqyJFZudqpfVp7ooyZ7
         Q12XOSO7vDcfaLYYzwt3TUmRhVZlw6JewfkOYtHUzzInUvRxwmwSMm9ZM6Iw+BzdOP6u
         DjsQ==
X-Gm-Message-State: AFqh2kqlkj6AbeJCMvyEP/chwPHYmzVPYJfipsuvGPIZszZH8yb2aWTh
	rgOCcUWTdqD3j1Y8mv3QzhOlqLTkpLI4yX4h
X-Google-Smtp-Source: AMrXdXtZBBAJRszEFQuiAI8oVhKjjwBpWztQ8LR+hAfpx5+gygc/xT1aXjwWWGgP9vgzwbJyvxRKDQ==
X-Received: by 2002:adf:fa4e:0:b0:2bd:d415:39c with SMTP id y14-20020adffa4e000000b002bdd415039cmr12015109wrr.4.1673952257509;
        Tue, 17 Jan 2023 02:44:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b0028965dc7c6bsm28121074wrp.73.2023.01.17.02.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:44:17 -0800 (PST)
Message-ID: <3c7e9a5f-24e3-3486-11f8-556428947423@linaro.org>
Date: Tue, 17 Jan 2023 11:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/10] dt-bindings: media: mediatek,vcodec: Remove
 dma-ranges property
Content-Language: en-US
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 =?UTF-8?B?TGlibyBLYW5nICjlurfliKnms6Ip?= <Libo.Kang@mediatek.com>,
 "kyrie.wu@mediatek.corp-partner.google.com"
 <kyrie.wu@mediatek.corp-partner.google.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 =?UTF-8?B?Q2hlbmdjaSBYdSAo6K645om/6LWQKQ==?= <Chengci.Xu@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "joro@8bytes.org"
 <joro@8bytes.org>, =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
 <Yunfei.Dong@mediatek.com>, =?UTF-8?B?WUYgV2FuZyAo546L5LqR6aOeKQ==?=
 <YF.Wang@mediatek.com>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?TWluZ3l1YW4gTWEgKOmprOm4o+i/nCk=?= <Mingyuan.Ma@mediatek.com>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
 <20230113060133.9394-2-yong.wu@mediatek.com>
 <07ecf7cf-4a68-0f80-0452-3737b7d7922d@linaro.org>
 <796e7fb8619d114c63580e5c4289c59a57449843.camel@mediatek.com>
 <2e2a0c70-86d2-7ba1-c87c-aaaa9dd460b5@linaro.org>
 <3da13600844b8a6c3b788bdb26faa537d0287173.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3da13600844b8a6c3b788bdb26faa537d0287173.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_024421_698778_00ADB4AF 
X-CRM114-Status: GOOD (  16.97  )
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

On 16/01/2023 10:16, Yong Wu (吴勇) wrote:
>>>>>
>>>>> Cc: Tiffany Lin <tiffany.lin@mediatek.com>
>>>>> Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>>>>> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
>>>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>>
>>>> There is little point in storing output of get_maintainers.pl
>>>> forever
>>>> in
>>>> the git log. If you need it for some reason, please keep it after
>>>> -
>>>> --.
>>>
>>> I did get the list from get_maintainers.pl. Sorry that I didn't
>>> differentiate.
>>
>> Getting the list from get_maintainers.pl is correct but storing it
>> forever in git log is really unnecessary. It's not useful. It's just
>> automated output, reproducible at any given time.
> 
> This patchset crosses several domains. This patch is about vcodec, the
> next one is about jpeg and the later ones are about iommu.
> The reviewers may be different, thus I use "Cc:" here. is this OK in
> this case? 

I guess we do not talk about the same thing. It does not matter that
reviewers are different. They are all different. Please show me the
direct benefit of storing automated output from a tool in Git log.

> or I should remove this, and put all of them in the cc list
> of the mail.

I gave you the instruction at beginning, some mails ago...

Best regards,
Krzysztof


