Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44295EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D6uZQx0A7zu9HZThgkhNF6gppfDzg14ZGsi8FUaY4Q=; b=P/eaFeS07M6+iCR+DxFJWG69k2
	peqGXb5nH6pz78yTr6GAP8O9NzGW98Pk4m1URLEurXonytAREAjFCfGsCHddTKyz8L4fP8e8e9haG
	8HOjQzXpyvmQc9dY9JsetfUDIdjCWBIccVhiSH5npcBqPOaZOU+oqRiJLrdQBUrvLbiiMP9FbPwEF
	AfB8uqybFdsDuYKQ+2pOGWsVe9uzp7M6tzuzBNnuKu5PkbEdYRjlQ+TnuXG2zSEIzqEto13PY3qG7
	KqUkhtvZpIit66vGHbAOvzaji62VjGZaTeSfZWHqLuvDCRbYFDRS4b86Bj4U91RgFmm/U0lfYSvDW
	IJmf6jqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeg3-000LJe-0K;
	Mon, 11 Sep 2023 11:01:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfefz-000LII-2r
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:01:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5007616b756so7061728e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430107; x=1695034907; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6D6uZQx0A7zu9HZThgkhNF6gppfDzg14ZGsi8FUaY4Q=;
        b=NCHPU4vvyede3e1EfZr9Q+nNvS7UZ2DKEKa2DQzGTvFtbSBeMVFmYgKJgWzP6CzyVz
         bMEvoffYrpnWYOZlY70g5oQbDdW89szCOzy1ecNPhvYeZY9UrQFDxWX3DB3qZCWcufr/
         vGjvOO0fk4CpLZxzBsp9YbIu7xKBE5OTloqnxI1IqP3/iYXvV66xRBixyCEpH4wcbJZB
         PFRfDETand/D6f0EgaUgLP3q80DNhULFHe0CksCME5aQomefg+E5dalTpSOe5Mki5LzF
         zxEivrZv3sA8gwOFi3ow2sB0C4moNmVUj1rcj78W6PW/kRWYn1Uh70lvijaZvWFgGsq/
         OYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430107; x=1695034907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6D6uZQx0A7zu9HZThgkhNF6gppfDzg14ZGsi8FUaY4Q=;
        b=geoeoav3DOmfWEShAoNOY9Lp97UQ/hBWXw159ngNqdH3CSW+7Q8nZC4dahmM0B6b5t
         8YsShmHCJzAKvqhyTG9AilQbyj6MMnLGVfkF6rSN1p4SoHqga3GcPZ2uA9pXR/Tyul0n
         gA/YAAjOkn3tQzKTDo4WspxH4Oj+SP2iPFQc1GEYRwJLqFcyNuy1SQ/bUtAjUdw3MkKq
         6tuQg5kdJWZKy2Wm+WhqZmf3vbJ1rqHvEK6PTWTaGmul0CMQ0ArS236/XLgVwgrLzIrb
         t0lGJp0dmqbfk+74IBeRgL8q8/MU5rnAEHwCPTJSpdudp9vMpiDdYLrCGBdGWBLL7DY/
         nD3A==
X-Gm-Message-State: AOJu0YxV6Y0cE+jMC6UqeJZeC8P8ySQe5heiFTRjPcSB2W9aptF0gnK4
	kwDqj3zii6APU6IHzChMiMRPrQ==
X-Google-Smtp-Source: AGHT+IGuUFRIM5BpeluBoo5NEliARLhu4KUj73ZJ5zv60HnO5TW4G54nipJsf0t1IIjq2gfhWbu1wg==
X-Received: by 2002:a05:6512:3d1c:b0:4ff:8c9e:eb0d with SMTP id d28-20020a0565123d1c00b004ff8c9eeb0dmr9569849lfv.0.1694430107080;
        Mon, 11 Sep 2023 04:01:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906351000b0099bd86f9248sm5175514eja.63.2023.09.11.04.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:01:43 -0700 (PDT)
Message-ID: <3bb1e84f-3b65-0596-1b6b-6decb0ff53cc@linaro.org>
Date: Mon, 11 Sep 2023 13:01:39 +0200
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
X-CRM114-CacheID: sfid-20230911_040155_924874_5CDFB6E8 
X-CRM114-Status: GOOD (  19.21  )
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
> Minidump is a best effort mechanism to collect useful and predefined
> data for first level of debugging on end user devices running on
> Qualcomm SoCs. It is built on the premise that System on Chip (SoC)
> or subsystem part of SoC crashes, due to a range of hardware and
> software bugs. Hence, the ability to collect accurate data is only
> a best-effort. The data collected could be invalid or corrupted,
> data collection itself could fail, and so on.

