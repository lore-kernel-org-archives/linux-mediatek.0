Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C60CC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6HWOEwIvxzzOAHzI2EcExmShWYJdBv/nEv/cvkVQ/g=; b=frrGzjZ+K5dIWqPtAnpmKhLZBC
	Of1PvGotKR6TrzhK5R4ZgkPqIfbcjM8Xn8G+SbKtaVT9MCYoGmy+FEZ0D1E602FK4heelcZBSh78H
	WNPscVuV7xU83PbkJxF40Gxr4nuTDCfvwJsqQJ4upTBb+FS8WUoQebMZvN8o5HXwQa3PX6oORJbBD
	fb89+N34tBhamU2R+HhwoWdC6h3RGKJkBPxolvt/nRfglBsz7rpNixMjxWG6wxttBy4I0JLUheiO9
	dffDHrY0cT1Gvf/pC/0asXQ568xeRS0Joyp2slbcxlzzWDU9RDA2YmYkNzSv05Dx8MBtAzROQ0Ga4
	TzgwYRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Y2-00000000K9G-1M51;
	Thu, 25 Jan 2024 14:17:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Xz-00000000K7M-1NlM;
	Thu, 25 Jan 2024 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u6HWOEwIvxzzOAHzI2EcExmShWYJdBv/nEv/cvkVQ/g=; b=Obd4tVKnH4KL6QMzZBdacldnAn
	Gm+cx2Wg+kXr6at3nU7ZLbhPEDtcVJ5q/cgw1qIC/ykeYTTNawgmYdt4SJelhx0t1F8lMimgYDWK7
	DAl3yXwi68HnWCVdvhFBzRY+1zgEctZvRro2QXiMq7Launlz7xNN8SbN6PTMK9sWJWb06ApJG28m1
	dMQKaUZ8rC2oz+STppAhIA9CaSkEI4bU3GcoVyMoRqM6q/TsOetJ00awnAqe4MYvIl1Jp34nqRTC6
	kKZfr7Fm/toV3D+FaBiz02kQBsla9N86vME6eN4dJs1u8/FmCJTyOTGcBodF2nkezkReSx0gGNP6S
	Kuj4v6XA==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxql-00000005BOv-2XW5;
	Thu, 25 Jan 2024 11:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706181825;
	bh=Uu+Kk+F3SFhkK+G9oXazlo4Q3fgVXLCk2hDT+fOsZgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tpfl3NwkDvB9rqHZp4zvSNJIQv4mPUBxpjbrijtRvWXAIrI16MWGKI7Jru0XlY3Mi
	 Fifv4/F93ks/6Fph6jKfjK0d9lijIIa/Ipoa9mWSvKLN0qIaF2Q7NUTMcRLEoDBtPX
	 ztVBB8R9PMfWwMS+5J12CVY7uEJwWvKjs8gDGruNTqfeN4T2+Dy+vTNVt8wRdXKxcR
	 plGG4GFTnvxsWvPDTKpiKURYkKjAcf2Cy52nC9dmNOZjdmqkO9rR0JRhHchYgFXqKd
	 LwxcBox227Gh/NJhnE9r2aLK6VIS5TzcQCZjxl3b4oWUJIRzJVvWpk/t7QVP9WfiKM
	 BvWZkvLLT3IWA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 93EA23781182;
	Thu, 25 Jan 2024 11:23:44 +0000 (UTC)
Message-ID: <2452472f-72ab-4422-97a3-1fda7ca8c862@collabora.com>
Date: Thu, 25 Jan 2024 12:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek-hw: Don't error out if supply is not
 found
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "kernelci.org bot" <bot@kernelci.org>
References: <20240124-mtk-cpufreq-hw-regulator-enodev-fix-v1-1-6f9fb7275886@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240124-mtk-cpufreq-hw-regulator-enodev-fix-v1-1-6f9fb7275886@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_112451_698883_99708132 
X-CRM114-Status: GOOD (  17.49  )
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

Il 24/01/24 21:31, Nícolas F. R. A. Prado ha scritto:
> devm_regulator_get_optional() returns -ENODEV if no supply can be found.
> By introducing its usage, commit 788715b5f21c ("cpufreq: mediatek-hw:
> Wait for CPU supplies before probing") caused the driver to fail probe
> if no supply was present in any of the CPU DT nodes.
> 
> Use devm_regulator_get() instead since the CPUs do require supplies
> even if not described in the DT. It will gracefully return a dummy
> regulator if none is found in the DT node, allowing probe to succeed.
> 
> Fixes: 788715b5f21c ("cpufreq: mediatek-hw: Wait for CPU supplies before probing")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://linux.kernelci.org/test/case/id/65b0b169710edea22852a3fa/
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Makes sense.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index a1aa9385980a..8d097dcddda4 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -312,7 +312,7 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
>   			return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
>   					     "Failed to get cpu%d device\n", cpu);
>   
> -		cpu_reg = devm_regulator_get_optional(cpu_dev, "cpu");
> +		cpu_reg = devm_regulator_get(cpu_dev, "cpu");
>   		if (IS_ERR(cpu_reg))
>   			return dev_err_probe(&pdev->dev, PTR_ERR(cpu_reg),
>   					     "CPU%d regulator get failed\n", cpu);
> 
> ---
> base-commit: 9ac3ebaef3cc43ecd136911c44f1427286ee5a05
> change-id: 20240124-mtk-cpufreq-hw-regulator-enodev-fix-f614019689d0
> 
> Best regards,


