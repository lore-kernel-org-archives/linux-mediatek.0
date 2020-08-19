Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2A6C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 22:39:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDF88207FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 22:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqLzGTbL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiFY5EFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDF88207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KlzNKHzW2KhE1S5oYR/DFPS5o5sd7z9Yikf9DFDxgMc=; b=qqLzGTbLnnqRM8tva6xHFF+ya
	zHbIJo/ltAwRJ6xLunnGiRWQN3HhnExAm6uoFnIQ5agesZcPxL1K0RD41X2S4fxrn4w6bRDnw0Cui
	ibk0oPq8CSEjAHCDSvPVzsCnQWftQAjqv510b2Rdq4QhavCJX4jPEqQRpdFIvdt4Q7nrmhnYK7ABr
	verJf0SsUSSvQ9wHJMTn61+q9dhL3r6+jrZ72phYH+X16jrZb7SThR6bN5dkYvVL8VEcqlOJ6uQsf
	9vonPkeYAK22HSisTAWSLczFwA18sf7irOM56Zx9DCGHPyHDAOC0Qh8El37vaXoTOAS2J1scqe/rq
	sy1tSNMow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Wjy-0002V5-3L; Wed, 19 Aug 2020 22:39:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Wjv-0002UU-FR; Wed, 19 Aug 2020 22:39:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id z18so237899wrm.12;
 Wed, 19 Aug 2020 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nRpCADsHOf/cWhcypV5jnkA5SHzSc6g+QJdTCoTw3Ds=;
 b=UiFY5EFg4f9I/213bZd57Gg8sKrk9+m6VDfEtWtAXi5DIt7Kb8yENRGuPg46iMtuHO
 VF/6fWP3m0inhANxal8sMy2Cpy1Ui8Jj3ChCNwbL6voIjWBhlUHLJ+bjN/ihOAqJz1hJ
 o95p+grke16tJSIiwBcl8gtbdLXl3Svbs6OEWhABY7wR+sIhu1pe2gIaPtSyEtxibn5k
 xug8GlgMoFMeeCbtQrEtAZYZSifQ6miaW8ubqwnodnY8bA5c9bWJPEwr8f5qdyR1XxYF
 UWqevL4r4pxh+pa70G0+Eo7ngQCEflQln2vQjxdqJS5TBMbmFVUjOGdBWBcT3aTEF0Ec
 yFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nRpCADsHOf/cWhcypV5jnkA5SHzSc6g+QJdTCoTw3Ds=;
 b=Z9BQg1lloNqb1qWDYim94ji+j1ogUqugWz4gwNf3t1KyM7379Y/LS51PYjL3c/AbGw
 fvXQ1r/mRxWnPw+hzuiuvtPjVdpr2l6a7d78zwU+9XGZVSZ221/7ASHU7CkNCzhhfTW+
 3N/FCFO/eyYPZYDWmEHtsVT4xmMteVS7kFRGFogR9OwZ8yNABbz9o4ACOIqWl/D3SeAw
 hixLoDXmHl7CAb+2hfDDMVXnTq9CuCIEkGtoEd0ZMdfrLRqtdF5yqZ4Y+jsQ/Ba2iBjR
 +WqzVENaB5/UzdSBKb1yJs32loc5McfL6+Zwh+D/sKGrw41rLnqtkZN2+u0aGcIxRoZ8
 /J/w==
X-Gm-Message-State: AOAM530ucPj6tPheh9P2Vz20FzzM0XSVkGJKGlYNAJzPpV9m8U8K7+oe
 8PhlnTYZjAdFyNV5GXz/YH0=
X-Google-Smtp-Source: ABdhPJyFRJO0AZRVyZ+C0c3HOnzZQn+Vqb9ABZGDytFjKz/PRua8HhDRp9AbY74tQIK5x195uVkZ5g==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr191393wru.341.1597876766413; 
 Wed, 19 Aug 2020 15:39:26 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
 by smtp.gmail.com with ESMTPSA id u7sm414472wrq.89.2020.08.19.15.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 15:39:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20200729074415.28393-1-krzk@kernel.org>
 <92ac7165-765e-da75-4c0b-3b232521b5e9@gmail.com>
 <20200819174805.GA394@kozik-lap>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <38e5f452-d049-f323-4a24-f7dafcbdb72f@gmail.com>
Date: Thu, 20 Aug 2020 00:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819174805.GA394@kozik-lap>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_183927_531562_6CA04800 
X-CRM114-Status: GOOD (  16.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/08/2020 19:48, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2020 at 09:53:59AM +0200, Matthias Brugger wrote:
>>
>>
>> On 29/07/2020 09:44, Krzysztof Kozlowski wrote:
>>> Fix W=1 compile warnings (invalid kerneldoc):
>>>
>>>       drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
>>>       drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Queued for v5.9-next/soc
> 
> Hi,
> 
> It looks like this missed the merge window. Do you plan to keep it for
> v5.10?
> 

Yes. I'm using the confusing way of v5.9-next branch, which means v5.10, as long 
as Linus does not decide to switch to v6.x

Anyway it's queued for v5.10

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
