Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9099DEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItV/PafZYbRtZG+3EH6sRu97i9Pet4QO+NBJ8/y2iuI=; b=l17X7jy7gp0dENIdrg5O/yTVze
	DvH6Z5UCrtySepELfKMsh26ONpSE63VDFH02ilIXaSYXpMLYRmRnDPxI5pWgZpFHExwAyCqSeAipD
	58b+isukKKbS8BVI6pnSbTOyOIOm3eW+E+NFya5yRTXZw1X8JTw9ukXR3paGZMTW77mkL5pNbLps3
	uxCJ4mjJ0pUlXJrL1yqsUJkH0X67ewlJW2oJR9AGoOGZJMStFDMTWS6UBIT/Fs/ShgWv0o/TjE3A0
	1MnURxk+DjDUGxwBgS9mL9AVr5bzhVru+rp6GEiZETkET8zYIFX5b7RdA1cut3CSakyEJUP10616z
	JsCWOl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfenj-000MKU-1Q;
	Mon, 11 Sep 2023 11:09:55 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeng-000MJL-2I
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:09:53 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bf8b9c5ca0so15336761fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430590; x=1695035390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItV/PafZYbRtZG+3EH6sRu97i9Pet4QO+NBJ8/y2iuI=;
        b=MLdohiH2A8DFgYsS/HaHHjbMVRoGsuUKjSl14PxzJegi/1QbaxSDOHO3L59OYwpWUj
         /ZwvdxIfNRqj2qoORqqzkDwlaXlJ3jfsVQw4VsfUC8/zr0qNcHV7Qw+kJ6E0j8rjGzrf
         I+JDQqP0at//YDY19J57yDOUAMAN5ygq1e+tc3YmkBDHBRr+2+FLC2OJGI85ijirU3Sc
         epIDL8FfJE5EfpJIWVjeBAB6uELQoDXp00i4C+05l2Qbc3rsabX+bIx5DaCKLiS7IbKB
         P1Crto4LcwUMYFWruz30B7p+rL1mO9WNXmwmprwLbNeNm1Vkf/iqrXi6zWxgVwUfLurw
         iSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430590; x=1695035390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItV/PafZYbRtZG+3EH6sRu97i9Pet4QO+NBJ8/y2iuI=;
        b=w26Oytv4glyqTKuUfEhgzjDNT8aU+jvrRFlXN+OvjWMu1kZ6Of1Dle7EPX4HZ4nmNE
         SN3sea1T1Fb0sUQsSe29DDrl3nP/pjAul5vm4/Bb5A2etIq+DoOTsy4NUR4KpGqEnYAt
         iuOqKphC4vQxa0LnHFnyDqK3Ueh3FSQp2A2qV2y9MiJxedrU401YSKZB6FwW+RKhYUYR
         XBW8Nout5zi/2cAMN6OCZdVsW0MKdTTFQd/P83cYMJSs901oLuwukRA6I+9ZfPN3HPLw
         3gNViNlfQZtQeOclkBOjJ7wc7pJc91K0I8yILjkH9cNGzj+PLFuh7Cs6MCdLs/lLiFQx
         pq2w==
X-Gm-Message-State: AOJu0YxnQb0Fajm0OufVcOchXt1o9lbL5RPLC/hkHJb14pPXDN+6l0v5
	dJbn+W1/r5Hvo1aEbzly3VTwSw==
X-Google-Smtp-Source: AGHT+IEA9FyfM8rXa+3k+u+doQWaGigDrU1zuRRVi1v3E2XELPt5LPr2HsZJRl0XxMdT23XFarwUrQ==
X-Received: by 2002:a2e:8543:0:b0:2bd:180d:67b7 with SMTP id u3-20020a2e8543000000b002bd180d67b7mr6601812ljj.40.1694430589764;
        Mon, 11 Sep 2023 04:09:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id lw7-20020a170906bcc700b009a168ab6ee2sm5129780ejb.164.2023.09.11.04.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:09:48 -0700 (PDT)
Message-ID: <0041a391-12ba-2e1b-0954-fbc0e00be631@linaro.org>
Date: Mon, 11 Sep 2023 13:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/17] qcom_minidump: Register ramoops region with
 minidump
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
 <1694290578-17733-12-git-send-email-quic_mojha@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-12-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040952_749787_9507FA7E 
X-CRM114-Status: GOOD (  12.90  )
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
> Register all the pstore frontend with minidump, so that they can
> be dumped as default Linux minidump region to be collected on
> SoC where minidump is enabled.
> 

...

> +
> +	record.type = type;
> +	record.id = 0;
> +	max_dump_cnt = 0;
> +	name = pstore_type_to_name(record.type);
> +	do {
> +		ret = pstore_region_defined(&record, &virt, &phys, &size, &max_dump_cnt);
> +		if (ret < 0)
> +			break;
> +
> +		mdr_list = devm_kzalloc(dev, sizeof(struct md_region_list), GFP_KERNEL);

sizeof(*)

Please fix it everywhere in your code.

> +		if (!mdr_list)
> +			return -ENOMEM;
> +
> +		md_region = &mdr_list->md_region;
> +		scnprintf(md_region->name, sizeof(md_region->name) - 1, "K%s%llu", name, record.id);
> +		md_region->virt_addr = virt;
> +		md_region->phys_addr = phys;
> +		md_region->size = size;
> +		ret = qcom_minidump_region_register(md_region);
> +		if (ret) {
> +			pr_err("failed to register minidump region\n");
> +			break;
> +		}
> +
> +		list_add(&mdr_list->list, &ramoops_region_list);
> +	} while (record.id < max_dump_cnt && ++record.id);
> +
> +	return ret;
> +}


Best regards,
Krzysztof


