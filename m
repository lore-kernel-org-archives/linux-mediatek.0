Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5688C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulQdzi20zd2U46RZKsWGGdfViyIJCsOcS9mGLZlm5yU=; b=1uFJEVAT03y24UGro7R0e8CVCi
	QOkmSBJELkCU4rBd2ghCu0bd5bTB3rTOcV0kNMK8qqrjGq9tsXEM8BlF5mqLfJDgyuxXgFQDIUw6z
	ywyUQOs8+TGBxsF9aKHH91hVN2S/xupzdIE/C9su8BnHKS70Z91RS+SArlWAfu1USxSfhHBpZ2YFi
	T8+Ilo9ctnBbiJLsbItiJR0pjbVQTewihvL88ZRyq4kapJJrkAVChq16oCFfHPkohNq4HZIGzOVsB
	J094xN0MwXryjx7h3/bDO+RKBIgUHjusRGkZnjjH517RdKlDiDNA61RRMGcyYQNSygYZwLHY3Iyxa
	HpGQIulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVhO-004s68-KE; Wed, 28 Dec 2022 12:38:22 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVhB-004s1F-NN
	for linux-mediatek@lists.infradead.org; Wed, 28 Dec 2022 12:38:17 +0000
Received: by mail-lj1-x22b.google.com with SMTP id s22so16419428ljp.5
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Dec 2022 04:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulQdzi20zd2U46RZKsWGGdfViyIJCsOcS9mGLZlm5yU=;
        b=ROZy35wsYl1/tNFkRh0mrMmTpcQIU+41TeXZI6z23pccDhF71JS3vFW0I6QBK5tqCG
         +yx3MG8YeeqfNyuyH7Kpxj6/ehUia8GTAq20UcCyksilXnkN3b8iIR4FvbHUTj6HoRlc
         UX9USikFDumDonaVnDgl137WIqjLQbBc/fPog42FT0vQ7d309epTunt9B50/0C05XE9I
         uGlEyErjaGvgamWLdzaMz9sooxtCug8QlctG6G9wRYUc1ppb1wJe7FcszmlUPfo18oTy
         yl6MWffhxj5pH9E4EuI4w+m0DRGYnOHcZwrAo34GHU9EjqrJ7I/out4nSyeUwEsT7wvg
         FUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulQdzi20zd2U46RZKsWGGdfViyIJCsOcS9mGLZlm5yU=;
        b=4vmab9t4eB0lbF1aoUZNXmC5xPzrYLJQ76GZIQ3LTI+x8/TYkKQYuVhg2e99ldDIY3
         OtkiJDsNDT1yQgXQ19/857d41eAOJ6PklgPyUX6i5F73AjXsBL/5CvhyJRkFuRifwOKb
         PFj/0KdJSxsP9Arz7r4rogthrhmszoOQPi9LmtVrZHIE3HdiKODNd5ciooMt8fKbm3Mo
         iv3uarj1j/VtQitjoW0qeMR81IUnIHRFzdkPTwMStXEZY8dkma0MalbeuOs93w+a3wk7
         nVjNaTi3gCAN23ewy13erB0qwWzGuxyaEGwnY7n2ocxb4VVgLm2Ex7oUrDQugJj+mOGy
         Uktg==
X-Gm-Message-State: AFqh2kpsHG7mRKiUk71yY5Kr8UHWecoFx5AUzjwuSq1qfVW/2z6YEkZw
	+c1qOfFi9NB/T6IkK130fy0PtA==
X-Google-Smtp-Source: AMrXdXsoIJZhKKDkqEp/ZqcNn9QOtQzkUwBxJWwRPesEC5Q4Kb3HlmbuhYhJDQ+aKdj8EeXGi7O2/w==
X-Received: by 2002:a05:651c:90:b0:27f:b833:c50a with SMTP id 16-20020a05651c009000b0027fb833c50amr3893384ljq.14.1672231087829;
        Wed, 28 Dec 2022 04:38:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c03c100b0027d75b38fd6sm1940734ljp.43.2022.12.28.04.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 04:38:06 -0800 (PST)
Message-ID: <76a34e02-ec76-10c8-5cea-681a7477a026@linaro.org>
Date: Wed, 28 Dec 2022 13:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: mt8186-mt6366: add new compatible
 for max98360a
Content-Language: en-US
To: tongjian <tongjian@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 angelogioacchino.delregno@collabora.com, nfraprado@collabora.com,
 jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
 <20221228122230.3818533-3-tongjian@huaqin.corp-partner.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228122230.3818533-3-tongjian@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_043816_237463_8C6E1B8C 
X-CRM114-Status: UNSURE (   6.69  )
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

On 28/12/2022 13:22, tongjian wrote:
> Adds new compatible string "mt8186-mt6366-rt5682s-max98360-sound" for machines
> with max98360a and rt5682s.
> 
> Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


