Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD307C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/XwNBoL4Bepsl7g/sWBiJeFXT6UQOp8xSka7hcO9do=; b=nDHsh/TjzN7haxMfuynbbWVi47
	rcu9Swm6khl4rE6aS6c9YhBWy1axEWAlA44c4mPOMmUVTqgYS07T3NPhPN2JAiJr0Fl0kw3NrH2mu
	Gp6h1rRb2YJnJmW+IoMEMOk4Sn6POWwvas9/iaD9rpnks5IuAfn3tOCqJJkAJZ5u9/hWE6ogDOx3b
	u9RykQw2UnUD/HbB6DVADDWrh5sYa8xQ5GkQvnhpJVTFK1APtNd8qBDiwqpVkQ13KNK8HE0OgBtj0
	FdUjVFBWhTv5/2iJxH1E6bvQ6/ZFXeVaMaOAogFNFCi12/apaVaRF9pKoo9dWDcPyjASMosfl0hVx
	pd5VUbQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAHBO-005hOD-1a;
	Mon, 04 Dec 2023 22:12:54 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAHBK-005hNK-36
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 22:12:52 +0000
Received: by mail-lj1-x241.google.com with SMTP id 38308e7fff4ca-2ca04b1cc37so13030051fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 14:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701727968; x=1702332768; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/XwNBoL4Bepsl7g/sWBiJeFXT6UQOp8xSka7hcO9do=;
        b=QdqidFNE1dDnOlpqQ4b9OiHk+oIdhIzNUIduX+4IYLNwr0m0EIIgx6vZiMmK9KPWdq
         ev8SeZpX/0TDRTYL/YuECKH8+Za24uDvpizQxOeNVg1HG1FquXoiZEAJkgdgTkaWCH/T
         MjJHhWVfgjzmh6HgFLo+sdaUuMEG6wZnz1pHUw86RS5O4g7GBFQSD7zOjpQ7n7R3HpUx
         ayk30OMT375n2q10Xl6ZoPz6le5XZ08T/QGt/60jkgvqoRdqAwjBuhBosEvf9XRWEOyC
         DBYitBHE15NgHje41Qr5Vt+lGVYLJI6gdtF4liRJswKAqYR4nE4tHymqhhNpBMVUIZeB
         mXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701727968; x=1702332768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/XwNBoL4Bepsl7g/sWBiJeFXT6UQOp8xSka7hcO9do=;
        b=bWLHTqiA31q0RfWGZrOy7tHYVw4irEzsKTa4efXTW2nHVJrh5iiDpoPfLznq0eDRXh
         rSjaS3pDXDeKjyMyg+5y/ZJWqrb7giap+kz60qIYEpNAI935TyweX7oYQC1kBtqh+3bp
         010hS45kYFYwk+cCvxek/MuqF+eBc3L8yYGyTBMb+ElkggjuJax+bmgvG+5Z0r/CGUJd
         mai9uq4sgZRMG3wtIadp/OEdnjMiAJD5dPOlPYkvUwoEsbUNvVIOabwRbwACSpkhwifc
         rZbuqwTIkzEkkPtsWJ8DT+pMZVq95/lDOYkW9zOqJvVgkJCcfsv2O+z+Yfeyviw7FQUp
         L9NQ==
X-Gm-Message-State: AOJu0Yxdyx14ZMTAwAhj/brfeIpcNi+x5olNnSvpFTJOiFxHz6JtFFsQ
	5CKLk3iiNUvG5pd6eM1dWz/Bhg==
X-Google-Smtp-Source: AGHT+IGHK8eaCUSqMAX1OhYsPV0pIhUbSjJMFerqkfAyQ/4Q38mzcJW2EMzEaVIIajQnD8anvfh8Gg==
X-Received: by 2002:a2e:a413:0:b0:2ca:92a:c109 with SMTP id p19-20020a2ea413000000b002ca092ac109mr232770ljn.24.1701727968171;
        Mon, 04 Dec 2023 14:12:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id a39-20020a2ebea7000000b002c9f70a0419sm746817ljr.140.2023.12.04.14.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 14:12:47 -0800 (PST)
Message-ID: <f8cf9a21-ef2b-48c6-86b3-ff8874c87b8b@linaro.org>
Date: Tue, 5 Dec 2023 00:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: add firmware for en8811h 2.5G ethernet
 phy
To: Sky Huang <SkyLake.Huang@mediatek.com>, John Boyer <jwboyer@kernel.org>
Cc: linux-firmware <linux-firmware@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Steven Liu <Steven.Liu@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 "Lucien . Jheng" <lucien.jheng@airoha.com>
References: <20231130134610.31342-1-SkyLake.Huang@mediatek.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231130134610.31342-1-SkyLake.Huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_141251_008781_747F9FEC 
X-CRM114-Status: GOOD (  21.43  )
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

On 30/11/2023 15:46, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch adds firmware files for airoha en8811h 2.5G ethernet phy.
> Refer to https://www.airoha.com/products/p/tKkm7DPXi5m6wY2D for more
> product information.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> Signed-off-by: Lucien.Jheng <lucien.jheng@airoha.com>
> ---
>   LICENSE.airoha         |   9 +++++++++
>   WHENCE                 |   9 +++++++++
>   airoha/EthMD32.DSP.bin | Bin 0 -> 131072 bytes
>   airoha/EthMD32.dm.bin  | Bin 0 -> 16384 bytes
>   4 files changed, 18 insertions(+)
>   create mode 100644 LICENSE.airoha
>   create mode 100644 airoha/EthMD32.DSP.bin
>   create mode 100644 airoha/EthMD32.dm.bin
> 
> diff --git a/LICENSE.airoha b/LICENSE.airoha
> new file mode 100644
> index 00000000..160058b7
> --- /dev/null
> +++ b/LICENSE.airoha
> @@ -0,0 +1,9 @@
> +Airoha Inc. grants permission to use and redistribute aforementioned firmware
> +files for the use with devices containing Airoha chipsets, but not as part of
> +the Linux kernel or in any other form which would require these files themselves
> +to be covered by the terms of the GNU General Public License or the GNU Lesser
> +General Public License.

This doesn't allow redistributing these firmware files for other use 
cases. Thus, I fear, generic purpose distributions will not be able to 
pick up these files. But please note, I'm not a lawyer.

> +
> +These firmware files are distributed in the hope that they will be useful, but
> +are provided WITHOUT ANY WARRANTY, INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTY
> +OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.

-- 
With best wishes
Dmitry


