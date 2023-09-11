Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69668EEB57D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ILX0tdLmqj9AVpuvBKgqDyqNcCHFP+tGWFAoPYPQ4w=; b=STjlnJff4V7rh6FOQiQOCOSDlU
	YLgcFq/7NYF8rQY2lHdAfl9U1lUu4mLmEf0pW526paY1piMse5MlJZtqPGb12gTezYIYlNgg5wamS
	NkL7BEfpdi0hAYydS70WPPPyOtrs1tvW3U54waKc3Z2ZmKYQDf8hCFeJvDH1NhXDkphurc49D2G/j
	MHygPM9FIBshwuSj8rdbG2L4N7EJig7DpwNDsc2U66gPdFBxYyNyiKd3a4w180Wd4VvTz7casf2gq
	dnH6VuswgQJQCDM9VWdFnKDLAjVMFWsvVetBfUV5OxTU7pwQFGbdA3vreOrfU3nROJ42uw4MvetnZ
	dBdlROzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfehv-000Lev-0o;
	Mon, 11 Sep 2023 11:03:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeht-000LdP-18
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:03:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so567525166b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430229; x=1695035029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ILX0tdLmqj9AVpuvBKgqDyqNcCHFP+tGWFAoPYPQ4w=;
        b=brrhR11PHfps+7+0lIxPrzClGWa52Mz0mIgoHcKj/19t/kn6gLi753TIoCz2qyNqwn
         F1uv/09VHSsbFuwTW5Tw7u74UN5N4uF2/+lDiUTaGlmoCxnHX2wBlCfd2AL1+otqgjlC
         zoeoa41Xq/J/Qg9KjnnZJ6+tIOoz5oSYMpHPaTYPkAaEO/rCMRa6L4sk7zo84YxYawWu
         NTwsX2A5CnaNqrIY4XlPvP6Jmtx5esLqHX4tqaIJWyUQfN2GTUIlYxUN/jCPUc/9X6sv
         lNQ2vs+Tcj68nrdjAaejWamFI1f24/SYq2oZD3UX+4l3F6hgBiUDdXcKN3uOw5xStM9P
         FDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430229; x=1695035029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ILX0tdLmqj9AVpuvBKgqDyqNcCHFP+tGWFAoPYPQ4w=;
        b=aQLczAH1/TMcSxPc7Gmm0t5dcv+ihhyOJ3KGOa8Dquz2QRonrCBpoWEURyxEKMNoI6
         VLLACEYDby835+uVJ11mPH/y5x8akguq3Xa5G3spkF3AvNlOjyhKzFXDff7Ub2pDvqDQ
         hJ1np+J5VQ/CkrV4KoemGz90oi7eY9jy13vD/ZyYYbWHILvIiamODGhDHa9+gJMjqjBZ
         0wSpXSSWombGtvxYuWC7JK71TmxWqcA2VCeLB/yLjdxyeslfmtHSUAC7z5VZnFxo5y1+
         9lti4dv+/k+17B0pR1lizf2BIfEhlfWEgv4ASqsY4pHUcFuYNxnz9gp1Ur6eHjvXO4/d
         tB7Q==
X-Gm-Message-State: AOJu0YwVLg7EaSzSDvIbpPJQ9DeAynLnMphQvsENOGbGomVDDSIObWBg
	RDXywskx9HrPlz9gxRAbJxrlrhT8Z39ynn2twnCn7Q==
X-Google-Smtp-Source: AGHT+IHrCuHXPW5iCbHOgDTuxr0+rEQqZq3NfeZFsduvBFV7Iz1nZShwqgZZlcUjSeB2syGYDhOFVA==
X-Received: by 2002:a17:906:8251:b0:9a5:eedb:ee2e with SMTP id f17-20020a170906825100b009a5eedbee2emr7821770ejx.19.1694430229508;
        Mon, 11 Sep 2023 04:03:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ov27-20020a170906fc1b00b00992c92af6f4sm5183284ejb.144.2023.09.11.04.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:03:48 -0700 (PDT)
Message-ID: <f3bd88f5-7dff-871c-28d6-a7dbb1104989@linaro.org>
Date: Mon, 11 Sep 2023 13:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [REBASE PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump
 kernel driver
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
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-7-git-send-email-quic_mojha@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694429639-21484-7-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040353_387502_989A632F 
X-CRM114-Status: UNSURE (   5.92  )
X-CRM114-Notice: Please train this message.
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

On 11/09/2023 12:53, Mukesh Ojha wrote:

...

> +module_platform_driver(qcom_minidump_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm APSS minidump driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:qcom-minidump-smem");

Nothing improved here and in other places. To avoid review being spread
all over, I will just NAK this one.

NAK

Best regards,
Krzysztof


