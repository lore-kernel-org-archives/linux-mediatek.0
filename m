Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFA1EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=; b=EiPpS1PkiHiGhDehl/sPrxym5b
	jB50s4enS25NdkYYLNARw2F7MaIIVVa6KZ/QrBZOFQEtn9tAoqp3c4Vffi2YDGlxQ/zEsk0nInwtQ
	nfAOSSaCa8hqjA3f2mLZTaREoJk7rCI1ynfQLyP3DbcTupepFLD7iRgWDy37PoPV2r5jpwXtdukWq
	AMo1AQvK4ejmdqwIoRV4ylPJBbw85Ky3iQQhGKoXJikBZ4sPlDKY3rhG8FmgQIYnQ/0GopH/ZRJFW
	f14LokW5mzk/UZNi+JlveMH5LWCoQms7jo40x8441/1SyYFB8VQ90fz+ItM23GRY3cX6hjIripR9M
	PLKtlTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfel6-000M1x-0Q;
	Mon, 11 Sep 2023 11:07:12 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfel2-000M0G-2g
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:07:10 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bceb02fd2bso70857041fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430426; x=1695035226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=;
        b=tlLIdL0Mlai6sVM7L1V2WFRCWqbE5dz7S5wWdOvPJe6aMe1yxWAgAYupmLy1nhXKKw
         cB9aJH5d4pgiaJlAKIx1ix257uo+S63fwGHSoe19KKwloHMkPvp4CZKCBkGLYBsZW3Di
         ZkElKCACIF70o/7HuVT4EUcbn7en0Jw8WFCxb162Y2MEyCwZXrePoUCniY7IELQijS1e
         IIopWatlp5YX+bznyjlqS5Ng6TGDAPQiQbIKaZ0Ptpo2MHcDGdaIyk77SXm1jVLDinmI
         I8CWcFabfG32ksz2P+u92cC5+BLz3UJuNAmuP3KsrA9tJvAYuKLRm0US64+q/5CZuMg5
         9rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430426; x=1695035226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=;
        b=mqFOA37jFV9zvjJwdCYkFDLbr6q4bWiu8uPgXhst/gwzgO1iO+9c6eaDzjaqoDquFk
         kLdRKLb+/cZEKUXbpWxDYBq8nn4nouB24jDnWN7ODor3SOwgeTBIiakKHhm8DE51/YL8
         1Sl8iwVhLusCg69zw752CdJgR8N4pWf4jZW9j/QHV4hh/Siip+q/NUQbEHWyFIHtMfuj
         PDC5D/oWrtIaF6C21LAsigh6y0hTSH3jK0wJ0qfrEvv9w8CdEiYjSBcHo4sjSObaJWN/
         6nCDeFmMMyPOilqGITKNXmw2hXYuanJMnVkeMU3yfgvTv6a7OcfiK/wAIglNIMJALxna
         BwEQ==
X-Gm-Message-State: AOJu0YwzEgsiVJWvu4g4q3i2Skq8cchEpOPCzcdner/LgrMsdt++11mM
	t00zdBgV9L5aBqO/vYRz/MRx+g==
X-Google-Smtp-Source: AGHT+IFR8IFxIJ7reSkaYfAFLu1yRY1oO/AEBb0QIMYpht4GuEFk0sZxNE+qAxMWLhq3G4SDtzJ7xQ==
X-Received: by 2002:a2e:9ed7:0:b0:2bd:124a:23d5 with SMTP id h23-20020a2e9ed7000000b002bd124a23d5mr8252127ljk.11.1694430425888;
        Mon, 11 Sep 2023 04:07:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id qn6-20020a170907210600b0099d9b50d786sm5219726ejb.199.2023.09.11.04.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:07:04 -0700 (PDT)
Message-ID: <e35a8b4f-ba1a-514e-9c59-a74442f0cb1f@linaro.org>
Date: Mon, 11 Sep 2023 13:07:01 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040708_911984_243D7AA6 
X-CRM114-Status: GOOD (  10.28  )
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

On 09/09/2023 22:16, Mukesh Ojha wrote:
> +/**
> + * qcom_minidump_region_register() - Register region in APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +int qcom_minidump_region_register(const struct qcom_minidump_region *region)
> +{
> +	struct minidump *md;
> +	int ret;
> +
> +	md = qcom_smem_minidump_ready();
> +	if (!md)
> +		return -EPROBE_DEFER;
> +
> +	if (!qcom_minidump_valid_region(region))
> +		return -EINVAL;
> +
> +	mutex_lock(&md->md_lock);
> +	ret = qcom_md_region_register(md, region);
> +	if (ret)
> +		goto unlock;
> +
> +	qcom_md_update_elfheader(md, region);
> +unlock:
> +	mutex_unlock(&md->md_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_minidump_region_register);

NAK, there is no user for this.

Drop all exports from minidump drivers. Your upstream driver *must not*
expose stuff to your vendor drivers.

Best regards,
Krzysztof


