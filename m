Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C17FC07480
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igrslGOc8lOfnbcsO3yOOnOBbB2z/+ZB5557ersesus=; b=Wl0wHydhenOrJgARXCNc22k4uV
	TT9qbk6xj4LhKYhMH6ZL6wz6a4Kj4Xdpm6uP1VzIj4yV/s+M5T7CPhxIBOnDjsvTPaItGmSPbnMxi
	HImYVYuj1z1zishKqns/Y/Vhim/GBGsMEEAjJ4pn63G95HvWLF6ei7Cm2UvBpSeUamJLV0qyfMy4L
	kiX3p8NDYjz1/xrfmfndbAlr5iHyw/4Y5v2e/Vj7irYG9l7ZyoLz/DBPn5pOlMnAzgnv/gl754DLH
	Mab+h3kjA4PE0N5rCbiVovnOh+3twBB/uoNk1hMkOPTUKdqozYtElAY9eL/5i/LNnJ9YgyG3rnfhn
	I7iGaVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnu-001meA-1I;
	Fri, 20 Oct 2023 10:32:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnr-001mcv-23
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:32:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d885e97e2so466069f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Oct 2023 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697797944; x=1698402744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igrslGOc8lOfnbcsO3yOOnOBbB2z/+ZB5557ersesus=;
        b=Qve/3yrBukybmjpVV5wo9ljcV5Xrk6rk2EU+N1eq0V/BFiCH7hctL33KeWXZCr4/I9
         EKxGtwer/MYBD68SE9mv3vtIcQhIcwG3EE3/Fxrjtpajxp2qX4jlqgJCrHm6I39iR80K
         8keMSGYz8F2kX+VY2LN8MukPz9X8ai/nDCDfDSkxyw607lgPsbQywTDNa9A29O/rdc6u
         lhawppQdIFvD46Rbr/R3TAuCUL7crt7hJCl+Etqmbz3lRRFtXtc8Z4lmERXozmHT49Jd
         j+bFZC+cAfPoPPsLWD3vOMVe7TnMC6m+jvijPwTQ/CJQqbO+djY/NxH5d3UpRY7gf0WP
         ahOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697797944; x=1698402744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igrslGOc8lOfnbcsO3yOOnOBbB2z/+ZB5557ersesus=;
        b=UV72FOkwjmh/LgAYL8fdHNu8asciMvimpSnRlvXHQMTqTmQfkntmoo0B4CUDVoDg6v
         DMjKuDnoHH2XTPww7Jnb2i3q3WkDEOFdxMgWwZamlYxxF5RD+Y2jjbPcBDTalR46Drh2
         YVN+L5KHl/dvbHzE5Ph7PvlUwpzO5JgaiYjFlKUG3PzYlCzmG3tEt42/1oKhG54TwGlU
         nCl9IavLiDX5+bAATG38wH6GfWWnhedNMBNUfK6o5sdonOadIfmkXwKp21IW3b7hgF6v
         L9zp313ukKAxYcl0trz43dgS7kwCpeWRLfbRbsUzs2A953t5JkIJtcTDABtN5Ttb4G9r
         LzFw==
X-Gm-Message-State: AOJu0YwgFKIfMozamCO3Ggad1WOBtUgJp2s3IZpGQLVrk6shggKcsuni
	8ewHoepHZ+NlTjCI6+q4rDIcRw==
X-Google-Smtp-Source: AGHT+IHvZz/X5JQHO3BEuu44B8mjF8wsdVBvnEP3zzsL+PMw2pSuhiBl3H5XEium7IMjvWbKbHSz2g==
X-Received: by 2002:adf:ec03:0:b0:32d:d879:1c3 with SMTP id x3-20020adfec03000000b0032dd87901c3mr1041129wrn.31.1697797943877;
        Fri, 20 Oct 2023 03:32:23 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y10-20020a5d470a000000b0032d9efeccd8sm1396888wrq.51.2023.10.20.03.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 03:32:23 -0700 (PDT)
Message-ID: <b372ef8c-7f3f-483b-8cc2-d927a60050be@baylibre.com>
Date: Fri, 20 Oct 2023 12:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to error path
 handling in mtk_jpeg_dec_device_run
Content-Language: en-US
To: Zheng Wang <zyytlz.wz@163.com>, dmitry.osipenko@collabora.com
Cc: Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Irui.Wang@mediatek.com, security@kernel.org, hackerzheng666@gmail.com,
 1395428693sheep@gmail.com, alex000young@gmail.com, wenst@chromium.org,
 stable@vger.kernel.org
References: <20231020040732.2499269-1-zyytlz.wz@163.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231020040732.2499269-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033227_736840_21CC5F9B 
X-CRM114-Status: GOOD (  12.81  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 20/10/2023 06:07, Zheng Wang wrote:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with 
> mtk_jpeg_job_timeout_work. In mtk_jpeg_dec_device_run, if error happens 
> in mtk_jpeg_set_dec_dst, it will finally start the worker while mark the 
> job as finished by invoking v4l2_m2m_job_finish. There are two methods 
> to trigger the bug. If we remove the module, it which will call 
> mtk_jpeg_remove to make cleanup. The possible sequence is as follows, 
> which will cause a use-after-free bug. CPU0 CPU1 mtk_jpeg_dec_... | 
> start worker | |mtk_jpeg_job_timeout_work mtk_jpeg_remove | 
> v4l2_m2m_release | kfree(m2m_dev); | | | v4l2_m2m_get_curr_priv | 
> m2m_dev->curr_ctx //use If we close the file descriptor, which will call 
> mtk_jpeg_release, it will have a similar sequence. Fix this bug by start 
> timeout worker only if started jpegdec worker successfully so the 
> v4l2_m2m_job_finish will only be called on either 
> mtk_jpeg_job_timeout_work or mtk_jpeg_dec_device_run. This patch also 
> reverts commit c677d7ae8314 ("media: mtk-jpeg: Fix use after free bug 
> due to uncanceled work") for this patch also fixed the use-after-free 
> bug mentioned before. Before mtk_jpeg_remove is invoked, 
> mtk_jpeg_release must be invoked to close opened files. And it will call 
> v4l2_m2m_cancel_job to wait for the timeout worker finished so the 
> canceling in mtk_jpeg_remove is unnecessary.

-- 
Regards,
Alexandre

