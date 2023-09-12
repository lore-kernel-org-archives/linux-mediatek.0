Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A95ECA0ED5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quEjwIEwQhvi6S4NasXoKOetPehrd0RF3qKdIQ0l7t4=; b=HDWQrygcX6qNMlDKjsVK09jT4+
	4CI9i8VCXs3JjTZST0SqUO8vgVOasNRTQnbxHOfjusJ30L1R0M0D+45Ei6VEMv2fTcFWFpPrrEcPC
	9aj9J4Xk/1NU7YRezhhZFLGsNzDVNOgQq5BDOHz99tq2qGnMJDpdxEK11GSkrXDTmxXHv3/LON4OA
	d38qcl+AuKoCEsT3KKVTTB9wL3baprku+zFaBnrI7J18fitzrAL7AnEYtAkGUj7YLUQnei2YPOik0
	xU2LhC9fdj73ccNNDxAlOkc7tMNLzgCLWFGhnNnMv4JCyfuDCLhdYkot/N+3EOExLtwtMaBrqhZyU
	3uw3aRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg06E-002oMY-1g;
	Tue, 12 Sep 2023 09:54:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg06B-002oLU-35
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 09:54:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-307d20548adso5472278f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694512461; x=1695117261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quEjwIEwQhvi6S4NasXoKOetPehrd0RF3qKdIQ0l7t4=;
        b=e8ABuHfbnktJj3gwTRzwpwyZ446Va3DJlQy1ZYhvZEre3hTcDTs+f5873X/x0FcfZe
         IGYleBokwatz0fTmT1goVf+7w0y47fmh2Rym8lwuo0ClE4NqqGWcsgTj36JRWXLACBIS
         ZARX9R/mWNvnfTkVMDfN0PLQQvAtVhdwNQ468ZT2DZazz3IM7qbcRN3g/pf3VCe/RKc0
         +sH78qIpZTtX00uSbNnndTgIEJJ2XQsf1O9v8d+Z5Lg2DuslBOYhKuVeiVr0EEC4z3a3
         qbU1GsyRlGyqTkVFpsA0AjMWZ+Y9EgcLqFfnGCFaUn4p56tujCuvrAHgUtboROQeyjsz
         laIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694512461; x=1695117261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quEjwIEwQhvi6S4NasXoKOetPehrd0RF3qKdIQ0l7t4=;
        b=AtJoVwfv7hY4b6RrTpDWX6tnhNOp6DnM0Vny9XTxhK7O/QC9smBlYV65jIih9A6oZw
         BBpxK/8/tPXbe83kHE8rqYTL5ePD/Br0oB5dnzxl3TaU+jIjPy+mZQB0RLxoNJzX2SGE
         TMl2L+d22XOa+s4htyQwfl28vfJ1I+BseW00GGSYXEO6MSCpCCC6QyhhDfgxxi/KIRrz
         AncSaqGoOh1pb42uCkw71F0MKKmA6R/obYDOqLucNJqEGBaem9EOUsUyToeE9bTnoziv
         ifMw5wsV6zoMaC/Bqv2qCtiIa0hdKUW4JMV2GWZ/GlyACUk3HnLGSPVQDD1Olfki0i8P
         iEPg==
X-Gm-Message-State: AOJu0YyTTZS6HmkZBLco+GTiJAL3YoR7Agxchb4Bd0bH6/bm40yUQe7i
	o6qHQv+CCV0LM5MoTj2CW3av0w==
X-Google-Smtp-Source: AGHT+IFnQg3ALYeJgAkk0jJC2jJChoqUbPD4jYDvz6vnfv5QkI7TVMzsvOUXJ6xATfIAfJduc6Y6Mg==
X-Received: by 2002:a5d:494f:0:b0:319:7b57:8dc5 with SMTP id r15-20020a5d494f000000b003197b578dc5mr9302315wrs.54.1694512461287;
        Tue, 12 Sep 2023 02:54:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e10-20020adf9bca000000b003143cb109d5sm9999941wrc.14.2023.09.12.02.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 02:54:20 -0700 (PDT)
Message-ID: <94770fc6-7d72-8283-5858-786685620d5c@linaro.org>
Date: Tue, 12 Sep 2023 11:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
 mathieu.poirier@linaro.org, catalin.marinas@arm.com, will@kernel.org,
 linus.walleij@linaro.org, andy.shevchenko@gmail.com, vigneshr@ti.com,
 nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org,
 alim.akhtar@samsung.com, bmasney@redhat.com, quic_tsoni@quicinc.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
 <3bb1e84f-3b65-0596-1b6b-6decb0ff53cc@linaro.org>
 <0eeef9c4-14c0-8283-803b-4684854d4be6@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0eeef9c4-14c0-8283-803b-4684854d4be6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_025424_020697_022AEFED 
X-CRM114-Status: GOOD (  11.11  )
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

On 12/09/2023 11:26, Mukesh Ojha wrote:
>>
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	mutex_init(&md->md_lock);
>>> +	ret = qcom_apss_md_table_init(md, &mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
>>> +	if (ret) {
>>> +		dev_err(md->dev, "apss minidump initialization failed: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* First entry would be ELF header */
>>> +	ret = qcom_md_add_elfheader(md);
>>> +	if (ret) {
>>> +		dev_err(md->dev, "Failed to add elf header: %d\n", ret);
>>> +		memset(md->apss_data->md_ss_toc, 0, sizeof(struct minidump_subsystem));
>>
>> Why do you need it?
> 
> Earlier, i got comment about clearing the SS TOC(subsystem table of 
> content) which is shared with other SS and it will have stale values.

OK, but then the entire code is poorly readable. First, any cleanup of
qcom_apss_md_table_init() should be named similarly, e.g.
qcom_apss_md_table_clean() or qcom_apss_md_table_exit() or whatever
seems feasible.

Second, shouldn't writing to shared memory be the last step? Step which
cannot fail and there is no cleanup afterwards (like
platform_set_drvdata)? I don't enjoy looking at this interface...



Best regards,
Krzysztof


