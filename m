Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B89C636D0
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDMyuNY9y2+mLIY91GGCJaf3jR2VGlODgfIJsSjay2k=; b=2ZtS0ZvtnTmHwdHy0ebZNXBN3W
	4wLT0iyK5NfWLzPLFqyWGtHrMOoKLRotyFdTl8FcuM3czxsn+WBTVY25nkgLx/JQSJlMjCHefxWWu
	xaRQCI+oD/0dmQPN6oAQQH96mRxUJUS+qdffo3f53Z7mbewL/DFlXVVvDLXp3zRFqpPdwX7ZTQ9K+
	SEtkxV11hCHlcsio9k099tQihmHQWbWqiTx2CjigoJzc9qaBU810AbFE3d9A5+R0mu/JcF3Hesa13
	sa2B+9LltPPhrHMqRDsX+ovkICv0RclDpNOCDXE+fBEWHTXyawvsgqNZNpgZEOhYCZf18B+3LVuQK
	Rssy7/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLilY-0002WN-PS; Sat, 28 Jan 2023 10:49:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLilV-0002Uc-7i
	for linux-mediatek@lists.infradead.org; Sat, 28 Jan 2023 10:48:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id q8so5069432wmo.5
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Jan 2023 02:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDMyuNY9y2+mLIY91GGCJaf3jR2VGlODgfIJsSjay2k=;
        b=hmFG1UC0xZDkKe8YXYtTsoSlN+mukQIUz+DjLBJydedkPIcvK8+eReW4WbgNupYvZt
         otEbRmzGeNzYEdhfu5WWDr4pMIvYjLYxP6InEc0nUuCcaRf0SB/Y4aSWVyesWuExKx/z
         U2lItJlcCAexXE1oyUeaEu2jwUYHH2FB54OL0XBD7MkMe2sqyALHhf+IVDik6zoqEA/O
         9QIUe5775lSgBt5BwcqaOcoxUykdawfEypSNY1Ri7B8E7cuh9Dixjig1gfWl9m5hph33
         pWybVYBJaz1U5+OhpUxD3/m7lbmdS9SiXu3hYg4/J1pIDsyAsE7t+v4Xk9Y9A5nM2yRE
         bgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDMyuNY9y2+mLIY91GGCJaf3jR2VGlODgfIJsSjay2k=;
        b=rA+tE05ckdBL6zy1J6axV/fVi/saAhPF+kG0EeE24zMfNw5ZTAcW6AAi8AvW/tfu5g
         gNyeskcBOv2iZy/DxYKQUaXqzOCEbsclBdRMhKesksTFk4/UHvy3veRhcPcuXNYMxwNf
         7vrMppbNr1uYqpGeM+2kfHTpUp6Q7B9rsfthsidcw/Ihde6IOJMnstKolKy4nBKq9aeR
         i5NPJ8K8j0tL+xYvSkML74ijhgEUUfIZ98w4jNo7U9r/80luRMC1S60RTMdTRQaaqm3f
         EaxhZNBp1rw2IUnMs6GC0sn7It+KvsCJr8o3BZ4SslY2vUHCFnnUhmCACR6gtrcPwv0m
         i/kg==
X-Gm-Message-State: AFqh2kq55vLQx9ORfXX8DGtWL0+n/os4NMYCOikcPdvDR98d2WVoA/n9
	HKF+LRHcZHY8U1WOfNNpqnMv5o7goJ4uPnJg
X-Google-Smtp-Source: AMrXdXvzLKnPJzKgzaJo+Fihga+fGeShpAelemc3eeNsipvcvTqGS01hVJ+Ze/uvvnAp2CCmGSCNMQ==
X-Received: by 2002:a05:600c:3b18:b0:3db:eab:3c5c with SMTP id m24-20020a05600c3b1800b003db0eab3c5cmr40476863wms.32.1674902934819;
        Sat, 28 Jan 2023 02:48:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003daf89e01d3sm6781867wme.11.2023.01.28.02.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:48:54 -0800 (PST)
Message-ID: <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
Date: Sat, 28 Jan 2023 11:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126161048.94089-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_024857_313626_D5206273 
X-CRM114-Status: GOOD (  12.08  )
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

On 26/01/2023 17:10, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controllers dt-binding definition for mt8195.

Subject: drop second/last, redundant "dt-binding definition". The
"dt-bindings" prefix is already stating that these are bindings.

Plus two comments at the end.

> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
> Changelog:
>   v12:
>      - Fixed subject prefix
>      - Fixed licences GPL-2.0+ to GPL-2.0
>      - Added dual licenses


> +    };
> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
> new file mode 100644
> index 000000000000..902d5b1e4f43
> --- /dev/null
> +++ b/include/dt-bindings/thermal/mediatek-lvts.h

Same filename as bindings.

> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */

Although this is correct, any reason why not using exactly the same
license as bindings?

> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Balsam CHIHI <bchihi@baylibre.com>
> + */

Best regards,
Krzysztof


