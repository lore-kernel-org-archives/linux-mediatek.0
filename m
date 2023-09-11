Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C6C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 19:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inHsDNknLIsreaH/7mQ9fcoY03dG1phB2IV/CbQwYHw=; b=tOT7XFkYhJqlhM4onIBvdrLeLQ
	ep7rjQSsuUL4kuJ4jl+jNteiFOe45Ih/y3WNpAxVkHrWrioH8xtD6ssH7FbNZfzrrpwRWIyqoo9a3
	L3gFBeiE9vclCXFWJzilyFh14gqBSjkfs9k2Cyi95Qoy0YPoLOPvIa+DjUTEl4BVW0H2Tu5QUIuFk
	G+UcdEf2GbCIt2mk82Wq4IPLsq/Opz4LwUNlon9rhBd9uxaTtwhlVRNrN2vNuC5vMf4ffGco26qwQ
	oFvsajKpGpr0bZX8th2xokU4eaSHqmE7jtSQ49GD1vS2n5IQ5Dh5lqCPyoSXEU0nwBG/pRwUdCN6c
	U8NyHCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmfR-001CsE-1Q;
	Mon, 11 Sep 2023 19:33:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmfO-001CrH-0X
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 19:33:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-307d20548adso4888908f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694460828; x=1695065628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inHsDNknLIsreaH/7mQ9fcoY03dG1phB2IV/CbQwYHw=;
        b=OPfnZIXBO9SLt+lAURfLzqRUSOy0H4A858azzSC1cj9uxHCgYVShw6BRxu8t4b18Cg
         uRog26zHrk2eWbcTkWLSFgnoOp3i+rlWnKLSHr29zm7gQ8S2J8Yrky9L6W974qFKbOAF
         9A+fxEL3uCIWXImyrz2HSZIdyWZ04vKSh28+sLpPwj3MYaDsFInwHR2NAPXLgYpu807i
         eJJuSr8a2UQ2Qh5e1Cl4f5PoYnMY32Ho8NJ/6m23N32yM77rv+G9f6zYMpGRrOAXxg8G
         49bf07yrnFj9meXMo0ydstLmnHcK5KdUDZpCFCK6Mf63uWvS/lbtKAs1ES/g3Af9moug
         ZWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694460828; x=1695065628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inHsDNknLIsreaH/7mQ9fcoY03dG1phB2IV/CbQwYHw=;
        b=UnAI3+uks4UX/7iZmqyCqLAB3gNb18lyYPorKSdxBQPAAhNQOA/tGPfAWmHr82DshZ
         Y9SYK5SSlDmrQ1wGMdQZhvD3/UTy9nUu2OFdG2oY5GxUBERJmyz/skdq+H8fpCjuI3KF
         pd2p8ilyzjh+496M0IqmdCf2Wd/njMEe/uLIUsZKawsP0CMX71EtaaisAP0nOa9u/5Ug
         toPNrhJqgDk6hFXlDD/ow/QgMkNlZczThNElx+q6X+68nnL8gWRE4ukUgPRagcEqpcvu
         fB5w0UfIApDXLE6GIrUqDS/c4PgrPSteDyDJQXP8itAyxLUIiULK1Sp0FDpwoeroNRXj
         budA==
X-Gm-Message-State: AOJu0YzqCxCgbzV8OycSZupB6gqHVTNp/wCbPgtVBz978lovBrhhJUoP
	tCmzVr34wyVxpDIeOvg1SwnL0Q==
X-Google-Smtp-Source: AGHT+IHPh4+mNCvhlbAWncPBV2Sm+011b3XyySb0xj15kRO2fiVHvavlbXLcuAA8FfPzM2ZflHLaHA==
X-Received: by 2002:a5d:560d:0:b0:31d:cd33:b30e with SMTP id l13-20020a5d560d000000b0031dcd33b30emr8891759wrv.4.1694460827797;
        Mon, 11 Sep 2023 12:33:47 -0700 (PDT)
Received: from [192.168.37.137] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id e24-20020a056402089800b0052565298bedsm5043464edy.34.2023.09.11.12.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 12:33:47 -0700 (PDT)
Message-ID: <ee8cc664-e698-4b0c-886d-ac33eb23b51e@linaro.org>
Date: Mon, 11 Sep 2023 21:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
 gpiccoli@igalia.com, mathieu.poirier@linaro.org, catalin.marinas@arm.com,
 will@kernel.org, linus.walleij@linaro.org, andy.shevchenko@gmail.com,
 vigneshr@ti.com, nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org,
 alim.akhtar@samsung.com, bmasney@redhat.com, quic_tsoni@quicinc.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
 <e35a8b4f-ba1a-514e-9c59-a74442f0cb1f@linaro.org>
 <36d9bd32-7ea4-4d84-b1e9-3cfcc3bec85c@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <36d9bd32-7ea4-4d84-b1e9-3cfcc3bec85c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_123350_224767_8045CC01 
X-CRM114-Status: GOOD (  11.16  )
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

On 11.09.2023 21:09, Jeff Johnson wrote:
> On 9/11/2023 4:07 AM, Krzysztof Kozlowski wrote:
>> On 09/09/2023 22:16, Mukesh Ojha wrote:
>>> +/**
>>> + * qcom_minidump_region_register() - Register region in APSS Minidump table.
>>> + * @region: minidump region.
>>> + *
>>> + * Return: On success, it returns 0 and negative error value on failure.
>>> + */
>>> +int qcom_minidump_region_register(const struct qcom_minidump_region *region)
>>> +{
>>> +    struct minidump *md;
>>> +    int ret;
>>> +
>>> +    md = qcom_smem_minidump_ready();
>>> +    if (!md)
>>> +        return -EPROBE_DEFER;
>>> +
>>> +    if (!qcom_minidump_valid_region(region))
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&md->md_lock);
>>> +    ret = qcom_md_region_register(md, region);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    qcom_md_update_elfheader(md, region);
>>> +unlock:
>>> +    mutex_unlock(&md->md_lock);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_minidump_region_register);
>>
>> NAK, there is no user for this.
>>
>> Drop all exports from minidump drivers. Your upstream driver *must not*
>> expose stuff to your vendor drivers.
> 
> Do we not expect that upstream drivers would want to register?
> Mind you, in the downstream code the following was a bad limitation:
> #define MAX_NUM_OF_SS           10
No, Krzysztof meant that you are not allowed to export symbols
without immediately providing a user for them - meaning if the
functions are not going to be used upstream, this change will
not be accepted.

Konrad

