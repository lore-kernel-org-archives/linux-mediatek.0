Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4CCC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DYLiElYQgv4EGpAL4uv9JD+TX+jA5euJMoTh7FRrC8=; b=tsHCYDRTq3/9oliKI6+8kdUx79
	pceJFupNchPoKSXQrCtnGhn1+qQeG5AdZfAljri84FX3x6ZvrzGe/QC2A7wdZ//Vkyx0dCwtgbxBN
	+KJU01BFlopYWF1KMaBC3okoeuG13o5WhwyuwpDi+7uNsFdgwCIA+okR65+2rQHzZMikYNEXe60AD
	QdnUikWtGQl5cV19U/+SAn5TAlFRYcCxWxmex3eVD2gTRjzmAXKyqW9N6Zw1bbRqFrAHVwby2kAcU
	HUkntFEmIXR+z5Jgdm5UN4Zy9E7vxzxmxYK4q1j5WlxLoC/xnHTLV4R8n1f7UuFUhCcqlgy2SVpZr
	61Z07Wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAntu-00DWZZ-6Y; Thu, 29 Dec 2022 08:04:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAntp-00DWUc-UV
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 08:04:27 +0000
Received: by mail-lf1-x12b.google.com with SMTP id f34so26530506lfv.10
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 00:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DYLiElYQgv4EGpAL4uv9JD+TX+jA5euJMoTh7FRrC8=;
        b=PBZ+vnE4/SqRWBbQf/R6Bu3YpqzM3EBlm1qj8DgHKEx1Zpc1IzWcqcLMmR1jU22Ypa
         BXfRxNdWJHUeUN3+wQ3XMj1iP0VK6uNXCWlNAxoN2PnXUH2jMd0PmarK2gDF09rgRDOd
         bBwVCQ2XKkRawy+coeJb6rZdiXeEqtgwAAo4wygIeo+RzO6z+hW5HTlr/APoWtyQDNJi
         fCvuIXATG5i+PBDDsL5juXSe2L9OR1qvVWimKMo7IgFhjj3Ay6Sloos9fC8D6F8kG15n
         Jk8Iy/daslBdQ2/xDhqFeLW6JMINvvZKBl4EFmCU/K6vy/N0Xge6+gUmridkWSHgCi/e
         f01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DYLiElYQgv4EGpAL4uv9JD+TX+jA5euJMoTh7FRrC8=;
        b=TkfoHxPFYvoOE/LwxDnBkgmHQzxsWqou3Hz6T1GBHKNA3LD6iAkstIp11WNrk7DK2L
         0lOkZ+s4qVAHcP22J2iIOwvUoCU6aYZvzsHzvilQTEyhGQ9ISdwYyKkKrIB5SxIF4Kt9
         5LOl/onbOFnLHaIdjG82etuo0RvfTqHDmhdZHxRm2FjzID13445i6Fyh1LLdi6ibSFUR
         nWD4cXvQZ/X8UVdXboWu874Wg0gdHP57t/UW/Pa6tFoHNOXItuxdjMacwRnaRZcih5ys
         dsKYAWdSIctZOy7qLc8c9EGENH78B0Qsw+ifaLA35icYeCMJzuJVGvfV9Llu0DrNC84t
         I3oQ==
X-Gm-Message-State: AFqh2kpZx3FeeY4Hm52v5UR2ex2BVWnwZtRQQrppgYquNBeMlBIB/pBo
	0ifNjOR15xQyUJiHDN7vLvaLeQ==
X-Google-Smtp-Source: AMrXdXsBM/+5SkTv2g2UOivb3O+hOArlgmPvXOxeIWL0XdAQwTEvZjoR3USSVK3GX7IJ5Jgc1VuWqA==
X-Received: by 2002:a05:6512:31c5:b0:4a4:68b9:66f1 with SMTP id j5-20020a05651231c500b004a468b966f1mr8800288lfe.60.1672301061752;
        Thu, 29 Dec 2022 00:04:21 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512208c00b004b551505c29sm2980736lfr.218.2022.12.29.00.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 00:04:21 -0800 (PST)
Message-ID: <ba935a94-ccd6-e062-a9f4-2431cc69f097@linaro.org>
Date: Thu, 29 Dec 2022 09:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
To: Jian Tong <tongjian@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, perex@perex.cz,
 tiwai@suse.com, angelogioacchino.delregno@collabora.com,
 nfraprado@collabora.com, jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
 <cae5273e-aac5-0c4c-6686-fb2cbc5379e3@linaro.org>
 <CAKKM_AVxcSW+ZaTbMuR-+=Fbkr64Arm2-3-MPWmoYV9Dpxkqdw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAKKM_AVxcSW+ZaTbMuR-+=Fbkr64Arm2-3-MPWmoYV9Dpxkqdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_000426_150950_B429B6AB 
X-CRM114-Status: GOOD (  12.43  )
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

On 29/12/2022 02:57, Jian Tong wrote:
> Hi,
> Yes, this is my full name.

Here you use different, so that's confusing...

> 
> Best regards,
> tongjian
> 
> 
> On Wed, Dec 28, 2022 at 8:37 PM Krzysztof Kozlowski <
> krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 28/12/2022 13:22, tongjian wrote:
>>> Add support for using the rt5682s codec together with max98360a on
>>> MT8186-MT6366-RT1019-RT5682S machines.
>>>
>>> Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
>>
>> The author and SoB should be full name. Is this correct (full)
>> transliteration of your name?
>>
>>
>> Best regards,
>> Krzysztof
>>
>>
> 

Best regards,
Krzysztof


