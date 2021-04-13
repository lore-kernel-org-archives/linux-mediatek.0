Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8BEC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 15:01:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B17B613B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 15:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B17B613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S8bE5QZKEO092RXTMKwcXPFrrM8T2ZHu+yDvhYSpERw=; b=jhALBDRKoVa8flVG3djX8X6Ll
	08INCBF8wF0tgum5SfQK/lXiaBmZVDTDuinDX7e7kmfi2e+3LKupG692Yh/L9bOi4Rpc4rLrY0m39
	tsTWTAPD0cRMUMX19mMr1L6yEkKutqRO2v/2ftH0SI0k0Ij8LJBZqWdWTIG/lQRxqZQsioB11URtq
	LfvvNr/QPk8QWioKZ+Q/vgbJxeNHQIki7fpAj1UVCGlPLhV7UtW7KZs9cZF8nfI+gaMMe7pkFwxn4
	nzBVHJ259t2c6DSrcZqcKTjiLHOXl7vZuc76ZSlW+WqX4Z7ethtNiRrf7ZqS940P5PeQssLStJq8l
	oV7CmlCvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKWx-009Zt2-6X; Tue, 13 Apr 2021 15:00:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKUd-009ZiI-VA
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 14:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=yJ2s7SvtJMvGXXT2TcTaXG1f4Lh8es6VQIDWtx4JoOk=; b=CrjY3Mio+vaoWTOUHNagKo4N9C
 ShxDdswzK8LjmJrlulcYTG55eQ2MqzXcc/S6KNmk1WkO2MDtWAqmbyNb1TZHIaYDaqD6C1YkeqBzS
 kIY/Ups5PgO0hsfdfNJr6DmBPa8BLNWJrdO4TTY1HIiabPA9VkL9kIyrt0pHFiMUdbCWgWXkfn1Yw
 okBYWgL/PubblL/foxVktYeKszsZcE4SaHfQYTLoQVj01/yCXJae1r1rsvlFDT+bDggxybItLnLvU
 R58sEPZC8MjEsLLD20py4PqFpWArIixnspQeJ+pXSxSzX2xp0bygZnJ5aq5rgzwkCNRy+Ya1aggL2
 848FeQUQ==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKUa-0077gp-Ps
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 14:58:18 +0000
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lWKUZ-0005Ci-Gv
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 14:58:15 +0000
Received: by mail-lj1-f200.google.com with SMTP id g4so489504ljn.18
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Apr 2021 07:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJ2s7SvtJMvGXXT2TcTaXG1f4Lh8es6VQIDWtx4JoOk=;
 b=HH21sWgUi96g0kHXK2tpVBzd2pBLkFun7OSjCqpgOLAut10zWMIVTzqNUaKwL2O/F8
 6PUf4jdcgblYyRGyT3KH7/SsFSznuw7opgE/NBXmpQyJbf/FC9gvAIMQZVK2osN0oW3L
 2q39PNLvG8gi7cRwaRRMatikR+DVx9eDnjVFHwl8fW3mWxdsTcefVf+hThKKwh1ZWkze
 qT7t0msDuktYkUREXgLNE24JIYXVDnZLa3a0eL8Ud9z6Xzc6lpX0J2USBrdxvXCfsrq0
 v2SNpQPxwuBDwq2lOmULwiKwV+7ucxLBCyd1CjrRH5ADx1vZw3Ofel95B1o9TIelDBev
 YrKw==
X-Gm-Message-State: AOAM530HfU5PJYAqCTznTXrqcXiLvOFgk3Cqp/Unvhcqy/MyPqpy6Wnm
 5X/Nq9c38Tpg6J8KgTwUKUME6KUTA1z4SZJ/33Nkw5xoi3EvPqOg5+YiJDHhu+UQ89m4mdVIzK9
 WPTSxRnu1cUmU/NOvP1aEj3rTGQVzQtfBApW9NyjGDsmzacaIyA==
X-Received: by 2002:a17:906:f1cb:: with SMTP id
 gx11mr13865173ejb.106.1618325884645; 
 Tue, 13 Apr 2021 07:58:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBS4f8/FtSKZIitrByeXvJ1+6fxGya2GdvXhrTkGICEYkSUaRVVNDzAJfvhqZqrKTZYiywqw==
X-Received: by 2002:a17:906:f1cb:: with SMTP id
 gx11mr13865137ejb.106.1618325884439; 
 Tue, 13 Apr 2021 07:58:04 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id c16sm8258136ejx.81.2021.04.13.07.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 07:58:04 -0700 (PDT)
Subject: Re: [PATCH v5 04/16] memory: mtk-smi: Add device-link between
 smi-larb and smi-common
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel
 <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, acourbot@chromium.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-5-yong.wu@mediatek.com>
 <ea7ed30f-050d-2d38-7c61-1e0c192f6ded@canonical.com>
 <1618293876.20053.19.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d3b5b48a-82dc-361b-91f7-df0a73629b67@canonical.com>
Date: Tue, 13 Apr 2021 16:58:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618293876.20053.19.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_075816_985260_630543B5 
X-CRM114-Status: GOOD (  21.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/04/2021 08:04, Yong Wu wrote:
> On Sat, 2021-04-10 at 14:40 +0200, Krzysztof Kozlowski wrote:
>> On 10/04/2021 11:11, Yong Wu wrote:
>>> Normally, If the smi-larb HW need work, we should enable the smi-common
>>> HW power and clock firstly.
>>> This patch adds device-link between the smi-larb dev and the smi-common
>>> dev. then If pm_runtime_get_sync(smi-larb-dev), the pm_runtime_get_sync
>>> (smi-common-dev) will be called automatically.
>>>
>>> Also, Add DL_FLAG_STATELESS to avoid the smi-common clocks be gated when
>>> probe.
>>>
>>> CC: Matthias Brugger <matthias.bgg@gmail.com>
>>> Suggested-by: Tomasz Figa <tfiga@chromium.org>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>  drivers/memory/mtk-smi.c | 19 ++++++++++---------
>>>  1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> I understood this is a dependency for other patches, so:
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>> If I am wrong and I can take it via memory tree, let me know.
> 
> Hi Krzysztof,
> 
> Thanks very much for your quickly review.
> 
> I think it is ok if it go through memory tree. In the original patch, we
> pm_runtime_get(smi-common-dev) in the smi-larb's pm resume callback.
> This patch only use device-link do this. thus, this patch have no
> function change. it only adjusts the SMI internal code flow.

Hm, okay, I took it then for v5.13.

> 
> In addition, [14/16] expects your Acked-by. and that one should be
> merged with the others.

Thanks for reminder.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
