Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D6EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Psajd6OVU6HONVcYwAF4k7kzKO1bSsPA0lwnR4yTjw=; b=zM0clB2IehJ1Ob09BsWBr0PO8B
	N477zTdam8VXs+nqYIVcwbUynKE4g9Re/DkB1umeBivyMNR1T5MPfBS+bWilbj48WYQBzCRjLKQmd
	/R14dWec9Yq7LihKLYYaCM18JecR7ypWtMsXGZZjUnCVLpL6sa8zfZqcQvIXCrZBVwnmj5RF8EBPo
	5EKCZ+4/LJTSQTEbJW98uxhJtHYPIp3AOhfj2xt9w9wxbK6/CU8TFy5dEXKCHcargOz5NZJfvQ0P1
	eSKwsS7FogGYpbGA8cmE1qaIuVaK83yskEFni97YpjMaZRh599I+f5flAeQB/qd0i3YIVbpIuXTSh
	Mr3WKGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmBS-004qU8-2x;
	Fri, 07 Jul 2023 14:11:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmBP-004qSg-39
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 14:11:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba86f069bso3138449e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688739095; x=1691331095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Psajd6OVU6HONVcYwAF4k7kzKO1bSsPA0lwnR4yTjw=;
        b=k0jYnuzcSLleSs3obf+lLaCtWROeHyPhn8EWW6WP6AGps9GYnwmtxLqnWzko3Y7PZ8
         MGdMD7Lo5VgU6tDGINs34PTZC/AlLTPiP4yN3qypZ897dyhroZoNVbfW3PS51XY6EpeU
         Xzv2ErGjwfl9TtO6WYUHjBLOo2OLwswW86WIdgzvZmGpvaP4nyOC8TcKIGKeWLEgqA0i
         aSCnNlnqho0nUXKhKNTr64NdiMNmAPhbzW0q6jCamtjYfo0jACY8m3YfEM5cMAEC8nAP
         HmzSyD6zZBMsYmqIW6ZKqmHCzwp5AgoV62trz1lwlG2SeHg1NTc+olyPUN3iJnseb4qp
         S5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688739095; x=1691331095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Psajd6OVU6HONVcYwAF4k7kzKO1bSsPA0lwnR4yTjw=;
        b=ZdwsDaAlMeSSjiixk257SYWxfN7OSpOMiwW5QS1VI7/gvKE2sLKKyAm5EDKChNaavu
         WXfULI4Hv61eFsNJutgI7DpLu3UsNy9N+IwjGQMsKEfDyA8d3+TFUQzAGX30QgxFhkfk
         ArAWD5zys/kLMR5GQwFvXA4p+kkfVKsGMfYuxVCTUNkk71i5b5pAryRQvsNVsKRzOa0N
         HP8yO6ZBhLsu8gY0ErYf3s8nLN2pAVwfWnmMOhuo2/9GwlTQrFLH8MCOi0C5r9RYyHfl
         NFzTOWXOQMYa6L/+aDf8SouKSFuCWdpt3eQveNRk4idMkJVZcPqeOdPihioiu6HwzKmv
         WDdQ==
X-Gm-Message-State: ABy/qLZb6RkTX+zXqzKkbYZfEY++HFPm/Rc9ppm/ls5/Bjm9miTTkAJz
	wEKhtlzjSIwTCGZYVW2cVNNqNw==
X-Google-Smtp-Source: APBJJlGOrHsd3wpz2+GZmZI1MI3v3biMwXG7vAhqELyS89IGLyJw+nKLVuZO69fJqliUZgxCRzWo9g==
X-Received: by 2002:a05:6512:3e9:b0:4f8:6d53:a68f with SMTP id n9-20020a05651203e900b004f86d53a68fmr3527714lfq.64.1688739095027;
        Fri, 07 Jul 2023 07:11:35 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003fbb618f7adsm2577638wml.15.2023.07.07.07.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 07:11:34 -0700 (PDT)
Message-ID: <538096d2-7b24-e1c7-706d-4d4f952d35eb@baylibre.com>
Date: Fri, 7 Jul 2023 16:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Content-Language: en-US
To: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com
Cc: bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com,
 security@kernel.org, hackerzheng666@gmail.com, 1395428693sheep@gmail.com,
 alex000young@gmail.com
References: <20230707092414.866760-1-zyytlz.wz@163.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230707092414.866760-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_071140_014860_764AAB6A 
X-CRM114-Status: GOOD (  10.93  )
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



On 07/07/2023 11:24, Zheng Wang wrote:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
> 
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> 
> CPU0                  CPU1
> 
>                      |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>    v4l2_m2m_release  |
>      kfree(m2m_dev); |
>                      |
>                      | v4l2_m2m_get_curr_priv
>                      |   m2m_dev->curr_ctx //use

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

