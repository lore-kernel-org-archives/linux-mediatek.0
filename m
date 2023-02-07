Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0E5C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACnOp18Cw9sVFaRz+DHpDGjm7Thlarubraxtwk1GdtE=; b=q6vLviW0RJUsV5HND8db7nteZx
	U6/knfzxtqPBhFsknFcK19W+OPQVmRIpxN6KtrVuRd4JpMJHchu7H++QAdfB0vKCoZ55hTN+t6zM5
	gGsLVc6rLadtBezJvW9QendG/YcdNGZFEBFJ5tkitalZGGRAsPSHjxO+tR5/MRhzmJtC4MSwspWbA
	07gA6y0gKynwkOw9ESWP5whxr1MYgLLDBPkgJye7KA3+WlfM4kK5ZrsFplBpow9zRcM2aSyzJRz8W
	AJQHEu7dUHzI3q86l85/2t3u4upvHfj86jWxD7NPIQJf1zgwoN5exMl04ASoscC8sYBzJwXEZ38L9
	1sMLd5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUeh-00DL9s-4h; Tue, 07 Feb 2023 20:33:31 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUeS-00DL8K-SO; Tue, 07 Feb 2023 20:33:22 +0000
Received: by mail-qt1-x834.google.com with SMTP id z5so18248101qtn.8;
        Tue, 07 Feb 2023 12:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ACnOp18Cw9sVFaRz+DHpDGjm7Thlarubraxtwk1GdtE=;
        b=ZPtal6XqEg5h9vGXn3Tpj+XjFZ/AXB0sOvRcopoZ89vuN9YDvq6piWVTamHUujJSJu
         yOkr0zBqCwNqj41Dz8DmoEnx6JEF/5PToOQnKgNeeY0Q+T8s5VAyaWu2YuGBvoGILlCk
         92baiNX1O+lJLVVQIvW+Lodu1izfg8CflK1OnPM50j6nh+9hBQDdwUh0HyOLANnTAAeF
         ++I5ezxwhYqxXKXVRW3upiDLEDdy4OtYq7apsDbTKW45uepaCAQJBcrp85PazgSA1rWC
         Hnh/j8S9k+Kg7KxbRFk7/0vhe+L0ssyMQIjopquea/kVUdmhPxLsoGFmhfezjd6xfg+D
         tktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACnOp18Cw9sVFaRz+DHpDGjm7Thlarubraxtwk1GdtE=;
        b=OBRQbPrh2V7k4x3zRCIxpJhNkNHLbUUhRBBQijObE7Q35QJjcUWplbiE81d8F/aATA
         7+SVd/7vq2j/wYUl5zAEpayBaj73aHwiQuC/fF8sLPZBYXfkK0Lzinr7oAHjXP+w3fWk
         7uOfzIIjTDzpj0sCf2Zb3gcr8/xmQciuh3h4tBcfTCAVEClXT06UbTSrNZvqqYfNiNKB
         8WJ1yKHsP1RK6dpJWCkZX/bw2laJcexEoVacXTY4vKBvNnVsBee80+ZmPkXlm6muVeqD
         x9j6vjJOabDROyUUkITh/W7B0c9uEOCBppjexcFZoJ4WFLzHQX6FSazhhQ7XZ8N6H/9s
         Kk8w==
X-Gm-Message-State: AO0yUKVuGP4FfaVi/aYcsf2p1dFZzw2IMl9DoCOJQ2r454fLpKoFYCg1
	Y8Tq6/DpLjlNFU3fKNGgWWU=
X-Google-Smtp-Source: AK7set/hNBjGKVokty8Kg7Hj+M/AZK5P9t99MexEgK0y64YxB5Ho3ND4mmbt2lgppKWclZ7x7fJtPw==
X-Received: by 2002:a05:622a:148c:b0:3b6:2f22:75bd with SMTP id t12-20020a05622a148c00b003b62f2275bdmr8014753qtx.28.1675801993929;
        Tue, 07 Feb 2023 12:33:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z7-20020ae9c107000000b00731c30ac2e8sm3631619qki.74.2023.02.07.12.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 12:33:13 -0800 (PST)
Message-ID: <cf4d3028-fea2-be31-4636-f739279d5806@gmail.com>
Date: Tue, 7 Feb 2023 12:33:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 iresh Kumar <viresh.kumar@linaro.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kevin Hilman <khilman@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de
References: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_123316_957545_7CC2D8B7 
X-CRM114-Status: GOOD (  13.04  )
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

On 2/7/23 11:59, Uwe Kleine-König wrote:
> All but a few drivers ignore the return value of
> cpufreq_unregister_driver(). Those few that don't only call it after
> cpufreq_register_driver() succeeded, in which case the call doesn't
> fail.
> 
> Make the function return no value and add a WARN_ON for the case that
> the function is called in an invalid situation (i.e. without a previous
> successful call to cpufreq_register_driver()).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----

Acked-by: Florian Fainelli <f.fainelli@gmail.com> # brcmstb-avs-cpufreq.c
-- 
Florian