...

> +static int qcom_apss_md_table_init(struct minidump *md,
> +				   struct minidump_subsystem *mdss_toc)
> +{
> +	struct minidump_ss_data *mdss_data;
> +
> +	mdss_data = devm_kzalloc(md->dev, sizeof(*mdss_data), GFP_KERNEL);
> +	if (!mdss_data)
> +		return -ENOMEM;
> +
> +	mdss_data->md_ss_toc = mdss_toc;
> +	mdss_data->md_regions = devm_kcalloc(md->dev, MAX_NUM_ENTRIES,
> +					     sizeof(struct minidump_region),
> +					     GFP_KERNEL);
> +	if (!mdss_data->md_regions)
> +		return -ENOMEM;
> +
> +	mdss_toc = mdss_data->md_ss_toc;
> +	mdss_toc->regions_baseptr = cpu_to_le64(virt_to_phys(mdss_data->md_regions));
> +	mdss_toc->enabled = cpu_to_le32(MINIDUMP_SS_ENABLED);
> +	mdss_toc->status = cpu_to_le32(1);
> +	mdss_toc->region_count = cpu_to_le32(0);
> +
> +	/* Tell bootloader not to encrypt the regions of this subsystem */
> +	mdss_toc->encryption_status = cpu_to_le32(MINIDUMP_SS_ENCR_DONE);
> +	mdss_toc->encryption_required = cpu_to_le32(MINIDUMP_SS_ENCR_NOTREQ);
> +
> +	md->apss_data = mdss_data;
> +
> +	return 0;
> +}
> +
> +static int qcom_apss_minidump_probe(struct platform_device *pdev)
> +{
> +	struct minidump_global_toc *mdgtoc;
> +	struct minidump *md;
> +	size_t size;
> +	int ret;
> +
> +	md = devm_kzalloc(&pdev->dev, sizeof(struct minidump), GFP_KERNEL);

sizeof(*)

Didn't you get such comments already?


> +	if (!md)
> +		return -ENOMEM;
> +
> +	md->dev = &pdev->dev;
> +	mdgtoc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &size);
> +	if (IS_ERR(mdgtoc)) {
> +		ret = PTR_ERR(mdgtoc);
> +		dev_err(md->dev, "Couldn't find minidump smem item: %d\n", ret);
> +		return ret;

The syntax is:
return dev_err_probe

> +	}
> +
> +	if (size < sizeof(*mdgtoc) || !mdgtoc->status) {
> +		dev_err(md->dev, "minidump table is not initialized: %d\n", ret);

ret is uninitialized here. Please use automated tools for checking your
code:
coccinelle, smatch and sparse

> +		return -EINVAL;
> +	}
> +
> +	mutex_init(&md->md_lock);
> +	ret = qcom_apss_md_table_init(md, &mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
> +	if (ret) {
> +		dev_err(md->dev, "apss minidump initialization failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* First entry would be ELF header */
> +	ret = qcom_md_add_elfheader(md);
> +	if (ret) {
> +		dev_err(md->dev, "Failed to add elf header: %d\n", ret);
> +		memset(md->apss_data->md_ss_toc, 0, sizeof(struct minidump_subsystem));

Why do you need it?

> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, md);
> +
> +	return ret;
> +}
> +
> +static int qcom_apss_minidump_remove(struct platform_device *pdev)
> +{
> +	struct minidump *md = platform_get_drvdata(pdev);
> +	struct minidump_ss_data *mdss_data;
> +
> +	mdss_data = md->apss_data;
> +	memset(mdss_data->md_ss_toc, cpu_to_le32(0), sizeof(struct minidump_subsystem));

Why do you need it?

> +	md = NULL;

That's useless assignment.

> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_minidump_driver = {
> +	.probe = qcom_apss_minidump_probe,
> +	.remove = qcom_apss_minidump_remove,
> +	.driver  = {
> +		.name = "qcom-minidump-smem",
> +	},
> +};
> +
> +module_platform_driver(qcom_minidump_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm APSS minidump driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:qcom-minidump-smem");

Add a proper ID table instead of re-inventing it with module aliases.

Best regards,
Krzysztof


