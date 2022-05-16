Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6321C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXeAHtIPBI6FocXOQagBGFl/yytyY6yTn9MNzyEhCyk=; b=XQLymHhWcq6tj8
	tZscAggXaCVmABVVGyVOBhgQ43tU2r21LVdYc5vXk+0huZN0cuzmZiC9S79/ktjDRzSkcWN/LJwt9
	ms8lPtvds3uwDernClFGXAov69OTiNv/vigR/ehv9l21I7C+e1jh60k6+ZjYT6eA5+3xKo7hnpAGl
	WcVTyb1qs5LpymcJKEjLMVRUYKhGaXZgoLukw8HQ6SO1GzkpDNFz0Ajw29tuqWkOxyvTF2ANUAoRD
	b9pTEzYRPRG4nZI1HFxVfSGV/9UfByGLzH1r9U3xIqECizQRi5EavqsGbPDyYRC5Q+eAxyirQ6pYD
	QMQQXvtcVeVVwh8vJlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUu0-006MUu-4s; Mon, 16 May 2022 07:12:24 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUrm-006LNJ-LE
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 07:10:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bx33so16950620ljb.12
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sxWW7nN1MX4qR5x7vYWxWhZdhe/dlQM1wOVqJQxUPUw=;
 b=xfgSJvvTfpB3bhvG57n8DdOASbQWiiD0aJbEx2q9VQiFwTMWieLv+76CkJZ+U2n5nd
 SeLg+QQPZ6V0nSyPBqobwtFuUOpjjzJSoROqSiq2V7Lj9xLXR9XI2j8rJYfID1yZzMj8
 XYC4vFiYINn/Pu0Kw38I6/ttfnhseJChXYkyHSKswuerj7YUKcUcoGx6WrX3zTuWbAFj
 BTqaz6IRcnWwUweLAZORhNAjK8LbQDIP25u3i0mgFmyuV3xVI+3yddr0b/HTBSLyGUff
 JthW+Y2HVfZJFRs03mpTS0HA5Y3waFMYbEb0YtBrM8ENx2y/t+3UVmH84hiaV9lxEk+f
 7xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sxWW7nN1MX4qR5x7vYWxWhZdhe/dlQM1wOVqJQxUPUw=;
 b=yWFuytxntgc4YAnOwgXYafJo3PZ3loiUXHirK9T6VrC0RkkCAzsy9kc4mXxfw8ouMD
 oEg/fNmIps+tuW0kxaa5yvfk234RN/JZEUK7zS9Ejev3ALGl2ts/3osUXKuYdu2jf7hj
 m9uAZIFMUQDOcMzz7My60pTuSYzPzW7AdtSCTRrnETq+vgGwhvP2qqddsjt5vmBUP+A0
 +PMU/axAiJ2IMYc7cY+0PEeAAhRO2f2p5IZfQ4eQn+ekhvJDBkuaOQlC3Z8R+5D1e5WE
 STrc5Y2Dam4TpRvB0HXBX4HVbDB6DeNSaBSRyQdqX5AghT0W6LO+OtG5FZgB2KY9TSNu
 Ur/Q==
X-Gm-Message-State: AOAM531IKvfXs+pEnvqioGHJXm7H9PLQT6kjGyfUzybnFQntRmvkNIMw
 kwGkYRfLLs+IFAdBB2HWYrQ6/g==
X-Google-Smtp-Source: ABdhPJzxRNYsZvOCN6MRG+JxA+WtxP3xo+m55ow/RQL6xD2LzouYeDYYoKb2Omp9nqb+r+aHW9F1iA==
X-Received: by 2002:a2e:bc14:0:b0:24f:5060:1dc3 with SMTP id
 b20-20020a2ebc14000000b0024f50601dc3mr10335364ljf.432.1652685003164; 
 Mon, 16 May 2022 00:10:03 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05651205c500b004758e4e6a96sm1222932lfo.245.2022.05.16.00.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 00:10:02 -0700 (PDT)
Message-ID: <03e99a02-1233-3882-e1e5-24ab1bbaf257@linaro.org>
Date: Mon, 16 May 2022 09:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt6795: Add fixed clocks for
 32kHz and 26MHz XOs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
 <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_001006_751344_DAEE1542 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/05/2022 19:16, AngeloGioacchino Del Regno wrote:
> Add the 32kHz and 26MHz oscillators as fixed clocks in devicetree to
> provide a good initial clock spec, since this SoC features two always

I don't understand that part with actual patch. You claim here you add
clocks, but in DTS they were already before.

Additionally, these clocks do not belong to DTSI because, AFAIU, these
are properties of boards. At least their frequencies should be moved to
the board DTS.



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
